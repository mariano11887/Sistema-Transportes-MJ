using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Backup
    {
        public static void HacerBackup(string Ubicacion)
        {
            BackupDAL.HacerBackup(Ubicacion);
            // Guardo en la bitácora
            BitacoraDAL bitacoraDAL = new BitacoraDAL()
            {
                Detalle = "Se realizó un backup de la base de datos",
                UsuarioId = Sesion.Instancia().UsuarioLogueado.Id
            };
            bitacoraDAL.Guardar();
        }

        public static void RestaurarBackup(string Ubicacion)
        {
            BackupDAL.RestaurarBackup(Ubicacion);

            // Guardo en la bitácora
            BitacoraDAL bitacoraDAL = new BitacoraDAL()
            {
                Detalle = "Se restauró un backup de la base de datos",
                UsuarioId = Sesion.Instancia().UsuarioLogueado.Id
            };
            bitacoraDAL.Guardar();
        }
    }
}
