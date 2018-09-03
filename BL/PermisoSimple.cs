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
        public override void AgregarPermisoHijo()
        {
            throw new NotImplementedException();
        }

        public override void Borrar()
        {
            throw new NotImplementedException();
        }

        public override List<Permiso> DevolverPerfil()
        {
            return new List<Permiso>() { this };
        }

        public override void Guardar()
        {
            throw new NotImplementedException();
        }

        public override List<Permiso> ObtenerPermisosHijos()
        {
            return new List<Permiso>();
        }
    }
}
