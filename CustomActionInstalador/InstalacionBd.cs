using Microsoft.Win32;
using System;
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

            string sqlServerInstance = GetSqlServerInstance();

            string sourceExePath = Path.Combine(targetDirectory, "Transportes MJ.exe");
            Configuration sourceConfiguration = ConfigurationManager.OpenExeConfiguration(sourceExePath);
            if (sourceConfiguration != null)
            {
                sourceConfiguration.ConnectionStrings.ConnectionStrings["Principal"].ConnectionString =
                    sourceConfiguration.ConnectionStrings.ConnectionStrings["Principal"].ConnectionString.Replace("DESKTOP-FE0C8EN", sqlServerInstance);
                sourceConfiguration.ConnectionStrings.ConnectionStrings["Bitacora"].ConnectionString =
                    sourceConfiguration.ConnectionStrings.ConnectionStrings["Bitacora"].ConnectionString.Replace("DESKTOP-FE0C8EN", sqlServerInstance);
                sourceConfiguration.ConnectionStrings.ConnectionStrings["Master"].ConnectionString =
                    sourceConfiguration.ConnectionStrings.ConnectionStrings["Master"].ConnectionString.Replace("DESKTOP-FE0C8EN", sqlServerInstance);

                sourceConfiguration.Save();

                string script = File.ReadAllText(Path.Combine(targetDirectory, "transportes_mj.sql"));
                string scriptBitacora = File.ReadAllText(Path.Combine(targetDirectory, "transportes_mj_bitacora.sql"));
                string connString = sourceConfiguration.ConnectionStrings.ConnectionStrings["Master"].ConnectionString;

                ExecuteScript(script, connString);
                ExecuteScript(scriptBitacora, connString);
            }
        }

        private string GetSqlServerInstance()
        {
            string serverName = Environment.MachineName;
            RegistryView registryView = Environment.Is64BitOperatingSystem ? RegistryView.Registry64 : RegistryView.Registry32;
            using (RegistryKey hklm = RegistryKey.OpenBaseKey(RegistryHive.LocalMachine, registryView))
            {
                RegistryKey instanceKey = hklm.OpenSubKey(@"SOFTWARE\Microsoft\Microsoft SQL Server\Instance Names\SQL", false);
                if (instanceKey != null)
                {
                    string sqlServer2014InstanceName = "";
                    string sqlServerNot2014InstanceName = "";
                    foreach (string name in instanceKey.GetValueNames())
                    {
                        if ((instanceKey.GetValue(name) as string).Contains("MSSQL12."))
                        {
                            sqlServer2014InstanceName = name;
                            break;
                        }
                        else if(sqlServerNot2014InstanceName == "")
                        {
                            sqlServerNot2014InstanceName = name;
                        }
                    }

                    string instanceName = sqlServer2014InstanceName != "" ? sqlServer2014InstanceName : sqlServerNot2014InstanceName;
                    if (instanceName == "MSSQLSERVER")
                    {
                        // Instancia por defecto, se pone solamente el ServerName
                        return serverName;
                    }
                    else
                    {
                        return serverName + "\\" + instanceName;
                    }
                }
            }

            return "";
            //return ".\\SQL_UAI";
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
