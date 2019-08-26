using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class BackupDAL
    {
        public static void HacerBackup(string Ubicacion)
        {
            string nombreBd = ConfigurationManager.AppSettings.Get("nombreBdPrincipal");
            string query = "BACKUP DATABASE " + nombreBd + " TO DISK = @ubicacion";
            SqlParameter[] parameters =
            {
                new SqlParameter("@ubicacion", Ubicacion)
            };
            SqlHelper.Ejecutar(query, parameters);
        }

        public static void RestaurarBackup(string Ubicacion)
        {
            string nombreBd = ConfigurationManager.AppSettings.Get("nombreBdPrincipal");
            string query = "ALTER DATABASE " + nombreBd + " SET SINGLE_USER WITH ROLLBACK IMMEDIATE; " +
                "RESTORE DATABASE " + nombreBd + " FROM DISK = @ubicacion WITH REPLACE; " +
                "ALTER DATABASE " + nombreBd + " SET MULTI_USER;"; ;
            SqlParameter[] parameters =
            {
                new SqlParameter("@ubicacion", Ubicacion)
            };
            SqlHelper.Ejecutar(query, parameters, SqlHelper.Bd.Master);
        }
    }
}
