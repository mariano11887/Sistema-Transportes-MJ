using DAL;
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
            List<Permiso> perfil = new List<Permiso>();
            List<Permiso> permisosHijos = ObtenerPermisosHijos();
            foreach (Permiso hijo in permisosHijos)
            {
                perfil.AddRange(hijo.DevolverPerfil());
            }
            return perfil;
        }

        public override void Guardar()
        {
            throw new NotImplementedException();
        }

        public override List<Permiso> ObtenerPermisosHijos()
        {
            if (_permisos == null)
            {
                _permisos = new List<Permiso>();
            }
            if (_permisos.Count == 0)
            {
                PermisoDAL permisoDAL = new PermisoDAL()
                {
                    PermisoId = _id
                };
                permisoDAL.Obtener();
                foreach (int hijoId in permisoDAL.PermisosHijosIds)
                {
                    PermisoDAL permisoDALHijo = new PermisoDAL()
                    {
                        PermisoId = hijoId
                    };
                    permisoDALHijo.Obtener();
                    _permisos.Add(ConvertirDesdeDAL(permisoDALHijo));
                }
            }

            return _permisos;
        }
    }
}
