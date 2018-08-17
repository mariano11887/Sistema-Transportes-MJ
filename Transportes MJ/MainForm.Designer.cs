namespace UI
{
    partial class MainForm
    {
        /// <summary>
        /// Variable del diseñador necesaria.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén usando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben desechar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido de este método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
            this.mnuPrincipal = new System.Windows.Forms.MenuStrip();
            this.mniSistema = new System.Windows.Forms.ToolStripMenuItem();
            this.mniOpciones = new System.Windows.Forms.ToolStripMenuItem();
            this.mniAdministrar = new System.Windows.Forms.ToolStripMenuItem();
            this.mniGestionar = new System.Windows.Forms.ToolStripMenuItem();
            this.mniAyuda = new System.Windows.Forms.ToolStripMenuItem();
            this.mniLogout = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuPrincipal.SuspendLayout();
            this.SuspendLayout();
            // 
            // mnuPrincipal
            // 
            this.mnuPrincipal.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mniSistema,
            this.mniOpciones,
            this.mniAdministrar,
            this.mniGestionar,
            this.mniAyuda});
            this.mnuPrincipal.Location = new System.Drawing.Point(0, 0);
            this.mnuPrincipal.Name = "mnuPrincipal";
            this.mnuPrincipal.Size = new System.Drawing.Size(943, 24);
            this.mnuPrincipal.TabIndex = 1;
            this.mnuPrincipal.Text = "menuStrip1";
            // 
            // mniSistema
            // 
            this.mniSistema.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mniLogout});
            this.mniSistema.Name = "mniSistema";
            this.mniSistema.Size = new System.Drawing.Size(60, 20);
            this.mniSistema.Text = "Sistema";
            // 
            // mniOpciones
            // 
            this.mniOpciones.Name = "mniOpciones";
            this.mniOpciones.Size = new System.Drawing.Size(69, 20);
            this.mniOpciones.Text = "Opciones";
            // 
            // mniAdministrar
            // 
            this.mniAdministrar.Name = "mniAdministrar";
            this.mniAdministrar.Size = new System.Drawing.Size(81, 20);
            this.mniAdministrar.Text = "Administrar";
            // 
            // mniGestionar
            // 
            this.mniGestionar.Name = "mniGestionar";
            this.mniGestionar.Size = new System.Drawing.Size(69, 20);
            this.mniGestionar.Text = "Gestionar";
            // 
            // mniAyuda
            // 
            this.mniAyuda.Name = "mniAyuda";
            this.mniAyuda.Size = new System.Drawing.Size(53, 20);
            this.mniAyuda.Text = "Ayuda";
            // 
            // mniLogout
            // 
            this.mniLogout.Name = "mniLogout";
            this.mniLogout.Size = new System.Drawing.Size(180, 22);
            this.mniLogout.Text = "Cerrar Sesión";
            this.mniLogout.Click += new System.EventHandler(this.mniLogout_Click);
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(943, 658);
            this.Controls.Add(this.mnuPrincipal);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.IsMdiContainer = true;
            this.MainMenuStrip = this.mnuPrincipal;
            this.Name = "MainForm";
            this.Text = "Transportes MJ";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.MainForm_Load);
            this.mnuPrincipal.ResumeLayout(false);
            this.mnuPrincipal.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip mnuPrincipal;
        private System.Windows.Forms.ToolStripMenuItem mniSistema;
        private System.Windows.Forms.ToolStripMenuItem mniOpciones;
        private System.Windows.Forms.ToolStripMenuItem mniAdministrar;
        private System.Windows.Forms.ToolStripMenuItem mniGestionar;
        private System.Windows.Forms.ToolStripMenuItem mniAyuda;
        private System.Windows.Forms.ToolStripMenuItem mniLogout;
    }
}

