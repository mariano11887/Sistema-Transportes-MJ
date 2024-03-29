﻿using BE;
using Logger;
using Nager.Date;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;

namespace BL
{
    public class GeneradorDePlanillas
    {
        private readonly DateTime _fechaAGenerar;
        private List<PlanillaHorariaBE> _planillasGeneradas;
        private List<VehiculoBE> _vehiculos;
        private List<ChoferBE> _choferes;

        public GeneradorDePlanillas(DateTime fechaAGenerar)
        {
            _fechaAGenerar = fechaAGenerar;
            _planillasGeneradas = new List<PlanillaHorariaBE>();
        }

        public static DateTime ObtenerProximaFecha(DateTime ultimaFecha, out bool puedeGenerarse)
        {
            DateTime proximaFecha = (ultimaFecha <= DateTime.Today ? DateTime.Today : ultimaFecha).AddDays(1);

            puedeGenerarse = proximaFecha <= DateTime.Today.AddDays(7);
            return proximaFecha;
        }

        public static void GenerarProximasPlanillas()
        {
            DateTime fechaUltimaPlanilla = PlanillaHoraria.ObtenerUltimaPlanilla();
            if (fechaUltimaPlanilla == default)
            {
                // Si no hay planillas, pongo la fecha de hoy
                fechaUltimaPlanilla = DateTime.Today;
            }

            DateTime proximaFecha = ObtenerProximaFecha(fechaUltimaPlanilla, out bool puedeGenerarse);
            if (puedeGenerarse)
            {
                GeneradorDePlanillas generadorDePlanillas = new GeneradorDePlanillas(proximaFecha);
                generadorDePlanillas.Generar();

                Bitacora.Loguear(string.Format("Se generaron las planillas para el día {0}", proximaFecha));
            }
        }

        public void Generar()
        {
            // Busco en el historial de viajes los que correspondan al mismo tipo de día
            TipoDeDia tipoDeDia = ObtenerTipoDeDia(_fechaAGenerar);
            List<DateTime> diasDelMismoTipo = ObtenerDiasDelMismoTipo(tipoDeDia);

            // Proceso cada recorrido individualmente
            List<RecorridoBE> recorridos = Recorrido.ListarTodos();
            List<CalculoDeRecorrido> calculosDeRecorrido = new List<CalculoDeRecorrido>();
            foreach (RecorridoBE recorrido in recorridos)
            {
                CalculoDeRecorrido calcRecorrido = new CalculoDeRecorrido
                {
                    Recorrido = recorrido
                };
                CalcularIntervalos(calcRecorrido, diasDelMismoTipo);

                GenerarViajesYPlanillas(calcRecorrido);
                calculosDeRecorrido.Add(calcRecorrido);
            }

            bool hayVehiculos = ChequearDisponibilidadDeVehiculos(out int vehiculosFaltantes);
            bool hayChoferes = ChequearDisponibilidadDeChoferes(out int choferesFaltantes);
            if(!hayVehiculos || !hayChoferes)
            {
                GenerarAlertaDeInsuficiencia(vehiculosFaltantes, choferesFaltantes);
                RecalcularFrecuencias(calculosDeRecorrido);
            }

            AsignarVehiculos();
            DividirEnDosTurnos();
            AsignarChoferes();

            PlanillaHoraria.GuardarMultiples(_planillasGeneradas);
        }

        private TipoDeDia ObtenerTipoDeDia(DateTime fecha)
        {
            if (fecha.DayOfWeek == DayOfWeek.Sunday || DateSystem.IsPublicHoliday(fecha, CountryCode.AR))
            {
                return TipoDeDia.DomingoOFeriado;
            }
            else if (fecha.DayOfWeek == DayOfWeek.Saturday)
            {
                return TipoDeDia.Sabado;
            }
            else
            {
                return TipoDeDia.DiaDeSemana;
            }
        }

        private List<DateTime> ObtenerDiasDelMismoTipo(TipoDeDia tipoDeDia)
        {
            List<DateTime> diasDelMismoTipo = new List<DateTime>();

            // Se establace como límite 10 días hacia atrás del mismo tipo que se requiere.
            DateTime fecha = DateTime.Today.AddDays(-1);
            while (diasDelMismoTipo.Count < 10)
            {
                if (ObtenerTipoDeDia(fecha) == tipoDeDia)
                {
                    diasDelMismoTipo.Add(fecha);
                }
                fecha = fecha.AddDays(-1);
            }

            return diasDelMismoTipo;
        }

