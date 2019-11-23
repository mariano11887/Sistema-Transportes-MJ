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
    public class IdiomaDAL
    {
        #region Métodos públicos
        public static void Guardar(IdiomaBE idioma)
        {
            if(idioma.Id > 0)
            {
                Actualizar(idioma);
            }
            else
            {
                Insertar(idioma);
            }
        }

        public static IdiomaBE Obtener(int id)
        {
            string query = "SELECT id, nombre, editable FROM idioma WHERE id = @id";
            SqlParameter[] parameters =
            {
                new SqlParameter("@id", id)
            };
            DataTable table = SqlHelper.Obtener(query, parameters);
            if(table.Rows.Count > 0)
            {
                return new IdiomaBE()
                {
                    Id = int.Parse(table.Rows[0]["id"].ToString()),
                    Nombre = table.Rows[0]["nombre"].ToString(),
                    Editable = bool.Parse(table.Rows[0]["editable"].ToString()),
                    Leyendas = LeyendaDAL.Obtener(id)
                };
            }
            return null;
        }

        public static void Borrar(int id)
        {
            string query = "DELETE FROM idioma WHERE id = @idiomaId AND editable = 1";
            SqlParameter[] parameters =
            {
                new SqlParameter("@idiomaId", id)
            };
            SqlHelper.Ejecutar(query, parameters);
        }

        public static List<IdiomaBE> ObtenerTodos()
        {
            string query = "SELECT id, nombre, editable FROM idioma";
            SqlParameter[] parameters = new SqlParameter[0];
            DataTable table = SqlHelper.Obtener(query, parameters);
            List<IdiomaBE> idiomas = new List<IdiomaBE>();
            foreach(DataRow row in table.Rows)
            {
                int id = int.Parse(row["id"].ToString());
                IdiomaBE idiomaDAL = new IdiomaBE
                {
                    Id = id,
                    Nombre = row["nombre"].ToString(),
                    Editable = bool.Parse(row["editable"].ToString()),
                    Leyendas = LeyendaDAL.Obtener(id)
                };
                idiomas.Add(idiomaDAL);
            }
            return idiomas;
        }
        #endregion

        #region Métodos privados
        private static void Insertar(IdiomaBE idioma)
        {
            string query = "INSERT INTO idioma (nombre) OUTPUT INSERTED.id VALUES (@nombre)";
            SqlParameter[] parameters = new SqlParameter[1]
            {
                new SqlParameter("@nombre", idioma.Nombre)
            };
            idioma.Id = SqlHelper.Insertar(query, parameters);
        }

        private static void Actualizar(IdiomaBE idioma)
        {
            string query = "UPDATE idioma SET nombre = @nombre WHERE id = @id AND editable = 1";
            SqlParameter[] parameters = new SqlParameter[2]
            {
                new SqlParameter("@nombre", idioma.Nombre),
                new SqlParameter("@id", idioma.Id)
            };
            SqlHelper.Ejecutar(query, parameters);
        }
        #endregion
    }
}
