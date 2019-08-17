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
        }
    }
}
