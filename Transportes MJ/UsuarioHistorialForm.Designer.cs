namespace UI
{
    partial class UsuarioHistorialForm
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
            this.dgvUsuarios = new System.Windows.Forms.DataGridView();
            this.colFecha = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colIdUsuario = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colNombre = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colIdioma = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colNombreUsuario = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colContraseniaEncriptada = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colPermisos = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dgvUsuarios)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvUsuarios
            // 
            this.dgvUsuarios.AllowUserToAddRows = false;
            this.dgvUsuarios.AllowUserToDeleteRows = false;
            this.dgvUsuarios.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvUsuarios.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colFecha,
            this.colIdUsuario,
            this.colNombre,
            this.colIdioma,
            this.colNombreUsuario,
            this.colContraseniaEncriptada,
            this.colPermisos});
            this.dgvUsuarios.Location = new System.Drawing.Point(12, 136);
            this.dgvUsuarios.Name = "dgvUsuarios";
            this.dgvUsuarios.ReadOnly = true;
            this.dgvUsuarios.Size = new System.Drawing.Size(775, 228);
            this.dgvUsuarios.TabIndex = 0;
            // 
            // colFecha
            // 
            this.colFecha.HeaderText = "Fecha";
            this.colFecha.Name = "colFecha";
            this.colFecha.ReadOnly = true;
            // 
            // colIdUsuario
            // 
            this.colIdUsuario.HeaderText = "ID Usuario";
            this.colIdUsuario.Name = "colIdUsuario";
            this.colIdUsuario.ReadOnly = true;
            // 
            // colNombre
            // 
            this.colNombre.HeaderText = "Nombre";
            this.colNombre.Name = "colNombre";
            this.colNombre.ReadOnly = true;
            // 
            // colIdioma
            // 
            this.colIdioma.HeaderText = "Idioma";
            this.colIdioma.Name = "colIdioma";
            this.colIdioma.ReadOnly = true;
            // 
            // colNombreUsuario
            // 
            this.colNombreUsuario.HeaderText = "Nombre de usuario";
            this.colNombreUsuario.Name = "colNombreUsuario";
            this.colNombreUsuario.ReadOnly = true;
            // 
            // colContraseniaEncriptada
            // 
            this.colContraseniaEncriptada.HeaderText = "Contraseña encriptada";
            this.colContraseniaEncriptada.Name = "colContraseniaEncriptada";
            this.colContraseniaEncriptada.ReadOnly = true;
            // 
            // colPermisos
            // 
            this.colPermisos.HeaderText = "Permisos";
            this.colPermisos.Name = "colPermisos";
            this.colPermisos.ReadOnly = true;
            // 
            // UsuarioHistorialForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.dgvUsuarios);
            this.Name = "UsuarioHistorialForm";
            this.Text = "Control de cambios de usuarios";
            this.Load += new System.EventHandler(this.UsuarioHistorialForm_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvUsuarios)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvUsuarios;
        private System.Windows.Forms.DataGridViewTextBoxColumn colFecha;
        private System.Windows.Forms.DataGridViewTextBoxColumn colIdUsuario;
        private System.Windows.Forms.DataGridViewTextBoxColumn colNombre;
        private System.Windows.Forms.DataGridViewTextBoxColumn colIdioma;
        private System.Windows.Forms.DataGridViewTextBoxColumn colNombreUsuario;
        private System.Windows.Forms.DataGridViewTextBoxColumn colContraseniaEncriptada;
        private System.Windows.Forms.DataGridViewTextBoxColumn colPermisos;
    }
}