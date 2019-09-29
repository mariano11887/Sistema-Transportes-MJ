using Logger;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class PermisoDAL
    {
        #region Propiedades
        private int _permisoId;
        public int PermisoId
        {
            get { return _permisoId; }
            set { _permisoId = value; }
        }

        private string _nombre;
        public string Nombre
        {
            get { return _nombre; }
            set { _nombre = value; }
        }

        private List<int> _permisosHijosIds;
        public List<int> PermisosHijosIds
        {
            get
            {
                if (_permisosHijosIds == null)
                {
                    if (_permisoId > 0)
                    {
                        BuscarPermisosHijos();
                    }
                    else
                    {
                        _permisosHijosIds = new List<int>();
                    }
                }
                return _permisosHijosIds;

            }
            set { _permisosHijosIds = value; }
        }

        private string _descripcion;
        public string Descripcion
        {
            get { return _descripcion; }
            set { _descripcion = value; }
        }

        private bool _habilitado;
        public bool Habilitado
        {
            get { return _habilitado; }
            set { _habilitado = value; }
        }
        #endregion

        #region Métodos públicos
        public static List<PermisoDAL> ObtenerPerfiles()
        {
            string query = "SELECT DISTINCT p.id, p.nombre, p.descripcion " +
                    "FROM permiso p " +
                    "INNER JOIN permiso_permiso pp ON p.id = pp.permiso_padre_id " +
                    "WHERE P.habilitado = 1";
            return Obtener(query, new SqlParameter[0]);
        }

        public static List<PermisoDAL> ObtenerPermisos()
        {
            string query = "SELECT DISTINCT p.id, p.nombre, p.descripcion " +
                    "FROM permiso p " +
                    "LEFT JOIN permiso_permiso pp ON p.id = pp.permiso_padre_id " +
                    "WHERE p.habilitado = 1 " +
                    "AND pp.permiso_padre_id IS NULL";
            return Obtener(query, new SqlParameter[0]);
        }

        public static PermisoDAL ObtenerPorId(int id)
        {
            string query = "SELECT id, nombre, descripcion FROM permiso WHERE habilitado = 1 AND id = @id";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@id", id)
            };
            return Obtener(query, parameters)?.FirstOrDefault();
        }

        public List<PermisoDAL> ObtenerPorUsuario(int usuarioId)
        {
            string query = "SELECT p.id, p.nombre, p.descripcion " +
                "FROM usuario_permiso up " +
                "JOIN permiso p ON p.id = up.permiso_id " +
                "WHERE up.usuario_id = @usuarioId " +
                "AND p.habilitado = 1;";
            SqlParameter[] paramsArray = new SqlParameter[1];
            paramsArray[0] = new SqlParameter
            {
                ParameterName = "@usuarioId",
                Value = usuarioId
            };

            return Obtener(query, paramsArray);
        }

        public void Guardar(bool actualizarHijos)
        {
            // Primero guardo los datos del permiso en sí
            if (PermisoId > 0)
            {
                Actualizar();
            }
            else
            {
                Insertar();
            }

            // Luego guardo los permisos hijos
            if (PermisoId > 0 && actualizarHijos)
            {
                // Borro permisos hijos
                string query = "DELETE FROM permiso_permiso WHERE permiso_padre_id = @permisoPadreId";
                SqlParameter[] parameters =
                {
                    new SqlParameter("@permisoPadreId", PermisoId)
                };
                SqlHelper.Ejecutar(query, parameters);

                // Inserto cada uno de los permisos hijos
                query = "INSERT INTO permiso_permiso (permiso_padre_id, permiso_hijo_id) VALUES (@permisoPadreId, @permisoHijoId)";
                foreach (int hijoId in PermisosHijosIds)
                {
                    parameters = new SqlParameter[2]
                    {
                        new SqlParameter("@permisoPadreId", PermisoId),
                        new SqlParameter("@permisoHijoId", hijoId)
                    };
                    SqlHelper.Ejecutar(query, parameters);
                }
            }
        }
        #endregion

        #region Métodos privados
        private void BuscarPermisosHijos()
        {
            string query = "SELECT pp.permiso_hijo_id " +
                "FROM permiso_permiso pp " +
                "INNER JOIN permiso p ON pp.permiso_hijo_id = p.id " +
                "WHERE p.habilitado = 1 " +
                "AND pp.permiso_padre_id = @permisoPadreId;";

            List<SqlParameter> parameters = new List<SqlParameter>
            {
                new SqlParameter("@permisoPadreId", _permisoId)
            };

            DataTable table = SqlHelper.Obtener(query, parameters.ToArray());
            _permisosHijosIds = new List<int>();
            foreach (DataRow row in table.Rows)
            {
                _permisosHijosIds.Add(int.Parse(row["permiso_hijo_id"].ToString()));
            }
        }

        private static List<PermisoDAL> Obtener(string query, SqlParameter[] parameters)
        {
            try
            {
                DataTable table = SqlHelper.Obtener(query, parameters);
                List<PermisoDAL> perfiles = new List<PermisoDAL>();
                foreach (DataRow row in table.Rows)
                {
                    PermisoDAL permisoDAL = new PermisoDAL()
                    {
                        Descripcion = row["descripcion"].ToString(),
                        Habilitado = true,
                        Nombre = row["nombre"].ToString(),
                        PermisoId = int.Parse(row["id"].ToString())
                    };
                    perfiles.Add(permisoDAL);
                }
                return perfiles;
            }
            catch (Exception ex)
            {
                Log.Grabar(ex);
                return new List<PermisoDAL>();
            }
        }

        private void Insertar()
        {
            string query = "INSERT INTO permiso (nombre, descripcion) OUTPUT INSERTED.id VALUES (@nombre, @descripcion)";
            SqlParameter[] parameters =
            {
                new SqlParameter("@nombre", Nombre),
                new SqlParameter("@descripcion", Descripcion)
            };
            PermisoId = SqlHelper.Insertar(query, parameters);
        }

        private void Actualizar()
        {
            string query = "UPDATE permiso SET nombre = @nombre, descripcion = @descripcion, habilitado = @habilitado WHERE id = @id";
            SqlParameter[] parameters =
            {
                new SqlParameter("@nombre", Nombre),
                new SqlParameter("@descripcion", Descripcion),
                new SqlParameter("@habilitado", Habilitado),
                new SqlParameter("@id", PermisoId)
            };
            SqlHelper.Ejecutar(query, parameters);
        }
        #endregion
    }
}
