using Logger;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace DAL
{
    class SqlHelper
    {
        private static SqlHelper _instancia;

        private string _connStringBdPrincipal;
        private string _connStringBdBitacora;

        private SqlHelper()
        {
            _connStringBdPrincipal = "Data Source=MARIANO-PC;Initial Catalog=transportes_mj_dev;Persist Security Info=True;User ID=sa;Password=UaiPas$w0rdDB";
            _connStringBdBitacora = "Data Source=MARIANO-PC;Initial Catalog=transportes_mj_bitacora_dev;Persist Security Info=True;User ID=sa;Password=UaiPas$w0rdDB";
        }

        public static SqlHelper ObtenerInstancia()
        {
            if(_instancia == null)
            {
                _instancia = new SqlHelper();
            }
            return _instancia;
        }

        public DataTable Obtener(string query, SqlParameter[] parameters)
        {
            try
            {
                SqlCommand cmd = new SqlCommand
                {
                    Connection = new SqlConnection
                    {
                        ConnectionString = _connStringBdPrincipal
                    },
                    CommandText = query,
                    CommandType = CommandType.Text,
                };
                if(parameters.Count() > 0)
                {
                    cmd.Parameters.AddRange(parameters);
                }
                cmd.Connection.Open();
                SqlDataAdapter dataAdapter = new SqlDataAdapter
                {
                    SelectCommand = cmd
                };
                DataSet ds = new DataSet();
                dataAdapter.Fill(ds);
                cmd.Connection.Close();

                return ds.Tables[0];
            }
            catch (Exception ex)
            {
                Log.Grabar(ex);
                return null;
            }
        }
    }
}
