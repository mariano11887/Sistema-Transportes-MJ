using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Viaje
    {
        #region Propiedades
        private int _id;

        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        private DateTime _horaSalida;

        public DateTime HoraSalida
        {
            get { return _horaSalida; }
            set { _horaSalida = value; }
        }

        private DateTime _horaEstimadaLlegada;

        public DateTime HoraEstimadaLlegada
        {
            get { return _horaEstimadaLlegada; }
            set { _horaEstimadaLlegada = value; }
        }

        private DateTime _horaRealLlegada;

        public DateTime HoraRealLlegada
        {
            get { return _horaRealLlegada; }
            set { _horaRealLlegada = value; }
        }

        private bool _completado;

        public bool Completado
        {
            get { return _completado; }
            set { _completado = value; }
        }

        private CompletitudViaje _completitud;

        public CompletitudViaje Completitud
        {
            get { return _completitud; }
            set { _completitud = value; }
        }

        private Terminal _terminalDestino;

        public Terminal TerminalDestino
        {
            get { return _terminalDestino; }
            set { _terminalDestino = value; }
        }
        #endregion

        public static List<Viaje> ObtenerPorPlanilla(PlanillaHoraria planilla)
        {
            return ViajeDAL.ObtenerPorPlanillaHoraria(planilla.Id).Select(dal => new Viaje
            {
                Completado = dal.Completado,
                Completitud = (CompletitudViaje)dal.CompletitudId,
                HoraEstimadaLlegada = dal.HoraEstimadaLlegada,
                HoraRealLlegada = dal.HoraRealLlegada,
                HoraSalida = dal.HoraSalida,
                Id = dal.Id
            }).ToList();
        }
    }
}
