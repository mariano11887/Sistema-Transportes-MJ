using System.Collections.Generic;
using System.Linq;

namespace BE
{
    public class PermisoCompuestoBE : PermisoBE
    {
        private readonly List<PermisoBE> _permisosHijos = new List<PermisoBE>();

        public override void AgregarPermisoHijo(PermisoBE permiso)
        {
            if (!_permisosHijos.Any(p => p.Id == permiso.Id))
            {
                _permisosHijos.Add(permiso);
            }
        }

        public override List<PermisoBE> DevolverPerfil()
        {
            return _permisosHijos;
        }

        public override void QuitarPermisoHijo(PermisoBE permiso)
        {
            PermisoBE permisoAQuitar = _permisosHijos.Where(p => p.Id == permiso.Id).FirstOrDefault();
            if (permisoAQuitar != null)
            {
                _permisosHijos.Remove(permisoAQuitar);
            }
        }
    }
}
