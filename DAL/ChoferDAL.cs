using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class ChoferDAL
    {
        #region Propiedades
        private int _id;

        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        private string _nombre;

        public string Nombre
        {
            get { return _nombre; }
            set { _nombre = value; }
        }

        private int _dni;

        public int Dni
        {
            get { return _dni; }
            set { _dni = value; }
        }

        private int _cochePreferidoId;

        public int CochePreferidoId
        {
            get { return _cochePreferidoId; }
            set { _cochePreferidoId = value; }
        }

        private DateTime _fechaFinLicencia;

        public DateTime FechaFinLicencia
        {
            get { return _fechaFinLicencia; }
            set { _fechaFinLicencia = value; }
        }

        private bool _habilitado;

        public bool Habilitado
        {
            get { return _habilitado; }
            set { _habilitado = value; }
        }
        #endregion

        public static List<ChoferDAL> Buscar(string nombre, int dni, bool? deLicencia, int idCochePreferido)
        {
            string queryLicencia;
            if(deLicencia == true)
            {
                queryLicencia = "(fecha_fin_licencia IS NOT NULL AND fecha_fin_licencia > GETDATE())";
            }
            else if(deLicencia == false)
            {
                queryLicencia = "(fecha_fin_licencia IS NULL OR fecha_fin_licencia < GETDATE())";
            }
            else
            {
                queryLicencia = "1 = 1";
            }

            List<SqlParameter> parameters = new List<SqlParameter>();

            string queryCochePreferido;
            if(idCochePreferido > 0)
            {
                queryCochePreferido = "coche_preferido_id = @cochePreferidoId";
                parameters.Add(new SqlParameter("@cochePreferidoId", idCochePreferido));
            }
            else
            {
                queryCochePreferido = "1 = 1";
            }

            string queryTemplate = "SELECT id, nombre, dni, coche_preferido_id, fecha_fin_licencia, habilitado " +
                "FROM chofer WHERE habilitado = 1 AND nombre LIKE {0} AND dni = {1} " +
                "AND " + queryLicencia + " AND " + queryCochePreferido;

            string sqlNombre, sqlDni;

            if(string.IsNullOrWhiteSpace(nombre))
            {
                sqlNombre = "nombre";
            }
            else
            {
                sqlNombre = "@nombre";
                parameters.Add(new SqlParameter("@nombre", "%" + nombre + "%"));
            }

            if(dni <= 0)
            {
                sqlDni = "dni";
            }
            else
            {
                sqlDni = "@dni";
                parameters.Add(new SqlParameter("@dni", dni));
            }

            string query = string.Format(queryTemplate, sqlNombre, sqlDni);

            return HacerBusqueda(query, parameters.ToArray()).ToList();
        }

        public static ChoferDAL Obtener(int id)
        {
            string query = "SELECT id, nombre, dni, coche_preferido_id, fecha_fin_licencia, habilitado FROM chofer " +
                "WHERE habilitado = 1 AND id = @id";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@id", id)
            };

            return HacerBusqueda(query, parameters).FirstOrDefault();
        }

        public void Guardar()
        {
            if(Id > 0)
            {
                Actualizar();
            }
            else
            {
                Insertar();
            }
        }

        public static void Borrar(int id)
        {
            string query = "UPDATE chofer SET habilitado = 0 WHERE id = @id";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@id", id)
            };

            SqlHelper.Ejecutar(query, parameters);
        }

        private static IEnumerable<ChoferDAL> HacerBusqueda(string query, SqlParameter[] parameters)
        {
            DataTable table = SqlHelper.Obtener(query, parameters);
            return table.Select().Select(r => new ChoferDAL
            {
                CochePreferidoId = r.IsNull("coche_preferido_id") ? 0 : int.Parse(r["coche_preferido_id"].ToString()),
                Dni = int.Parse(r["dni"].ToString()),
                FechaFinLicencia = r.IsNull("fecha_fin_licencia") ? default : DateTime.Parse(r["fecha_fin_licencia"].ToString()),
                Habilitado = true,
                Id = int.Parse(r["id"].ToString()),
                Nombre = r["nombre"].ToString()
            });
        }

        private void Insertar()
        {
            string query = "INSERT INTO chofer (nombre, dni, coche_preferido_id, habilitado) " +
                "OUTPUT INSERTED.id VALUES (@nombre, @dni, @cochePreferidoId, 1)";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@nombre", Nombre),
                new SqlParameter("@dni", Dni),
                new SqlParameter("@cochePreferidoId", CochePreferidoId == 0 ? DBNull.Value : (object)CochePreferidoId)
            };

            Id = SqlHelper.Insertar(query, parameters);
        }

        private void Actualizar()
        {
            string query = "UPDATE chofer SET nombre = @nombre, dni = @dni, coche_preferido_id = @cochePreferidoId, " +
                "fecha_fin_licencia = @fechaFinLicencia WHERE id = @id";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@nombre", Nombre),
                new SqlParameter("@dni", Dni),
                new SqlParameter("@cochePreferidoId", CochePreferidoId == 0 ? DBNull.Value : (object)CochePreferidoId),
                new SqlParameter("@fechaFinLicencia", FechaFinLicencia >= DateTime.Today ? (object)FechaFinLicencia : DBNull.Value),
                new SqlParameter("@id", Id)
            };

            SqlHelper.Ejecutar(query, parameters);
        }
    }
}
