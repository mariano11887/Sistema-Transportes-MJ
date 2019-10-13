using System;
using System.Data.SqlClient;

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
    }
}
