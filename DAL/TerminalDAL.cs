using BE;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace DAL
{
    public class TerminalDAL
    {
        public static TerminalBE Obtener(int id)
        {
            string query = "SELECT id, nombre, direccion, latitud, longitud FROM terminal WHERE id = @id";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@id", id)
            };

            DataTable table = SqlHelper.Obtener(query, parameters);
            return table.Select().Select(r => new TerminalBE
            {
                Direccion = r["direccion"].ToString(),
                Id = int.Parse(r["id"].ToString()),
                Latitud = double.Parse(r["latitud"].ToString()),
                Longitud = double.Parse(r["longitud"].ToString()),
                Nombre = r["nombre"].ToString()
            }).FirstOrDefault();
        }

        public static List<TerminalBE> ListarTodas()
        {
            string query = "SELECT id, nombre, direccion, latitud, longitud FROM terminal";

            DataTable table = SqlHelper.Obtener(query, new SqlParameter[0]);
            return table.Select().Select(r => new TerminalBE
            {
                Direccion = r["direccion"].ToString(),
                Id = int.Parse(r["id"].ToString()),
                Latitud = double.Parse(r["latitud"].ToString()),
                Longitud = double.Parse(r["longitud"].ToString()),
                Nombre = r["nombre"].ToString()
            }).ToList();
        }
    }
}
