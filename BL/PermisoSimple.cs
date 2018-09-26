using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    class PermisoSimple : Permiso
    {
        public override void AgregarPermisoHijo(Permiso permiso)
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
