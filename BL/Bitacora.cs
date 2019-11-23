using BE;
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
        #region Métodos
        public static void Loguear(string mensaje)
        {
            BitacoraBE bitacora = new BitacoraBE()
            {
                FechaHora = DateTime.Now,
                Usuario = Sesion.Instancia().UsuarioLogueado,
                Detalle = mensaje
            };
            BitacoraDAL.Guardar(bitacora);
        }

        public static List<BitacoraBE> Buscar(DateTime fechaInicio, DateTime fechafin, UsuarioBE usuario, string parteDetalle)
        {
            int usuarioId = usuario == null ? 0 : usuario.Id;
            return BitacoraDAL.Buscar(fechaInicio, fechafin, usuarioId, parteDetalle);
        }
        #endregion
    }
}
