using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Bitacora
    {
        #region Propiedades
        private DateTime _fechaHora;
        public DateTime FechaHora
        {
            get { return _fechaHora; }
        }

        private Usuario _usuario;
        private int _usuarioId;
        public Usuario Usuario
        {
            get
            {
                if(_usuario == null && _usuarioId > 0)
                {
                    _usuario = new Usuario(_usuarioId);
                }
                return _usuario;
            }
        }

        private string _detalle;
        public string Detalle
        {
            get { return _detalle; }
        }
        #endregion

        #region Métodos
        public static void Loguear(string mensaje)
        {
            BitacoraDAL bitacora = new BitacoraDAL()
            {
                UsuarioId = Sesion.Instancia().UsuarioLogueado.Id,
                Detalle = mensaje
            };
            bitacora.Guardar();
        }

        public static List<Bitacora> Buscar(DateTime fechaInicio, DateTime fechafin, Usuario usuario, string parteDetalle)
        {
            int usuarioId = usuario == null ? 0 : usuario.Id;
            List<BitacoraDAL> bitacorasDAL = BitacoraDAL.Buscar(fechaInicio, fechafin, usuarioId, parteDetalle);
            List<Bitacora> bitacoras = new List<Bitacora>();
            foreach(BitacoraDAL bitacoraDAL in bitacorasDAL)
            {
                bitacoras.Add(ConvertirDesdeDAL(bitacoraDAL));
            }
            return bitacoras;
        }

        private static Bitacora ConvertirDesdeDAL(BitacoraDAL bitacoraDAL)
        {
            return new Bitacora()
            {
                _fechaHora = bitacoraDAL.FechaHora,
                _usuarioId = bitacoraDAL.UsuarioId,
                _detalle = bitacoraDAL.Detalle
            };
        }
        #endregion
    }
}