        private void CalcularIntervalos(CalculoDeRecorrido calcRecorrido, List<DateTime> dias)
        {
            List<PlanillaHorariaBE> planillas = PlanillaHoraria.ObtenerPlanilas(calcRecorrido.Recorrido, dias);

            calcRecorrido.FrecuenciaPorIntervalo = new Dictionary<int, int>();
            calcRecorrido.DuracionPorIntervalo = new Dictionary<int, TimeSpan>();

            // Agrupo las planillas por día
            var planillasPorDia = planillas.GroupBy(p => p.Fecha).Select(g => new
            {
                Fecha = g.Key,
                Planillas = g.ToList()
            }).OrderBy(x => x.Fecha).ToList();

            int diasDeCalculo = planillasPorDia.Count;

            // Un intervalo representa un período de 2 hs. El intervalo 4 es el período de 4 a 6 hs por ej.
            // Empieza en 4 porque el primer viaje del día siempre es a las 4 AM
            for (int intervalo = 4; intervalo <= 22; intervalo += 2)
            {
                decimal sumaDeIndices = 0;
                TimeSpan sumaDuracion = new TimeSpan();
                int frecuenciaDiaAnterior = -1;
                int cantidadViajes = 0;
                for (int dia = 0; dia < diasDeCalculo; dia++)
                {
                    // Viajes de este intervalo de cada planilla
                    List<ViajeBE> viajesDeIntervalo = planillasPorDia[dia].Planillas.SelectMany(p => p.Viajes)
                        .Where(v => v.HoraSalida.Hour - v.HoraSalida.Hour % 2 == intervalo).OrderBy(v => v.HoraSalida).ToList();

                    cantidadViajes += viajesDeIntervalo.Count;
                    decimal sumaCompletitud = 0;
                    for (int iViaje = 0; iViaje < viajesDeIntervalo.Count; iViaje++)
                    {
                        ViajeBE viaje = viajesDeIntervalo[iViaje];

                        // Completitud del viaje
                        if (viaje.Completitud == CompletitudViaje.Vacio)
                        {
                            sumaCompletitud += 0.5M;
                        }
                        else if (viaje.Completitud == CompletitudViaje.Moderado || viaje.Completitud == CompletitudViaje.Nulo)
                        {
                            sumaCompletitud += 1;
                        }
                        else if (viaje.Completitud == CompletitudViaje.Lleno)
                        {
                            sumaCompletitud += 1.5M;
                        }

                        // Duración del viaje
                        if(viaje.HoraRealLlegada.HasValue && viaje.HoraRealLlegada.Value < viaje.HoraSalida)
                        {
                            // Este es el caso cuando llega al día siguiente
                            viaje.HoraRealLlegada = viaje.HoraRealLlegada.Value.AddDays(1);
                        }
                        DateTime horaLlegada = viaje.HoraRealLlegada ?? viaje.HoraEstimadaLlegada;
                        sumaDuracion = sumaDuracion.Add(horaLlegada - viaje.HoraSalida);

                        // Frecuencia del día anterior
                        if (dia == 0 && frecuenciaDiaAnterior < 0)
                        {
                            DateTime horaProximoViaje = viajesDeIntervalo.Where(v => v.HoraSalida > viaje.HoraSalida)
                                .OrderBy(v => v.HoraSalida).Select(v => v.HoraSalida).FirstOrDefault();
                            if(horaProximoViaje != default)
                            {
                                frecuenciaDiaAnterior = (int)(horaProximoViaje - viaje.HoraSalida).TotalMinutes;
                            }
                            else if (intervalo <= 20)
                            {
                                // No hay proximo viaje en este intervalo, busco en el siguiente
                                horaProximoViaje = planillasPorDia[dia].Planillas.SelectMany(p => p.Viajes)
                                    .Where(v => v.HoraSalida.Hour - v.HoraSalida.Hour % 2 == (intervalo + 2))
                                    .OrderBy(v => v.HoraSalida).Select(v => v.HoraSalida).FirstOrDefault();
                                frecuenciaDiaAnterior = (int)(horaProximoViaje - viaje.HoraSalida).TotalMinutes;
                            }
                            else
                            {
                                // No hay siguiente intervalo, tomo la frecuencia respecto al anterior.
                                DateTime horaViajeAnterior = planillasPorDia[dia].Planillas
                                        .SelectMany(p => p.Viajes)
                                        .Where(v => v.HoraSalida.Hour - v.HoraSalida.Hour % 2 == (intervalo - 2))
                                        .OrderBy(v => v.HoraSalida).Select(v => v.HoraSalida).LastOrDefault();
                                frecuenciaDiaAnterior = (int)(viaje.HoraSalida - horaViajeAnterior).TotalMinutes;
                            }
                        }
                    }

                    decimal promedioCompletitudIntervalo = sumaCompletitud / viajesDeIntervalo.Count;
                    decimal indiceDeAjuste = promedioCompletitudIntervalo * (diasDeCalculo - dia) / diasDeCalculo;
                    sumaDeIndices += indiceDeAjuste;
                }

                int nuevaFrecuencia;
                TimeSpan nuevaDuracion;
                if (diasDeCalculo > 0 && cantidadViajes > 0)
                {
                    decimal divisorDeFrecuencia = sumaDeIndices / diasDeCalculo;
                    nuevaFrecuencia = (int)Math.Round(frecuenciaDiaAnterior / divisorDeFrecuencia);
                    nuevaFrecuencia = Math.Min(nuevaFrecuencia, 60); // No puede haber una frecuencia mayor a 60 minutos
                    nuevaDuracion = new TimeSpan(sumaDuracion.Ticks / cantidadViajes);
                    // Redondeo al minuto más cercano
                    nuevaDuracion = TimeSpan.FromMinutes(Math.Round(nuevaDuracion.TotalMinutes));
                }
                else
                {
                    // Si no hay datos, tomo la frecuencia y duración por defecto
                    nuevaFrecuencia = int.Parse(ConfigurationManager.AppSettings["frecuenciaDefault"]);
                    nuevaDuracion = new TimeSpan(0, int.Parse(ConfigurationManager.AppSettings["duracionDefault"]), 0);
                }

                calcRecorrido.FrecuenciaPorIntervalo.Add(intervalo, nuevaFrecuencia);
                calcRecorrido.DuracionPorIntervalo.Add(intervalo, nuevaDuracion);
            }
        }

