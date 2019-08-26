using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class PlanillaHorariaDAL
    {
        #region Propiedades
        private int _id;

        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        private int _choferId;

        public int ChoferId
        {
            get { return _choferId; }
            set { _choferId = value; }
        }

        private int _cocheId;

        public int CocheId
        {
            get { return _cocheId; }
            set { _cocheId = value; }
        }

        private int _recorridoId;

        public int RecorridoId
        {
            get { return _recorridoId; }
            set { _recorridoId = value; }
        }

        private DateTime _fecha;

        public DateTime Fecha
        {
            get { return _fecha; }
            set { _fecha = value; }
        }

        private short _dvh;

        public short DVH
        {
            get { return _dvh; }
            set { _dvh = value; }
        }
        #endregion

        public static DateTime ObtenerUltimaPlanilla()
        {
            string query = "SELECT MAX(fecha) FROM planilla_horaria";
            return SqlHelper.ObtenerValor<DateTime>(query, new SqlParameter[0]);
        }
    }
}
