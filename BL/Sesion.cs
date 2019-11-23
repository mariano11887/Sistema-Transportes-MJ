using BE;
using System.Collections.Generic;
using System.Linq;

namespace BL
{
    public class Sesion
    {
        private Sesion() { }

        private static Sesion _instancia;

        private UsuarioBE _usuarioLogueado;
        public UsuarioBE UsuarioLogueado
        {
            get { return _usuarioLogueado; }
            set 
            { 
                _usuarioLogueado = value;
                _permisos = new HashSet<string>();
                CompletarPermisos(_usuarioLogueado.Perfil);
            }
        }

        private HashSet<string> _permisos;

        public static Sesion Instancia()
        {
            if(_instancia == null)
            {
                _instancia = new Sesion();
            }
            return _instancia;
        }

        private void CompletarPermisos(List<PermisoBE> permisos)
        {
            foreach (PermisoBE p in permisos)
            {
                List<PermisoBE> permisosHijos = p.DevolverPerfil();
                _permisos.UnionWith(permisosHijos.Select(x => x.Nombre));
                CompletarPermisos(permisosHijos);
            }
        }

        public bool TienePermiso(string permiso)
        {
            return _permisos.Contains(permiso);
        }

        public void CerrarSesion()
        {
            if (_usuarioLogueado != null)
            {
                Bitacora.Loguear("El usuario cerró sesión");

                _usuarioLogueado = null;
                _permisos = null;
            }
        }
    }
}
