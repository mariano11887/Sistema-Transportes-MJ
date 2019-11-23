using BE;
using DAL;
using System;
using System.Collections.Generic;

namespace BL
{
    public class UsuarioHistorial
    {
        public static List<UsuarioHistorialBE> ObtenerUltimos()
        {
            return UsuarioHistorialDAL.ObtenerUltimos();
        }

        public static List<UsuarioHistorialBE> Buscar(DateTime fechaInicio, DateTime fechaFin, string nombre, string nombreUsuario)
        {
            return UsuarioHistorialDAL.Buscar(fechaInicio, fechaFin, nombre, nombreUsuario);
        }
    }
}
