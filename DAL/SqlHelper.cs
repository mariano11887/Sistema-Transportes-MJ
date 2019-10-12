using Logger;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Configuration;

namespace DAL
{
    class SqlHelper
    {
        public enum Bd
        {
            Principal,
            Bitacora,
            Master
        }

        public static DataTable Obtener(string query, SqlParameter[] parameters)
        {
            return Obtener(query, parameters, Bd.Principal);
        }

        public static DataTable Obtener(string query, SqlParameter[] parameters, Bd bd)
        {
            string connString = LeerConnString(bd);
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

                DataSet ds = new DataSet();
                cmd.Connection.Open();
                using (SqlDataAdapter dataAdapter = new SqlDataAdapter())
                {
                    dataAdapter.SelectCommand = cmd;
                    dataAdapter.Fill(ds);
                }
                cmd.Connection.Close();

                return ds.Tables[0];
            }
            catch (Exception ex)
            {
                Log.Grabar(ex);
                return null;
            }
        }

        public static T ObtenerValor<T>(string query, SqlParameter[] parameters)
        {
            return ObtenerValor<T>(query, parameters, Bd.Principal);
        }

        public static T ObtenerValor<T>(string query, SqlParameter[] parameters, Bd bd)
        {
            string connString = LeerConnString(bd);
            try
            {
                using (SqlConnection connection = new SqlConnection(connString))
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.CommandType = CommandType.Text;
                    command.Parameters.AddRange(parameters);
                    command.Connection.Open();
                    object value = command.ExecuteScalar();
                    T valor = value is DBNull || value == null ? default : (T)value;
                    command.Connection.Close();
                    return valor;
                }
            }
            catch (Exception ex)
            {
                Log.Grabar(ex);
                return default;
            }
        }

        public static void Ejecutar(string query, SqlParameter[] parameters)
        {
            Ejecutar(query, parameters, Bd.Principal);
        }

        public static void Ejecutar(string query, SqlParameter[] parameters, Bd bd)
        {
            string connString = LeerConnString(bd);
            try
            {
                using (SqlConnection connection = new SqlConnection(connString))
                using (SqlCommand command = new SqlCommand(query, connection))
                {
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

        public static int Insertar(string query, SqlParameter[] parameters)
        {
            return Insertar(query, parameters, Bd.Principal);
        }

        public static int Insertar(string query, SqlParameter[] parameters, Bd bd)
        {
            string connString = LeerConnString(bd);
            try
            {
                using (SqlConnection connection = new SqlConnection(connString))
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.CommandType = CommandType.Text;
                    command.Parameters.AddRange(parameters);
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
