using BL;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace UI
{
    public partial class IdiomasForm : FormGeneral
    {
        private bool _editando = false;
        private int _ultimoIdiomaSeleccionado = 0;
        private bool _inhibir = false;

        public IdiomasForm()
        {
            InitializeComponent();
        }

        #region Eventos
        private void IdiomasForm_Load(object sender, EventArgs e)
        {
            Abrir();

            List<Idioma> idiomas = Idioma.ListarTodos();
            lstIdiomasActuales.DataSource = idiomas;
            lstIdiomasActuales.SelectedItem = null;

            Idioma idiomaEspaniol = idiomas.SingleOrDefault(i => i.Id == 1);
            if (idiomaEspaniol != null)
            {
                LlenarGrillaLeyendasEspaniol(idiomaEspaniol.Leyendas);
            }
        }

        private void lstIdiomasActuales_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(_inhibir)
            {
                _inhibir = false;
                return;
            }

            if (_editando)
            {
                DialogResult result = MessageBox.Show(ObtenerLeyenda("msgPerderCambios"), ObtenerLeyenda("msgPerderCambiosTitulo"),
                    MessageBoxButtons.OKCancel, MessageBoxIcon.Warning);
                if(result == DialogResult.Cancel)
                {
                    _inhibir = true;
                    lstIdiomasActuales.SelectedIndex = _ultimoIdiomaSeleccionado;
                    return;
                }
            }

            _ultimoIdiomaSeleccionado = lstIdiomasActuales.SelectedIndex;

            txtNombre.Enabled = false;
            btnGuardar.Enabled = false;
            btnDescartar.Enabled = false;
            if (lstIdiomasActuales.SelectedItem == null)
            {
                btnEditar.Enabled = false;
                btnEliminar.Enabled = false;
                txtNombre.Text = "";
                LlenarTextoIdioma(new List<Leyenda>());
            }
            else
            {
                Idioma idiomaSeleccionado = (Idioma)lstIdiomasActuales.SelectedItem;
                btnEditar.Enabled = idiomaSeleccionado.Editable;
                btnEliminar.Enabled = idiomaSeleccionado.Editable;
                txtNombre.Text = idiomaSeleccionado.Nombre;
                LlenarTextoIdioma(idiomaSeleccionado.Leyendas);
            }
        }
        #endregion

        #region Métodos
        public override void ProcesarControlesConPermisos()
        {
            btnCrearNuevo.Visible = TienePermiso(Permisos.CREAR_IDIOMAS);
            btnEditar.Visible = TienePermiso(Permisos.MODIFICAR_IDIOMAS);
            btnEliminar.Visible = TienePermiso(Permisos.BORRAR_IDIOMAS);
        }

        private void LlenarGrillaLeyendasEspaniol(List<Leyenda> leyendas)
        {
            foreach (Leyenda leyenda in leyendas)
            {
                DataGridViewRow row = new DataGridViewRow();
                row.CreateCells(dgvLeyendas);
                row.Cells[0].Value = leyenda.NombreForm + " - " + leyenda.NombreControl;
                row.Cells[1].Value = leyenda.Texto;
                row.Tag = leyenda;
                dgvLeyendas.Rows.Add(row);
            }
        }

        private void LlenarTextoIdioma(List<Leyenda> leyendas)
        {
            foreach(DataGridViewRow row in dgvLeyendas.Rows)
            {
                Leyenda le = (Leyenda)row.Tag; // Leyenda en español
                Leyenda leyendaIdioma = leyendas.SingleOrDefault(l => l.NombreForm == le.NombreForm && l.NombreControl == le.NombreControl);
                row.Cells[2].Value = leyendaIdioma != null ? leyendaIdioma.Texto : "";
            }
        }
        #endregion
    }
}
