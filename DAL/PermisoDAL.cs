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

        private bool _editable;
        public bool Editable
        {
            get { return _editable; }
            set { _editable = value; }
        }

        private bool _esPerfil;
        public bool EsPerfil
        {
            get { return _esPerfil; }
            set { _esPerfil = value; }
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
            try
            {
                string query = "SELECT id, nombre, descripcion, editable FROM permiso WHERE habilitado = 1 AND es_perfil = 1";
                DataTable table = SqlHelper.Instancia().Obtener(query, new SqlParameter[0]);
                List<PermisoDAL> perfiles = new List<PermisoDAL>();
                foreach(DataRow row in table.Rows)
                {
                    PermisoDAL permisoDAL = new PermisoDAL()
                    {
                        Descripcion = row["descripcion"].ToString(),
                        Editable = bool.Parse(row["editable"].ToString()),
                        EsPerfil = true,
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

        public static PermisoDAL ObtenerPorNombre(string Nombre)
        {
            try
            {
                string query = "SELECT id, nombre, descripcion, editable, es_perfil FROM permiso WHERE habilitado = 1 AND nombre = @nombre";
                SqlParameter[] parameters = new SqlParameter[1]
                {
                    new SqlParameter("@nombre", Nombre)
                };
                DataTable table = SqlHelper.Instancia().Obtener(query, parameters);
                if(table.Rows.Count > 0)
                {
                    DataRow row = table.Rows[0];
                    PermisoDAL permisoDAL = new PermisoDAL()
                    {
                        Descripcion = row["descripcion"].ToString(),
                        Editable = bool.Parse(row["editable"].ToString()),
                        EsPerfil = bool.Parse(row["es_perfil"].ToString()),
                        Habilitado = true,
                        Nombre = row["nombre"].ToString(),
                        PermisoId = int.Parse(row["id"].ToString())
                    };
                    return permisoDAL;
                }
            }
            catch (Exception ex)
            {
                Log.Grabar(ex);
            }
            return null;
        }

        public void Guardar(bool ActualizarHijos)
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
            if (PermisoId > 0 && ActualizarHijos)
            {
                // Borro permisos hijos
                string query = "DELETE FROM permiso_permiso WHERE permiso_padre_id = @permisoPadreId";
                SqlParameter[] parameters =
                {
                    new SqlParameter("@permisoPadreId", PermisoId)
                };
                SqlHelper.Instancia().Ejecutar(query, parameters);

                // Inserto cada uno de los permisos hijos
                query = "INSERT INTO permiso_permiso (permiso_padre_id, permiso_hijo_id) VALUES (@permisoPadreId, @permisoHijoId)";
                foreach (int hijoId in PermisosHijosIds)
                {
                    parameters = new SqlParameter[2]
                    {
                        new SqlParameter("@permisoPadreId", PermisoId),
                        new SqlParameter("@permisoHijoId", hijoId)
                    };
                    SqlHelper.Instancia().Ejecutar(query, parameters);
                }
            }
        }

        public void Obtener()
        {
            try
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("SELECT id, nombre, descripcion, editable, es_perfil, habilitado FROM permiso WHERE habilitado = 1");

                List<SqlParameter> parameters = new List<SqlParameter>();

                if(_permisoId > 0)
                {
                    sb.Append(" AND id = @permisoId");
                    parameters.Add(new SqlParameter
                    {
                        ParameterName = "@permisoId",
                        Value = _permisoId
                    });
                }
                else
                {
                    if (!string.IsNullOrWhiteSpace(_nombre))
                    {
                        sb.Append(" AND nombre = @nombre");
                        parameters.Add(new SqlParameter
                        {
                            ParameterName = "@nombre",
                            Value = _nombre
                        });
                    }
                }
                sb.Append(";");

                string query = sb.ToString();
                SqlParameter[] paramsArray = parameters.ToArray();
                DataTable table = SqlHelper.Instancia().Obtener(query, paramsArray);
                if (table.Rows.Count > 0)
                {
                    _permisoId = int.Parse(table.Rows[0]["id"].ToString());
                    _nombre = table.Rows[0]["nombre"].ToString();
                    _descripcion = table.Rows[0]["descripcion"].ToString();
                    _editable = bool.Parse(table.Rows[0]["editable"].ToString());
                    _habilitado = bool.Parse(table.Rows[0]["habilitado"].ToString());
                    _esPerfil = bool.Parse(table.Rows[0]["es_perfil"].ToString());
                }
            }
            catch (Exception ex)
            {
                Log.Grabar(ex);
            }
        }

        public List<PermisoDAL> ObtenerPorUsuario(int usuarioId)
        {
            string query = "SELECT p.id, p.nombre, p.descripcion, p.editable " +
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
            DataTable table = SqlHelper.Instancia().Obtener(query, paramsArray);
            List<PermisoDAL> permisos = new List<PermisoDAL>();
            foreach(DataRow row in table.Rows)
            {
                permisos.Add(new PermisoDAL() {
                    _permisoId = int.Parse(row["id"].ToString()),
                    _nombre = row["nombre"].ToString(),
                    _descripcion = row["descripcion"].ToString(),
                    _editable = bool.Parse(row["editable"].ToString())
                });
            }
            return permisos;
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
            
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(new SqlParameter
            {
                ParameterName = "@permisoPadreId",
                Value = _permisoId
            });

            DataTable table = SqlHelper.Instancia().Obtener(query, parameters.ToArray());
            _permisosHijosIds = new List<int>();
            foreach (DataRow row in table.Rows)
            {
                _permisosHijosIds.Add(int.Parse(row["permiso_hijo_id"].ToString()));
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
            PermisoId = SqlHelper.Instancia().Insertar(query, parameters);
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
            SqlHelper.Instancia().Ejecutar(query, parameters);
        }
        #endregion
    }
}
