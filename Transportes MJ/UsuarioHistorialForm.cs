using BL;
using System;

namespace UI
{
    public partial class UsuarioHistorialForm : FormGeneral
    {
        public UsuarioHistorialForm()
        {
            InitializeComponent();
        }

        private void UsuarioHistorialForm_Load(object sender, EventArgs e)
        {
            Abrir();

            dtpFechaInicio.MaxDate = DateTime.Now;
            dtpFechaFin.MaxDate = DateTime.Now;
            dtpFechaFin.Value = DateTime.Now;
            try
            {
                dgvUsuarios.DataSource = UsuarioHistorial.ObtenerUltimos();
            }
            catch
            {
                MostrarError();
            }
        }

        private void BtnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                dgvUsuarios.DataSource = UsuarioHistorial.Buscar(dtpFechaInicio.Value, dtpFechaFin.Value, txtNombre.Text, txtNombreUsuario.Text);
            }
            catch
            {
                MostrarError();
            }
        }
    }
}
