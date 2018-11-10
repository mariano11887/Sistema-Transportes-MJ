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
    public partial class PersonalizacionForm : FormGeneral
    {
        public PersonalizacionForm()
        {
            InitializeComponent();
        }

        private void PersonalizacionForm_Load(object sender, EventArgs e)
        {
            Abrir();

            cmbIdioma.Items.AddRange(Idioma.ListarTodos().ToArray());
            cmbIdioma.SelectedIndex = cmbIdioma.FindStringExact(Sesion.Instancia().UsuarioLogueado.Idioma.ToString());
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void btnAceptar_Click(object sender, EventArgs e)
        {
            Usuario usuarioLogueado = Sesion.Instancia().UsuarioLogueado;
            Idioma idiomaSeleccionado = (Idioma)cmbIdioma.SelectedItem;
            if(!usuarioLogueado.Idioma.Equals(idiomaSeleccionado))
            {
                usuarioLogueado.Idioma = idiomaSeleccionado;
                usuarioLogueado.Guardar();

                GestorDeIdioma.Instancia().Notificar();
            }

            Close();
        }
    }
}
