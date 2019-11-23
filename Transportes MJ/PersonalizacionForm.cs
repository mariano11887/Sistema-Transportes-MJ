using BE;
using BL;
using System;

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

        private void BtnCancelar_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void BtnAceptar_Click(object sender, EventArgs e)
        {
            UsuarioBE usuarioLogueado = Sesion.Instancia().UsuarioLogueado;
            IdiomaBE idiomaSeleccionado = (IdiomaBE)cmbIdioma.SelectedItem;
            if(!usuarioLogueado.Idioma.Equals(idiomaSeleccionado))
            {
                usuarioLogueado.Idioma = idiomaSeleccionado;
                Usuario.Guardar(usuarioLogueado);

                GestorDeIdioma.Instancia().Notificar();
            }

            Close();
        }
    }
}
