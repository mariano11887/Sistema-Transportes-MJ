using System.Collections.Generic;

namespace BL
{
    class PermisoSimple : Permiso
    {
        public override void AgregarPermisoHijo(Permiso permiso)
        {
            // No hace nada
        }

        public override void QuitarPermisoHijo(Permiso permiso)
        {
            // No hace nada
        }

        public override void Borrar()
        {
            // No se borran permisos individuales
        }

        public override List<Permiso> DevolverPerfil()
        {
            return new List<Permiso>() { this };
        }

        public override void Guardar()
        {
            // No se guardan permisos individuales
        }

        public override List<Permiso> ObtenerPermisosHijos()
        {
            return new List<Permiso>();
        }
    }
}
