using BE;
using Logger;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace DAL
{
    public class PermisoDAL
    {
        #region Métodos públicos
        public static List<PermisoBE> ObtenerPerfiles()
        {
            string query = "SELECT DISTINCT p.id " +
                    "FROM permiso p " +
                    "INNER JOIN permiso_permiso pp ON p.id = pp.permiso_padre_id " +
                    "WHERE p.habilitado = 1";
            try
            {
                DataTable table = SqlHelper.Obtener(query, new SqlParameter[0]);
                List<PermisoBE> perfiles = new List<PermisoBE>();
                foreach (DataRow row in table.Rows)
                {
                    PermisoBE permiso = ObtenerPermiso(int.Parse(row["id"].ToString()), 1);
                    perfiles.Add(permiso);
                }
                return perfiles;
            }
            catch (Exception ex)
            {
                Log.Grabar(ex);
                return new List<PermisoBE>();
            }
        }

        public static List<PermisoBE> ObtenerPermisos()
        {
            string query = "SELECT DISTINCT p.id, p.nombre, p.descripcion " +
                    "FROM permiso p " +
                    "LEFT JOIN permiso_permiso pp ON p.id = pp.permiso_padre_id " +
                    "WHERE p.habilitado = 1 " +
                    "AND pp.permiso_padre_id IS NULL";
            try
            {
                DataTable table = SqlHelper.Obtener(query, new SqlParameter[0]);
                List<PermisoBE> perfiles = new List<PermisoBE>();
                foreach (DataRow row in table.Rows)
                {
                    PermisoBE permiso = new PermisoSimpleBE()
                    {
                        Descripcion = row["descripcion"].ToString(),
                        Nombre = row["nombre"].ToString(),
                        Id = int.Parse(row["id"].ToString())
                    };
                    perfiles.Add(permiso);
                }
                return perfiles;
            }
            catch (Exception ex)
            {
                Log.Grabar(ex);
                return new List<PermisoBE>();
            }
        }

        public static List<PermisoBE> ObtenerPorUsuario(int usuarioId)
        {
            string query = "SELECT p.id " +
                "FROM usuario_permiso up " +
                "JOIN permiso p ON p.id = up.permiso_id " +
                "WHERE up.usuario_id = @usuarioId " +
                "AND p.habilitado = 1;";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@usuarioId", usuarioId)
            };

            DataTable table = SqlHelper.Obtener(query, parameters);
            List<PermisoBE> permisos = new List<PermisoBE>();
            foreach (DataRow row in table.Rows)
            {
                PermisoBE permiso = ObtenerPermiso(int.Parse(row["id"].ToString()), 1);
                permisos.Add(permiso);
            }
            return permisos;
        }

        public static void Guardar(PermisoBE permiso, bool habilitado, bool actualizarHijos)
        {
            // Primero guardo los datos del permiso en sí
            if (permiso.Id > 0)
            {
                Actualizar(permiso, habilitado);
            }
            else
            {
                Insertar(permiso);
            }

            // Luego guardo los permisos hijos
            if (permiso.Id > 0 && actualizarHijos)
            {
                // Borro permisos hijos
                string query = "DELETE FROM permiso_permiso WHERE permiso_padre_id = @permisoPadreId";
                SqlParameter[] parameters =
                {
                    new SqlParameter("@permisoPadreId", permiso.Id)
                };
                SqlHelper.Ejecutar(query, parameters);

                // Inserto cada uno de los permisos hijos
                query = "INSERT INTO permiso_permiso (permiso_padre_id, permiso_hijo_id) VALUES (@permisoPadreId, @permisoHijoId)";
                foreach (PermisoBE hijo in permiso.DevolverPerfil())
                {
                    parameters = new SqlParameter[2]
                    {
                        new SqlParameter("@permisoPadreId", permiso.Id),
                        new SqlParameter("@permisoHijoId", hijo.Id)
                    };
                    SqlHelper.Ejecutar(query, parameters);
                }
            }
        }
        #endregion

        #region Métodos privados
        private static void Insertar(PermisoBE permiso)
        {
            string query = "INSERT INTO permiso (nombre, descripcion) OUTPUT INSERTED.id VALUES (@nombre, @descripcion)";
            SqlParameter[] parameters =
            {
                new SqlParameter("@nombre", permiso.Nombre),
                new SqlParameter("@descripcion", permiso.Descripcion)
            };
            permiso.Id = SqlHelper.Insertar(query, parameters);
        }

        private static void Actualizar(PermisoBE permiso, bool habilitado)
        {
            string query = "UPDATE permiso SET nombre = @nombre, descripcion = @descripcion, habilitado = @habilitado WHERE id = @id";
            SqlParameter[] parameters =
            {
                new SqlParameter("@nombre", permiso.Nombre),
                new SqlParameter("@descripcion", permiso.Descripcion),
                new SqlParameter("@habilitado", habilitado),
                new SqlParameter("@id", permiso.Id)
            };
            SqlHelper.Ejecutar(query, parameters);
        }

        private static PermisoBE ObtenerPermiso(int permisoId, int profundidad)
        {
            PermisoBE permiso;
            List<int> hijosIds = new List<int>();
            if (profundidad < 10)
            {
                hijosIds = ObtenerPermisosHijos(permisoId);
            }

            if(hijosIds.Any())
            {
                // Es un permiso compuesto
                permiso = new PermisoCompuestoBE();
                foreach(int hijoId in hijosIds)
                {
                    PermisoBE permisoHijo = ObtenerPermiso(hijoId, profundidad + 1);
                    permiso.AgregarPermisoHijo(permisoHijo);
                }
            }
            else
            {
                // Es un permiso simple
                permiso = new PermisoSimpleBE();
            }

            CompletarPermiso(permiso, permisoId);

            return permiso;
        }

        private static List<int> ObtenerPermisosHijos(int permisoId)
        {
            string query = "SELECT pp.permiso_hijo_id " +
                    "FROM permiso p " +
                    "INNER JOIN permiso_permiso pp ON p.id = pp.permiso_padre_id " +
                    "WHERE p.habilitado = 1 AND pp.permiso_padre_id = @permisoPadreId";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@permisoPadreId", permisoId)
            };

            DataTable table = SqlHelper.Obtener(query, parameters);
            return table.Select().Select(r => int.Parse(r["permiso_hijo_id"].ToString())).ToList();
        }

        private static void CompletarPermiso(PermisoBE permiso, int permisoId)
        {
            string query = "SELECT nombre, descripcion FROM permiso WHERE id = @id";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@id", permisoId)
            };

            DataTable table = SqlHelper.Obtener(query, parameters);
            if(table.Rows.Count > 0)
            {
                permiso.Id = permisoId;
                permiso.Nombre = table.Rows[0]["nombre"].ToString();
                permiso.Descripcion = table.Rows[0]["descripcion"].ToString();
            }
        }
        #endregion
    }
}
