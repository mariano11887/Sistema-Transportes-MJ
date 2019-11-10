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

        private void btnAceptar_Click(object sender, EventArgs e)
        {
            if (ValidarDatos())
            {
                Usuario usuario = new Usuario();
                if (usuario.Login(txtNombreDeUsuario.Text.Trim(), txtContrasenia.Text.Trim()))
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
                btnAceptar_Click(this, new EventArgs());
            }
        }
        #endregion

        public bool ValidarDatos()
        {
            return !string.IsNullOrWhiteSpace(txtNombreDeUsuario.Text) && !string.IsNullOrWhiteSpace(txtContrasenia.Text);
        }        
    }
}
