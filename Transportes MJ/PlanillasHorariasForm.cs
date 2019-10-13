using BL;
using System;
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
