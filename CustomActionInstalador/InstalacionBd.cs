using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Configuration.Install;
using System.Data.SqlClient;
using System.IO;
using System.Text.RegularExpressions;

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
            System.Configuration.Configuration sourceConfiguration = ConfigurationManager.OpenExeConfiguration(sourceExePath);
            if (sourceConfiguration != null)
            {
                sourceConfiguration.ConnectionStrings.ConnectionStrings["Principal"].ConnectionString =
                    sourceConfiguration.ConnectionStrings.ConnectionStrings["Principal"].ConnectionString.Replace("DESKTOP-FE0C8EN", Context.Parameters["Db"]);
                sourceConfiguration.ConnectionStrings.ConnectionStrings["Bitacora"].ConnectionString =
                    sourceConfiguration.ConnectionStrings.ConnectionStrings["Bitacora"].ConnectionString.Replace("DESKTOP-FE0C8EN", Context.Parameters["Db"]);
                sourceConfiguration.ConnectionStrings.ConnectionStrings["Master"].ConnectionString =
                    sourceConfiguration.ConnectionStrings.ConnectionStrings["Master"].ConnectionString.Replace("DESKTOP-FE0C8EN", Context.Parameters["Db"]);

                sourceConfiguration.Save();

                string script = File.ReadAllText(Path.Combine(targetDirectory, "transportes_mj.sql"));
                string scriptBitacora = File.ReadAllText(Path.Combine(targetDirectory, "transportes_mj_bitacora.sql"));
                string connString = sourceConfiguration.ConnectionStrings.ConnectionStrings["Master"].ConnectionString;

                ExecuteScript(script, connString);
                ExecuteScript(scriptBitacora, connString);
            }
        }

        private void ExecuteScript(string script, string connString)
        {
            using (SqlConnection connection = new SqlConnection(connString))
            {
                IEnumerable<string> commandStrings = Regex.Split(script, @"^\s*GO\s*$", RegexOptions.Multiline | RegexOptions.IgnoreCase);

                connection.Open();
                foreach (string commandString in commandStrings)
                {
                    if (commandString.Trim() != "")
                    {
                        using (SqlCommand command = new SqlCommand(commandString, connection))
                        {
                            command.ExecuteNonQuery();
                        }
                    }
                }
                connection.Close();
            }
        }
    }
}
