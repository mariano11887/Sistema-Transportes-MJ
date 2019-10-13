using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class UsuarioHistorial
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

        private string _nombreUsuario;

        public string NombreUsuario
        {
            get { return _nombreUsuario; }
            set { _nombreUsuario = value; }
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
            set { _permisos = value; }
        }

        private bool _habilitado;

        public bool Habilitado
        {
            get { return _habilitado; }
            set { _habilitado = value; }
        }
        #endregion

        public static List<UsuarioHistorial> ObtenerUltimos()
        {
            return UsuarioHistorialDAL.ObtenerUltimos().Select(dal => new UsuarioHistorial
            {
                Contrasenia = dal.Contrasenia,
                Fecha = dal.Fecha,
                Habilitado = dal.Habilitado,
                Idioma = dal.Idioma,
                IdUsuario = dal.IdUsuario,
                Nombre = dal.Nombre,
                NombreUsuario = dal.NombreDeUsuario,
                Permisos = dal.Permisos
            }).ToList();
        }

        public static List<UsuarioHistorial> Buscar(DateTime fechaInicio, DateTime fechaFin, string nombre, string nombreUsuario)
        {
            return UsuarioHistorialDAL.Buscar(fechaInicio, fechaFin, nombre, nombreUsuario).Select(dal => new UsuarioHistorial
            {
                Contrasenia = dal.Contrasenia,
                Fecha = dal.Fecha,
                Habilitado = dal.Habilitado,
                Idioma = dal.Idioma,
                IdUsuario = dal.IdUsuario,
                Nombre = dal.Nombre,
                NombreUsuario = dal.NombreDeUsuario,
                Permisos = dal.Permisos
            }).ToList();
        }
    }
}
