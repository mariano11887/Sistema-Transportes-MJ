using BE;
using DAL;
using System.Collections.Generic;
using System.Linq;

namespace BL
{
    public class Chofer
    {
        public static List<ChoferBE> Buscar(string nombre, int dni, bool? deLicencia, string patenteCochePreferido)
        {
            int cochePreferidoId = 0;
            if(!string.IsNullOrWhiteSpace(patenteCochePreferido))
            {
                VehiculoBE cochePreferido = Vehiculo.Buscar(patenteCochePreferido, 0, null).FirstOrDefault();
                if(cochePreferido != null)
                {
                    cochePreferidoId = cochePreferido.Id;
                }
            }

            return ChoferDAL.Buscar(nombre, dni, deLicencia, cochePreferidoId);
        }

        public static List<ChoferBE> ListarTodos()
        {
            return ChoferDAL.ListarTodos();
        }

        public static ChoferBE Obtener(int id)
        {
            return ChoferDAL.Obtener(id);
        }

        public static void Guardar(ChoferBE chofer)
        {
            ChoferDAL.Guardar(chofer);

            Bitacora.Loguear("Se guardó el chofer con Id " + chofer.Id);
        }

        public static void Borrar(ChoferBE chofer)
        {
            ChoferDAL.Borrar(chofer.Id);

            Bitacora.Loguear("Se borró el chofer con Id " + chofer.Id);
        }
    }
}