        private void GenerarViajesYPlanillas(CalculoDeRecorrido calcRecorrido)
        {
            // Una vez que termino con el cálculo de cada intervalo genero viajes
            // El primer viaje del día es a las 4 AM
            DateTime inicioProximoViaje = new DateTime(1, 1, 1, 4, 0, 0);
            RecorridoBE recorrido = calcRecorrido.Recorrido;
            int descansoChoferes = int.Parse(ConfigurationManager.AppSettings["descansoChoferes"]);

            foreach (int intervalo in calcRecorrido.FrecuenciaPorIntervalo.Keys)
            {
                while (inicioProximoViaje.Hour - inicioProximoViaje.Hour % 2 == intervalo)
                {
                    ViajeBE viajeIda = new ViajeBE
                    {
                        HoraSalida = inicioProximoViaje,
                        HoraEstimadaLlegada = inicioProximoViaje.Add(calcRecorrido.DuracionPorIntervalo[intervalo]),
                        EsIda = true,
                        TerminalOrigen = recorrido.TerminalInicio,
                        TerminalDestino = recorrido.TerminalFin
                    };

                    // Busco la planilla cuyo último viaje termine en la terminal de salida antes de que 
                    // salga este micro (más el descanso de los choferes)
                    PlanillaHorariaBE planillaIda = _planillasGeneradas.Where(p =>
                        p.Recorrido == recorrido &&
                        p.Viajes.Last().TerminalDestino == recorrido.TerminalInicio &&
                        p.Viajes.Last().HoraEstimadaLlegada.AddMinutes(descansoChoferes) < inicioProximoViaje).FirstOrDefault();

                    if (planillaIda == null)
                    {
                        planillaIda = new PlanillaHorariaBE
                        {
                            Fecha = _fechaAGenerar,
                            Recorrido = recorrido,
                            Viajes = new List<ViajeBE>()
                        };
                        _planillasGeneradas.Add(planillaIda);
                    }
                    planillaIda.Viajes.Add(viajeIda);

                    // Hago lo mismo con el viaje de vuelta
                    ViajeBE viajeVuelta = new ViajeBE
                    {
                        HoraSalida = inicioProximoViaje,
                        HoraEstimadaLlegada = inicioProximoViaje.Add(calcRecorrido.DuracionPorIntervalo[intervalo]),
                        EsIda = false,
                        TerminalOrigen = recorrido.TerminalFin,
                        TerminalDestino = recorrido.TerminalInicio,
                    };

                    PlanillaHorariaBE planillaVuelta = _planillasGeneradas.Where(p =>
                        p.Recorrido == recorrido &&
                        p.Viajes.Last().TerminalDestino == recorrido.TerminalFin &&
                        p.Viajes.Last().HoraEstimadaLlegada.AddMinutes(descansoChoferes) < inicioProximoViaje).FirstOrDefault();

                    if (planillaVuelta == null)
                    {
                        planillaVuelta = new PlanillaHorariaBE
                        {
                            Fecha = _fechaAGenerar,
                            Recorrido = recorrido,
                            Viajes = new List<ViajeBE>()
                        };
                        _planillasGeneradas.Add(planillaVuelta);
                    }
                    planillaVuelta.Viajes.Add(viajeVuelta);

                    inicioProximoViaje = inicioProximoViaje.AddMinutes(calcRecorrido.FrecuenciaPorIntervalo[intervalo]);
                }
            }
        }

