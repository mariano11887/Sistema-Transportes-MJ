﻿using BE;
using BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Windows.Forms;

namespace UI
{
    public partial class ChoferesForm : FormGeneral
    {
        private string deLicenciaSi;
        private string deLicenciaNo;

        public ChoferesForm()
        {
            InitializeComponent();
        }

        private void ChoferesForm_Load(object sender, EventArgs e)
        {
            Abrir();

            dtpFechaFinLicencia.MinDate = DateTime.Today;
            btnEditar.Enabled = false;
            btnCargarLicencia.Enabled = false;
            btnEliminar.Enabled = false;
            grpDetalles.Enabled = false;
            grpLicencias.Enabled = false;

            deLicenciaSi = ObtenerLeyenda("optSi");
            deLicenciaNo = ObtenerLeyenda("optNo");

            cmbDeLicencia.Items.Add("");
            cmbDeLicencia.Items.Add(deLicenciaSi);
            cmbDeLicencia.Items.Add(deLicenciaNo);

            try
            {
                List<VehiculoBE> vehiculos = Vehiculo.ListarTodos();
                cmbCochePreferidoBusqueda.Items.AddRange(vehiculos.Select(v => v.Patente).ToArray());
                cmbCochePreferidoDetalle.Items.AddRange(vehiculos.ToArray());
            }
            catch
            {
                MostrarError();
            }
        }

        private void TxtDniBusqueda_KeyPress(object sender, KeyPressEventArgs e)
        {
            AceptarSoloNumeros(e);
        }

        private void TxtDniDetalle_KeyPress(object sender, KeyPressEventArgs e)
        {
            AceptarSoloNumeros(e);
        }

        private void BtnNuevo_Click(object sender, EventArgs e)
        {
            lstResultadoBusqueda.Items.Clear();
            btnEditar.Enabled = false;
            btnCargarLicencia.Enabled = false;
            btnEliminar.Enabled = false;

            grpDetalles.Enabled = true;
            LimpiarDetalles();
            grpLicencias.Enabled = false;
        }

        private void BtnBuscar_Click(object sender, EventArgs e)
        {
            lstResultadoBusqueda.Items.Clear();
            LimpiarDetalles();
            btnEditar.Enabled = false;
            btnCargarLicencia.Enabled = false;
            btnEliminar.Enabled = false;
            grpDetalles.Enabled = false;
            grpLicencias.Enabled = false;

            string nombre = txtNombreBusqueda.Text;
            int.TryParse(txtDniBusqueda.Text, out int dni);
            string enCirculacionSelected = cmbDeLicencia.SelectedItem?.ToString();

            bool? enCirculacion = null;
            if (enCirculacionSelected == deLicenciaSi)
            {
                enCirculacion = true;
            }
            else if(enCirculacionSelected == deLicenciaNo)
            {
                enCirculacion = false;
            }

            string patente = cmbCochePreferidoBusqueda.Text;

            try
            {
                List<ChoferBE> choferes = Chofer.Buscar(nombre, dni, enCirculacion, patente);
                ListViewItem[] items = choferes.Select(c => new ListViewItem
                {
                    Text = c.Nombre,
                    Tag = c
                }).ToArray();

                lstResultadoBusqueda.Items.AddRange(items);
            }
            catch
            {
                MostrarError();
            }
        }

        private void BtnDescartar_Click(object sender, EventArgs e)
        {
            LimpiarDetalles();
            grpDetalles.Enabled = false;
            btnEditar.Enabled = false;
            btnCargarLicencia.Enabled = false;
            btnEliminar.Enabled = false;
        }

        private void BtnGuardarChofer_Click(object sender, EventArgs e)
        {
            if(ValidarDatos())
            {
                ChoferBE chofer;
                if (lstResultadoBusqueda.SelectedItems.Count > 0 && lstResultadoBusqueda.SelectedItems[0] != null)
                {
                    chofer = lstResultadoBusqueda.SelectedItems[0].Tag as ChoferBE;
                }
                else
                {
                    chofer = new ChoferBE();
                }

                int selectedIndex = cmbCochePreferidoDetalle.FindStringExact(cmbCochePreferidoDetalle.Text);
                if(selectedIndex > 0)
                {
                    chofer.CochePreferido = cmbCochePreferidoDetalle.Items[selectedIndex] as VehiculoBE;
                }
                chofer.Dni = int.Parse(txtDniDetalle.Text);
                chofer.Nombre = txtNombreDetalle.Text;

                try
                {
                    Chofer.Guardar(chofer);
                    MessageBox.Show(ObtenerLeyenda("msgChoferGuardado"));

                    LimpiarDetalles();
                    grpDetalles.Enabled = false;
                    grpLicencias.Enabled = false;
                    btnEditar.Enabled = false;
                    btnCargarLicencia.Enabled = false;
                    btnEliminar.Enabled = false;
                    lstResultadoBusqueda.Items.Clear();
                }
                catch
                {
                    MostrarError();
                }
            }
        }

