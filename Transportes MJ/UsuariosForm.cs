﻿using BL;
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

        private void lstUsuariosActuales_SelectedIndexChanged(object sender, EventArgs e)
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
                _editando = true;
                foreach (TreeNode nodo in trvPermisos.Nodes)
                {
                    if (!nodo.Checked)
                    {
                        Permiso permiso = (Permiso)nodo.Tag;
                        if (usuario.Perfil.Contains(permiso, new Permiso.Comparador()))
                        {
                            nodo.Checked = true;
                        }
                    }
                }
                _editando = false;

                // El usuario administrador (id 1) no puede editarse ni eliminarse
                btnEditar.Enabled = usuario.Id > 1;
                btnEliminar.Enabled = usuario.Id > 1;
            }
            _ultimoUsuarioSeleccionado = lstUsuariosActuales.SelectedIndex;
        }

        private void trvPermisos_AfterCheck(object sender, TreeViewEventArgs e)
        {
            foreach(TreeNode nodoHijo in e.Node.Nodes)
            {
                nodoHijo.Checked = e.Node.Checked;
            }
        }

        private void trvPermisos_BeforeCheck(object sender, TreeViewCancelEventArgs e)
        {
            if(!_editando)
            {
                e.Cancel = true;
            }
        }

        private void btnCrearNuevo_Click(object sender, EventArgs e)
        {
            if (_editando && !PreguntarPorLosCambios())
            {
                return;
            }

            lstUsuariosActuales.SelectedItem = null;
            ResetearDetalles(true);
        }

        private void btnDescartar_Click(object sender, EventArgs e)
        {
            if(PreguntarPorLosCambios())
            {
                ResetearDetalles(false);
                lstUsuariosActuales.SelectedItem = null;
            }
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            // Chequeo que la info esté bien
            if(string.IsNullOrWhiteSpace(txtNombre.Text) || string.IsNullOrWhiteSpace(txtNombreUsuario.Text))
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
                if(lstUsuariosActuales.SelectedItem == null)
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
                // TODO: Hacer que guarde!!
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
            return permisos;
        }
        #endregion
    }
}
