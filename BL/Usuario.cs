using BE;
using DAL;
using Logger;
using System;
using System.Collections.Generic;
using System.Linq;

namespace BL
{
    public class Usuario
    {
        #region Métodos públicos
        public static bool Login(string nombreDeUsuario, string contrasenia)
        {
            try
            {
                UsuarioBE usuario = UsuarioDAL.Obtener(nombreDeUsuario, Encriptador.Encriptar(contrasenia));
                if (usuario != null)
                {
                    Sesion.Instancia().UsuarioLogueado = usuario;
                    if(Sesion.Instancia().TienePermiso(Permisos.LOGIN))
                    {
                        Bitacora.Loguear("El usuario se logueó al sistema");
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

        public static void PonerIdiomaDefault(IdiomaBE idiomaAQuitar)
        {
            UsuarioDAL.PonerIdiomaDefault(idiomaAQuitar.Id);
        }

        public static List<UsuarioBE> ObtenerTodos()
        {
            return UsuarioDAL.ObtenerTodos();
        }

        public static void Guardar(UsuarioBE usuario)
        {
            if(!string.IsNullOrEmpty(usuario.Contrasenia))
            {
                usuario.Contrasenia = Encriptador.Encriptar(usuario.Contrasenia);
            }

            // Guardo el usuario
            UsuarioDAL.Guardar(usuario);

            GuardarHistorial(usuario, true);

            // Registro en bitácora
            Bitacora.Loguear("Usuario " + usuario.NombreDeUsuario + " guardado");
        }

        public static void Eliminar(UsuarioBE usuario)
        {
            UsuarioDAL.Eliminar(usuario.Id);

            GuardarHistorial(usuario, false);

            // Registro en bitácora
            Bitacora.Loguear("Usuario " + usuario.NombreDeUsuario + " eliminado");
        }
        #endregion

        #region Métodos privados
        private static void GuardarHistorial(UsuarioBE usuario, bool habilitado)
        {
            UsuarioHistorialBE usuarioHistorial = new UsuarioHistorialBE
            {
                Contrasenia = usuario.Contrasenia ?? "",
                Fecha = DateTime.Now,
                Idioma = usuario.Idioma.Nombre,
                IdUsuario = usuario.Id,
                Nombre = usuario.Nombre,
                NombreUsuario = usuario.NombreDeUsuario,
                Permisos = string.Join(", ", usuario.Perfil.Select(p => p.Nombre).ToList()),
                Habilitado = habilitado
            };
            UsuarioHistorialDAL.Guardar(usuarioHistorial);
        }
        #endregion
    }
}
