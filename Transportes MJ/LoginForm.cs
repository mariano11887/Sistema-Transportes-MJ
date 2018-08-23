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
                MostrarError();
            }
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            Close();
        }

        public bool ValidarDatos()
        {
            return !String.IsNullOrWhiteSpace(txtNombreDeUsuario.Text) && !String.IsNullOrWhiteSpace(txtContrasenia.Text);
        }

        public void Login()
        {

        }

        public void MostrarError()
        {
            MessageBox.Show("Se deben completar todos los campos");
        }
    }
}
