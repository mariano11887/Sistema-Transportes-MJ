namespace UI
{
    partial class BackupForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(BackupForm));
            this.grpCrearBackup = new System.Windows.Forms.GroupBox();
            this.btnCrearBackup = new System.Windows.Forms.Button();
            this.grpRestaurarBackup = new System.Windows.Forms.GroupBox();
            this.btnRestaurarBackup = new System.Windows.Forms.Button();
            this.btnExaminarRestaurar = new System.Windows.Forms.Button();
            this.txtUbicacionRestaurar = new System.Windows.Forms.TextBox();
            this.lblUbicacionRestaurarBackup = new System.Windows.Forms.Label();
            this.sfdCrearBackup = new System.Windows.Forms.SaveFileDialog();
            this.ofdRestaurarBackup = new System.Windows.Forms.OpenFileDialog();
            this.grpCrearBackup.SuspendLayout();
            this.grpRestaurarBackup.SuspendLayout();
            this.SuspendLayout();
            // 
            // grpCrearBackup
            // 
            this.grpCrearBackup.Controls.Add(this.btnCrearBackup);
            this.grpCrearBackup.Location = new System.Drawing.Point(13, 13);
            this.grpCrearBackup.Name = "grpCrearBackup";
            this.grpCrearBackup.Size = new System.Drawing.Size(397, 86);
            this.grpCrearBackup.TabIndex = 0;
            this.grpCrearBackup.TabStop = false;
            this.grpCrearBackup.Text = "Crear copia de seguridad";
            // 
            // btnCrearBackup
            // 
            this.btnCrearBackup.Location = new System.Drawing.Point(87, 19);
            this.btnCrearBackup.Name = "btnCrearBackup";
            this.btnCrearBackup.Size = new System.Drawing.Size(237, 55);
            this.btnCrearBackup.TabIndex = 3;
            this.btnCrearBackup.Text = "Crear copia de seguridad";
            this.btnCrearBackup.UseVisualStyleBackColor = true;
            this.btnCrearBackup.Click += new System.EventHandler(this.btnCrearBackup_Click);
            // 
            // grpRestaurarBackup
            // 
            this.grpRestaurarBackup.Controls.Add(this.btnRestaurarBackup);
            this.grpRestaurarBackup.Controls.Add(this.btnExaminarRestaurar);
            this.grpRestaurarBackup.Controls.Add(this.txtUbicacionRestaurar);
            this.grpRestaurarBackup.Controls.Add(this.lblUbicacionRestaurarBackup);
            this.grpRestaurarBackup.Location = new System.Drawing.Point(12, 105);
            this.grpRestaurarBackup.Name = "grpRestaurarBackup";
            this.grpRestaurarBackup.Size = new System.Drawing.Size(397, 119);
            this.grpRestaurarBackup.TabIndex = 4;
            this.grpRestaurarBackup.TabStop = false;
            this.grpRestaurarBackup.Text = "Restaurar copia de seguridad";
            // 
            // btnRestaurarBackup
            // 
            this.btnRestaurarBackup.Location = new System.Drawing.Point(149, 63);
            this.btnRestaurarBackup.Name = "btnRestaurarBackup";
            this.btnRestaurarBackup.Size = new System.Drawing.Size(102, 43);
            this.btnRestaurarBackup.TabIndex = 3;
            this.btnRestaurarBackup.Text = "Restaurar copia de seguridad";
            this.btnRestaurarBackup.UseVisualStyleBackColor = true;
            this.btnRestaurarBackup.Click += new System.EventHandler(this.btnRestaurarBackup_Click);
            // 
            // btnExaminarRestaurar
            // 
            this.btnExaminarRestaurar.Location = new System.Drawing.Point(311, 35);
            this.btnExaminarRestaurar.Name = "btnExaminarRestaurar";
            this.btnExaminarRestaurar.Size = new System.Drawing.Size(75, 23);
            this.btnExaminarRestaurar.TabIndex = 2;
            this.btnExaminarRestaurar.Text = "Examinar...";
            this.btnExaminarRestaurar.UseVisualStyleBackColor = true;
            this.btnExaminarRestaurar.Click += new System.EventHandler(this.btnExaminarRestaurar_Click);
            // 
            // txtUbicacionRestaurar
            // 
            this.txtUbicacionRestaurar.Location = new System.Drawing.Point(7, 37);
            this.txtUbicacionRestaurar.Name = "txtUbicacionRestaurar";
            this.txtUbicacionRestaurar.ReadOnly = true;
            this.txtUbicacionRestaurar.Size = new System.Drawing.Size(298, 20);
            this.txtUbicacionRestaurar.TabIndex = 1;
            this.txtUbicacionRestaurar.Text = "C:/";
            // 
            // lblUbicacionRestaurarBackup
            // 
            this.lblUbicacionRestaurarBackup.AutoSize = true;
            this.lblUbicacionRestaurarBackup.Location = new System.Drawing.Point(7, 20);
            this.lblUbicacionRestaurarBackup.Name = "lblUbicacionRestaurarBackup";
            this.lblUbicacionRestaurarBackup.Size = new System.Drawing.Size(318, 13);
            this.lblUbicacionRestaurarBackup.TabIndex = 0;
            this.lblUbicacionRestaurarBackup.Text = "Indique la ubicación de la copia de seguridad que desea restaurar";
            // 
            // sfdCrearBackup
            // 
            this.sfdCrearBackup.DefaultExt = "bak";
            // 
            // ofdRestaurarBackup
            // 
            this.ofdRestaurarBackup.DefaultExt = "bak";
            this.ofdRestaurarBackup.FileName = "openFileDialog1";
            this.ofdRestaurarBackup.Filter = "Archivos bak|*.bak";
            // 
            // BackupForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(425, 240);
            this.Controls.Add(this.grpRestaurarBackup);
            this.Controls.Add(this.grpCrearBackup);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "BackupForm";
            this.Text = "Copia de seguridad";
            this.Load += new System.EventHandler(this.BackupForm_Load);
            this.grpCrearBackup.ResumeLayout(false);
            this.grpRestaurarBackup.ResumeLayout(false);
            this.grpRestaurarBackup.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox grpCrearBackup;
        private System.Windows.Forms.Button btnCrearBackup;
        private System.Windows.Forms.GroupBox grpRestaurarBackup;
        private System.Windows.Forms.Button btnRestaurarBackup;
        private System.Windows.Forms.Button btnExaminarRestaurar;
        private System.Windows.Forms.TextBox txtUbicacionRestaurar;
        private System.Windows.Forms.Label lblUbicacionRestaurarBackup;
        private System.Windows.Forms.SaveFileDialog sfdCrearBackup;
        private System.Windows.Forms.OpenFileDialog ofdRestaurarBackup;
    }
}