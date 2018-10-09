using BL;
using Logger;
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
        private List<Leyenda> _leyendas;
        
        public void Abrir()
        {
            Idioma idioma = Sesion.Instancia().UsuarioLogueado.Idioma;
            _leyendas = idioma.Leyendas.Where(l => l.NombreForm == Name).ToList();
            AsignarLeyenda(this);
            ProcesarControlesConPermisos();
        }

        private void AsignarLeyenda(Control Control)
        {
            Leyenda leyenda = _leyendas.FirstOrDefault(l => l.NombreControl == Control.Name);
            if (leyenda != null)
            {
                Control.Text = leyenda.Texto;
            }
            if (Control.GetType() == typeof(MenuStrip))
            {
                foreach (ToolStripMenuItem item in ((MenuStrip)Control).Items)
                {
                    AsignarLeyenda(item);
                }
            }
            else if(Control.GetType() == typeof(DataGridView))
            {
                foreach (DataGridViewColumn columna in ((DataGridView)Control).Columns)
                {
                    AsignarLeyenda(columna);
                }
            }
            else
            {
                foreach (Control controlHijo in Control.Controls)
                {
                    AsignarLeyenda(controlHijo);
                }
            }
        }

        private void AsignarLeyenda(ToolStripMenuItem Item)
        {
            Leyenda leyenda = _leyendas.FirstOrDefault(l => l.NombreControl == Item.Name);
            if (leyenda != null)
            {
                Item.Text = leyenda.Texto;
            }
            foreach(ToolStripMenuItem item in Item.DropDownItems)
            {
                AsignarLeyenda(item);
            }
        }

        private void AsignarLeyenda(DataGridViewColumn columna)
        {
            Leyenda leyenda = _leyendas.FirstOrDefault(l => l.NombreControl == columna.Name);
            if (leyenda != null)
            {
                columna.HeaderText = leyenda.Texto;
            }
        }

        protected string ObtenerLeyenda(string Clave)
        {
            Leyenda leyenda = _leyendas.FirstOrDefault(l => l.NombreControl == Clave);
            if (leyenda != null)
            {
                return leyenda.Texto;
            }
            else
            {
                return "";
            }
        }

        public virtual void ProcesarControlesConPermisos() { }

        protected bool TienePermiso(string Permiso)
        {
            return Sesion.Instancia().TienePermiso(Permiso);
        }
    }
}
