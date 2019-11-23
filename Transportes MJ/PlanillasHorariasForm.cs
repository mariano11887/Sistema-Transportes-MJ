using BE;
using BL;
using Logger;
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

            try
            {
                RefrescarGeneracionPlanillas();

                dtpFecha.Value = DateTime.Today;

                List<ChoferBE> choferes = Chofer.ListarTodos().OrderBy(c => c.Nombre).ToList();
                choferes.Insert(0, new ChoferBE());
                cmbChofer.DataSource = choferes;

                List<VehiculoBE> coches = Vehiculo.ListarTodos().OrderBy(v => v.Patente).ToList();
                coches.Insert(0, new VehiculoBE());
                cmbCoche.DataSource = coches;

                List<RecorridoBE> recorridos = Recorrido.ListarTodos().OrderBy(r => r.ToString()).ToList();
                recorridos.Insert(0, new RecorridoBE());
                cmbRecorrido.DataSource = recorridos;
            }
            catch
            {
                MostrarError();
            }
        }

        private void BtnGenerarPlanillas_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show(ObtenerLeyenda("msgConfirmacionGenerarPlanillas"), "",
                MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if(result == DialogResult.Yes)
            {
                try
                {
                    Cursor = Cursors.WaitCursor;
                    GeneradorDePlanillas.GenerarProximasPlanillas();
                    Cursor = Cursors.Default;

                    MessageBox.Show(ObtenerLeyenda("msgGeneracionPlanillasOk"));

                    RefrescarGeneracionPlanillas();

                    (MdiParent as MainForm).ChequearAlertasDeInsuficiencia();
                }
                catch (Exception ex)
                {
                    Log.Grabar(ex);
                    MessageBox.Show(ObtenerLeyenda("msgErrorAlGenerarPlanillas"), "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
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
            ChoferBE chofer = (ChoferBE)cmbChofer.SelectedItem;
            VehiculoBE coche = (VehiculoBE)cmbCoche.SelectedItem;
            RecorridoBE recorrido = (RecorridoBE)cmbRecorrido.SelectedItem;

            try
            {
                List<PlanillaHorariaBE> planillas = PlanillaHoraria.Buscar(numeroPlanilla, fecha, chofer, coche, recorrido);
                dgvResultadoBusqueda.DataSource = planillas.Select(p => new GridItem
                {
                    Planilla = p,
                    Id = p.Id,
                    Fecha = p.Fecha,
                    Chofer = p.Chofer.Nombre,
                    Vehiculo = p.Vehiculo.Patente,
                    Recorrido = p.Recorrido.ToString(),
                    Detalles = ObtenerLeyenda("btnVer")
                }).ToList();
            }
            catch
            {
                MostrarError();
            }
        }

        private void DgvResultadoBusqueda_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridView grid = (DataGridView)sender;
            if(grid.Columns[e.ColumnIndex] is DataGridViewButtonColumn & e.RowIndex >= 0)
            {
                // Se clickeó en un botón de Detalle
                PlanillaHorariaBE planilla = (grid.Rows[e.RowIndex].DataBoundItem as GridItem).Planilla;
                DetalleDePlanillaForm detalleDePlanillaForm = new DetalleDePlanillaForm(planilla)
                {
                    MdiParent = MdiParent
                };
                detalleDePlanillaForm.Show();
            }
        }

        public override void ProcesarControlesConPermisos()
        {
            btnGenerarPlanillas.Visible = TienePermiso(Permisos.PLANILLAS_GENERAR);
        }

        private void RefrescarGeneracionPlanillas()
        {
            DateTime ultimaFecha = PlanillaHoraria.ObtenerUltimaPlanilla();
            if(ultimaFecha == default)
            {
                lblUltimaPlanillaInfo.Text = ObtenerLeyenda("msgNoHayPlanillas");
            }
            else
            {
                string leyendaUltimaPlanillaInfo = ObtenerLeyenda("lblUltimaPlanillaInfo");
                if (leyendaUltimaPlanillaInfo.Contains("{0}"))
                {
                    lblUltimaPlanillaInfo.Text = string.Format(leyendaUltimaPlanillaInfo, ultimaFecha.ToString("dd/MM/yyyy"));
                }
            }

            DateTime proximaFecha = GeneradorDePlanillas.ObtenerProximaFecha(ultimaFecha, out bool puedeGenerarse);
            string leyendaGenerarPlanillas = ObtenerLeyenda("btnGenerarPlanillas");
            if (leyendaGenerarPlanillas.Contains("{0}"))
            {
                btnGenerarPlanillas.Text = string.Format(leyendaGenerarPlanillas, proximaFecha.ToString("dd/MM/yyyy"));
            }
            btnGenerarPlanillas.Enabled = puedeGenerarse;
        }

        private class GridItem
        {
            public PlanillaHorariaBE Planilla { get; set; }
            public int Id { get; set; }
            public DateTime Fecha { get; set; }
            public string Chofer { get; set; }
            public string Vehiculo { get; set; }
            public string Recorrido { get; set; }
            public string Detalles { get; set; }
        }
    }
}