        private bool ChequearDisponibilidadDeVehiculos(out int vehiculosFaltantes)
        {
            if (_vehiculos == null)
            {
                _vehiculos = Vehiculo.ListarTodos().Where(v => v.EnCirculacion).ToList();
            }

            if(_vehiculos.Count < _planillasGeneradas.Count)
            {
                // No alcanzan los vehículos para cubrir la frecuencia recomendada.
                vehiculosFaltantes = _planillasGeneradas.Count - _vehiculos.Count;
                return false;
            }

            vehiculosFaltantes = 0;
            return true;
        }

        private bool ChequearDisponibilidadDeChoferes(out int choferesFaltantes)
        {
            if (_choferes == null)
            {
                _choferes = Chofer.ListarTodos().Where(c => c.FechaFinLicencia <= DateTime.Today).ToList();
            }

            if(_choferes.Count < _planillasGeneradas.Count * 2)
            {
                // No alcanzan los choferes para cubrir las planillas.
                choferesFaltantes = _planillasGeneradas.Count * 2 - _choferes.Count;
                return false;
            }

            choferesFaltantes = 0;
            return true;
        }

        private void DividirEnDosTurnos()
        {
            // Cada planilla generada hay que dividirla en dos turnos de 10 hs cada una.
            // Esto es porque a las 10 hs termina la jornada laboral de los choferes y vienen otros.
            List<PlanillaHorariaBE> planillasDivididas = new List<PlanillaHorariaBE>();
            foreach(PlanillaHorariaBE planilla in _planillasGeneradas)
            {
                List<ViajeBE> viajesPrimerTurno = planilla.Viajes.Where(v => v.HoraSalida.Hour < 14).ToList();
                List<ViajeBE> viajesSegundoTurno = planilla.Viajes.Where(v => v.HoraSalida.Hour >= 14).ToList();

                // Se deja como está la planilla de la colección, pero con los viajes del primer turno
                planilla.Viajes = viajesPrimerTurno;
                planillasDivididas.Add(planilla);

                // Se crea una planilla igual pero con los viajes del segundo turno
                PlanillaHorariaBE planillaSegundoTurno = new PlanillaHorariaBE
                {
                    Fecha = planilla.Fecha,
                    Recorrido = planilla.Recorrido,
                    Vehiculo = planilla.Vehiculo,
                    Viajes = viajesSegundoTurno
                };
                planillasDivididas.Add(planillaSegundoTurno);
            }

            // Sobreescribo la colección de planillas horarias
            _planillasGeneradas = planillasDivididas;
        }

