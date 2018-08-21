using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class BitacoraDAL
    {
        private DateTime _fechaHora;
        public DateTime FechaHora
        {
            get { return _fechaHora; }
            set { _fechaHora = value; }
        }

        private string _detalle;
        public string Detalle
        {
            get { return _detalle; }
            set { _detalle = value; }
        }

        public void Guardar()
        {

        }

        public static List<BitacoraDAL> ObtenerVarios(DateTime fechaInicio, DateTime fechaFin, string texto)
        {
            return new List<BitacoraDAL>();
        }
    }
}
