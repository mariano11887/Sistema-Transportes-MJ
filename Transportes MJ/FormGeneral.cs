using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace UI
{
    public class FormGeneral : Form
    {
        private List<Control> _controles;
        public List<Control> Controles
        {
            get { return _controles; }
            set { _controles = value; }
        }

        private string _titulo;
        public string Titulo
        {
            get { return _titulo; }
            set { _titulo = value; }
        }


        public void Abrir()
        {

        }

        public void Cerrar()
        {

        }

        protected void OcultarControl()
        {

        }

        protected void AsignarLeyenda()
        {

        }
    }
}
