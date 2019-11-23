using BE;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace DAL
{
    public class RecorridoDAL
    {
        public static List<RecorridoBE> ListarTodos()
        {
            string query = "SELECT id, linea, ramal, terminal_inicio_id, terminal_fin_id FROM recorrido";
            DataTable table = SqlHelper.Obtener(query, new SqlParameter[0]);
            return RealizarBusqueda(table);
        }

        public static RecorridoBE Obtener(int idRecorrido)
        {
            string query = "SELECT id, linea, ramal, terminal_inicio_id, terminal_fin_id " +
                "FROM recorrido WHERE id = @id";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@id", idRecorrido)
            };

            DataTable table = SqlHelper.Obtener(query, parameters);
            return RealizarBusqueda(table).FirstOrDefault();
        }

        private static List<RecorridoBE> RealizarBusqueda(DataTable table)
        {
            return table.Select().Select(r => new RecorridoBE
            {
                Id = int.Parse(r["id"].ToString()),
                Linea = int.Parse(r["linea"].ToString()),
                Ramal = r.IsNull("ramal") ? "" : r["ramal"].ToString(),
                TerminalInicio = TerminalDAL.Obtener(int.Parse(r["terminal_inicio_id"].ToString())),
                TerminalFin = TerminalDAL.Obtener(int.Parse(r["terminal_fin_id"].ToString()))
            }).ToList();
        }
    }
}
