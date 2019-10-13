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
            dgvUsuarios.DataSource = UsuarioHistorial.ObtenerUltimos();
        }

        private void BtnBuscar_Click(object sender, EventArgs e)
        {
            dgvUsuarios.DataSource = UsuarioHistorial.Buscar(dtpFechaInicio.Value, dtpFechaFin.Value, txtNombre.Text, txtNombreUsuario.Text);
        }
    }
}
