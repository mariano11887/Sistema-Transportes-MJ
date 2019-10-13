using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class PlanillaHorariaDAL : IDigitoVerificable
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

        private int _dvh;

        public int DVH
        {
            get { return _dvh; }
        }
        #endregion

        public string ObtenerNombreTabla()
        {
            return "planilla_horaria";
        }

        public List<RegistroParaDV> ObtenerRegistrosParaDV()
        {
            string query = "SELECT id, chofer_id, coche_id, recorrido_id, fecha, dvh FROM planilla_horaria";
            DataTable table = SqlHelper.Obtener(query, new SqlParameter[0]);

            return table.Select().Select(r => new RegistroParaDV
            {
                Registro = r["id"].ToString() + r["chofer_id"].ToString() + r["coche_id"].ToString() + 
                    r["recorrido_id"].ToString() + DateTime.Parse(r["fecha"].ToString()).ToString("yyyyMMdd"),
                DVH = int.Parse(r["dvh"].ToString())
            }).ToList();
        }

        public void Guardar()
        {
            string query = "INSERT INTO planilla_horaria (chofer_id, coche_id, recorrido_id, fecha, dvh) " +
                "OUTPUT INSERTED.id VALUES (@choferId, @cocheId, @recorridoId, @fecha, 0)";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@choferId", ChoferId),
                new SqlParameter("@cocheId", CocheId),
                new SqlParameter("@recorridoId", RecorridoId),
                new SqlParameter("@fecha", Fecha)
            };

            Id = SqlHelper.Insertar(query, parameters);

            string registro = string.Format("{0}{1}{2}{3}{4}", Id, ChoferId, CocheId, RecorridoId, Fecha.ToString("yyyyMMdd"));
            _dvh = DigitoVerificadorDAL.CalcularDV(registro);

            DigitoVerificadorDAL.ActualizarDVH("planilla_horaria", _dvh, Id);
        }

        public static void RecalcularDVV()
        {
            DigitoVerificadorDAL.RecalcularDVV("planilla_horaria");
        }

        public static DateTime ObtenerUltimaPlanilla()
        {
            string query = "SELECT MAX(fecha) FROM planilla_horaria";
            string fecha = SqlHelper.ObtenerValor<string>(query, new SqlParameter[0]);
            return fecha != null ? DateTime.Parse(fecha) : default;
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
            return Transformar(table);
        }

        public static List<PlanillaHorariaDAL> Buscar(int idPlanilla, DateTime? fecha, int idChofer, int idVehiculo, int idRecorrido)
        {
            string query = "SELECT TOP 1000 id, chofer_id, coche_id, recorrido_id, fecha FROM planilla_horaria " +
                "WHERE 1 = 1";
            List<SqlParameter> parameters = new List<SqlParameter>();

            if(idPlanilla > 0)
            {
                query += " AND id = @id";
                parameters.Add(new SqlParameter("@id", idPlanilla));
            }

            if(fecha.HasValue)
            {
                query += " AND fecha = @fecha";
                parameters.Add(new SqlParameter("@fecha", fecha.Value.Date));
            }

            if(idChofer > 0)
            {
                query += " AND chofer_id = @idChofer";
                parameters.Add(new SqlParameter("@idChofer", idChofer));
            }

            if (idVehiculo > 0)
            {
                query += " AND coche_id = @idCoche";
                parameters.Add(new SqlParameter("@idCoche", idVehiculo));
            }

            if (idRecorrido > 0)
            {
                query += " AND recorrido_id = @idRecorrido";
                parameters.Add(new SqlParameter("@idRecorrido", idRecorrido));
            }

            query += " ORDER BY fecha DESC";

            DataTable table = SqlHelper.Obtener(query, parameters.ToArray());
            return Transformar(table);
        }

        private static List<PlanillaHorariaDAL> Transformar(DataTable table)
        {
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
