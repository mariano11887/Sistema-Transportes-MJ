using BE;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;

namespace BL
{
    public class PlanillaHoraria
    {
        public static void GuardarViajes(PlanillaHorariaBE planillaHoraria)
        {
            foreach (ViajeBE viaje in planillaHoraria.Viajes)
            {
                Viaje.Guardar(viaje, planillaHoraria);
            }
            
            Viaje.RecalcularDVV();

            Bitacora.Loguear("Se actualizaron los viajes de la planilla N° " + planillaHoraria.Id);
        }

        private static void Guardar(PlanillaHorariaBE planillaHoraria)
        {
            PlanillaHorariaDAL.Guardar(planillaHoraria);

            // Guardo todos los viajes
            foreach(ViajeBE viaje in planillaHoraria.Viajes)
            {
                Viaje.Guardar(viaje, planillaHoraria);
            }
        }

        public static void GuardarMultiples(List<PlanillaHorariaBE> planillas)
        {
            planillas.ForEach(p => Guardar(p));
            PlanillaHorariaDAL.RecalcularDVV();
            Viaje.RecalcularDVV();
        }

        public static DateTime ObtenerUltimaPlanilla()
        {
            return PlanillaHorariaDAL.ObtenerUltimaPlanilla();
        }

        public static List<PlanillaHorariaBE> ObtenerPlanilas(RecorridoBE recorrido, List<DateTime> fechas)
        {
            List<PlanillaHorariaBE> planillas = PlanillaHorariaDAL.ObtenerPorRecorridoYFechas(recorrido.Id, fechas);

            foreach(PlanillaHorariaBE planilla in planillas)
            {
                planilla.Viajes = Viaje.ObtenerPorPlanilla(planilla);
            }

            return planillas;
        }

        public static List<PlanillaHorariaBE> Buscar(int numeroPlanilla, DateTime? fecha, ChoferBE chofer, VehiculoBE vehiculo, RecorridoBE recorrido)
        {
            List<PlanillaHorariaBE> planillas = PlanillaHorariaDAL.Buscar(numeroPlanilla, fecha, chofer.Id, vehiculo.Id, recorrido.Id);

            foreach (PlanillaHorariaBE planilla in planillas)
            {
                planilla.Viajes = Viaje.ObtenerPorPlanilla(planilla);
            }

            return planillas;
        }
    }
}
