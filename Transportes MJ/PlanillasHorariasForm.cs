using BL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace UI
{
    public partial class PlanillasHorariasForm : FormGeneral
    {
        public PlanillasHorariasForm()
        {
            InitializeComponent();
        }

        private void PlanillasHorariasForm_Load(object sender, EventArgs e)
        {
            Abrir();
            RefrescarGeneracionPlanillas();

            dtpFecha.Value = DateTime.Today;

            List<Chofer> choferes = Chofer.ListarTodos().OrderBy(c => c.Nombre).ToList();
            choferes.Insert(0, new Chofer());
            cmbChofer.DataSource = choferes;

            List<Vehiculo> coches = Vehiculo.ListarTodos().OrderBy(v => v.Patente).ToList();
            coches.Insert(0, new Vehiculo());
            cmbCoche.DataSource = coches;

            List<Recorrido> recorridos = Recorrido.ListarTodos().OrderBy(r => r.ToString()).ToList();
            recorridos.Insert(0, new Recorrido());
            cmbRecorrido.DataSource = recorridos;
        }

        private void BtnGenerarPlanillas_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show(ObtenerLeyenda("msgConfirmacionGenerarPlanillas"), "",
                MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if(result == DialogResult.Yes)
            {
                Cursor = Cursors.WaitCursor;
                GeneradorDePlanillas.GenerarProximasPlanillas();
                Cursor = Cursors.Default;

                MessageBox.Show(ObtenerLeyenda("msgGeneracionPlanillasOk"));

                RefrescarGeneracionPlanillas();
            }
        }

        private void ChkFecha_CheckedChanged(object sender, EventArgs e)
        {
            dtpFecha.Enabled = chkFecha.Checked;
        }

        private void TxtNumeroPlanilla_KeyPress(object sender, KeyPressEventArgs e)
        {
            if(!char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
            }
        }

        private void BtnBuscar_Click(object sender, EventArgs e)
        {
            int numeroPlanilla = int.TryParse(txtNumeroPlanilla.Text, out int numPlanilla) ? numPlanilla : 0;
            DateTime? fecha = chkFecha.Checked ? dtpFecha.Value : (DateTime?)null;
            Chofer chofer = (Chofer)cmbChofer.SelectedItem;
            Vehiculo coche = (Vehiculo)cmbCoche.SelectedItem;
            Recorrido recorrido = (Recorrido)cmbRecorrido.SelectedItem;

            List<PlanillaHoraria> planillas = PlanillaHoraria.Buscar(numeroPlanilla, fecha, chofer, coche, recorrido);
            dgvResultadoBusqueda.DataSource = planillas.Select(p => new
            {
                Planilla = p,
                p.Id,
                p.Fecha,
                Chofer = p.Chofer.Nombre,
                Vehiculo = p.Vehiculo.Patente,
                Recorrido = p.Recorrido.ToString(),
                Detalles = ObtenerLeyenda("btnVer")
            }).ToList();
        }

        private void RefrescarGeneracionPlanillas()
        {
            DateTime ultimaFecha = PlanillaHoraria.ObtenerUltimaPlanilla();
            string leyendaUltimaPlanillaInfo = ObtenerLeyenda("lblUltimaPlanillaInfo");
            if (leyendaUltimaPlanillaInfo.Contains("{0}"))
            {
                lblUltimaPlanillaInfo.Text = string.Format(leyendaUltimaPlanillaInfo, ultimaFecha.ToString("dd/MM/yyyy"));
            }

            DateTime proximaFecha = GeneradorDePlanillas.ObtenerProximaFecha(ultimaFecha, out bool puedeGenerarse);
            string leyendaGenerarPlanillas = ObtenerLeyenda("btnGenerarPlanillas");
            if (leyendaGenerarPlanillas.Contains("{0}"))
            {
                btnGenerarPlanillas.Text = string.Format(leyendaGenerarPlanillas, proximaFecha.ToString("dd/MM/yyyy"));
            }
            btnGenerarPlanillas.Enabled = puedeGenerarse;
        }
    }
}
