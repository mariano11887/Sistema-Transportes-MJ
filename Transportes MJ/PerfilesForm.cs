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
        private List<Permiso> todosLosPerfiles = new List<Permiso>();
        private Permiso permisoActual;

        public PerfilesForm()
        {
            InitializeComponent();
        }

        #region Eventos
        private void PerfilesForm_Load(object sender, EventArgs e)
        {
            Abrir();

            ActualizarPerfiles();
            cmbPermisos.DataSource = Permiso.ObtenerPermisosSimples();
            ResetearFormulario();
        }

        private void LstPerfilesActuales_SelectedIndexChanged(object sender, EventArgs e)
        {
            ResetearFormulario();
            cmbFamilias.DataSource = todosLosPerfiles.ToList();

            if (lstPerfilesActuales.SelectedItem != null)
            {
                permisoActual = (Permiso)lstPerfilesActuales.SelectedItem;
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
            Permiso familiaSeleccionada = (Permiso)cmbFamilias.SelectedItem;
            permisoActual.AgregarPermisoHijo(familiaSeleccionada);

            RefrescarArbol();
        }

        private void BtnAgregarPermiso_Click(object sender, EventArgs e)
        {
            Permiso permisoSeleccionado = (Permiso)cmbPermisos.SelectedItem;
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
            Permiso permisoSeleccionado = (Permiso)trvPermisosAsignados.SelectedNode.Tag;
            permisoActual.QuitarPermisoHijo(permisoSeleccionado);

            RefrescarArbol();
        }

        private void BtnGuardar_Click(object sender, EventArgs e)
        {
            if(ValidarDatos())
            {
                permisoActual.Descripcion = txtDescripcion.Text;
                permisoActual.Nombre = txtNombre.Text;
                permisoActual.Guardar();

                MessageBox.Show(ObtenerLeyenda("msgGuardado"), ObtenerLeyenda("msgGuardadoTitulo"),
                    MessageBoxButtons.OK, MessageBoxIcon.Information);

                ActualizarPerfiles();
                ResetearFormulario();
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
            DialogResult result = MessageBox.Show(ObtenerLeyenda("msgEliminar"), ObtenerLeyenda("msgEliminarTitulo"),
                MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation);
            if(result == DialogResult.Yes)
            {
                Permiso permiso = (Permiso)lstPerfilesActuales.SelectedItem;
                permiso.Borrar();
                ActualizarPerfiles();
                ResetearFormulario();
            }
        }
        #endregion

        #region Métodos
        private void AgregarAlArbol(Permiso permiso, TreeNode nodoPadre, int nivel)
        {
            TreeNode nodo = new TreeNode(permiso.ToString())
            {
                Tag = permiso
            };
            List<Permiso> permisosHijos = permiso.ObtenerPermisosHijos();
            foreach (Permiso p in permisosHijos)
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
                permisoActual.ObtenerPermisosHijos().Count == 0)
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
                foreach (Permiso permiso in permisoActual.ObtenerPermisosHijos())
                {
                    AgregarAlArbol(permiso, null, 1);
                }
            }

            btnQuitar.Enabled = false;
        }

        #endregion
    }
}
