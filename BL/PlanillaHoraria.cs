using DAL;
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

        private Chofer _chofer;

        public Chofer Chofer
        {
            get { return _chofer; }
            set { _chofer = value; }
        }

        private Vehiculo _vehiculo;

        public Vehiculo Vehiculo
        {
            get { return _vehiculo; }
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
    }
}
