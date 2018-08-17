using DAL;
using Logger;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Usuario
    {
        #region Propiedades
        private int _id;
        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        private string _nombreDeUsuario;
        public string NombreDeUsuario
        {
            get { return _nombreDeUsuario; }
            set { _nombreDeUsuario = value; }
        }

        private string _nombre;
        public string Nombre
        {
            get { return _nombre; }
            set { _nombre = value; }
        }
        #endregion

        public bool Login(string nombreDeUsuario, string contrasenia)
        {
            try
            {
                UsuarioDAL usuarioDAL = new UsuarioDAL()
                {
                    NombreDeUsuario = nombreDeUsuario,
                    Contrasenia = Encriptador.Encriptar(contrasenia)
                };
                usuarioDAL.Obtener();
                if (usuarioDAL.UsuarioId > 0)
                {
                    Sesion.ObtenerInstancia().UsuarioLogueado = ConvertirDesdeDAL(usuarioDAL);
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Log.Grabar(ex);
                return false;
            }
        }

        private Usuario ConvertirDesdeDAL(UsuarioDAL usuarioDAL)
        {
            Usuario usuario = new Usuario();
            usuario._id = usuarioDAL.UsuarioId;
            usuario._nombreDeUsuario = usuarioDAL.NombreDeUsuario;
            usuario._nombre = usuarioDAL.Nombre;
            return usuario;
        }

    }
}
