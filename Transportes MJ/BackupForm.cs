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
    public partial class BackupForm : FormGeneral
    {
        public BackupForm()
        {
            InitializeComponent();
        }

        private void BackupForm_Load(object sender, EventArgs e)
        {
            Abrir();
        }

        private void btnCrearBackup_Click(object sender, EventArgs e)
        {
            sfdCrearBackup.ShowDialog();
            string filePath = sfdCrearBackup.FileName;
            if (string.IsNullOrWhiteSpace(filePath))
            {
                MessageBox.Show(ObtenerLeyenda("msgUbicacionVaciaCrear"), ObtenerLeyenda("msgUbicacionVaciaCrearTitulo"),
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (DigitoVerificador.ChequearDVs())
            {
                Backup.HacerBackup(sfdCrearBackup.FileName);
                MessageBox.Show(ObtenerLeyenda("msgBackupCreado"), ObtenerLeyenda("msgBackupCreadoTitulo"),
                    MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show(ObtenerLeyenda("msgPruebaDVMal"), "", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
        }

        private void btnExaminarRestaurar_Click(object sender, EventArgs e)
        {
            ofdRestaurarBackup.ShowDialog();
            txtUbicacionRestaurar.Text = ofdRestaurarBackup.FileName;
        }

        private void btnRestaurarBackup_Click(object sender, EventArgs e)
        {
            if(txtUbicacionRestaurar.Text.EndsWith(".bak"))
            {
                DialogResult result = MessageBox.Show(ObtenerLeyenda("msgConfirmacionRestaurar"), ObtenerLeyenda("msgConfirmacionRestaurarTitulo"),
                    MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
                if (result == DialogResult.Yes)
                {
                    Backup.RestaurarBackup(txtUbicacionRestaurar.Text);
                    MessageBox.Show(ObtenerLeyenda("msgRestauracionCompleta"), ObtenerLeyenda("msgRestauracionCompletaTitulo"),
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                    // Se desloguea al usuario del sistema
                    ((MainForm)MdiParent).CerrarSesion();
                }
            }
            else
            {
                MessageBox.Show(ObtenerLeyenda("msgArchivoBackupInvalido"), ObtenerLeyenda("msgArchivoBackupInvalidoTitulo"),
                    MessageBoxButtons.OK, MessageBoxIcon.Hand);
            }
        }
    }
}
