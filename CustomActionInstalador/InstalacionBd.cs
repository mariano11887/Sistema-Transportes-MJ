using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Configuration.Install;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CustomActionInstalador
{
    [RunInstaller(true)]
    public class InstalacionBd : Installer
    {
        public override void Install(IDictionary stateSaver)
        {
            base.Install(stateSaver);

            string targetDirectory = Context.Parameters["TargetDirectory"];
            if (string.IsNullOrEmpty(targetDirectory))
            {
                Rollback(stateSaver);
                return;
            }

            string sourceExePath = Path.Combine(targetDirectory, "Transportes MJ.exe");
            Configuration sourceConfiguration = ConfigurationManager.OpenExeConfiguration(sourceExePath);
            if (sourceConfiguration != null)
            {
                sourceConfiguration.ConnectionStrings.ConnectionStrings["Principal"].ConnectionString =
                    sourceConfiguration.ConnectionStrings.ConnectionStrings["Principal"].ConnectionString.Replace("DESKTOP-FE0C8EN", Context.Parameters["Db"]);
                sourceConfiguration.ConnectionStrings.ConnectionStrings["Bitacora"].ConnectionString =
                    sourceConfiguration.ConnectionStrings.ConnectionStrings["Bitacora"].ConnectionString.Replace("DESKTOP-FE0C8EN", Context.Parameters["Db"]);
                //sourceConfiguration.ConnectionStrings.ConnectionStrings["Master"].ConnectionString =
                //    sourceConfiguration.ConnectionStrings.ConnectionStrings["Master"].ConnectionString.Replace("DESKTOP-FE0C8EN", Context.Parameters["Db"]);

                sourceConfiguration.Save();

                //string query = File.ReadAllText("transportes_mj.sql");
                //string connString = sourceConfiguration.ConnectionStrings.ConnectionStrings["Master"].ConnectionString;

                //using (SqlConnection connection = new SqlConnection(connString))
                //using (SqlCommand command = new SqlCommand(query, connection))
                //{
                //    command.CommandType = CommandType.Text;
                //    command.Connection.Open();
                //    command.ExecuteNonQuery();
                //    command.Connection.Close();
                //}
            }
        }
    }
}
