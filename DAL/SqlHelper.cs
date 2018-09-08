using Logger;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
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

        private enum Bd
        {
            Principal,
            Bitacora
        }

        private SqlHelper() { }

        public static SqlHelper Instancia()
        {
            if(_instancia == null)
            {
                _instancia = new SqlHelper()
                {
                    _connStringBdPrincipal = LeerConnString(Bd.Principal),
                    _connStringBdBitacora = LeerConnString(Bd.Bitacora)
                };
            }
            return _instancia;
        }

        private static String LeerConnString(Bd bd)
        {
            String rutaXml = Directory.GetCurrentDirectory() + "\\ConfigDAL.xml";
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(rutaXml);
            foreach(XmlNode n in xmlDoc.ChildNodes[1])
            {
                if(n.Attributes["name"].Value == "connStringBdPrincipal" && bd == Bd.Principal ||
                    n.Attributes["name"].Value == "connStringBdBitacora" && bd == Bd.Bitacora)
                {
                    return n.InnerText;
                }
            }
            return "";
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
