﻿using BE;
using BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Windows.Forms;

namespace UI
{
    public partial class PerfilesForm : FormGeneral
    {
        private List<PermisoBE> todosLosPerfiles = new List<PermisoBE>();
        private PermisoBE permisoActual;

        public PerfilesForm()
        {
            InitializeComponent();
        }

        #region Eventos
        private void PerfilesForm_Load(object sender, EventArgs e)
        {
            Abrir();

            try
            {
                ActualizarPerfiles();
                cmbPermisos.DataSource = Permiso.ObtenerPermisosSimples();
                ResetearFormulario();
            }
            catch
            {
                MostrarError();
            }
        }

        private void LstPerfilesActuales_SelectedIndexChanged(object sender, EventArgs e)
        {
            ResetearFormulario();
            cmbFamilias.DataSource = todosLosPerfiles.ToList();

            if (lstPerfilesActuales.SelectedItem != null)
            {
                permisoActual = (PermisoBE)lstPerfilesActuales.SelectedItem;
                btnEditar.Enabled = true;
                btnEliminar.Enabled = true;
                txtNombre.Text = permisoActual.Nombre;
                txtDescripcion.Text = permisoActual.Descripcion;
                cmbFamilias.DataSource = todosLosPerfiles.Where(p => p.Id != permisoActual.Id).ToList();

                RefrescarArbol();
            }
        }

        private void BtnCrearNuevo_Click(object sender, EventArgs e)
        {
            lstPerfilesActuales.SelectedItem = null;
            txtNombre.Enabled = true;
            txtDescripcion.Enabled = true;
            grpFamiliasPermisos.Enabled = true;
            btnGuardar.Enabled = true;

            permisoActual = Permiso.NuevoPerfil();
        }

        private void BtnAgregarFamilia_Click(object sender, EventArgs e)
        {
            PermisoBE familiaSeleccionada = (PermisoBE)cmbFamilias.SelectedItem;
            permisoActual.AgregarPermisoHijo(familiaSeleccionada);

            RefrescarArbol();
        }

        private void BtnAgregarPermiso_Click(object sender, EventArgs e)
        {
            PermisoBE permisoSeleccionado = (PermisoBE)cmbPermisos.SelectedItem;
            permisoActual.AgregarPermisoHijo(permisoSeleccionado);

            RefrescarArbol();
        }

        private void TrvPermisosAsignados_AfterSelect(object sender, TreeViewEventArgs e)
        {
            btnQuitar.Enabled = txtNombre.Enabled && 
                trvPermisosAsignados.SelectedNode != null && 
                trvPermisosAsignados.SelectedNode.Parent == null;
        }

        private void BtnQuitar_Click(object sender, EventArgs e)
        {
            PermisoBE permisoSeleccionado = (PermisoBE)trvPermisosAsignados.SelectedNode.Tag;
            permisoActual.QuitarPermisoHijo(permisoSeleccionado);

            RefrescarArbol();
        }

        private void BtnGuardar_Click(object sender, EventArgs e)
        {
            if(ValidarDatos())
            {
                try
                {
                    permisoActual.Descripcion = txtDescripcion.Text;
                    permisoActual.Nombre = txtNombre.Text;
                    Permiso.Guardar(permisoActual);

                    MessageBox.Show(ObtenerLeyenda("msgGuardado"), ObtenerLeyenda("msgGuardadoTitulo"),
                        MessageBoxButtons.OK, MessageBoxIcon.Information);

                    ActualizarPerfiles();
                    ResetearFormulario();
                }
                catch
                {
                    MostrarError();
                }
            }
        }

        private void BtnEditar_Click(object sender, EventArgs e)
        {
            txtNombre.Enabled = true;
            txtDescripcion.Enabled = true;
            grpFamiliasPermisos.Enabled = true;
            btnGuardar.Enabled = true;
            trvPermisosAsignados.SelectedNode = null;
        }

        private void BtnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                DialogResult result = MessageBox.Show(ObtenerLeyenda("msgEliminar"), ObtenerLeyenda("msgEliminarTitulo"),
                    MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation);
                if (result == DialogResult.Yes)
                {
                    PermisoBE permiso = (PermisoBE)lstPerfilesActuales.SelectedItem;
                    Permiso.Borrar(permiso);
                    ActualizarPerfiles();
                    ResetearFormulario();
                }
            }
            catch
            {
                MostrarError();
            }
        }
        #endregion

        #region Métodos
        private void AgregarAlArbol(PermisoBE permiso, TreeNode nodoPadre, int nivel)
        {
            TreeNode nodo = new TreeNode(permiso.ToString())
            {
                Tag = permiso
            };
            List<PermisoBE> permisosHijos = permiso.DevolverPerfil();
            foreach (PermisoBE p in permisosHijos)
            {
                // Pongo este nivel como método de seguridad contra los permisos anidados de manera cíclica
                if (nivel < 10)
                {
                    AgregarAlArbol(p, nodo, nivel + 1);
                }
            }

            if (nodoPadre == null)
            {
                trvPermisosAsignados.Nodes.Add(nodo);
            }
            else
            {
                nodoPadre.Nodes.Add(nodo);
            }
        }

        private void ResetearFormulario()
        {
            txtNombre.Text = "";
            txtDescripcion.Text = "";
            txtNombre.Enabled = false;
            txtDescripcion.Enabled = false;
            grpFamiliasPermisos.Enabled = false;
            btnGuardar.Enabled = false;
            btnQuitar.Enabled = false;
            trvPermisosAsignados.Nodes.Clear();
            permisoActual = null;
        }

        private bool ValidarDatos()
        {
            if(string.IsNullOrWhiteSpace(txtNombre.Text) || 
                string.IsNullOrWhiteSpace(txtDescripcion.Text) ||
                permisoActual.DevolverPerfil().Count == 0)
            {
                MessageBox.Show(ObtenerLeyenda("msgDatosIncompletos"), ObtenerLeyenda("msgDatosIncompletosTitulo"),
                    MessageBoxButtons.OK, MessageBoxIcon.Hand);
                return false;
            }
            return true;
        }

        private void ActualizarPerfiles()
        {
            lstPerfilesActuales.DataSource = null;
            cmbFamilias.DataSource = null;

            todosLosPerfiles = Permiso.ObtenerPerfiles();
            lstPerfilesActuales.DataSource = todosLosPerfiles;
            lstPerfilesActuales.SelectedItem = null;

            btnEditar.Enabled = false;
            btnEliminar.Enabled = false;
        }

        public override void ProcesarControlesConPermisos()
        {
            btnCrearNuevo.Visible = TienePermiso(Permisos.PERFILES_ALTA);
            btnEditar.Visible = TienePermiso(Permisos.PERFILES_MODIFICAR);
            btnEliminar.Visible = TienePermiso(Permisos.PERFILES_BAJA);
        }

        private void RefrescarArbol()
        {
            trvPermisosAsignados.Nodes.Clear();
            if (permisoActual != null)
            {
                foreach (PermisoBE permiso in permisoActual.DevolverPerfil())
                {
                    AgregarAlArbol(permiso, null, 1);
                }
            }

            btnQuitar.Enabled = false;
        }

        #endregion
    }
}
