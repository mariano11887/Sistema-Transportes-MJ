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

                    if(!DigitoVerificador.ChequearDVs())
                    {
                        MessageBox.Show(ObtenerLeyenda("msgPruebaDVMal"), "", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    }
                }
                else
                {
                    Application.Exit();
                }
            }
            catch (Exception ex)
            {
                Log.Grabar(ex);
            }
        }

        private void MniLogout_Click(object sender, EventArgs e)
        {
            CerrarSesion();
        }

        private void MniPerfilesDeUsuario_Click(object sender, EventArgs e)
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

        private void MniCopiaDeSeguridad_Click(object sender, EventArgs e)
        {
            BackupForm backupForm = new BackupForm
            {
                MdiParent = this
            };
            backupForm.Show();
        }

        private void MniIdiomas_Click(object sender, EventArgs e)
        {
            IdiomasForm idiomasForm = new IdiomasForm
            {
                MdiParent = this
            };
            idiomasForm.Show();
        }

        private void MniUsuarios_Click(object sender, EventArgs e)
        {
            UsuariosForm usuariosForm = new UsuariosForm
            {
                MdiParent = this
            };
            usuariosForm.Show();
        }

        private void MniSalir_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void MniVerBitacora_Click(object sender, EventArgs e)
        {
            BitacoraForm bitacoraForm = new BitacoraForm
            {
                MdiParent = this
            };
            bitacoraForm.Show();
        }

        private void MniPersonalizar_Click(object sender, EventArgs e)
        {
            PersonalizacionForm personalizacionForm = new PersonalizacionForm
            {
                MdiParent = this
            };
            personalizacionForm.Show();
        }

        private void MniPlanillasHorarias_Click(object sender, EventArgs e)
        {
            PlanillasHorariasForm planillasHorariasForm = new PlanillasHorariasForm
            {
                MdiParent = this
            };
            planillasHorariasForm.Show();
        }

        private void MniVehiculos_Click(object sender, EventArgs e)
        {
            VehiculosForm vehiculosForm = new VehiculosForm
            {
                MdiParent = this
            };
            vehiculosForm.Show();
        }

        private void MniChoferes_Click(object sender, EventArgs e)
        {
            ChoferesForm choferesForm = new ChoferesForm
            {
                MdiParent = this
            };
            choferesForm.Show();
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
