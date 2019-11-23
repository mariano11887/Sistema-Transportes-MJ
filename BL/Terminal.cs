using BE;
using DAL;
using System.Collections.Generic;
using System.Device.Location;
using System.Linq;

namespace BL
{
    public class Terminal
    {
        // Guardo todas las terminales acá para no ir a buscar los mismos datos a la BD muchas veces
        private static List<TerminalBE> terminales;

        public static TerminalBE ObtenerTerminalCercana(TerminalBE terminalReferencia, int indiceCercania)
        {
            if(terminales == null)
            {
                terminales = TerminalDAL.ListarTodas();
            }

            if(indiceCercania >= terminales.Count - 1)
            {
                return null;
            }

            GeoCoordinate ubicacion = new GeoCoordinate(terminalReferencia.Latitud, terminalReferencia.Longitud);

            // Las ordeno por distancia
            List<TerminalBE> terminalesOrdenadas = terminales.Where(t => t.Id != terminalReferencia.Id).Select(t => new
            {
                Distancia = ubicacion.GetDistanceTo(new GeoCoordinate(t.Latitud, t.Longitud)),
                Terminal = t
            }).OrderBy(x => x.Distancia).Select(x => x.Terminal).ToList();

            return terminalesOrdenadas[indiceCercania];
        }

        public static TerminalBE Obtener(int id)
        {
            return TerminalDAL.Obtener(id);
        }
    }
}