        private void LstResultadoBusqueda_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(lstResultadoBusqueda.SelectedItems.Count > 0 && lstResultadoBusqueda.SelectedItems[0] != null)
            {
                btnEditar.Enabled = true;
                btnCargarLicencia.Enabled = true;
                btnEliminar.Enabled = true;

                ChoferBE chofer = lstResultadoBusqueda.SelectedItems[0].Tag as ChoferBE;
                txtNombreDetalle.Text = chofer.Nombre;
                txtDniDetalle.Text = chofer.Dni.ToString();
                cmbCochePreferidoDetalle.Text = chofer.CochePreferido?.Patente ?? "";
                if(chofer.FechaFinLicencia >= DateTime.Today)
                {
                    dtpFechaFinLicencia.Format = DateTimePickerFormat.Long;
                    dtpFechaFinLicencia.Value = chofer.FechaFinLicencia;
                }
                else
                {
                    dtpFechaFinLicencia.Format = DateTimePickerFormat.Custom;
                }
            }
            else
            {
                btnEditar.Enabled = false;
                btnCargarLicencia.Enabled = false;
                btnEliminar.Enabled = false;

                LimpiarDetalles();
            }

            grpDetalles.Enabled = false;
            grpLicencias.Enabled = false;
        }

        private void BtnEditar_Click(object sender, EventArgs e)
        {
            grpDetalles.Enabled = true;
        }

        private void BtnCargarLicencia_Click(object sender, EventArgs e)
        {
            grpLicencias.Enabled = true;
            if(dtpFechaFinLicencia.Format == DateTimePickerFormat.Custom)
            {
                dtpFechaFinLicencia.Format = DateTimePickerFormat.Long;
                dtpFechaFinLicencia.Value = DateTime.Today;
            }
        }

        private void BtnGuardarLicencia_Click(object sender, EventArgs e)
        {
            if (lstResultadoBusqueda.SelectedItems.Count > 0 && lstResultadoBusqueda.SelectedItems[0] != null)
            {
                ChoferBE chofer = lstResultadoBusqueda.SelectedItems[0].Tag as ChoferBE;
                chofer.FechaFinLicencia = dtpFechaFinLicencia.Value;
                try
                {
                    Chofer.Guardar(chofer);

                    MessageBox.Show(ObtenerLeyenda("msgLicenciaGuardada"));

                    LimpiarDetalles();
                    grpDetalles.Enabled = false;
                    grpLicencias.Enabled = false;
                    btnEditar.Enabled = false;
                    btnCargarLicencia.Enabled = false;
                    btnEliminar.Enabled = false;
                    lstResultadoBusqueda.Items.Clear();
                }
                catch
                {
                    MostrarError();
                }
            }
        }

        private void BtnEliminar_Click(object sender, EventArgs e)
        {
            if (lstResultadoBusqueda.SelectedItems.Count > 0 && lstResultadoBusqueda.SelectedItems[0] != null)
            {
                try
                {
                    ChoferBE chofer = lstResultadoBusqueda.SelectedItems[0].Tag as ChoferBE;
                    Chofer.Borrar(chofer);

                    MessageBox.Show(ObtenerLeyenda("msgChoferBorrado"), string.Empty,
                        MessageBoxButtons.OK, MessageBoxIcon.Information);

                    LimpiarDetalles();
                    grpDetalles.Enabled = false;
                    grpLicencias.Enabled = false;
                    btnEditar.Enabled = false;
                    btnCargarLicencia.Enabled = false;
                    btnEliminar.Enabled = false;
                    lstResultadoBusqueda.Items.Clear();
                }
                catch
                {
                    MostrarError();
                }
            }
        }

        public override void ProcesarControlesConPermisos()
        {
            btnNuevo.Visible = TienePermiso(Permisos.CHOFERES_ALTA);
            btnEditar.Visible = TienePermiso(Permisos.CHOFERES_MODIFICAR);
            btnEliminar.Visible = TienePermiso(Permisos.CHOFERES_BAJA);
        }

        private void AceptarSoloNumeros(KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
            }
        }

        private void LimpiarDetalles()
        {
            txtNombreDetalle.Text = "";
            txtDniDetalle.Text = "";
            cmbCochePreferidoDetalle.Text = "";
            dtpFechaFinLicencia.Format = DateTimePickerFormat.Custom;
        }

        private bool ValidarDatos()
        {
            if(string.IsNullOrWhiteSpace(txtNombreDetalle.Text))
            {
                MessageBox.Show(ObtenerLeyenda("msgNombreVacio"), "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }

            if(string.IsNullOrWhiteSpace(txtDniDetalle.Text))
            {
                MessageBox.Show(ObtenerLeyenda("msgDniVacio"), "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }

            if(!int.TryParse(txtDniDetalle.Text, out int dni))
            {
                MessageBox.Show(ObtenerLeyenda("msgDniInvalido"), "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }

            return true;
        }
    }
}
