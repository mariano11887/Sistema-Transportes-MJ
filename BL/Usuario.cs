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

        private string _contrasenia;
        public string Contrasenia
        {
            get { return _contrasenia; }
            set { _contrasenia = value; }
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

        private int _idiomaId;
        private Idioma _idioma;
        public Idioma Idioma
        {
            get
            {
                if(_idioma == null)
                {
                    _idioma = new Idioma(_idiomaId);
                }
                return _idioma;
            }
            set { _idioma = value; }
        }
        #endregion

        #region Métodos públicos
        public override string ToString()
        {
            return Nombre;
        }

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
                    if(Sesion.Instancia().TienePermiso(Permisos.LOGIN))
                    {
                        BitacoraDAL bitacora = new BitacoraDAL()
                        {
                            UsuarioId = Sesion.Instancia().UsuarioLogueado.Id,
                            Detalle = "El usuario se logueó al sistema"
                        };
                        bitacora.Guardar();
                        return true;
                    }
                    return false;
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

        public static void PonerIdiomaDefault(Idioma idiomaAQuitar)
        {
            UsuarioDAL.PonerIdiomaDefault(idiomaAQuitar.Id);
        }

        public static List<Usuario> ObtenerTodos()
        {
            List<UsuarioDAL> usuariosDAL = UsuarioDAL.ObtenerTodos();
            List<Usuario> usuarios = new List<Usuario>();
            foreach(UsuarioDAL usuarioDAL in usuariosDAL)
            {
                Usuario usuario = new Usuario();
                usuario.ConvertirDesdeDAL(usuarioDAL);
                usuarios.Add(usuario);
            }
            return usuarios;
        }

        public void Guardar()
        {
            if(!string.IsNullOrEmpty(Contrasenia))
            {
                Contrasenia = Encriptador.Encriptar(Contrasenia);
            }

            // Guardo el usuario
            UsuarioDAL usuarioDAL = new UsuarioDAL()
            {
                UsuarioId = Id,
                Nombre = Nombre,
                NombreDeUsuario = NombreDeUsuario,
                Contrasenia = Contrasenia,
                IdiomaId = Idioma.Id,
                Habilitado = true
            };
            
            List<int> permisosId = new List<int>();
            foreach(Permiso permiso in Perfil)
            {
                permisosId.Add(permiso.Id);
            }
            usuarioDAL.PermisosId = permisosId;
            usuarioDAL.Guardar();

            // Registro en bitácora
            BitacoraDAL bitacoraDAL = new BitacoraDAL()
            {
                Detalle = "Usuario " + NombreDeUsuario + " guardado",
                UsuarioId = Sesion.Instancia().UsuarioLogueado.Id
            };
        }
        #endregion

        #region Métodos privados
        private void ConvertirDesdeDAL(UsuarioDAL usuarioDAL)
        {
            _id = usuarioDAL.UsuarioId;
            _nombreDeUsuario = usuarioDAL.NombreDeUsuario;
            _nombre = usuarioDAL.Nombre;
            _idiomaId = usuarioDAL.IdiomaId;
        }
        #endregion
    }
}
