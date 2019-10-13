using BL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace UI
{
    public partial class UsuariosForm : FormGeneral
    {
        private bool _editando;
        private int _ultimoUsuarioSeleccionado = -1;

        public UsuariosForm()
        {
            InitializeComponent();
        }

        #region Eventos
        private void UsuariosForm_Load(object sender, EventArgs e)
        {
            Abrir();
            RefrescarListaUsuarios();

            // Completo el árbol de permisos
            List<Permiso> permisos = Permiso.ObtenerPerfiles();
            foreach(Permiso permiso in permisos)
            {
                AgregarAlArbol(permiso, null);
            }

            // Completo el dropdown de idiomas
            List<Idioma> idiomas = Idioma.ListarTodos();
            if(idiomas.Count > 0)
            {
                cmbIdioma.Items.AddRange(idiomas.ToArray());
                cmbIdioma.SelectedIndex = 0;
            }

            ResetearDetalles(false);
            btnEditar.Enabled = false;
            btnEliminar.Enabled = false;
        }

        private void LstUsuariosActuales_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(lstUsuariosActuales.SelectedIndex == _ultimoUsuarioSeleccionado)
            {
                return;
            }

            if (_editando && !PreguntarPorLosCambios())
            {
                lstUsuariosActuales.SelectedIndex = _ultimoUsuarioSeleccionado;
                return;
            }

            ResetearDetalles(false);
            if (lstUsuariosActuales.SelectedItem == null)
            {
                btnEditar.Enabled = false;
                btnEliminar.Enabled = false;
            }
            else
            {
                Usuario usuario = (Usuario)lstUsuariosActuales.SelectedItem;
                txtNombre.Text = usuario.Nombre;
                cmbIdioma.SelectedIndex = cmbIdioma.FindStringExact(usuario.Idioma.ToString());
                txtNombreUsuario.Text = usuario.NombreDeUsuario;
                TildarPermisosUsuario(usuario, trvPermisos.Nodes);

                // El usuario administrador (id 1) no puede editarse ni eliminarse
                // Tampoco puede editarse el usuario actual
                bool puedeEditarse = usuario.Id > 1 && usuario.Id != Sesion.Instancia().UsuarioLogueado.Id;
                btnEditar.Enabled = puedeEditarse;
                btnEliminar.Enabled = puedeEditarse;
            }
            _ultimoUsuarioSeleccionado = lstUsuariosActuales.SelectedIndex;
        }

        private void TrvPermisos_AfterCheck(object sender, TreeViewEventArgs e)
        {
            foreach(TreeNode nodoHijo in e.Node.Nodes)
            {
                nodoHijo.Checked = e.Node.Checked;
            }
        }

        private void TrvPermisos_BeforeCheck(object sender, TreeViewCancelEventArgs e)
        {
            if(!_editando)
            {
                e.Cancel = true;
            }
        }

        private void BtnCrearNuevo_Click(object sender, EventArgs e)
        {
            if (_editando && !PreguntarPorLosCambios())
            {
                return;
            }

            lstUsuariosActuales.SelectedItem = null;
            ResetearDetalles(true);
        }

        private void BtnDescartar_Click(object sender, EventArgs e)
        {
            if(PreguntarPorLosCambios())
            {
                ResetearDetalles(false);
                lstUsuariosActuales.SelectedItem = null;
            }
        }

        private void BtnGuardar_Click(object sender, EventArgs e)
        {
            // Chequeo que la info esté bien
            if (string.IsNullOrWhiteSpace(txtNombre.Text)
                || string.IsNullOrWhiteSpace(txtNombreUsuario.Text)
                || (lstUsuariosActuales.SelectedItem == null && string.IsNullOrWhiteSpace(txtContrasenia.Text)))
            {
                // Faltan datos
                MessageBox.Show(ObtenerLeyenda("msgIncompleto"), ObtenerLeyenda("msgIncompletoTitulo"),
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (txtContrasenia.Text.Trim() != txtRepetirContrasenia.Text.Trim())
            {
                // Las contraseñas no coinciden
                MessageBox.Show(ObtenerLeyenda("msgConfContrasenia"), ObtenerLeyenda("msgConfContraseniaTitulo"),
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                // Todo OK, guardo
                Usuario usuario;
                if (lstUsuariosActuales.SelectedItem == null)
                {
                    usuario = new Usuario();
                }
                else
                {
                    usuario = (Usuario)lstUsuariosActuales.SelectedItem;
                }
                usuario.Nombre = txtNombre.Text;
                usuario.Idioma = (Idioma)cmbIdioma.SelectedItem;
                usuario.NombreDeUsuario = txtNombreUsuario.Text;
                usuario.Contrasenia = txtContrasenia.Text;
                usuario.Perfil = ObtenerPermisosTildados();
                usuario.Guardar();

                MessageBox.Show(ObtenerLeyenda("msgGuardado"), ObtenerLeyenda("msgGuardadoTitulo"),
                    MessageBoxButtons.OK, MessageBoxIcon.Information);

                ResetearDetalles(false);
                RefrescarListaUsuarios();
            }
        }

        private void BtnEditar_Click(object sender, EventArgs e)
        {
            txtNombre.Enabled = true;
            cmbIdioma.Enabled = true;
            txtNombreUsuario.Enabled = true;
            txtContrasenia.Enabled = true;
            txtRepetirContrasenia.Enabled = true;
            _editando = true;
            btnGuardar.Enabled = true;
            btnDescartar.Enabled = true;
        }

        private void BtnEliminar_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show(ObtenerLeyenda("msgConfEliminar"), ObtenerLeyenda("msgConfEliminarTitulo"),
                MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
            if(result == DialogResult.Yes)
            {
                Usuario usuario = (Usuario)lstUsuariosActuales.SelectedItem;
                usuario.Eliminar();

                MessageBox.Show(ObtenerLeyenda("msgEliminado"), ObtenerLeyenda("msgEliminadoTitulo"),
                    MessageBoxButtons.OK, MessageBoxIcon.Information);

                ResetearDetalles(false);
                RefrescarListaUsuarios();
            }
        }
        #endregion

        #region Métodos
        public override void ProcesarControlesConPermisos()
        {
            btnCrearNuevo.Visible = TienePermiso(Permisos.USUARIOS_ALTA);
            btnEditar.Visible = TienePermiso(Permisos.USUARIOS_MODIFICAR);
            btnEliminar.Visible = TienePermiso(Permisos.USUARIOS_BAJA);
        }

        private void RefrescarListaUsuarios()
        {
            lstUsuariosActuales.Items.Clear();
            List<Usuario> usuarios = Usuario.ObtenerTodos();
            foreach (Usuario usuario in usuarios)
            {
                lstUsuariosActuales.Items.Add(usuario);
            }
            _ultimoUsuarioSeleccionado = -1;
        }

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

            if(nodoPadre == null)
            {
                trvPermisos.Nodes.Add(nodo);
            }
            else
            {
                nodoPadre.Nodes.Add(nodo);
            }
        }

        private void ResetearDetalles(bool edicionHabilitada)
        {
            txtNombre.Text = "";
            txtNombre.Enabled = edicionHabilitada;
            cmbIdioma.SelectedIndex = 0;
            cmbIdioma.Enabled = edicionHabilitada;
            txtNombreUsuario.Text = "";
            txtNombreUsuario.Enabled = edicionHabilitada;
            txtContrasenia.Text = "";
            txtContrasenia.Enabled = edicionHabilitada;
            txtRepetirContrasenia.Text = "";
            txtRepetirContrasenia.Enabled = edicionHabilitada;
            _editando = true;
            foreach (TreeNode nodo in trvPermisos.Nodes)
            {
                nodo.Checked = false;
            }
            _editando = edicionHabilitada;
            btnGuardar.Enabled = edicionHabilitada;
            btnDescartar.Enabled = edicionHabilitada;
        }

        private bool PreguntarPorLosCambios()
        {
            DialogResult result = MessageBox.Show(ObtenerLeyenda("msgDescartar"), ObtenerLeyenda("msgDescartarTitulo"),
                    MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation);
            return result == DialogResult.Yes;
        }

        private List<Permiso> ObtenerPermisosTildados()
        {
            return ObtenerPermisosTildados(trvPermisos.Nodes);
        }

        private List<Permiso> ObtenerPermisosTildados(TreeNodeCollection nodosDondeBuscar)
        {
            List<Permiso> permisos = new List<Permiso>();
            foreach(TreeNode nodo in nodosDondeBuscar)
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
            return permisos.GroupBy(p => p.Id).Select(g => g.First()).ToList();
        }

        private void TildarPermisosUsuario(Usuario usuario, TreeNodeCollection nodosABuscar)
        {
            foreach (TreeNode nodo in nodosABuscar)
            {
                if (!nodo.Checked)
                {
                    Permiso permiso = (Permiso)nodo.Tag;
                    if (usuario.Perfil.Contains(permiso, new Permiso.Comparador()))
                    {
                        _editando = true;
                        nodo.Checked = true;
                        _editando = false;
                    }
                    TildarPermisosUsuario(usuario, nodo.Nodes);
                }
            }
        }
        #endregion
    }
}
