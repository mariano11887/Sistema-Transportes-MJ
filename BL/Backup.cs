using BE;
using DAL;

namespace BL
{
    public class Backup
    {
        public static void HacerBackup(string Ubicacion)
        {
            BackupDAL.HacerBackup(Ubicacion);
            // Guardo en la bitácora
            Bitacora.Loguear("Se realizó un backup de la base de datos");
        }

        public static void RestaurarBackup(string Ubicacion)
        {
            BackupDAL.RestaurarBackup(Ubicacion);

            // Guardo en la bitácora
            Bitacora.Loguear("Se restauró un backup de la base de datos");
        }
    }
}
