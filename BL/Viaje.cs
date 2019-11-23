using BE;
using DAL;
using System.Collections.Generic;

namespace BL
{
    public class Viaje
    {        
        public static void Guardar(ViajeBE viaje, PlanillaHorariaBE planillaHoraria)
        {
            ViajeDAL.Guardar(viaje, planillaHoraria.Id);
        }

        public static void RecalcularDVV()
        {
            ViajeDAL.RecalcularDVV();
        }

        public static List<ViajeBE> ObtenerPorPlanilla(PlanillaHorariaBE planilla)
        {
            List<ViajeBE> viajes = ViajeDAL.ObtenerPorPlanillaHoraria(planilla.Id);
            foreach(ViajeBE viaje in viajes)
            {
                viaje.TerminalOrigen = viaje.EsIda ? planilla.Recorrido?.TerminalInicio : planilla.Recorrido?.TerminalFin;
                viaje.TerminalDestino = viaje.EsIda ? planilla.Recorrido?.TerminalFin : planilla.Recorrido?.TerminalInicio;
            }

            return viajes;
        }
    }
}
