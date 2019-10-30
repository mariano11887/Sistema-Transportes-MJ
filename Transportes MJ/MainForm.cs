using BL;
using Logger;
using System;
using System.Windows.Forms;

namespace UI
{
    public partial class MainForm : FormGeneral
    {
        public MainForm()
        {
            InitializeComponent();
        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            try
            {
                Hide();
                using (LoginForm frmLogin = new LoginForm())
                {
                    frmLogin.ShowDialog();
                }
                if (Sesion.Instancia().UsuarioLogueado != null)
                {
                    Show();
                    Abrir();

                    if (!DigitoVerificador.ChequearDVs())
                    {
                        MessageBox.Show(ObtenerLeyenda("msgPruebaDVMal"), "", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    }

                    ChequearAlertasDeInsuficiencia();
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

        private void MainForm_FormClosed(object sender, FormClosedEventArgs e)
        {
            Sesion.Instancia().CerrarSesion();
        }

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
            mniControlDeCambios.Visible = TienePermiso(Permisos.CONTROL_DE_CAMBIOS_VER);

            // Opciones
            mniCopiaDeSeguridad.Visible = TienePermiso(Permisos.BACKUP_GESTIONAR);
        }

        public void ChequearAlertasDeInsuficiencia()
        {
            if (TienePermiso(Permisos.CHOFERES_ALTA) || TienePermiso(Permisos.VEHICULOS_ALTA) || TienePermiso(Permisos.PLANILLAS_GENERAR))
            {
                AlertaInsuficiencia alerta = AlertaInsuficiencia.ChequearAlerta();
                if (alerta != null)
                {
                    string mensajePrincipal = ObtenerLeyenda("msgAlertaInsuficiencia");
                    string mensajeChoferesFaltantes = ObtenerLeyenda("msgChoferesFaltantes");
                    string mensajeVehiculosFaltantes = ObtenerLeyenda("msgVehiculosFaltantes");
                    if (mensajeChoferesFaltantes.Contains("{0}") && mensajeVehiculosFaltantes.Contains("{0}"))
                    {
                        string mensaje = mensajePrincipal + Environment.NewLine + Environment.NewLine +
                            string.Format(mensajeChoferesFaltantes, alerta.ChoferesFaltantes) + Environment.NewLine +
                            string.Format(mensajeVehiculosFaltantes, alerta.VehiculosFaltantes);
                        MessageBox.Show(mensaje, "", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }
            }
        }

        #region Sistema
        private void MniLogout_Click(object sender, EventArgs e)
        {
            CerrarSesion();
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
        #endregion

        #region Opciones
        private void MniCopiaDeSeguridad_Click(object sender, EventArgs e)
        {
            BackupForm backupForm = new BackupForm
            {
                MdiParent = this
            };
            backupForm.Show();
        }

        private void MniPersonalizar_Click(object sender, EventArgs e)
        {
            PersonalizacionForm personalizacionForm = new PersonalizacionForm
            {
                MdiParent = this
            };
            personalizacionForm.Show();
        }
        #endregion

        #region Administrar
        private void MniPerfilesDeUsuario_Click(object sender, EventArgs e)
        {
            PerfilesForm perfilesForm = new PerfilesForm
            {
                MdiParent = this
            };
            perfilesForm.Show();
        }

        private void MniControlDeCambios_Click(object sender, EventArgs e)
        {
            UsuarioHistorialForm usuarioHistorialForm = new UsuarioHistorialForm
            {
                MdiParent = this
            };
            usuarioHistorialForm.Show();
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
        #endregion

        #region Gestionar
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

        #region Ayuda

        #endregion
    }
}
