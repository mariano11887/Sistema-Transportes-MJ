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

        private List<Permiso> _perfil;
        public List<Permiso> Perfil
        {
            get
            {
                if(_perfil == null)
                {
                    _perfil = new List<Permiso>();
                    PermisoDAL permisoDAL = new PermisoDAL();
                    List<PermisoDAL> permisosDAL = permisoDAL.ObtenerPorUsuario(Id);
                    foreach(PermisoDAL pDAL in permisosDAL)
                    {
                        _perfil.Add(Permiso.ConvertirDesdeDAL(pDAL));
                    }
                }
                return _perfil;
            }
            set { _perfil = value; }
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
                    ConvertirDesdeDAL(usuarioDAL);
                    Sesion.Instancia().UsuarioLogueado = this;
                    Sesion.Instancia().EstablecerPermisos(Perfil);
                    return Sesion.Instancia().TienePermiso(Permisos.LOGIN);
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

        private void ConvertirDesdeDAL(UsuarioDAL usuarioDAL)
        {
            _id = usuarioDAL.UsuarioId;
            _nombreDeUsuario = usuarioDAL.NombreDeUsuario;
            _nombre = usuarioDAL.Nombre;
        }

    }
}
