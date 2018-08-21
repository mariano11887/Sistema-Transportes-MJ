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

        public static Sesion ObtenerInstancia()
        {
            if(_instancia == null)
            {
                _instancia = new Sesion();
            }
            return _instancia;
        }

        public void CerrarSesion()
        {

        }
    }
}
