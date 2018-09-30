using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Leyenda
    {
        #region Propiedades
        private string _texto;
        public string Texto
        {
            get { return _texto; }
            set { _texto = value; }
        }

        private string _nombreForm;
        public string NombreForm
        {
            get { return _nombreForm; }
            set { _nombreForm = value; }
        }

        private string _nombreControl;
        public string NombreControl
        {
            get { return _nombreControl; }
            set { _nombreControl = value; }
        }
        #endregion

        #region Métodos Públicos
        public static List<Leyenda> ObtenerTodas(Idioma Idioma)
        {
            List<LeyendaDAL> leyendasDAL = LeyendaDAL.Obtener(Idioma.Id);
            List<Leyenda> leyendas = new List<Leyenda>();
            foreach(LeyendaDAL leyendaDAL in leyendasDAL)
            {
                Leyenda leyenda = new Leyenda();
                leyenda.ConvertirDesdeDAL(leyendaDAL);
                leyendas.Add(leyenda);
            }
            return leyendas;
        }
        #endregion

        #region Métodos privados
        private void ConvertirDesdeDAL(LeyendaDAL LeyendaDAL)
        {
            NombreForm = LeyendaDAL.NombreForm;
            NombreControl = LeyendaDAL.NombreControl;
            Texto = LeyendaDAL.Texto;
        }
        #endregion
    }
}
