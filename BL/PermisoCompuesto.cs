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
            get
            {
                if(_permisos == null)
                {
                    _permisos = new List<Permiso>();
                }
                return _permisos;
            }
            set { _permisos = value; }
        }

        public override void AgregarPermisoHijo(Permiso permiso)
        {
            Permisos.Add(permiso);
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
            BitacoraDAL bitacora = new BitacoraDAL()
            {
                Detalle = "Se eliminó el permiso con Id " + Id,
                UsuarioId = Sesion.Instancia().UsuarioLogueado.Id
            };
            bitacora.Guardar();
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
                Editable = true,
                EsPerfil = true,
                Habilitado = true,
                Nombre = Nombre,
                PermisoId = Id
            };
            foreach(Permiso hijo in Permisos)
            {
                permisoDAL.PermisosHijosIds.Add(hijo.Id);
            }
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
            BitacoraDAL bitacora = new BitacoraDAL()
            {
                Detalle = mensajeBitacora,
                UsuarioId = Sesion.Instancia().UsuarioLogueado.Id
            };
            bitacora.Guardar();
        }

        public override List<Permiso> ObtenerPermisosHijos()
        {
            if (Permisos.Count == 0)
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
                    Permisos.Add(ConvertirDesdeDAL(permisoDALHijo));
                }
            }

            return Permisos;
        }
    }
}
