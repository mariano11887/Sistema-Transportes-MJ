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
    public class BitacoraDAL
    {
        #region Métodos
        public static void Guardar(BitacoraBE bitacora)
        {
            string query = "INSERT INTO bitacora (fecha_hora, usuario_id, detalle) VALUES (@fechaHora, @usuarioId, @detalle);";
            SqlParameter[] parameters = new SqlParameter[3]
            {
                new SqlParameter("@fechaHora", bitacora.FechaHora),
                new SqlParameter("@usuarioId", bitacora.Usuario.Id),
                new SqlParameter("@detalle", bitacora.Detalle)
            };
            SqlHelper.Ejecutar(query, parameters, SqlHelper.Bd.Bitacora);
        }

        public static List<BitacoraBE> Buscar(DateTime fechaInicio, DateTime fechaFin, int usuarioId, string texto)
        {
            string query = "SELECT fecha_hora, usuario_id, detalle FROM bitacora WHERE fecha_hora BETWEEN @fechaInicio AND @fechaFin";
            List<SqlParameter> paramList = new List<SqlParameter> {
                new SqlParameter("@fechaInicio", fechaInicio),
                new SqlParameter("@fechaFin", fechaFin)
            };
            if(usuarioId > 0)
            {
                query += " AND usuario_id = @usuarioId";
                paramList.Add(new SqlParameter("@usuarioId", usuarioId));
            }
            if(!string.IsNullOrEmpty(texto))
            {
                query += " AND detalle LIKE @detalle";
                paramList.Add(new SqlParameter("@detalle", "%" + texto + "%"));
            }
            DataTable table = SqlHelper.Obtener(query, paramList.ToArray(), SqlHelper.Bd.Bitacora);
            List<BitacoraBE> bitacoras = new List<BitacoraBE>();
            foreach(DataRow row in table.Rows)
            {
                BitacoraBE bitacora = new BitacoraBE
                {
                    FechaHora = DateTime.Parse(row["fecha_hora"].ToString()),
                    Usuario = UsuarioDAL.Obtener(int.Parse(row["usuario_id"].ToString())),
                    Detalle = row["detalle"].ToString()
                };
                bitacoras.Add(bitacora);
            }
            return bitacoras;
        }
        #endregion
    }
}
