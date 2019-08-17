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
                Vehiculo vehiculo = new Vehiculo
                {
                    AnioFabricacion = int.Parse(txtAnioFabricacion.Text),
                    Capacidad = int.Parse(txtCapacidad.Text),
                    EnCirculacion = chkEnCirculacionDetalles.Checked,
                    FechaAdquisiquion = dtpFechaDeAdquisicion.Value,
                    NumeroInterno = int.Parse(txtNumeroDeInternoDetalles.Text),
                    Marca = txtMarca.Text.Trim(),
                    Modelo = txtModelo.Text.Trim(),
                    Patente = txtPatenteDetalles.Text.Trim().ToUpper()
                };

                vehiculo.Guardar();

                MessageBox.Show(ObtenerLeyenda("msgVehiculoGuardado"), string.Empty,
                    MessageBoxButtons.OK, MessageBoxIcon.Information);
                ResetearFormulario();
            }
        }

        private void BtnBuscar_Click(object sender, EventArgs e)
        {
            lstResultadoBusqueda.Items.Clear();


            int numeroInterno = string.IsNullOrWhiteSpace(txtNumeroDeInternoBusqueda.Text) ? 0 : 
                int.Parse(txtNumeroDeInternoBusqueda.Text);
            List<Vehiculo> vehiculos = Vehiculo.Buscar(txtPatenteBusqueda.Text.Trim(), numeroInterno, 
                chkEnCirculacionBusqueda.Checked);

            ListViewItem[] items = vehiculos.Select(v => new ListViewItem
            {
                Text = string.Format("{0} - {1} {2}. Interno {3}", v.Patente, v.Marca, v.Modelo, v.NumeroInterno),
                Tag = v
            }).ToArray();

            lstResultadoBusqueda.Items.AddRange(items);
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
