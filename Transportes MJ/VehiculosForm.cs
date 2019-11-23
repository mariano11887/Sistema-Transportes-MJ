using BE;
using BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Windows.Forms;

namespace UI
{
    public partial class VehiculosForm : FormGeneral
    {
        public VehiculosForm()
        {
            InitializeComponent();
        }

        private void VehiculosForm_Load(object sender, EventArgs e)
        {
            Abrir();

            dtpFechaDeAdquisicion.MaxDate = DateTime.Today;
        }

        private void BtnNuevo_Click(object sender, EventArgs e)
        {
            lstResultadoBusqueda.SelectedIndices.Clear();
            grpDetalles.Enabled = true;
            BorrarSeccionDetalles();
        }

        private void TxtCapacidad_KeyPress(object sender, KeyPressEventArgs e)
        {
            AceptarSoloNumeros(e);
        }

        private void TxtAnioFabricacion_KeyPress(object sender, KeyPressEventArgs e)
        {
            AceptarSoloNumeros(e);
        }

        private void TxtNumeroDeInternoDetalles_KeyPress(object sender, KeyPressEventArgs e)
        {
            AceptarSoloNumeros(e);
        }

        private void TxtNumeroDeInterno_KeyPress(object sender, KeyPressEventArgs e)
        {
            AceptarSoloNumeros(e);
        }

        private void BtnGuardar_Click(object sender, EventArgs e)
        {
            if(ValidarDatos())
            {
                VehiculoBE vehiculo;
                if (lstResultadoBusqueda.SelectedItems.Count > 0 && lstResultadoBusqueda.SelectedItems[0] != null)
                {
                    vehiculo = lstResultadoBusqueda.SelectedItems[0].Tag as VehiculoBE;
                }
                else
                {
                    vehiculo = new VehiculoBE();
                }

                vehiculo.AnioFabricacion = int.Parse(txtAnioFabricacion.Text);
                vehiculo.Capacidad = int.Parse(txtCapacidad.Text);
                vehiculo.EnCirculacion = chkEnCirculacionDetalles.Checked;
                vehiculo.FechaAdquisicion = dtpFechaDeAdquisicion.Value;
                vehiculo.NumeroInterno = int.Parse(txtNumeroDeInternoDetalles.Text);
                vehiculo.Marca = txtMarca.Text.Trim();
                vehiculo.Modelo = txtModelo.Text.Trim();
                vehiculo.Patente = txtPatenteDetalles.Text.Trim().ToUpper();

                Vehiculo.Guardar(vehiculo);

                MessageBox.Show(ObtenerLeyenda("msgVehiculoGuardado"), string.Empty,
                    MessageBoxButtons.OK, MessageBoxIcon.Information);
                ResetearFormulario();
                btnBuscar.PerformClick();
            }
        }

        private void BtnBuscar_Click(object sender, EventArgs e)
        {
            lstResultadoBusqueda.Items.Clear();

            int numeroInterno = string.IsNullOrWhiteSpace(txtNumeroDeInternoBusqueda.Text) ? 0 : 
                int.Parse(txtNumeroDeInternoBusqueda.Text);
            List<VehiculoBE> vehiculos = Vehiculo.Buscar(txtPatenteBusqueda.Text.Trim(), numeroInterno, 
                chkEnCirculacionBusqueda.Checked);

            ListViewItem[] items = vehiculos.Select(v => new ListViewItem
            {
                Text = string.Format("{0} - {1} {2}. Interno {3}", v.Patente, v.Marca, v.Modelo, v.NumeroInterno),
                Tag = v
            }).ToArray();

            lstResultadoBusqueda.Items.AddRange(items);
        }

        private void LstResultadoBusqueda_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(lstResultadoBusqueda.SelectedItems.Count > 0 && lstResultadoBusqueda.SelectedItems[0] != null)
            {
                btnEditar.Enabled = true;
                btnEliminar.Enabled = true;
            }
            else
            {
                btnEditar.Enabled = false;
                btnEliminar.Enabled = false;
                BorrarSeccionDetalles();
                grpDetalles.Enabled = false;
            }
        }

        private void BtnEditar_Click(object sender, EventArgs e)
        {
            if (lstResultadoBusqueda.SelectedItems.Count > 0 && lstResultadoBusqueda.SelectedItems[0] != null)
            {
                grpDetalles.Enabled = true;

                VehiculoBE vehiculo = lstResultadoBusqueda.SelectedItems[0].Tag as VehiculoBE;

                txtPatenteDetalles.Text = vehiculo.Patente;
                txtMarca.Text = vehiculo.Marca;
                txtModelo.Text = vehiculo.Modelo;
                txtCapacidad.Text = vehiculo.Capacidad.ToString();
                dtpFechaDeAdquisicion.Value = vehiculo.FechaAdquisicion;
                txtAnioFabricacion.Text = vehiculo.AnioFabricacion.ToString();
                txtNumeroDeInternoDetalles.Text = vehiculo.NumeroInterno.ToString();
                chkEnCirculacionDetalles.Checked = vehiculo.EnCirculacion;
            }
        }

        private void BtnEliminar_Click(object sender, EventArgs e)
        {
            if (lstResultadoBusqueda.SelectedItems.Count > 0 && lstResultadoBusqueda.SelectedItems[0] != null)
            {
                VehiculoBE vehiculo = lstResultadoBusqueda.SelectedItems[0].Tag as VehiculoBE;
                Vehiculo.Borrar(vehiculo);

                MessageBox.Show(ObtenerLeyenda("msgVehiculoBorrado"), string.Empty,
                    MessageBoxButtons.OK, MessageBoxIcon.Information);
                ResetearFormulario();
                btnBuscar.PerformClick();
            }
        }

        private void BtnDescartar_Click(object sender, EventArgs e)
        {
            lstResultadoBusqueda.SelectedIndices.Clear();
            grpDetalles.Enabled = false;
            BorrarSeccionDetalles();
        }

        public override void ProcesarControlesConPermisos()
        {
            btnNuevo.Visible = TienePermiso(Permisos.VEHICULOS_ALTA);
            btnEditar.Visible = TienePermiso(Permisos.VEHICULOS_MODIFICAR);
            btnEliminar.Visible = TienePermiso(Permisos.VEHICULOS_BAJA);
        }

        private void ResetearFormulario()
        {
            btnEditar.Enabled = false;
            btnEliminar.Enabled = false;
            grpDetalles.Enabled = false;
            BorrarSeccionDetalles();
        }

        private void BorrarSeccionDetalles()
        {
            txtPatenteDetalles.Text = string.Empty;
            txtMarca.Text = string.Empty;
            txtModelo.Text = string.Empty;
            txtCapacidad.Text = string.Empty;
            dtpFechaDeAdquisicion.Value = DateTime.Today;
            txtAnioFabricacion.Text = string.Empty;
            txtNumeroDeInternoDetalles.Text = string.Empty;
            chkEnCirculacionDetalles.Checked = false;
        }

        private void AceptarSoloNumeros(KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
            }
        }

        private bool ValidarDatos()
        {
            if (txtPatenteDetalles.Text.Trim().Length == 0 ||
                txtMarca.Text.Trim().Length == 0 ||
                txtModelo.Text.Trim().Length == 0 ||
                txtCapacidad.Text.Trim().Length == 0 ||
                txtAnioFabricacion.Text.Trim().Length == 0 ||
                txtNumeroDeInternoDetalles.Text.Trim().Length == 0)
            {
                MessageBox.Show(ObtenerLeyenda("msgCompletarCampos"), ObtenerLeyenda("msgCompletarCamposTitulo"), 
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }

            return true;
        }
    }
}
