using BE;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Idioma
    {
        #region Métodos públicos
        public static void Guardar(IdiomaBE idioma)
        {
            // Primero el idioma en sí
            IdiomaDAL.Guardar(idioma);

            // Ahora las leyendas
            LeyendaDAL leyendaDAL = new LeyendaDAL(idioma.Id);
            foreach(LeyendaBE leyenda in idioma.Leyendas)
            {
                leyendaDAL.Guardar(leyenda);
            }

            // Registro en la bitácora
            Bitacora.Loguear("Se guardó el idioma con el id " + idioma.Id);
        }

        public static List<IdiomaBE> ListarTodos()
        {
            return IdiomaDAL.ObtenerTodos();
        }

        public static void Eliminar(IdiomaBE idioma)
        {
            // Los usuarios que tengan este idioma asignado pasarán a tener Español (id 1)
            Usuario.PonerIdiomaDefault(idioma);

            // Eliminar las leyendas de este idioa
            LeyendaDAL.EliminarPorIdioma(idioma.Id);

            // Ahora sí elimino el idioma
            IdiomaDAL.Borrar(idioma.Id);

            // Registro en la bitácora
            Bitacora.Loguear("Se eliminó el idioma " + idioma.Nombre);
        }
        #endregion
    }
}
