using DAL;
using Nager.Date;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class PlanillaHoraria
    {
        #region Propiedades
        private int _id;

        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        private int _choferId;
        private Chofer _chofer;

        public Chofer Chofer
        {
            get
            {
                if(_chofer == null && _choferId > 0)
                {
                    _chofer = Chofer.Obtener(_choferId);
                }
                return _chofer;
            }
            set { _chofer = value; }
        }

        private int _vehiculoId;
        private Vehiculo _vehiculo;

        public Vehiculo Vehiculo
        {
            get
            {
                if(_vehiculo == null && _vehiculoId > 0)
                {
                    _vehiculo = Vehiculo.Buscar(_vehiculoId);
                }
                return _vehiculo;
            }
            set { _vehiculo = value; }
        }

        private Recorrido _recorrido;

        public Recorrido Recorrido
        {
            get { return _recorrido; }
            set { _recorrido = value; }
        }

        private DateTime _fecha;

        public DateTime Fecha
        {
            get { return _fecha; }
            set { _fecha = value; }
        }

        private List<Viaje> _viajes;

        public List<Viaje> Viajes
        {
            get { return _viajes; }
            set { _viajes = value; }
        }
        #endregion

        public static DateTime ObtenerUltimaPlanilla()
        {
            DateTime ultimaFecha = PlanillaHorariaDAL.ObtenerUltimaPlanilla();
            if(ultimaFecha == default)
            {
                // Si no hay planillas, pongo la fecha de hoy
                ultimaFecha = DateTime.Today;
            }
            return ultimaFecha;
        }

        public static DateTime ObtenerProximaFecha(DateTime ultimaFecha, out bool puedeGenerarse)
        {
            DateTime proximaFecha = (ultimaFecha <= DateTime.Today ? DateTime.Today : ultimaFecha).AddDays(1);

            puedeGenerarse = proximaFecha <= DateTime.Today.AddDays(7);
            return proximaFecha;
        }

        public static void GenerarProximasPlanillas()
        {
            DateTime proximaFecha = ObtenerProximaFecha(ObtenerUltimaPlanilla(), out bool puedeGenerarse);
            if(!puedeGenerarse)
            {
                return;
            }

            // Busco en el historial de viajes los que correspondan al mismo tipo de día
            TipoDeDia tipoDeDia = ObtenerTipoDeDia(proximaFecha);
            List<DateTime> diasDelMismoTipo = ObtenerDiasDelMismoTipo(tipoDeDia);

            // Proceso cada recorrido individualmente
            List<Recorrido> recorridos = Recorrido.ListarTodos();
            foreach(Recorrido recorrido in recorridos)
            {
                CalcularIntervalos(recorrido, diasDelMismoTipo, 
                    out Dictionary<int, int> frecuenciaPorIntervalo, out Dictionary<int, TimeSpan> duracionPorIntervalo);

                List<PlanillaHoraria> planillas = new List<PlanillaHoraria>();

                // Una vez que termino con el cálculo de cada intervalo genero viajes
                // El primer viaje del día es a las 4 AM
                DateTime inicioProximoViaje = new DateTime(0, 0, 0, 4, 0, 0);
                foreach (int intervalo in frecuenciaPorIntervalo.Keys)
                {
                    while (inicioProximoViaje.Hour - inicioProximoViaje.Hour % 2 == intervalo)
                    {
                        Viaje viajeIda = new Viaje
                        {
                            HoraSalida = inicioProximoViaje,
                            HoraEstimadaLlegada = inicioProximoViaje.Add(duracionPorIntervalo[intervalo]),
                            TerminalDestino = recorrido.TerminalFin
                        };

                        // Busco la planilla cuyo último viaje termine en la terminal de salida antes de que 
                        // salga este micro (más 15 min de descanso)
                        PlanillaHoraria planilla = planillas.Where(p => 
                            p.Viajes.Last().TerminalDestino == recorrido.TerminalInicio
                            && p.Viajes.Last().HoraEstimadaLlegada.AddMinutes(15) < inicioProximoViaje).FirstOrDefault();

                        if (planilla == null)
                        {
                            planilla = new PlanillaHoraria
                            {
                                Fecha = proximaFecha,
                                Recorrido = recorrido,
                                Viajes = new List<Viaje>()
                            };
                            planillas.Add(planilla);
                        }
                        planilla.Viajes.Add(viajeIda);
                        
                        // Hago lo mismo con el viaje de vuelta (TODO)
                        Viaje viajeVuelta = new Viaje
                        {
                            HoraSalida = inicioProximoViaje,
                            HoraEstimadaLlegada = inicioProximoViaje.Add(duracionPorIntervalo[intervalo]),
                            TerminalDestino = recorrido.TerminalInicio,
                        };

                        inicioProximoViaje = inicioProximoViaje.AddMinutes(frecuenciaPorIntervalo[intervalo]);
                    }
                }
            }
        }

        private static void CalcularIntervalos(Recorrido recorrido, List<DateTime> dias,
            out Dictionary<int, int> frecuenciaPorIntervalo, 
            out Dictionary<int, TimeSpan> duracionPorIntervalo)
        {
            List<PlanillaHoraria> planillas = ObtenerPlanilas(recorrido, dias);

            frecuenciaPorIntervalo = new Dictionary<int, int>();
            duracionPorIntervalo = new Dictionary<int, TimeSpan>();

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
                for (int dia = 0; dia < diasDeCalculo; dia++)
                {
                    // Viajes de este intervalo de cada planilla
                    List<Viaje> viajesDeIntervalo = planillasPorDia[dia].Planillas.SelectMany(p => p.Viajes)
                        .Where(v => v.HoraSalida.Hour - v.HoraSalida.Hour % 2 == intervalo).OrderBy(v => v.HoraSalida).ToList();

                    decimal sumaCompletitud = 0;
                    for (int iViaje = 0; iViaje < viajesDeIntervalo.Count; iViaje++)
                    {
                        Viaje viaje = viajesDeIntervalo[iViaje];

                        // Completitud del viaje
                        if (viaje.Completitud == CompletitudViaje.Vacio)
                        {
                            sumaCompletitud += 0.5M;
                        }
                        else if (viaje.Completitud == CompletitudViaje.Moderado)
                        {
                            sumaCompletitud += 1;
                        }
                        else if (viaje.Completitud == CompletitudViaje.Lleno)
                        {
                            sumaCompletitud += 1.5M;
                        }

                        // Duración del viaje
                        sumaDuracion.Add(viaje.HoraRealLlegada - viaje.HoraSalida);

                        // Frecuencia del día anterior
                        if (dia == 0 && frecuenciaDiaAnterior < 0 && iViaje < viajesDeIntervalo.Count)
                        {
                            frecuenciaDiaAnterior = (viajesDeIntervalo[iViaje + 1].HoraSalida - viaje.HoraSalida).Minutes;
                        }
                    }

                    decimal promedioCompletitudIntervalo = sumaCompletitud / viajesDeIntervalo.Count;
                    decimal indiceDeAjuste = promedioCompletitudIntervalo * (diasDeCalculo - dia) / diasDeCalculo;
                    sumaDeIndices += indiceDeAjuste;
                }

                int nuevaFrecuencia;
                TimeSpan nuevaDuracion;
                if (diasDeCalculo > 0)
                {
                    decimal multiplicadorDeFrecuencia = sumaDeIndices / diasDeCalculo;
                    nuevaFrecuencia = (int)Math.Round(frecuenciaDiaAnterior * multiplicadorDeFrecuencia);
                    nuevaDuracion = new TimeSpan(sumaDuracion.Ticks / diasDeCalculo);
                }
                else
                {
                    // Si no hay datos, decido que la frecuencia es cada 12 minutos y la duración de 1 hora
                    nuevaFrecuencia = 12;
                    nuevaDuracion = new TimeSpan(1, 0, 0);
                }

                frecuenciaPorIntervalo.Add(intervalo, nuevaFrecuencia);
                duracionPorIntervalo.Add(intervalo, nuevaDuracion);
            }
        }

        private static TipoDeDia ObtenerTipoDeDia(DateTime fecha)
        {
            if(fecha.DayOfWeek == DayOfWeek.Sunday || DateSystem.IsPublicHoliday(fecha, CountryCode.AR))
            {
                return TipoDeDia.DomingoOFeriado;
            }
            else if(fecha.DayOfWeek == DayOfWeek.Saturday)
            {
                return TipoDeDia.Sabado;
            }
            else
            {
                return TipoDeDia.DiaDeSemana;
            }
        }

        private static List<DateTime> ObtenerDiasDelMismoTipo(TipoDeDia tipoDeDia)
        {
            List<DateTime> diasDelMismoTipo = new List<DateTime>();

            // Se establace como límite 10 días hacia atrás del mismo tipo que se requiere.
            DateTime fecha = DateTime.Today.AddDays(-1);
            while(diasDelMismoTipo.Count < 10)
            {
                if(ObtenerTipoDeDia(fecha) == tipoDeDia)
                {
                    diasDelMismoTipo.Add(fecha);
                }
                fecha = fecha.AddDays(-1);
            }

            return diasDelMismoTipo;
        }

        private static List<PlanillaHoraria> ObtenerPlanilas(Recorrido recorrido, List<DateTime> fechas)
        {
            List<PlanillaHoraria> planillas = PlanillaHorariaDAL.ObtenerPorRecorridoYFechas(recorrido.Id, fechas)
                .Select(dal => new PlanillaHoraria
            {
                _choferId = dal.ChoferId,
                Fecha = dal.Fecha,
                Id = dal.Id,
                _vehiculoId = dal.CocheId
            }).ToList();

            foreach(PlanillaHoraria planilla in planillas)
            {
                planilla.Viajes = Viaje.ObtenerPorPlanilla(planilla);
            }

            return planillas;
        }
    }
}
