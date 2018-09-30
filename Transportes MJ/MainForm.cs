using BL;
using Logger;
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
    public partial class MainForm : FormGeneral
    {
        public MainForm()
        {
            InitializeComponent();
        }

        #region Eventos
        private void MainForm_Load(object sender, EventArgs e)
        {
            try
            {
                Hide();
                LoginForm frmLogin = new LoginForm();
                frmLogin.ShowDialog();
                if (Sesion.Instancia().UsuarioLogueado != null)
                {
                    ControlarMenusConPermisos();
                    Show();
                    Abrir();
                }
                else
                {
                    Application.Exit();
                }
            }
            catch(Exception ex)
            {
                Log.Grabar(ex);
            }
        }

        private void mniLogout_Click(object sender, EventArgs e)
        {
            try
            {
                Sesion.Instancia().CerrarSesion();
                Application.Restart();
            }
            catch(Exception ex)
            {
                Log.Grabar(ex);
            }
        }

        private void mniPerfilesDeUsuario_Click(object sender, EventArgs e)
        {
            PerfilesForm perfilesForm = new PerfilesForm();
            perfilesForm.MdiParent = this;
            perfilesForm.Show();
        }

        private void MainForm_FormClosed(object sender, FormClosedEventArgs e)
        {
            Sesion.Instancia().CerrarSesion();
        }
        #endregion

        public List<FormGeneral> ObtenerFormulariosAbiertos()
        {
            return new List<FormGeneral>();
        }

        public void MostrarMensaje(string mensaje)
        {

        }

        private void ControlarMenusConPermisos()
        {
            bool puedeVerPerfiles = Sesion.Instancia().TienePermiso(Permisos.VER_PERFILES);
            mniPerfilesDeUsuario.Visible = puedeVerPerfiles;
            mniAdministrar.Visible = puedeVerPerfiles;
        }
    }
}
