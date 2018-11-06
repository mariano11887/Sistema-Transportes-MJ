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
            this.mniVerBitacora = new System.Windows.Forms.ToolStripMenuItem();
            this.mniLogout = new System.Windows.Forms.ToolStripMenuItem();
            this.mniSalir = new System.Windows.Forms.ToolStripMenuItem();
            this.mniOpciones = new System.Windows.Forms.ToolStripMenuItem();
            this.mniPersonalizar = new System.Windows.Forms.ToolStripMenuItem();
            this.mniCopiaDeSeguridad = new System.Windows.Forms.ToolStripMenuItem();
            this.mniAdministrar = new System.Windows.Forms.ToolStripMenuItem();
            this.mniPerfilesDeUsuario = new System.Windows.Forms.ToolStripMenuItem();
            this.mniIdiomas = new System.Windows.Forms.ToolStripMenuItem();
            this.mniUsuarios = new System.Windows.Forms.ToolStripMenuItem();
            this.mniGestionar = new System.Windows.Forms.ToolStripMenuItem();
            this.mniPlanillasHorarias = new System.Windows.Forms.ToolStripMenuItem();
            this.mniVehiculos = new System.Windows.Forms.ToolStripMenuItem();
            this.mniChoferes = new System.Windows.Forms.ToolStripMenuItem();
            this.mniAyuda = new System.Windows.Forms.ToolStripMenuItem();
            this.mniAcercaDe = new System.Windows.Forms.ToolStripMenuItem();
            this.mniAyudaEnLinea = new System.Windows.Forms.ToolStripMenuItem();
            this.mniFicheroLeame = new System.Windows.Forms.ToolStripMenuItem();
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
            this.mniVerBitacora,
            this.mniLogout,
            this.mniSalir});
            this.mniSistema.Name = "mniSistema";
            this.mniSistema.Size = new System.Drawing.Size(60, 20);
            this.mniSistema.Text = "Sistema";
            // 
            // mniVerBitacora
            // 
            this.mniVerBitacora.Name = "mniVerBitacora";
            this.mniVerBitacora.Size = new System.Drawing.Size(158, 22);
            this.mniVerBitacora.Text = "Ver bitácora";
            this.mniVerBitacora.Click += new System.EventHandler(this.mniVerBitacora_Click);
            // 
            // mniLogout
            // 
            this.mniLogout.Name = "mniLogout";
            this.mniLogout.Size = new System.Drawing.Size(158, 22);
            this.mniLogout.Text = "Cerrar Sesión";
            this.mniLogout.Click += new System.EventHandler(this.mniLogout_Click);
            // 
            // mniSalir
            // 
            this.mniSalir.Name = "mniSalir";
            this.mniSalir.Size = new System.Drawing.Size(158, 22);
            this.mniSalir.Text = "Salir del sistema";
            this.mniSalir.Click += new System.EventHandler(this.mniSalir_Click);
            // 
            // mniOpciones
            // 
            this.mniOpciones.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mniPersonalizar,
            this.mniCopiaDeSeguridad});
            this.mniOpciones.Name = "mniOpciones";
            this.mniOpciones.Size = new System.Drawing.Size(69, 20);
            this.mniOpciones.Text = "Opciones";
            // 
            // mniPersonalizar
            // 
            this.mniPersonalizar.Name = "mniPersonalizar";
            this.mniPersonalizar.Size = new System.Drawing.Size(180, 22);
            this.mniPersonalizar.Text = "Personalizar";
            this.mniPersonalizar.Click += new System.EventHandler(this.mniPersonalizar_Click);
            // 
            // mniCopiaDeSeguridad
            // 
            this.mniCopiaDeSeguridad.Name = "mniCopiaDeSeguridad";
            this.mniCopiaDeSeguridad.Size = new System.Drawing.Size(180, 22);
            this.mniCopiaDeSeguridad.Text = "Copia de seguridad";
            this.mniCopiaDeSeguridad.Click += new System.EventHandler(this.mniCopiaDeSeguridad_Click);
            // 
            // mniAdministrar
            // 
            this.mniAdministrar.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mniPerfilesDeUsuario,
            this.mniIdiomas,
            this.mniUsuarios});
            this.mniAdministrar.Name = "mniAdministrar";
            this.mniAdministrar.Size = new System.Drawing.Size(81, 20);
            this.mniAdministrar.Text = "Administrar";
            // 
            // mniPerfilesDeUsuario
            // 
            this.mniPerfilesDeUsuario.Name = "mniPerfilesDeUsuario";
            this.mniPerfilesDeUsuario.Size = new System.Drawing.Size(170, 22);
            this.mniPerfilesDeUsuario.Text = "Perfiles de usuario";
            this.mniPerfilesDeUsuario.Click += new System.EventHandler(this.mniPerfilesDeUsuario_Click);
            // 
            // mniIdiomas
            // 
            this.mniIdiomas.Name = "mniIdiomas";
            this.mniIdiomas.Size = new System.Drawing.Size(170, 22);
            this.mniIdiomas.Text = "Idiomas";
            this.mniIdiomas.Click += new System.EventHandler(this.mniIdiomas_Click);
            // 
            // mniUsuarios
            // 
            this.mniUsuarios.Name = "mniUsuarios";
            this.mniUsuarios.Size = new System.Drawing.Size(170, 22);
            this.mniUsuarios.Text = "Usuarios";
            this.mniUsuarios.Click += new System.EventHandler(this.mniUsuarios_Click);
            // 
            // mniGestionar
            // 
            this.mniGestionar.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mniPlanillasHorarias,
            this.mniVehiculos,
            this.mniChoferes});
            this.mniGestionar.Name = "mniGestionar";
            this.mniGestionar.Size = new System.Drawing.Size(69, 20);
            this.mniGestionar.Text = "Gestionar";
            // 
            // mniPlanillasHorarias
            // 
            this.mniPlanillasHorarias.Name = "mniPlanillasHorarias";
            this.mniPlanillasHorarias.Size = new System.Drawing.Size(162, 22);
            this.mniPlanillasHorarias.Text = "Planillas horarias";
            // 
            // mniVehiculos
            // 
            this.mniVehiculos.Name = "mniVehiculos";
            this.mniVehiculos.Size = new System.Drawing.Size(162, 22);
            this.mniVehiculos.Text = "Vehículos";
            // 
            // mniChoferes
            // 
            this.mniChoferes.Name = "mniChoferes";
            this.mniChoferes.Size = new System.Drawing.Size(162, 22);
            this.mniChoferes.Text = "Choferes";
            // 
            // mniAyuda
            // 
            this.mniAyuda.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mniAcercaDe,
            this.mniAyudaEnLinea,
            this.mniFicheroLeame});
            this.mniAyuda.Name = "mniAyuda";
            this.mniAyuda.Size = new System.Drawing.Size(53, 20);
            this.mniAyuda.Text = "Ayuda";
            // 
            // mniAcercaDe
            // 
            this.mniAcercaDe.Name = "mniAcercaDe";
            this.mniAcercaDe.Size = new System.Drawing.Size(152, 22);
            this.mniAcercaDe.Text = "Acerca de...";
            // 
            // mniAyudaEnLinea
            // 
            this.mniAyudaEnLinea.Name = "mniAyudaEnLinea";
            this.mniAyudaEnLinea.Size = new System.Drawing.Size(152, 22);
            this.mniAyudaEnLinea.Text = "Ayuda en línea";
            // 
            // mniFicheroLeame
            // 
            this.mniFicheroLeame.Name = "mniFicheroLeame";
            this.mniFicheroLeame.Size = new System.Drawing.Size(152, 22);
            this.mniFicheroLeame.Text = "Fichero léame";
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
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.MainForm_FormClosed);
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
        private System.Windows.Forms.ToolStripMenuItem mniPerfilesDeUsuario;
        private System.Windows.Forms.ToolStripMenuItem mniCopiaDeSeguridad;
        private System.Windows.Forms.ToolStripMenuItem mniIdiomas;
        private System.Windows.Forms.ToolStripMenuItem mniUsuarios;
        private System.Windows.Forms.ToolStripMenuItem mniSalir;
        private System.Windows.Forms.ToolStripMenuItem mniVerBitacora;
        private System.Windows.Forms.ToolStripMenuItem mniPlanillasHorarias;
        private System.Windows.Forms.ToolStripMenuItem mniVehiculos;
        private System.Windows.Forms.ToolStripMenuItem mniChoferes;
        private System.Windows.Forms.ToolStripMenuItem mniAcercaDe;
        private System.Windows.Forms.ToolStripMenuItem mniAyudaEnLinea;
        private System.Windows.Forms.ToolStripMenuItem mniFicheroLeame;
        private System.Windows.Forms.ToolStripMenuItem mniPersonalizar;
    }
}

