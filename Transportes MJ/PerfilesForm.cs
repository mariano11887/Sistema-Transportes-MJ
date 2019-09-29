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
    public partial class PerfilesForm : FormGeneral
    {
        private bool _edicionHabilitada = false;
        private bool _cambiosRealizados = false;

        public PerfilesForm()
        {
            InitializeComponent();
        }

        #region Eventos
        private void PerfilesForm_Load(object sender, EventArgs e)
        {
            Abrir();

            // Armo el árbol de permisos
            Permiso permisoRaiz = Permiso.ObtenerPermisoRaiz();
            foreach (Permiso perfil in permisoRaiz.ObtenerPermisosHijos())
            {
                AgregarAlArbol(perfil, null);
            }
            trvPermisosInteriores.ExpandAll();

            CompletarListadoPerfiles();
        }

        private void lstPerfilesActuales_SelectedIndexChanged(object sender, EventArgs e)
        {
            bool estadoEdicion = _edicionHabilitada;
            _edicionHabilitada = true;
            DestildarNodos(trvPermisosInteriores.Nodes);
            if (lstPerfilesActuales.SelectedItem == null)
            {
                // Ningún ítem seleccionado, deshabilito todo
                btnEditar.Enabled = false;
                btnEliminar.Enabled = false;
                txtNombre.Text = "";
                txtDescripcion.Text = "";
                DestildarNodos(trvPermisosInteriores.Nodes);
            }
            else
            {
                Permiso permisoSeleccionado = (Permiso)lstPerfilesActuales.SelectedItem;
                btnEditar.Enabled = permisoSeleccionado.Editable;
                btnEliminar.Enabled = permisoSeleccionado.Editable;
                txtNombre.Text = permisoSeleccionado.Nombre;
                txtDescripcion.Text = permisoSeleccionado.Descripcion;
                // Tildo los nodos que corresponden
                List<Permiso> permisosHijos = permisoSeleccionado.ObtenerPermisosHijos();
                foreach (Permiso hijo in permisosHijos)
                {
                    TildarNodo(hijo.ToString(), trvPermisosInteriores.Nodes);
                }
            }
            _edicionHabilitada = estadoEdicion;
            _cambiosRealizados = true;
        }

        private void trvPermisosInteriores_BeforeCheck(object sender, TreeViewCancelEventArgs e)
        {
            if (!_edicionHabilitada || e.Node.Text == "Raíz")
            {
                e.Cancel = true;
            }
        }

        private void trvPermisosInteriores_AfterCheck(object sender, TreeViewEventArgs e)
        {
            foreach(TreeNode nodoHijo in e.Node.Nodes)
            {
                nodoHijo.Checked = e.Node.Checked;
            }
            _cambiosRealizados = true;
        }

        private void btnCrearNuevo_Click(object sender, EventArgs e)
        {
            lstPerfilesActuales.ClearSelected();
            _edicionHabilitada = true;
            _cambiosRealizados = false;
            RefrescarControlesDetalles();
            txtNombre.Text = "";
            txtDescripcion.Text = "";
            DestildarNodos(trvPermisosInteriores.Nodes);
        }

        private void btnDescartar_Click(object sender, EventArgs e)
        {
            if(_cambiosRealizados)
            {
                DialogResult result = MessageBox.Show(ObtenerLeyenda("msgDescartar"), ObtenerLeyenda("msgDescartarTitulo"), 
                    MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation);
                if(result == DialogResult.Yes)
                {
                    ResetearFormulario();
                }
            }
            else
            {
                ResetearFormulario();
            }
        }

        private void txtNombre_KeyPress(object sender, KeyPressEventArgs e)
        {
            _cambiosRealizados = true;
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            if(ValidarDatos())
            {
                Permiso perfil;
                if (lstPerfilesActuales.SelectedItem == null)
                {
                    perfil = Permiso.NuevoPerfil();
                }
                else
                {
                    perfil = (Permiso)lstPerfilesActuales.SelectedItem;
                }
                perfil.Descripcion = txtDescripcion.Text;
                perfil.Nombre = txtNombre.Text;
                List<Permiso> permisosTildados = ObtenerPermisosTildados();
                foreach(Permiso permisoTildado in permisosTildados)
                {
                    perfil.AgregarPermisoHijo(permisoTildado);
                }
                perfil.Guardar();
                MessageBox.Show(ObtenerLeyenda("msgGuardado"), ObtenerLeyenda("msgGuardadoTitulo"),
                    MessageBoxButtons.OK, MessageBoxIcon.Information);
                CompletarListadoPerfiles();
                ResetearFormulario();
            }
        }

        private void btnEditar_Click(object sender, EventArgs e)
        {
            _edicionHabilitada = true;
            RefrescarControlesDetalles();
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show(ObtenerLeyenda("msgEliminar"), ObtenerLeyenda("msgEliminarTitulo"),
                MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation);
            if(result == DialogResult.Yes)
            {
                Permiso permiso = (Permiso)lstPerfilesActuales.SelectedItem;
                permiso.Borrar();
                _edicionHabilitada = true;
                CompletarListadoPerfiles();
                ResetearFormulario();
            }
        }
        #endregion

        #region Métodos
        private void AgregarAlArbol(Permiso permiso, TreeNode nodoPadre)
        {
            TreeNode nodo = new TreeNode(permiso.ToString())
            {
                Tag = permiso
            };
            List<Permiso> permisosHijos = permiso.ObtenerPermisosHijos();
            foreach (Permiso p in permisosHijos)
            {
                AgregarAlArbol(p, nodo);
            }

            if (nodoPadre == null)
            {
                trvPermisosInteriores.Nodes.Add(nodo);
            }
            else if(!permiso.Editable)
                // Solamente agrego los que no son editables para que no aparezcan los perfiles creados
            {
                nodoPadre.Nodes.Add(nodo);
            }
        }

        private void DestildarNodos(TreeNodeCollection nodos)
        {
            foreach(TreeNode nodo in nodos)
            {
                nodo.Checked = false;
                DestildarNodos(nodo.Nodes);
            }
        }

        private void TildarNodo(string Texto, TreeNodeCollection NodosDondeBuscar)
        {
            foreach(TreeNode nodo in NodosDondeBuscar)
            {
                if(nodo.Text == Texto)
                {
                    nodo.Checked = true;
                }
                TildarNodo(Texto, nodo.Nodes);
            }
        }

        private void RefrescarControlesDetalles()
        {
            txtNombre.Enabled = _edicionHabilitada;
            txtDescripcion.Enabled = _edicionHabilitada;
            btnGuardar.Enabled = _edicionHabilitada;
            btnDescartar.Enabled = _edicionHabilitada;
        }

        private void ResetearFormulario()
        {
            lstPerfilesActuales.ClearSelected();
            txtNombre.Text = "";
            txtDescripcion.Text = "";
            DestildarNodos(trvPermisosInteriores.Nodes);
            _edicionHabilitada = false;
            _cambiosRealizados = false;
            RefrescarControlesDetalles();
        }

        private bool ValidarDatos()
        {
            if(string.IsNullOrWhiteSpace(txtNombre.Text) || 
                string.IsNullOrWhiteSpace(txtDescripcion.Text) ||
                ObtenerPermisosTildados().Count == 0)
            {
                MessageBox.Show(ObtenerLeyenda("msgDatosIncompletos"), ObtenerLeyenda("msgDatosIncompletosTitulo"),
                    MessageBoxButtons.OK, MessageBoxIcon.Hand);
                return false;
            }
            return true;
        }

        private List<Permiso> ObtenerPermisosTildados()
        {
            List<Permiso> permisos = ObtenerPermisosTildados(trvPermisosInteriores.Nodes);
            return permisos;
        }

        private List<Permiso> ObtenerPermisosTildados(TreeNodeCollection NodosDondeBuscar)
        {
            List<Permiso> permisos = new List<Permiso>();
            foreach(TreeNode nodo in NodosDondeBuscar)
            {
                if(nodo.Checked)
                {
                    permisos.Add((Permiso)nodo.Tag);
                }
                else if(nodo.Nodes.Count > 0)
                {
                    permisos.AddRange(ObtenerPermisosTildados(nodo.Nodes));
                }
            }
            return permisos;
        }

        private void CompletarListadoPerfiles()
        {
            lstPerfilesActuales.Items.Clear();
            List<Permiso> perfiles = Permiso.ObtenerPerfiles();
            lstPerfilesActuales.Items.AddRange(perfiles.ToArray());
        }

        public override void ProcesarControlesConPermisos()
        {
            btnCrearNuevo.Visible = TienePermiso(Permisos.PERFILES_ALTA);
            btnEditar.Visible = TienePermiso(Permisos.PERFILES_MODIFICAR);
            btnEliminar.Visible = TienePermiso(Permisos.PERFILES_BAJA);
        }

        #endregion
    }
}
