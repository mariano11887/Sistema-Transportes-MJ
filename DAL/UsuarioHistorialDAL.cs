using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace DAL
{
    public class UsuarioHistorialDAL
    {
        #region Propiedades
        private DateTime _fecha;

        public DateTime Fecha
        {
            get { return _fecha; }
            set { _fecha = value; }
        }

        private int _idUsuario;

        public int IdUsuario
        {
            get { return _idUsuario; }
            set { _idUsuario = value; }
        }

        private string _nombre;

        public string Nombre
        {
            get { return _nombre; }
            set { _nombre = value; }
        }

        private string _idioma;

        public string Idioma
        {
            get { return _idioma; }
            set { _idioma = value; }
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

        private string _permisos;

        public string Permisos
        {
            get { return _permisos; }
            set { _permisos = value.Length > 1000 ? value.Substring(0, 1000) : value; }
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
            string query = "INSERT INTO usuario_historial (fecha, id_usuario, nombre, idioma, nombre_usuario, contrasenia, permisos, habilitado) " +
                "VALUES (@fecha, @idUsuario, @nombre, @idioma, @nombreUsuario, @contrasenia, @permisos, @habilitado)";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@fecha", Fecha),
                new SqlParameter("@idUsuario", IdUsuario),
                new SqlParameter("@nombre", Nombre),
                new SqlParameter("@idioma", Idioma),
                new SqlParameter("@nombreUsuario", NombreDeUsuario),
                new SqlParameter("@contrasenia", Contrasenia),
                new SqlParameter("@permisos", Permisos),
                new SqlParameter("@habilitado", Habilitado)
            };

            SqlHelper.Ejecutar(query, parameters);
        }

        public static List<UsuarioHistorialDAL> ObtenerUltimos()
        {
            string query = "SELECT top 100 fecha, id_usuario, nombre, idioma, nombre_usuario, contrasenia, permisos, habilitado " +
                "FROM usuario_historial ORDER BY id DESC";
            DataTable table = SqlHelper.Obtener(query, new SqlParameter[0]);
            return DesdeDatatable(table);
        }

        public static List<UsuarioHistorialDAL> Buscar(DateTime fechaInicio, DateTime fechaFin, string nombre, string nombreUsuario)
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

        private static List<UsuarioHistorialDAL> DesdeDatatable(DataTable table)
        {
            return table.Select().Select(r => new UsuarioHistorialDAL
            {
                Contrasenia = r["contrasenia"].ToString(),
                Fecha = DateTime.Parse(r["fecha"].ToString()),
                Habilitado = bool.Parse(r["habilitado"].ToString()),
                Idioma = r["idioma"].ToString(),
                IdUsuario = int.Parse(r["id_usuario"].ToString()),
                Nombre = r["nombre"].ToString(),
                NombreDeUsuario = r["nombre_usuario"].ToString(),
                Permisos = r["permisos"].ToString()
            }).ToList();
        }
    }
}
