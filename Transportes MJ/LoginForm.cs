using BL;
using System;
using System.Windows.Forms;

namespace UI
{
    public partial class LoginForm : FormGeneral
    {
        public LoginForm()
        {
            InitializeComponent();
        }

        #region Eventos
        private void LoginForm_Load(object sender, EventArgs e)
        {
            // IMPORTANTE: Sacar esto cuando ya no se pruebe más
            //txtNombreDeUsuario.Text = "admin";
            //txtContrasenia.Text = "admin";
            //btnAceptar.PerformClick();
        }

        private void BtnAceptar_Click(object sender, EventArgs e)
        {
            if (ValidarDatos())
            {
                if (Usuario.Login(txtNombreDeUsuario.Text.Trim(), txtContrasenia.Text.Trim()))
                {
                    Close();
                }
                else
                {
                    MessageBox.Show("Las credenciales son erróneas");
                }
            }
            else
            {
                MessageBox.Show("Se deben completar todos los campos");
            }
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void textbox_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                BtnAceptar_Click(this, new EventArgs());
            }
        }
        #endregion

        public bool ValidarDatos()
        {
            return !string.IsNullOrWhiteSpace(txtNombreDeUsuario.Text) && !string.IsNullOrWhiteSpace(txtContrasenia.Text);
        }        
    }
}
