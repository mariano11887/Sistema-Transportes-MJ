using BE;
using BL;
using System;
using System.Collections.Generic;
using System.Linq;
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

            List<IdiomaBE> idiomas = Idioma.ListarTodos();
            lstIdiomasActuales.DataSource = idiomas;
            lstIdiomasActuales.SelectedItem = null;

            IdiomaBE idiomaEspaniol = idiomas.SingleOrDefault(i => i.Id == 1);
            if (idiomaEspaniol != null)
            {
                LlenarGrillaLeyendasEspaniol(idiomaEspaniol.Leyendas);
            }
        }

        private void LstIdiomasActuales_SelectedIndexChanged(object sender, EventArgs e)
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
                    LlenarTextoIdioma(new List<LeyendaBE>());
                }
                else
                {
                    IdiomaBE idiomaSeleccionado = (IdiomaBE)lstIdiomasActuales.SelectedItem;
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

        private void BtnCrearNuevo_Click(object sender, EventArgs e)
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

        private void BtnDescartar_Click(object sender, EventArgs e)
        {
            if(LimpiarForm())
            {
                _editando = false;
            }
        }

        private void BtnGuardar_Click(object sender, EventArgs e)
        {
            if (ValidarDatos())
            {
                CompletarLeyendasFaltantes();
                IdiomaBE idioma;
                if (lstIdiomasActuales.SelectedItem == null)
                {
                    idioma = new IdiomaBE();
                }
                else
                {
                    idioma = (IdiomaBE)lstIdiomasActuales.SelectedItem;
                }
                idioma.Nombre = txtNombre.Text;

                // Comienzo construyendo las leyendas
                idioma.Leyendas = new List<LeyendaBE>();
                foreach (DataGridViewRow row in dgvLeyendas.Rows)
                {
                    LeyendaBE leyendaEsp = (LeyendaBE)row.Tag;
                    LeyendaBE leyenda = new LeyendaBE
                    {
                        NombreControl = leyendaEsp.NombreControl,
                        NombreForm = leyendaEsp.NombreForm,
                        Texto = row.Cells[2].Value.ToString()
                    };
                    idioma.Leyendas.Add(leyenda);
                }

                Idioma.Guardar(idioma);

                MessageBox.Show(ObtenerLeyenda("msgGuardado"), ObtenerLeyenda("msgGuardadoTitulo"),
                    MessageBoxButtons.OK, MessageBoxIcon.Information);
                _editando = false;
                LimpiarForm();

                List<IdiomaBE> idiomas = Idioma.ListarTodos();
                lstIdiomasActuales.DataSource = idiomas;
                lstIdiomasActuales.SelectedItem = null;
            }
        }

        private void BtnEditar_Click(object sender, EventArgs e)
        {
            _editando = true;
            txtNombre.Enabled = true;
            dgvLeyendas.Columns[2].ReadOnly = false;
            btnGuardar.Enabled = true;
            btnDescartar.Enabled = true;
        }

        private void BtnEliminar_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show(ObtenerLeyenda("msgEliminar"), ObtenerLeyenda("msgEliminarTitulo"),
                MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation);
            if (result == DialogResult.Yes)
            {
                IdiomaBE idioma = (IdiomaBE)lstIdiomasActuales.SelectedItem;
                Idioma.Eliminar(idioma);
                LimpiarForm();

                List<IdiomaBE> idiomas = Idioma.ListarTodos();
                lstIdiomasActuales.DataSource = idiomas;
                lstIdiomasActuales.SelectedItem = null;
            }
        }
        #endregion

        #region Métodos
        public override void ProcesarControlesConPermisos()
        {
            btnCrearNuevo.Visible = TienePermiso(Permisos.IDIOMAS_ALTA);
            btnEditar.Visible = TienePermiso(Permisos.IDIOMAS_MODIFICAR);
            btnEliminar.Visible = TienePermiso(Permisos.IDIOMAS_BAJA);
        }

        private void LlenarGrillaLeyendasEspaniol(List<LeyendaBE> leyendas)
        {
            foreach (LeyendaBE leyenda in leyendas)
            {
                DataGridViewRow row = new DataGridViewRow();
                row.CreateCells(dgvLeyendas);
                row.Cells[0].Value = leyenda.NombreForm + " - " + leyenda.NombreControl;
                row.Cells[1].Value = leyenda.Texto;
                row.Tag = leyenda;
                dgvLeyendas.Rows.Add(row);
            }
        }

        private void LlenarTextoIdioma(List<LeyendaBE> leyendas)
        {
            foreach(DataGridViewRow row in dgvLeyendas.Rows)
            {
                LeyendaBE le = (LeyendaBE)row.Tag; // Leyenda en español
                LeyendaBE leyendaIdioma = leyendas.SingleOrDefault(l => l.NombreForm == le.NombreForm && l.NombreControl == le.NombreControl);
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
