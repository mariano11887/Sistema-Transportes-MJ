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
            if (_inhibir)
            {
                _inhibir = false;
                return;
            }

            if (LimpiarForm())
            {
                _ultimoIdiomaSeleccionado = lstIdiomasActuales.SelectedIndex;
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
            else
            {
                _inhibir = true;
                lstIdiomasActuales.SelectedIndex = _ultimoIdiomaSeleccionado;
            }
        }

        private void btnCrearNuevo_Click(object sender, EventArgs e)
        {
            lstIdiomasActuales.SelectedItem = null;
            _editando = true;
            txtNombre.Enabled = true;
            txtNombre.Text = "";
            dgvLeyendas.Columns[2].ReadOnly = false;
            foreach (DataGridViewRow row in dgvLeyendas.Rows)
            {
                row.Cells[2].Value = "";
            }
            btnGuardar.Enabled = true;
            btnDescartar.Enabled = true;
        }

        private void btnDescartar_Click(object sender, EventArgs e)
        {
            if(LimpiarForm())
            {
                _editando = false;
            }
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            if (ValidarDatos())
            {
                CompletarLeyendasFaltantes();
                Idioma idioma;
                if (lstIdiomasActuales.SelectedItem == null)
                {
                    idioma = new Idioma();
                }
                else
                {
                    idioma = (Idioma)lstIdiomasActuales.SelectedItem;
                }
                idioma.Nombre = txtNombre.Text;

                // Comienzo construyendo las leyendas
                idioma.Leyendas = new List<Leyenda>();
                foreach (DataGridViewRow row in dgvLeyendas.Rows)
                {
                    Leyenda leyendaEsp = (Leyenda)row.Tag;
                    Leyenda leyenda = new Leyenda();
                    leyenda.NombreControl = leyendaEsp.NombreControl;
                    leyenda.NombreForm = leyendaEsp.NombreForm;
                    leyenda.Texto = row.Cells[2].Value.ToString();
                    idioma.Leyendas.Add(leyenda);
                }

                idioma.Guardar();

                MessageBox.Show(ObtenerLeyenda("msgGuardado"), ObtenerLeyenda("msgGuardadoTitulo"),
                    MessageBoxButtons.OK, MessageBoxIcon.Information);
                _editando = false;
                LimpiarForm();

                List<Idioma> idiomas = Idioma.ListarTodos();
                lstIdiomasActuales.DataSource = idiomas;
                lstIdiomasActuales.SelectedItem = null;
            }
        }

        private void btnEditar_Click(object sender, EventArgs e)
        {
            _editando = true;
            txtNombre.Enabled = true;
            dgvLeyendas.Columns[2].ReadOnly = false;
            btnGuardar.Enabled = true;
            btnDescartar.Enabled = true;
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show(ObtenerLeyenda("msgEliminar"), ObtenerLeyenda("msgEliminarTitulo"),
                MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation);
            if (result == DialogResult.Yes)
            {
                Idioma idioma = (Idioma)lstIdiomasActuales.SelectedItem;
                idioma.Eliminar();
                LimpiarForm();

                List<Idioma> idiomas = Idioma.ListarTodos();
                lstIdiomasActuales.DataSource = idiomas;
                lstIdiomasActuales.SelectedItem = null;
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

        private bool LimpiarForm()
        {
            if (_editando)
            {
                DialogResult result = MessageBox.Show(ObtenerLeyenda("msgPerderCambios"), ObtenerLeyenda("msgPerderCambiosTitulo"),
                    MessageBoxButtons.OKCancel, MessageBoxIcon.Warning);
                if (result == DialogResult.Cancel)
                {
                    return false;
                }
            }

            txtNombre.Enabled = false;
            txtNombre.Text = "";
            btnGuardar.Enabled = false;
            btnDescartar.Enabled = false;
            dgvLeyendas.Columns[2].ReadOnly = true;
            foreach (DataGridViewRow row in dgvLeyendas.Rows)
            {
                row.Cells[2].Value = "";
            }

            return true;
        }

        private bool ValidarDatos()
        {
            if(string.IsNullOrWhiteSpace(txtNombre.Text))
            {
                MessageBox.Show(ObtenerLeyenda("msgCompletarDatos"), ObtenerLeyenda("msgCompletarDatosTitulo"),
                    MessageBoxButtons.OK, MessageBoxIcon.Hand);
                return false;
            }
            return true;
        }

        private void CompletarLeyendasFaltantes()
        {
            foreach (DataGridViewRow row in dgvLeyendas.Rows)
            {
                if(string.IsNullOrWhiteSpace(row.Cells[2].Value.ToString()))
                {
                    row.Cells[2].Value = row.Cells[1].Value;
                }
            }
        }
        #endregion
    }
}
