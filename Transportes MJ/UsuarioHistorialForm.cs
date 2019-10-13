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
        }


    }
}
