using BE;
using BL;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace UI
{
    public class FormGeneral : Form, IObservadorIdioma
    {
        private List<LeyendaBE> _leyendas;

        #region Métodos públicos
        public void Abrir()
        {
            GestorDeIdioma.Instancia().RegistrarObservador(this);

            FormClosing += new FormClosingEventHandler(ThisForm_FormClosing);

            ActualizarLeyendas();
            ProcesarControlesConPermisos();
        }

        public void ActualizarLeyendas()
        {
            IdiomaBE idioma = Sesion.Instancia().UsuarioLogueado.Idioma;
            _leyendas = idioma.Leyendas.Where(l => l.NombreForm == Name).ToList();
            AsignarLeyenda(this);
        }

        public string ObtenerLeyenda(string Clave)
        {
            LeyendaBE leyenda = _leyendas.FirstOrDefault(l => l.NombreControl == Clave);
            return leyenda != null ? leyenda.Texto : "";
        }

        public virtual void ProcesarControlesConPermisos() { }
        #endregion

        #region Métodos protegidos
        protected bool TienePermiso(string Permiso)
        {
            return Sesion.Instancia().TienePermiso(Permiso);
        }
        #endregion

        #region Métodos privados
        private void ThisForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            GestorDeIdioma.Instancia().QuitarObservador(this);
        }

        private void AsignarLeyenda(Control Control)
        {
            LeyendaBE leyenda = _leyendas.FirstOrDefault(l => l.NombreControl == Control.Name);
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
            else if (Control.GetType() == typeof(DataGridView))
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
            LeyendaBE leyenda = _leyendas.FirstOrDefault(l => l.NombreControl == Item.Name);
            if (leyenda != null)
            {
                Item.Text = leyenda.Texto;
            }
            foreach (ToolStripMenuItem item in Item.DropDownItems)
            {
                AsignarLeyenda(item);
            }
        }

        private void AsignarLeyenda(DataGridViewColumn columna)
        {
            LeyendaBE leyenda = _leyendas.FirstOrDefault(l => l.NombreControl == columna.Name);
            if (leyenda != null)
            {
                columna.HeaderText = leyenda.Texto;
            }
        }
        #endregion
    }
}
