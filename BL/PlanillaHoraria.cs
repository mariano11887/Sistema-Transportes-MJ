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

            // Se establace como límite 3 meses hacia atrás.
            DateTime fecha = DateTime.Today.AddMonths(-3);
            while(fecha < DateTime.Today)
            {
                if(ObtenerTipoDeDia(fecha) == tipoDeDia)
                {
                    diasDelMismoTipo.Add(fecha);
                }
                fecha.AddDays(1);
            }

            return diasDelMismoTipo;
        }

        private static List<PlanillaHoraria> ObtenerPlanilas(Recorrido recorrido, List<DateTime> fechas)
        {
            return PlanillaHorariaDAL.ObtenerPorRecorridoYFechas(recorrido.Id, fechas).Select(dal => new PlanillaHoraria
            {
                _choferId = dal.ChoferId
            }).ToList();
        }
    }
}
