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
    public class UsuarioDAL
    {
        #region Propiedades
        private int _usuarioId;
        public int UsuarioId
        {
            get { return _usuarioId; }
            set { _usuarioId = value; }
        }

        private string _nombre;
        public string Nombre
        {
            get { return _nombre; }
            set { _nombre = value; }
        }

        private string _nombreDeUsuario;
        public string NombreDeUsuario
        {
            get { return _nombreDeUsuario; }
            set { _nombreDeUsuario = value; }
        }

        private string _contrasenia;
        public string Contrasenia
        {
            get { return _contrasenia; }
            set { _contrasenia = value; }
        }

        private int _idiomaId;
        public int IdiomaId
        {
            get { return _idiomaId; }
            set { _idiomaId = value; }
        }

        private List<int> _permisosId;
        public List<int> PermisosId
        {
            set { _permisosId = value; }
        }

        private bool _habilitado;
        public bool Habilitado
        {
            get { return _habilitado; }
            set { _habilitado = value; }
        }
        #endregion

        #region Métodos públicos
        public void Guardar()
        {
            string query;
            SqlParameter[] parameters;
            if (UsuarioId > 0)
            {
                Actualizar();

                // Borro los permisos que tenga el usuario
                query = "DELETE FROM usuario_permiso WHERE usuario_id = @usuarioId";
                parameters = new SqlParameter[]
                {
                    new SqlParameter("@usuarioId", UsuarioId)
                };
                SqlHelper.Instancia().Ejecutar(query, parameters);
            }
            else
            {
                Insertar();
            }

            // Inserto los permisos
            query = "INSERT INTO usuario_permiso (usuario_id, permiso_id) VALUES (@usuarioId, @permisoId)";
            foreach (int permisoId in _permisosId)
            {
                parameters = new SqlParameter[]
                {
                    new SqlParameter("@usuarioId", UsuarioId),
                    new SqlParameter("@permisoId", permisoId)
                };
                SqlHelper.Instancia().Ejecutar(query, parameters);
            }
        }

        public void Obtener()
        {
            Obtener(true);
        }

        public void Obtener(bool soloHabilitados)
        {
            try
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("SELECT TOP 1 * FROM usuario WHERE 1 = 1");
                if (soloHabilitados)
                {
                    sb.Append(" AND habilitado = 1");
                }

                List<SqlParameter> parameters = new List<SqlParameter>();

                if (_usuarioId > 0)
                {
                    sb.Append(" AND id = @usuarioId");
                    parameters.Add(new SqlParameter
                    {
                        ParameterName = "@usuarioId",
                        Value = _usuarioId
                    });
                }
                else
                {
                    if (!string.IsNullOrWhiteSpace(_nombre))
                    {
                        sb.Append(" AND nombre LIKE @nombre");
                        parameters.Add(new SqlParameter
                        {
                            ParameterName = "@nombre",
                            Value = "%" + _nombre + "%"
                        });
                    }
                    if (!string.IsNullOrWhiteSpace(_nombreDeUsuario))
                    {
                        sb.Append(" AND nombre_usuario = @nombreUsuario");
                        parameters.Add(new SqlParameter
                        {
                            ParameterName = "@nombreUsuario",
                            Value = _nombreDeUsuario
                        });
                    }
                    if (!string.IsNullOrWhiteSpace(_contrasenia))
                    {
                        sb.Append(" AND contrasenia = @contrasenia");
                        parameters.Add(new SqlParameter
                        {
                            ParameterName = "@contrasenia",
                            Value = _contrasenia
                        });
                    }
                    if (_idiomaId > 0)
                    {
                        sb.Append(" AND idioma_id = @idioma_id");
                        parameters.Add(new SqlParameter
                        {
                            ParameterName = "@idioma_id",
                            Value = _idiomaId
                        });
                    }
                }
                sb.Append(";");

                string query = sb.ToString();
                SqlParameter[] paramsArray = parameters.ToArray();
                DataTable table = SqlHelper.Instancia().Obtener(query, paramsArray);
                if (table.Rows.Count > 0)
                {
                    _usuarioId = int.Parse(table.Rows[0]["id"].ToString());
                    _nombre = table.Rows[0]["nombre"].ToString();
                    _idiomaId = int.Parse(table.Rows[0]["idioma_id"].ToString());
                    _nombreDeUsuario = table.Rows[0]["nombre_usuario"].ToString();
                    _contrasenia = table.Rows[0]["contrasenia"].ToString();
                    _habilitado = bool.Parse(table.Rows[0]["habilitado"].ToString());
                }
            }
            catch (Exception ex)
            {
                Log.Grabar(ex);
            }
        }

        public static void PonerIdiomaDefault(int idiomaIdAQuitar)
        {
            string query = "UPDATE usuario SET idioma_id = 1 WHERE idioma_id = @idiomaIdViejo";
            SqlParameter[] parameters =
            {
                new SqlParameter("@idiomaIdViejo", idiomaIdAQuitar)
            };
            SqlHelper.Instancia().Ejecutar(query, parameters);
        }

        public static List<UsuarioDAL> ObtenerTodos()
        {
            string query = "SELECT id, nombre, idioma_id, nombre_usuario, contrasenia FROM usuario WHERE habilitado = 1";
            SqlParameter[] parameters = { };
            DataTable table = SqlHelper.Instancia().Obtener(query, parameters);
            List<UsuarioDAL> usuariosDAL = new List<UsuarioDAL>();
            foreach (DataRow row in table.Rows)
            {
                UsuarioDAL usuarioDAL = new UsuarioDAL()
                {
                    UsuarioId = int.Parse(row["id"].ToString()),
                    Nombre = row["nombre"].ToString(),
                    IdiomaId = int.Parse(row["idioma_id"].ToString()),
                    NombreDeUsuario = row["nombre_usuario"].ToString(),
                    Contrasenia = row["contrasenia"].ToString(),
                    Habilitado = true
                };
                usuariosDAL.Add(usuarioDAL);
            }
            return usuariosDAL;
        }
        #endregion

        #region Métodos privados
        private void Insertar()
        {
            string query = "INSERT INTO usuario (nombre, idioma_id, nombre_usuario, contrasenia) OUTPUT INSERTED.id VALUES (@nombre, @idiomaId, @nombreUsuario, @contrasenia)";
            SqlParameter[] parameters =
            {
                new SqlParameter("@nombre", Nombre),
                new SqlParameter("@idiomaId", IdiomaId),
                new SqlParameter("@nombreUsuario", NombreDeUsuario),
                new SqlParameter("@contrasenia", Contrasenia)
            };
            UsuarioId = SqlHelper.Instancia().Insertar(query, parameters);
        }

        private void Actualizar()
        {
            string query = "UPDATE usuario SET nombre = @nombre, idioma_id = @idiomaId, nombre_usuario = @nombreUsuario";
            SqlParameter[] parameters;
            if (!string.IsNullOrEmpty(Contrasenia))
            {
                query += ", contrasenia = @contrasenia";
                parameters = new SqlParameter[5];
                parameters[4] = new SqlParameter("@contrasenia", Contrasenia);
            }
            else
            {
                parameters = new SqlParameter[4];
            }
            query += " WHERE id = @id";
            parameters[0] = new SqlParameter("@nombre", Nombre);
            parameters[1] = new SqlParameter("@idiomaId", IdiomaId);
            parameters[2] = new SqlParameter("@nombreUsuario", NombreDeUsuario);
            parameters[3] = new SqlParameter("@id", UsuarioId);

            SqlHelper.Instancia().Ejecutar(query, parameters);
        }
        #endregion
    }
}
