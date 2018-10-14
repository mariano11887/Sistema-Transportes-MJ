namespace UI
{
    partial class IdiomasForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(IdiomasForm));
            this.lstIdiomasActuales = new System.Windows.Forms.ListBox();
            this.grpLeyendas = new System.Windows.Forms.GroupBox();
            this.dgvLeyendas = new System.Windows.Forms.DataGridView();
            this.btnCrearNuevo = new System.Windows.Forms.Button();
            this.lblIdiomasActuales = new System.Windows.Forms.Label();
            this.grpDetalles = new System.Windows.Forms.GroupBox();
            this.btnDescartar = new System.Windows.Forms.Button();
            this.btnGuardar = new System.Windows.Forms.Button();
            this.txtNombre = new System.Windows.Forms.TextBox();
            this.lblNombre = new System.Windows.Forms.Label();
            this.btnEditar = new System.Windows.Forms.Button();
            this.btnEliminar = new System.Windows.Forms.Button();
            this.colIdentifiador = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTextoEspaniol = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTextoIdioma = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.grpLeyendas.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvLeyendas)).BeginInit();
            this.grpDetalles.SuspendLayout();
            this.SuspendLayout();
            // 
            // lstIdiomasActuales
            // 
            this.lstIdiomasActuales.FormattingEnabled = true;
            this.lstIdiomasActuales.Location = new System.Drawing.Point(12, 25);
            this.lstIdiomasActuales.Name = "lstIdiomasActuales";
            this.lstIdiomasActuales.Size = new System.Drawing.Size(90, 108);
            this.lstIdiomasActuales.TabIndex = 0;
            this.lstIdiomasActuales.SelectedIndexChanged += new System.EventHandler(this.lstIdiomasActuales_SelectedIndexChanged);
            // 
            // grpLeyendas
            // 
            this.grpLeyendas.Controls.Add(this.dgvLeyendas);
            this.grpLeyendas.Location = new System.Drawing.Point(10, 43);
            this.grpLeyendas.Name = "grpLeyendas";
            this.grpLeyendas.Size = new System.Drawing.Size(995, 341);
            this.grpLeyendas.TabIndex = 1;
            this.grpLeyendas.TabStop = false;
            this.grpLeyendas.Text = "Leyendas";
            // 
            // dgvLeyendas
            // 
            this.dgvLeyendas.AllowUserToAddRows = false;
            this.dgvLeyendas.AllowUserToDeleteRows = false;
            this.dgvLeyendas.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvLeyendas.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllHeaders;
            this.dgvLeyendas.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvLeyendas.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colIdentifiador,
            this.colTextoEspaniol,
            this.colTextoIdioma});
            this.dgvLeyendas.Location = new System.Drawing.Point(7, 20);
            this.dgvLeyendas.Name = "dgvLeyendas";
            this.dgvLeyendas.Size = new System.Drawing.Size(982, 315);
            this.dgvLeyendas.TabIndex = 0;
            // 
            // btnCrearNuevo
            // 
            this.btnCrearNuevo.Location = new System.Drawing.Point(13, 140);
            this.btnCrearNuevo.Name = "btnCrearNuevo";
            this.btnCrearNuevo.Size = new System.Drawing.Size(89, 23);
            this.btnCrearNuevo.TabIndex = 1;
            this.btnCrearNuevo.Text = "Crear nuevo";
            this.btnCrearNuevo.UseVisualStyleBackColor = true;
            this.btnCrearNuevo.Click += new System.EventHandler(this.btnCrearNuevo_Click);
            // 
            // lblIdiomasActuales
            // 
            this.lblIdiomasActuales.AutoSize = true;
            this.lblIdiomasActuales.Location = new System.Drawing.Point(12, 9);
            this.lblIdiomasActuales.Name = "lblIdiomasActuales";
            this.lblIdiomasActuales.Size = new System.Drawing.Size(86, 13);
            this.lblIdiomasActuales.TabIndex = 2;
            this.lblIdiomasActuales.Text = "Idiomas actuales";
            // 
            // grpDetalles
            // 
            this.grpDetalles.Controls.Add(this.btnDescartar);
            this.grpDetalles.Controls.Add(this.btnGuardar);
            this.grpDetalles.Controls.Add(this.txtNombre);
            this.grpDetalles.Controls.Add(this.lblNombre);
            this.grpDetalles.Controls.Add(this.grpLeyendas);
            this.grpDetalles.Location = new System.Drawing.Point(123, 9);
            this.grpDetalles.Name = "grpDetalles";
            this.grpDetalles.Size = new System.Drawing.Size(1011, 429);
            this.grpDetalles.TabIndex = 3;
            this.grpDetalles.TabStop = false;
            this.grpDetalles.Text = "Detalles";
            // 
            // btnDescartar
            // 
            this.btnDescartar.Location = new System.Drawing.Point(930, 391);
            this.btnDescartar.Name = "btnDescartar";
            this.btnDescartar.Size = new System.Drawing.Size(75, 23);
            this.btnDescartar.TabIndex = 3;
            this.btnDescartar.Text = "Descartar";
            this.btnDescartar.UseVisualStyleBackColor = true;
            this.btnDescartar.Click += new System.EventHandler(this.btnDescartar_Click);
            // 
            // btnGuardar
            // 
            this.btnGuardar.Location = new System.Drawing.Point(17, 391);
            this.btnGuardar.Name = "btnGuardar";
            this.btnGuardar.Size = new System.Drawing.Size(75, 23);
            this.btnGuardar.TabIndex = 2;
            this.btnGuardar.Text = "Guardar";
            this.btnGuardar.UseVisualStyleBackColor = true;
            this.btnGuardar.Click += new System.EventHandler(this.btnGuardar_Click);
            // 
            // txtNombre
            // 
            this.txtNombre.Enabled = false;
            this.txtNombre.Location = new System.Drawing.Point(57, 17);
            this.txtNombre.Name = "txtNombre";
            this.txtNombre.Size = new System.Drawing.Size(174, 20);
            this.txtNombre.TabIndex = 1;
            // 
            // lblNombre
            // 
            this.lblNombre.AutoSize = true;
            this.lblNombre.Location = new System.Drawing.Point(7, 20);
            this.lblNombre.Name = "lblNombre";
            this.lblNombre.Size = new System.Drawing.Size(44, 13);
            this.lblNombre.TabIndex = 0;
            this.lblNombre.Text = "Nombre";
            // 
            // btnEditar
            // 
            this.btnEditar.Enabled = false;
            this.btnEditar.Location = new System.Drawing.Point(12, 169);
            this.btnEditar.Name = "btnEditar";
            this.btnEditar.Size = new System.Drawing.Size(90, 23);
            this.btnEditar.TabIndex = 4;
            this.btnEditar.Text = "Editar";
            this.btnEditar.UseVisualStyleBackColor = true;
            // 
            // btnEliminar
            // 
            this.btnEliminar.Enabled = false;
            this.btnEliminar.Location = new System.Drawing.Point(12, 198);
            this.btnEliminar.Name = "btnEliminar";
            this.btnEliminar.Size = new System.Drawing.Size(90, 23);
            this.btnEliminar.TabIndex = 5;
            this.btnEliminar.Text = "Eliminar";
            this.btnEliminar.UseVisualStyleBackColor = true;
            // 
            // colIdentifiador
            // 
            this.colIdentifiador.HeaderText = "Identificador";
            this.colIdentifiador.Name = "colIdentifiador";
            this.colIdentifiador.ReadOnly = true;
            // 
            // colTextoEspaniol
            // 
            this.colTextoEspaniol.HeaderText = "Texto en Español";
            this.colTextoEspaniol.Name = "colTextoEspaniol";
            this.colTextoEspaniol.ReadOnly = true;
            // 
            // colTextoIdioma
            // 
            this.colTextoIdioma.HeaderText = "Texto en idioma seleccionado";
            this.colTextoIdioma.Name = "colTextoIdioma";
            this.colTextoIdioma.ReadOnly = true;
            // 
            // IdiomasForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1140, 450);
            this.Controls.Add(this.btnEliminar);
            this.Controls.Add(this.btnEditar);
            this.Controls.Add(this.grpDetalles);
            this.Controls.Add(this.lblIdiomasActuales);
            this.Controls.Add(this.btnCrearNuevo);
            this.Controls.Add(this.lstIdiomasActuales);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "IdiomasForm";
            this.Text = "Idiomas";
            this.Load += new System.EventHandler(this.IdiomasForm_Load);
            this.grpLeyendas.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvLeyendas)).EndInit();
            this.grpDetalles.ResumeLayout(false);
            this.grpDetalles.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ListBox lstIdiomasActuales;
        private System.Windows.Forms.GroupBox grpLeyendas;
        private System.Windows.Forms.DataGridView dgvLeyendas;
        private System.Windows.Forms.Button btnCrearNuevo;
        private System.Windows.Forms.Label lblIdiomasActuales;
        private System.Windows.Forms.GroupBox grpDetalles;
        private System.Windows.Forms.TextBox txtNombre;
        private System.Windows.Forms.Label lblNombre;
        private System.Windows.Forms.Button btnDescartar;
        private System.Windows.Forms.Button btnGuardar;
        private System.Windows.Forms.Button btnEditar;
        private System.Windows.Forms.Button btnEliminar;
        private System.Windows.Forms.DataGridViewTextBoxColumn colIdentifiador;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTextoEspaniol;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTextoIdioma;
    }
}