using BE;
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

        public static void Guardar(PlanillaHorariaBE planillaHoraria)
        {
            string query = "INSERT INTO planilla_horaria (chofer_id, coche_id, recorrido_id, fecha, dvh) " +
                "OUTPUT INSERTED.id VALUES (@choferId, @cocheId, @recorridoId, @fecha, 0)";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@choferId", planillaHoraria.Chofer.Id),
                new SqlParameter("@cocheId", planillaHoraria.Vehiculo.Id),
                new SqlParameter("@recorridoId", planillaHoraria.Recorrido.Id),
                new SqlParameter("@fecha", planillaHoraria.Fecha)
            };

            planillaHoraria.Id = SqlHelper.Insertar(query, parameters);

            string registro = string.Format("{0}{1}{2}{3}{4}", planillaHoraria.Id, planillaHoraria.Chofer.Id, 
                planillaHoraria.Vehiculo.Id, planillaHoraria.Recorrido.Id, planillaHoraria.Fecha.ToString("yyyyMMdd"));
            int dvh = DigitoVerificadorDAL.CalcularDV(registro);

            DigitoVerificadorDAL.ActualizarDVH("planilla_horaria", dvh, planillaHoraria.Id);
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

        public static List<PlanillaHorariaBE> ObtenerPorRecorridoYFechas(int recorridoId, List<DateTime> fechas)
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

        public static List<PlanillaHorariaBE> Buscar(int idPlanilla, DateTime? fecha, int idChofer, int idVehiculo, int idRecorrido)
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

        private static List<PlanillaHorariaBE> Transformar(DataTable table)
        {
            return table.Select().Select(r => new PlanillaHorariaBE
            {
                Chofer = ChoferDAL.Obtener(int.Parse(r["chofer_id"].ToString())),
                Vehiculo = VehiculoDAL.Obtener(int.Parse(r["coche_id"].ToString())),
                Fecha = DateTime.Parse(r["fecha"].ToString()),
                Id = int.Parse(r["id"].ToString()),
                Recorrido = RecorridoDAL.Obtener(int.Parse(r["recorrido_id"].ToString())),
                Viajes = ViajeDAL.ObtenerPorPlanillaHoraria(int.Parse(r["id"].ToString()))
            }).ToList();
        }
    }
}
