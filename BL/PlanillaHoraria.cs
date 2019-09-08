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

        public static List<PlanillaHoraria> ObtenerPlanilas(Recorrido recorrido, List<DateTime> fechas)
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
