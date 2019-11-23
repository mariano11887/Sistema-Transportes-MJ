using BE;
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
    public partial class BitacoraForm : FormGeneral
    {
        public BitacoraForm()
        {
            InitializeComponent();
        }

        private void BitacoraForm_Load(object sender, EventArgs e)
        {
            Abrir();

            dtpFechaInicio.MaxDate = DateTime.Now;
            dtpFechaFin.MinDate = DateTime.Now;
            dtpFechaFin.MaxDate = DateTime.Now;

            cmbUsuario.Items.AddRange(Usuario.ObtenerTodos().ToArray());
        }

        private void dtpFechaInicio_ValueChanged(object sender, EventArgs e)
        {
            dtpFechaFin.MinDate = dtpFechaInicio.Value;
        }

        private void dtpFechaFin_ValueChanged(object sender, EventArgs e)
        {
            dtpFechaInicio.MaxDate = dtpFechaFin.Value;
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            dgvRegistros.Rows.Clear();

            DateTime fechaInicio = dtpFechaInicio.Value.Date;
            DateTime fechaFin = dtpFechaFin.Value.Date.AddDays(1); // Agrego un día para que lo incluya en la búsqueda
            UsuarioBE usuario = cmbUsuario.SelectedItem as UsuarioBE;
            string parteTexto = txtParteDelTexto.Text.Trim();
            List<BitacoraBE> bitacoras = Bitacora.Buscar(fechaInicio, fechaFin, usuario, parteTexto);
            foreach(BitacoraBE bitacora in bitacoras)
            {
                DataGridViewRow row = new DataGridViewRow();
                row.CreateCells(dgvRegistros);
                row.Cells[0].Value = bitacora.FechaHora;
                row.Cells[1].Value = bitacora.Usuario;
                row.Cells[2].Value = bitacora.Detalle;
                dgvRegistros.Rows.Add(row);
            }
        }
    }
}
