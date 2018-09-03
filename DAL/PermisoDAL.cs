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
                    _permisosHijosIds = new List<int>();
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


        private bool _habilitado;
        public bool Habilitado
        {
            get { return _habilitado; }
            set { _habilitado = value; }
        }

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
                #region Buscar datos de este permiso
                StringBuilder sb = new StringBuilder();
                sb.Append("SELECT id, nombre, descripcion, editable, habilitado FROM permiso WHERE 1 = 1");
                if (soloHabilitados)
                {
                    sb.Append(" AND habilitado = 1");
                }

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
                DataTable table = SqlHelper.ObtenerInstancia().Obtener(query, paramsArray);
                if (table.Rows.Count > 0)
                {
                    _permisoId = int.Parse(table.Rows[0]["id"].ToString());
                    _nombre = table.Rows[0]["nombre"].ToString();
                    _descripcion = table.Rows[0]["descripcion"].ToString();
                    _editable = bool.Parse(table.Rows[0]["editable"].ToString());
                    _habilitado = bool.Parse(table.Rows[0]["habilitado"].ToString());
                }
                #endregion

                #region Buscar permisos hijos
                sb = new StringBuilder();
                sb.Append("SELECT pp.permiso_hijo_id FROM permiso_permiso pp");
                
                if (soloHabilitados)
                {
                    sb.Append(" INNER JOIN permiso p ON pp.permiso_hijo_id = p.id WHERE p.habilitado = 1 AND pp.permiso_padre_id = @permisoPadreId;");
                }
                else
                {
                    sb.Append(" WHERE pp.permiso_padre_id = @permisoPadreId;");
                }

                parameters = new List<SqlParameter>();
                parameters.Add(new SqlParameter
                {
                    ParameterName = "@permisoPadreId",
                    Value = _permisoId
                });

                query = sb.ToString();
                paramsArray = parameters.ToArray();
                table = SqlHelper.ObtenerInstancia().Obtener(query, paramsArray);
                _permisosHijosIds = new List<int>();
                foreach(DataRow row in table.Rows)
                {
                    _permisosHijosIds.Add(int.Parse(row["permiso_hijo_id"].ToString()));
                }
                #endregion
            }
            catch (Exception ex)
            {
                Log.Grabar(ex);
            }
        }
    }
}
