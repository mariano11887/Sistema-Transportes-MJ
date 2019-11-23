using BE;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace DAL
{
    public class UsuarioHistorialDAL
    {
        public static void Guardar(UsuarioHistorialBE usuarioHistorial)
        {
            string query = "INSERT INTO usuario_historial (fecha, id_usuario, nombre, idioma, nombre_usuario, contrasenia, permisos, habilitado) " +
                "VALUES (@fecha, @idUsuario, @nombre, @idioma, @nombreUsuario, @contrasenia, @permisos, @habilitado)";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@fecha", usuarioHistorial.Fecha),
                new SqlParameter("@idUsuario", usuarioHistorial.IdUsuario),
                new SqlParameter("@nombre", usuarioHistorial.Nombre),
                new SqlParameter("@idioma", usuarioHistorial.Idioma),
                new SqlParameter("@nombreUsuario", usuarioHistorial.NombreUsuario),
                new SqlParameter("@contrasenia", usuarioHistorial.Contrasenia),
                new SqlParameter("@permisos", usuarioHistorial.Permisos),
                new SqlParameter("@habilitado", usuarioHistorial.Habilitado)
            };

            SqlHelper.Ejecutar(query, parameters);
        }

        public static List<UsuarioHistorialBE> ObtenerUltimos()
        {
            string query = "SELECT top 100 fecha, id_usuario, nombre, idioma, nombre_usuario, contrasenia, permisos, habilitado " +
                "FROM usuario_historial ORDER BY id DESC";
            DataTable table = SqlHelper.Obtener(query, new SqlParameter[0]);
            return DesdeDatatable(table);
        }

        public static List<UsuarioHistorialBE> Buscar(DateTime fechaInicio, DateTime fechaFin, string nombre, string nombreUsuario)
        {
            string query = "SELECT top 100 fecha, id_usuario, nombre, idioma, nombre_usuario, contrasenia, permisos, habilitado " +
                "FROM usuario_historial WHERE fecha BETWEEN @fechaInicio AND @fechaFin {0} ORDER BY id DESC";
            List<SqlParameter> parameters = new List<SqlParameter>
            {
                new SqlParameter("@fechaInicio", fechaInicio),
                new SqlParameter("@fechaFin", fechaFin)
            };

            string conditions = "";
            if(!string.IsNullOrWhiteSpace(nombre))
            {
                conditions += "AND nombre LIKE  @nombre ";
                parameters.Add(new SqlParameter("@nombre", "%" + nombre + "%"));
            }
            if(!string.IsNullOrWhiteSpace(nombreUsuario))
            {
                conditions += "AND nombre_usuario LIKE @nombreUsuario ";
                parameters.Add(new SqlParameter("@nombreUsuario", "%" + nombreUsuario + "%"));
            }

            query = string.Format(query, conditions);

            DataTable table = SqlHelper.Obtener(query, parameters.ToArray());
            return DesdeDatatable(table);
        }

        private static List<UsuarioHistorialBE> DesdeDatatable(DataTable table)
        {
            return table.Select().Select(r => new UsuarioHistorialBE
            {
                Contrasenia = r["contrasenia"].ToString(),
                Fecha = DateTime.Parse(r["fecha"].ToString()),
                Habilitado = bool.Parse(r["habilitado"].ToString()),
                Idioma = r["idioma"].ToString(),
                IdUsuario = int.Parse(r["id_usuario"].ToString()),
                Nombre = r["nombre"].ToString(),
                NombreUsuario = r["nombre_usuario"].ToString(),
                Permisos = r["permisos"].ToString()
            }).ToList();
        }
    }
}
