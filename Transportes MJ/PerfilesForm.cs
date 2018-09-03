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
            procesarPermiso(permisoRaiz);
            // Agrego los perfiles al listado principal
            lstPerfilesActuales.Items.AddRange(_perfiles.ToArray());
        }

        private void procesarPermiso(Permiso permiso)
        {
            List<Permiso> permisosHijos = permiso.ObtenerPermisosHijos();
            foreach (Permiso p in permisosHijos)
            {
                if (p.ObtenerPermisosHijos().Count > 0)
                {
                    _perfiles.Add(p);
                    procesarPermiso(p);
                }
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

    }
}
