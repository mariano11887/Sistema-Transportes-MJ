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

        public List<UsuarioDAL> ObtenerVarios()
        {
            return new List<UsuarioDAL>();
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
        #endregion

    }
}
