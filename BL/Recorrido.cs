using BE;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Recorrido
    {
        public static List<RecorridoBE> ListarTodos()
        {
            return RecorridoDAL.ListarTodos();
        }

        public static RecorridoBE Obtener(int idRecorrido)
        {
            return RecorridoDAL.Obtener(idRecorrido);
        }
    }
}
