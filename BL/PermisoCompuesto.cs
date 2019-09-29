using DAL;
using System.Collections.Generic;
using System.Linq;

namespace BL
{
    class PermisoCompuesto : Permiso
    {
        private readonly List<Permiso> _permisos = new List<Permiso>();
        public List<Permiso> Permisos
        {
            get
            {
                return _permisos;
            }
        }

        public override void AgregarPermisoHijo(Permiso permiso)
        {
            if (!Permisos.Any(p => p.Id == permiso.Id))
            {
                Permisos.Add(permiso);
            }
        }

        public override void QuitarPermisoHijo(Permiso permiso)
        {
            Permiso permisoAQuitar = Permisos.Where(p => p.Id == permiso.Id).FirstOrDefault();
            if (permisoAQuitar != null)
            {
                Permisos.Remove(permisoAQuitar);
            }
        }

        public override void Borrar()
        {
            PermisoDAL permisoDAL = new PermisoDAL()
            {
                PermisoId = Id,
                Nombre = Nombre,
                Descripcion = Descripcion,
                Habilitado = false
            };
            permisoDAL.Guardar(false);

            // Guardo la bitácora
            Bitacora.Loguear("Se eliminó el permiso con Id " + Id);
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
            PermisoDAL permisoDAL = new PermisoDAL()
            {
                Descripcion = Descripcion,
                Habilitado = true,
                Nombre = Nombre,
                PermisoId = Id,
                PermisosHijosIds = Permisos.Select(p => p.Id).ToList()
            };
            permisoDAL.Guardar(true);

            // Guardo la bitácora
            string mensajeBitacora;
            if(Id > 0)
            {
                mensajeBitacora = "Se actualizó el permiso con Id " + Id;
            }
            else
            {
                mensajeBitacora = "Se creó un nuevo permiso. Nombre: " + Nombre;
            }
            Bitacora.Loguear(mensajeBitacora);
        }

        public override List<Permiso> ObtenerPermisosHijos()
        {
            if (Permisos.Count == 0 && _id > 0)
            {
                PermisoDAL dal = PermisoDAL.ObtenerPorId(_id);
                foreach (int hijoId in dal.PermisosHijosIds)
                {
                    PermisoDAL dalHijo = PermisoDAL.ObtenerPorId(hijoId);
                    Permisos.Add(ConvertirDesdeDAL(dalHijo));
                }
            }

            return Permisos;
        }
    }
}
