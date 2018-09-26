using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Sesion
    {
        private Sesion() { }

        private static Sesion _instancia;

        private Usuario _usuarioLogueado;
        public Usuario UsuarioLogueado
        {
            get { return _usuarioLogueado; }
            set { _usuarioLogueado = value; }
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

        public void EstablecerPermisos(List<Permiso> permisos)
        {
            _permisos = new HashSet<string>();
            foreach (Permiso p in permisos)
            {
                _permisos.UnionWith(p.DevolverPerfil().Select(x => x.Nombre));
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
                BitacoraDAL bitacora = new BitacoraDAL()
                {
                    UsuarioId = _usuarioLogueado.Id,
                    Detalle = "El usuario cerró sesión"
                };
                bitacora.Guardar();

                _usuarioLogueado = null;
                _permisos = null;
            }
        }
    }
}
