using System;
using System.Collections.Generic;
using System.Data;
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

        public static List<PlanillaHorariaDAL> ObtenerPorRecorridoYFechas(int recorridoId, List<DateTime> fechas)
        {
            string query = "SELECT id, chofer_id, coche_id, recorrido_id, fecha FROM planilla_horaria " +
                "WHERE recorrido_id = @recorridoId AND fecha IN ({0})";
            List<SqlParameter> parameters = new List<SqlParameter>()
            {
                new SqlParameter("@recorridoId", recorridoId)
            };

            StringBuilder sb = new StringBuilder();
            for(int i = 0; i < fechas.Count; i++)
            {
                string parameterName = "@fecha" + i;
                sb.Append(parameterName).Append(",");
                parameters.Add(new SqlParameter(parameterName, fechas[i].ToString("yyyy-MM-dd")));
            }

            query = string.Format(query, sb.ToString().TrimEnd(','));

            DataTable table = SqlHelper.Obtener(query, parameters.ToArray());
            return table.Select().Select(r => new PlanillaHorariaDAL
            {
                ChoferId = int.Parse(r["chofer_id"].ToString()),
                CocheId = int.Parse(r["coche_id"].ToString()),
                Fecha = DateTime.Parse(r["fecha"].ToString()),
                Id = int.Parse(r["id"].ToString()),
                RecorridoId = int.Parse(r["recorrido_id"].ToString())
            }).ToList();
        }
    }
}
