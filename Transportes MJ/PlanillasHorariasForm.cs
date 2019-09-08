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
    public partial class PlanillasHorariasForm : FormGeneral
    {
        public PlanillasHorariasForm()
        {
            InitializeComponent();
        }

        private void PlanillasHorariasForm_Load(object sender, EventArgs e)
        {
            Abrir();

            DateTime ultimaFecha = PlanillaHoraria.ObtenerUltimaPlanilla();
            lblUltimaPlanillaInfo.Text = string.Format(lblUltimaPlanillaInfo.Text, ultimaFecha.ToString("dd/MM/yyyy"));

            DateTime proximaFecha = GeneradorDePlanillas.ObtenerProximaFecha(ultimaFecha, out bool puedeGenerarse);
            btnGenerarPlanillas.Text = string.Format(btnGenerarPlanillas.Text, proximaFecha.ToString("dd/MM/yyyy"));
            btnGenerarPlanillas.Enabled = puedeGenerarse;
        }

        private void BtnGenerarPlanillas_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show(ObtenerLeyenda("msgConfirmacionGenerarPlanillas"), "",
                MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if(result == DialogResult.Yes)
            {
                GenerarPlanillas();
            }
        }

        private void GenerarPlanillas()
        {
            Cursor = Cursors.WaitCursor;
            GeneradorDePlanillas.GenerarProximasPlanillas();
            Cursor = Cursors.Default;
        }
    }
}
