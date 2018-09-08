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
        private List<Permiso> _perfiles;

        public PerfilesForm()
        {
            InitializeComponent();
            _perfiles = new List<Permiso>();
        }

        #region Eventos
        private void PerfilesForm_Load(object sender, EventArgs e)
        {
            Abrir();
        }
        #endregion

        #region Métodos
        private new void Abrir()
        {
            base.Abrir();
            Permiso permisoRaiz = Permiso.ObtenerPermisoRaiz();
            // Completo el listado de permisos compuestos (perfiles)
            procesarPermiso(permisoRaiz, null);
            // Agrego los perfiles al listado principal
            lstPerfilesActuales.Items.AddRange(_perfiles.ToArray());
        }

        private void procesarPermiso(Permiso permiso, TreeNode nodoPadre)
        {
            TreeNode nodo = new TreeNode(permiso.ToString());
            List<Permiso> permisosHijos = permiso.ObtenerPermisosHijos();
            foreach (Permiso p in permisosHijos)
            {
                if (p.ObtenerPermisosHijos().Count > 0)
                {
                    _perfiles.Add(p);
                }
                procesarPermiso(p, nodo);
            }

            if (nodoPadre == null)
            {
                trvPermisosInteriores.Nodes.Add(nodo);
            }
            else
            {
                nodoPadre.Nodes.Add(nodo);
            }
        }

        private void MostrarDetalles()
        {

        }

        private void CrearNuevo()
        {

        }

        private void DescartarCambios()
        {

        }

        private void Guardar()
        {

        }

        private void Editar()
        {

        }

        private void CerrarAdvertenciaEliminar()
        {

        }

        private void Eliminar()
        {

        }

        private void MostrarAdvertenciaEliminar()
        {

        }
        #endregion

        #region Eventos
        private void lstPerfilesActuales_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (lstPerfilesActuales.SelectedItem == null)
            {
                // Ningún ítem seleccionado, deshabilito todo
                btnEditar.Enabled = false;
                btnEliminar.Enabled = false;
                grpDetalles.Enabled = false;
                txtNombre.Text = "";
                txtDescripcion.Text = "";
            }
            else
            {
                Permiso permisoSeleccionado = (Permiso)lstPerfilesActuales.SelectedItem;
                if (permisoSeleccionado.Editable)
                {
                    btnEditar.Enabled = true;
                    btnEliminar.Enabled = true;
                    txtNombre.Text = permisoSeleccionado.Nombre;
                    txtDescripcion.Text = permisoSeleccionado.Descripcion;
                }
            }
        }
        #endregion

    }
}
