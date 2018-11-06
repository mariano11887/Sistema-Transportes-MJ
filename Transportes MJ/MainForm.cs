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
            CerrarSesion();
        }

        private void mniPerfilesDeUsuario_Click(object sender, EventArgs e)
        {
            PerfilesForm perfilesForm = new PerfilesForm
            {
                MdiParent = this
            };
            perfilesForm.Show();
        }

        private void MainForm_FormClosed(object sender, FormClosedEventArgs e)
        {
            Sesion.Instancia().CerrarSesion();
        }

        private void mniCopiaDeSeguridad_Click(object sender, EventArgs e)
        {
            BackupForm backupForm = new BackupForm
            {
                MdiParent = this
            };
            backupForm.Show();
        }

        private void mniIdiomas_Click(object sender, EventArgs e)
        {
            IdiomasForm idiomasForm = new IdiomasForm
            {
                MdiParent = this
            };
            idiomasForm.Show();
        }

        private void mniUsuarios_Click(object sender, EventArgs e)
        {
            UsuariosForm usuariosForm = new UsuariosForm
            {
                MdiParent = this
            };
            usuariosForm.Show();
        }

        private void mniSalir_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void mniVerBitacora_Click(object sender, EventArgs e)
        {
            BitacoraForm bitacoraForm = new BitacoraForm
            {
                MdiParent = this
            };
            bitacoraForm.Show();
        }

        private void mniPersonalizar_Click(object sender, EventArgs e)
        {
            PersonalizacionForm personalizacionForm = new PersonalizacionForm
            {
                MdiParent = this
            };
            personalizacionForm.Show();
        }
        #endregion

        #region Métodos
        public void CerrarSesion()
        {
            try
            {
                Sesion.Instancia().CerrarSesion();
                Application.Restart();
            }
            catch (Exception ex)
            {
                Log.Grabar(ex);
            }
        }

        public override void ProcesarControlesConPermisos()
        {
            // Sistema
            mniVerBitacora.Visible = TienePermiso(Permisos.BITACORA_VER);

            // Administrar
            mniPerfilesDeUsuario.Visible = TienePermiso(Permisos.PERFILES_VER);
            mniIdiomas.Visible = TienePermiso(Permisos.IDIOMAS_VER);
            mniUsuarios.Visible = TienePermiso(Permisos.USUARIOS_VER);
            mniAdministrar.Visible = TienePermiso(Permisos.PERFILES_VER) || TienePermiso(Permisos.IDIOMAS_VER) || TienePermiso(Permisos.USUARIOS_VER);

            // Opciones
            mniCopiaDeSeguridad.Visible = TienePermiso(Permisos.BACKUP_GESTIONAR);
        }

        #endregion
    }
}