        private void RecalcularFrecuencias(List<CalculoDeRecorrido> calculosDeRecorrido)
        {
            float propRecalculoChoferes = (float)_planillasGeneradas.Count * 2 / _choferes.Count;
            float propRecalculoVehiculos = (float)_planillasGeneradas.Count / _vehiculos.Count;
            float proporcionDeRecalculo = Math.Max(propRecalculoChoferes, propRecalculoVehiculos);

            _planillasGeneradas.Clear();

            foreach(CalculoDeRecorrido calcRecorrido in calculosDeRecorrido)
            {
                Dictionary<int, int> nuevaFrecuenciaPorIntervalo = new Dictionary<int, int>();
                foreach (KeyValuePair<int, int> frecIntervalo in calcRecorrido.FrecuenciaPorIntervalo)
                {
                    nuevaFrecuenciaPorIntervalo.Add(frecIntervalo.Key,
                        (int)Math.Ceiling(frecIntervalo.Value * proporcionDeRecalculo));
                }

                calcRecorrido.FrecuenciaPorIntervalo = nuevaFrecuenciaPorIntervalo;

                GenerarViajesYPlanillas(calcRecorrido);
            }
        }

        private void AsignarVehiculos()
        {
            foreach(PlanillaHorariaBE planilla in _planillasGeneradas)
            {
                // Busco un vehiculo (no asignado a otra planilla) que haya terminado su recorrido el día anterior 
                // en la terminal de origen del primer viaje del día
                VehiculoBE vehiculo = 
                    _vehiculos.Where(v => Vehiculo.ObtenerUltimoEstacionamiento(v).Id == planilla.Viajes[0].TerminalOrigen.Id &&
                        !_planillasGeneradas.Any(p => p.Vehiculo != null && p.Vehiculo.Id == v.Id)).FirstOrDefault();

                if (vehiculo != null)
                {
                    planilla.Vehiculo = vehiculo;
                }
            }

            // A las planillas que todavía quedaron sin vehículo, les busco alguno en las terminales cercanas
            List<PlanillaHorariaBE> planillasSinVehiculo = _planillasGeneradas.Where(p => p.Vehiculo == null).ToList();
            int indiceCercania = -1;
            while (planillasSinVehiculo.Count > 0)
            {
                indiceCercania++;
                bool hayTerminales = true;
                foreach (PlanillaHorariaBE planilla in planillasSinVehiculo)
                {
                    TerminalBE terminalCercana = Terminal.ObtenerTerminalCercana(planilla.Viajes[0].TerminalOrigen, indiceCercania);
                    if (terminalCercana != null)
                    {
                        VehiculoBE vehiculo =
                            _vehiculos.Where(v => Vehiculo.ObtenerUltimoEstacionamiento(v).Id == terminalCercana.Id &&
                                !_planillasGeneradas.Any(p => p.Vehiculo != null && p.Vehiculo.Id == v.Id)).FirstOrDefault();

                        if (vehiculo != null)
                        {
                            planilla.Vehiculo = vehiculo;
                        }
                    }
                    else
                    {
                        // Ya no hay más terminales por verificar (no debería suceder nunca)
                        hayTerminales = false;
                        break;
                    }
                }

                if(!hayTerminales)
                {
                    break;
                }

                planillasSinVehiculo = _planillasGeneradas.Where(p => p.Vehiculo == null).ToList();
            }
        }

        private void AsignarChoferes()
        {
            List<ChoferBE> choferesSinAsignar = _choferes.ToList();

            // Primero asigno los choferes cuyo coche preferido esté en la planilla
            foreach(PlanillaHorariaBE planilla in _planillasGeneradas)
            {
                ChoferBE chofer = choferesSinAsignar.Where(c => c.CochePreferido != null &&
                    c.CochePreferido.Id == planilla.Vehiculo.Id).FirstOrDefault();
                if(chofer != null)
                {
                    planilla.Chofer = chofer;
                    choferesSinAsignar.Remove(chofer);
                }
            }

            // Luego a las planillas restantes les asigno cualquier chofer
            foreach(PlanillaHorariaBE planilla in _planillasGeneradas.Where(p => p.Chofer == null).ToList())
            {
                ChoferBE chofer = choferesSinAsignar.FirstOrDefault();
                if(chofer != null)
                {
                    planilla.Chofer = chofer;
                    choferesSinAsignar.Remove(chofer);
                }
            }
        }

        private void GenerarAlertaDeInsuficiencia(int vehiculosFaltantes, int choferesFaltantes)
        {
            AlertaInsuficienciaBE alerta = new AlertaInsuficienciaBE
            {
                Fecha = DateTime.Now,
                ChoferesFaltantes = choferesFaltantes,
                VehiculosFaltantes = vehiculosFaltantes
            };
            AlertaInsuficiencia.Guardar(alerta);
        }
    }
}
