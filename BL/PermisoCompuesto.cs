using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    class PermisoCompuesto : Permiso
    {
        private List<Permiso> _permisos;
        public List<Permiso> Permisos
        {
            get { return _permisos; }
            set { _permisos = value; }
        }

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
            throw new NotImplementedException();
        }

        public override void Guardar()
        {
            throw new NotImplementedException();
        }
    }
}
