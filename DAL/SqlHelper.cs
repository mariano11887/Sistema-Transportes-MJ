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
using System.Configuration;

namespace DAL
{
    class SqlHelper
    {
        private static SqlHelper _instancia;

        private string _connStringBdPrincipal;
        private string _connStringBdBitacora;

        public enum Bd
        {
            Principal,
            Bitacora,
            Master
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

        public DataTable Obtener(string query, SqlParameter[] parameters)
        {
            return Obtener(query, parameters, Bd.Principal);
        }

        public DataTable Obtener(string query, SqlParameter[] parameters, Bd bd)
        {
            string connString = bd == Bd.Principal ? _connStringBdPrincipal : _connStringBdBitacora;
            try
            {
                SqlCommand cmd = new SqlCommand
                {
                    Connection = new SqlConnection
                    {
                        ConnectionString = connString
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

        public void Ejecutar(string query, SqlParameter[] parameters)
        {
            Ejecutar(query, parameters, Bd.Principal);
        }

        public void Ejecutar(string query, SqlParameter[] parameters, Bd bd)
        {
            string connString = bd == Bd.Principal ? _connStringBdPrincipal : _connStringBdBitacora;
            try
            {
                using (SqlConnection connection = new SqlConnection(connString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    command.CommandType = CommandType.Text;
                    command.Parameters.AddRange(parameters);
                    command.Connection.Open();
                    command.ExecuteNonQuery();
                    command.Connection.Close();
                }
            }
            catch (Exception ex)
            {
                Log.Grabar(ex);
            }
        }

        public int Insertar(string Query, SqlParameter[] Parameters)
        {
            return Insertar(Query, Parameters, Bd.Principal);
        }

        public int Insertar(string Query, SqlParameter[] Parameters, Bd Bd)
        {
            string connString = Bd == Bd.Principal ? _connStringBdPrincipal : _connStringBdBitacora;
            try
            {
                using (SqlConnection connection = new SqlConnection(connString))
                {
                    SqlCommand command = new SqlCommand(Query, connection);
                    command.CommandType = CommandType.Text;
                    command.Parameters.AddRange(Parameters);
                    command.Connection.Open();
                    int idInsertado = (int)command.ExecuteScalar();
                    command.Connection.Close();
                    return idInsertado;
                }
            }
            catch (Exception ex)
            {
                Log.Grabar(ex);
                return 0;
            }
        }

        private static string LeerConnString(Bd bd)
        {
            string key = "";
            if (bd == Bd.Principal)
            {
                key = "Principal";
            }
            else if (bd == Bd.Bitacora)
            {
                key = "Bitacora";
            }
            else if (bd == Bd.Master)
            {
                key = "Master";
            }

            return ConfigurationManager.ConnectionStrings[key].ConnectionString;
        }
    }
}
