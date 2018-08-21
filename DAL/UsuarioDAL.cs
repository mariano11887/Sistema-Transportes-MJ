using Logger;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class UsuarioDAL
    {
        #region Propiedades
        private int _usuarioId;
        public int UsuarioId
        {
            get { return _usuarioId; }
            set { _usuarioId = value; }
        }

        private string _nombre;
        public string Nombre
        {
            get { return _nombre; }
            set { _nombre = value; }
        }

        private string _nombreDeUsuario;
        public string NombreDeUsuario
        {
            get { return _nombreDeUsuario; }
            set { _nombreDeUsuario = value; }
        }

        private string _contrasenia;
        public string Contrasenia
        {
            get { return _contrasenia; }
            set { _contrasenia = value; }
        }

        private int _idiomaId;
        public int IdiomaId
        {
            get { return _idiomaId; }
            set { _idiomaId = value; }
        }

        private bool _habilitado;
        public bool Habilitado
        {
            get { return _habilitado; }
            set { _habilitado = value; }
        }
        #endregion

        public void Guardar()
        {

        }

        public void Obtener()
        {
            try
            {
                // Esto es parte del prototipo para que saque los usuarios de una colección predefinida.
                // En la versión final del sistema se consultará la base de datos.
                UsuarioPrototipo usuarioPrototipo = _usuariosDelSistema.FirstOrDefault(u => u.NombreDeUsuario == _nombreDeUsuario && u.Contrasenia == _contrasenia);
                if (usuarioPrototipo != null)
                {
                    _usuarioId = usuarioPrototipo.Id;
                    _nombre = usuarioPrototipo.Nombre;
                    _nombreDeUsuario = usuarioPrototipo.NombreDeUsuario;
                    _contrasenia = usuarioPrototipo.Contrasenia;
                }
            }
            catch(Exception ex)
            {
                Log.Grabar(ex);
            }
        }

        public List<UsuarioDAL> ObtenerVarios()
        {
            return new List<UsuarioDAL>();
        }

        #region Prototipo (quitar esto después)
        private List<UsuarioPrototipo> _usuariosDelSistema;

        public UsuarioDAL()
        {
            _usuariosDelSistema = new List<UsuarioPrototipo>();
            _usuariosDelSistema.Add(new UsuarioPrototipo() {
                Id = 1,
                Nombre = "Pepito Primero",
                NombreDeUsuario = "pepito",
                Contrasenia = "xf2eBdwlF/NqIev68l5qlWmFbZLkbcUsZRnGBG4uFlE=" //"pepito"
            });
            _usuariosDelSistema.Add(new UsuarioPrototipo()
            {
                Id = 2,
                Nombre = "Fulano",
                NombreDeUsuario = "fulano",
                Contrasenia = "dgc9dkzyzjBAYZ/4/aln5Yb1EaF74N3HcjVzKxdqDL0=" //"fulano"
            });
            _usuariosDelSistema.Add(new UsuarioPrototipo()
            {
                Id = 3,
                Nombre = "Pirulo",
                NombreDeUsuario = "pirulo",
                Contrasenia = "VgybCqSr/gZoNONnAnCJ1Ns9AQQJmauRx1RlSGTn2eg=" //"pirulo"
            });
        }

        private class UsuarioPrototipo
        {
            public int Id;
            public string Nombre;
            public string NombreDeUsuario;
            public string Contrasenia;
        }
        #endregion
    }
}
