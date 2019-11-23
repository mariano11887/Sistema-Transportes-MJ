using BE;
using DAL;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;

namespace BL
{
    public class Vehiculo
    {
        public static void Guardar(VehiculoBE vehiculo)
        {
            VehiculoDAL.Guardar(vehiculo);

            Bitacora.Loguear("Se guardó el vehículo con Id " + vehiculo.Id);
        }

        public static void Borrar(VehiculoBE vehiculo)
        {
            VehiculoDAL.Borrar(vehiculo.Id);

            Bitacora.Loguear("Se borró vehículo con Id " + vehiculo.Id);
        }

        public static TerminalBE ObtenerUltimoEstacionamiento(VehiculoBE vehiculo)
        {
            int ultimaTerminalId = VehiculoDAL.ObtenerUltimaTerminalId(vehiculo.Id);
            if (ultimaTerminalId <= 0)
            {
                // No hay datos de este vehículo. Asumo que está en la terminal configurada en el config
                ultimaTerminalId = int.Parse(ConfigurationManager.AppSettings["terminalIdNuevoVehiculo"]);
            }

            return Terminal.Obtener(ultimaTerminalId);
        }

        public static VehiculoBE Buscar(int id)
        {
            return VehiculoDAL.Buscar(id);
        }

        public static List<VehiculoBE> Buscar(string patente, int numeroDeInterno, bool? enCirculacion)
        {
            return VehiculoDAL.Buscar(patente, numeroDeInterno, enCirculacion);
        }

        public static List<VehiculoBE> ListarTodos()
        {
            return VehiculoDAL.ListarTodos();
        }
    }
}
