using BE;
using DAL;
using System.Collections.Generic;

namespace BL
{
    public class Permiso
    {
        #region Métodos
        public static List<PermisoBE> ObtenerPerfiles()
        {
            return PermisoDAL.ObtenerPerfiles();
        }

        public static List<PermisoBE> ObtenerPermisosSimples()
        {
            return PermisoDAL.ObtenerPermisos();
        }

        public static void Guardar(PermisoBE permiso)
        {
            PermisoDAL.Guardar(permiso, true, true);

            // Guardo la bitácora
            string mensajeBitacora = permiso.Id > 0 ? "Se actualizó el permiso con Id " + permiso.Id : 
                "Se creó un nuevo permiso. Nombre: " + permiso.Nombre;
            Bitacora.Loguear(mensajeBitacora);
        }

        public static void Borrar(PermisoBE permiso)
        {
            PermisoDAL.Guardar(permiso, false, false);

            // Guardo la bitácora
            Bitacora.Loguear("Se eliminó el permiso con Id " + permiso.Id);
        }

        public static PermisoBE NuevoPerfil()
        {
            return new PermisoCompuestoBE();
        }
        #endregion
    }
}
