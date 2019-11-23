using BE;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace DAL
{
    public class UsuarioDAL
    {
        #region Métodos públicos
        public static UsuarioBE Obtener(int id)
        {
            string query = "SELECT id, nombre, idioma_id, nombre_usuario FROM usuario WHERE id = @id";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@id", id)
            };
            DataTable table = SqlHelper.Obtener(query, parameters);
            if (table != null && table.Rows.Count > 0)
            {
                return new UsuarioBE
                {
                    Id = int.Parse(table.Rows[0]["id"].ToString()),
                    Nombre = table.Rows[0]["nombre"].ToString(),
                    Idioma = IdiomaDAL.Obtener(int.Parse(table.Rows[0]["idioma_id"].ToString())),
                    NombreDeUsuario = table.Rows[0]["nombre_usuario"].ToString(),
                    Perfil = PermisoDAL.ObtenerPorUsuario(id)
                };
            }

            return null;
        }

        public static void Guardar(UsuarioBE usuario)
        {
            string query;
            SqlParameter[] parameters;
            if (usuario.Id > 0)
            {
                Actualizar(usuario);

                // Borro los permisos que tenga el usuario
                query = "DELETE FROM usuario_permiso WHERE usuario_id = @usuarioId";
                parameters = new SqlParameter[]
                {
                    new SqlParameter("@usuarioId", usuario.Id)
                };
                SqlHelper.Ejecutar(query, parameters);
            }
            else
            {
                Insertar(usuario);
            }

            // Inserto los permisos
            query = "INSERT INTO usuario_permiso (usuario_id, permiso_id) VALUES (@usuarioId, @permisoId)";
            foreach (int permisoId in usuario.Perfil.Select(p => p.Id))
            {
                parameters = new SqlParameter[]
                {
                    new SqlParameter("@usuarioId", usuario.Id),
                    new SqlParameter("@permisoId", permisoId)
                };
                SqlHelper.Ejecutar(query, parameters);
            }
        }

        public static UsuarioBE Obtener(string nombreDeUsuario, string contrasenia)
        {
            string query = "SELECT TOP 1 id, nombre, idioma_id, nombre_usuario FROM usuario " +
                "WHERE habilitado = 1 AND nombre_usuario = @nombreDeUsuario AND contrasenia = @contrasenia";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@nombreDeUsuario", nombreDeUsuario),
                new SqlParameter("@contrasenia", contrasenia)
            };

            DataTable table = SqlHelper.Obtener(query, parameters);
            if (table != null && table.Rows.Count > 0)
            {
                int id = int.Parse(table.Rows[0]["id"].ToString());
                return new UsuarioBE
                {
                    Id = id,
                    Nombre = table.Rows[0]["nombre"].ToString(),
                    Idioma = IdiomaDAL.Obtener(int.Parse(table.Rows[0]["idioma_id"].ToString())),
                    NombreDeUsuario = table.Rows[0]["nombre_usuario"].ToString(),
                    Perfil = PermisoDAL.ObtenerPorUsuario(id)
                };
            }

            return null;
        }

        public static void PonerIdiomaDefault(int idiomaIdAQuitar)
        {
            string query = "UPDATE usuario SET idioma_id = 1 WHERE idioma_id = @idiomaIdViejo";
            SqlParameter[] parameters =
            {
                new SqlParameter("@idiomaIdViejo", idiomaIdAQuitar)
            };
            SqlHelper.Ejecutar(query, parameters);
        }

        public static List<UsuarioBE> ObtenerTodos()
        {
            string query = "SELECT id, nombre, idioma_id, nombre_usuario FROM usuario WHERE habilitado = 1";
            SqlParameter[] parameters = { };
            DataTable table = SqlHelper.Obtener(query, parameters);
            List<UsuarioBE> usuarios = new List<UsuarioBE>();
            foreach (DataRow row in table.Rows)
            {
                int id = int.Parse(row["id"].ToString());
                UsuarioBE usuario = new UsuarioBE()
                {
                    Id = id,
                    Nombre = row["nombre"].ToString(),
                    Idioma = IdiomaDAL.Obtener(int.Parse(row["idioma_id"].ToString())),
                    NombreDeUsuario = row["nombre_usuario"].ToString(),
                    Perfil = PermisoDAL.ObtenerPorUsuario(id)
                };
                usuarios.Add(usuario);
            }
            return usuarios;
        }

        public static void Eliminar(int usuarioId)
        {
            // Primero elimino los permisos
            string query = "DELETE FROM usuario_permiso WHERE usuario_id = @usuarioId";
            SqlParameter[] parameters =
            {
                new SqlParameter("@usuarioId", usuarioId)
            };
            SqlHelper.Ejecutar(query, parameters);

            // Ahora deshabilito el usuario
            query = "UPDATE usuario SET habilitado = 0 WHERE id = @usuarioId";
            parameters = new SqlParameter[1] {
                new SqlParameter("@usuarioId", usuarioId)
            };
            SqlHelper.Ejecutar(query, parameters);
        }
        #endregion

        #region Métodos privados
        private static void Insertar(UsuarioBE usuario)
        {
            string query = "INSERT INTO usuario (nombre, idioma_id, nombre_usuario, contrasenia) OUTPUT INSERTED.id VALUES (@nombre, @idiomaId, @nombreUsuario, @contrasenia)";
            SqlParameter[] parameters =
            {
                new SqlParameter("@nombre", usuario.Nombre),
                new SqlParameter("@idiomaId", usuario.Idioma.Id),
                new SqlParameter("@nombreUsuario", usuario.NombreDeUsuario),
                new SqlParameter("@contrasenia", usuario.Contrasenia)
            };
            usuario.Id = SqlHelper.Insertar(query, parameters);
        }

        private static void Actualizar(UsuarioBE usuario)
        {
            string query = "UPDATE usuario SET nombre = @nombre, idioma_id = @idiomaId, nombre_usuario = @nombreUsuario";
            SqlParameter[] parameters;
            if (!string.IsNullOrEmpty(usuario.Contrasenia))
            {
                query += ", contrasenia = @contrasenia";
                parameters = new SqlParameter[5];
                parameters[4] = new SqlParameter("@contrasenia", usuario.Contrasenia);
            }
            else
            {
                parameters = new SqlParameter[4];
            }
            query += " WHERE id = @id";
            parameters[0] = new SqlParameter("@nombre", usuario.Nombre);
            parameters[1] = new SqlParameter("@idiomaId", usuario.Idioma.Id);
            parameters[2] = new SqlParameter("@nombreUsuario", usuario.NombreDeUsuario);
            parameters[3] = new SqlParameter("@id", usuario.Id);

            SqlHelper.Ejecutar(query, parameters);
        }
        #endregion
    }
}
