namespace UI
{
    partial class ChoferesForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ChoferesForm));
            this.grpBuscarChoferes = new System.Windows.Forms.GroupBox();
            this.btnBuscar = new System.Windows.Forms.Button();
            this.cmbCochePreferidoBusqueda = new System.Windows.Forms.ComboBox();
            this.lblCochePreferidoBusqueda = new System.Windows.Forms.Label();
            this.cmbDeLicencia = new System.Windows.Forms.ComboBox();
            this.lblDeLicencia = new System.Windows.Forms.Label();
            this.txtDniBusqueda = new System.Windows.Forms.TextBox();
            this.lblDniBusqueda = new System.Windows.Forms.Label();
            this.txtNombreBusqueda = new System.Windows.Forms.TextBox();
            this.lblNombreBusqueda = new System.Windows.Forms.Label();
            this.btnNuevo = new System.Windows.Forms.Button();
            this.lblResultadoBusqueda = new System.Windows.Forms.Label();
            this.lstResultadoBusqueda = new System.Windows.Forms.ListView();
            this.btnEditar = new System.Windows.Forms.Button();
            this.btnEliminar = new System.Windows.Forms.Button();
            this.grpDetalles = new System.Windows.Forms.GroupBox();
            this.cmbCochePreferidoDetalle = new System.Windows.Forms.ComboBox();
            this.lblCochePreferidoDetalle = new System.Windows.Forms.Label();
            this.txtNombreDetalle = new System.Windows.Forms.TextBox();
            this.lblNombreDetalle = new System.Windows.Forms.Label();
            this.txtDniDetalle = new System.Windows.Forms.TextBox();
            this.lblDniDetalle = new System.Windows.Forms.Label();
            this.btnDescartar = new System.Windows.Forms.Button();
            this.btnGuardarChofer = new System.Windows.Forms.Button();
            this.dtpFechaFinLicencia = new System.Windows.Forms.DateTimePicker();
            this.lblFechaFinLicencia = new System.Windows.Forms.Label();
            this.btnCargarLicencia = new System.Windows.Forms.Button();
            this.grpLicencias = new System.Windows.Forms.GroupBox();
            this.btnGuardarLicencia = new System.Windows.Forms.Button();
            this.grpBuscarChoferes.SuspendLayout();
            this.grpDetalles.SuspendLayout();
            this.grpLicencias.SuspendLayout();
            this.SuspendLayout();
            // 
            // grpBuscarChoferes
            // 
            this.grpBuscarChoferes.Controls.Add(this.btnBuscar);
            this.grpBuscarChoferes.Controls.Add(this.cmbCochePreferidoBusqueda);
            this.grpBuscarChoferes.Controls.Add(this.lblCochePreferidoBusqueda);
            this.grpBuscarChoferes.Controls.Add(this.cmbDeLicencia);
            this.grpBuscarChoferes.Controls.Add(this.lblDeLicencia);
            this.grpBuscarChoferes.Controls.Add(this.txtDniBusqueda);
            this.grpBuscarChoferes.Controls.Add(this.lblDniBusqueda);
            this.grpBuscarChoferes.Controls.Add(this.txtNombreBusqueda);
            this.grpBuscarChoferes.Controls.Add(this.lblNombreBusqueda);
            this.grpBuscarChoferes.Location = new System.Drawing.Point(13, 13);
            this.grpBuscarChoferes.Name = "grpBuscarChoferes";
            this.grpBuscarChoferes.Size = new System.Drawing.Size(241, 179);
            this.grpBuscarChoferes.TabIndex = 0;
            this.grpBuscarChoferes.TabStop = false;
            this.grpBuscarChoferes.Text = "Buscar choferes";
            // 
            // btnBuscar
            // 
            this.btnBuscar.Location = new System.Drawing.Point(77, 139);
            this.btnBuscar.Name = "btnBuscar";
            this.btnBuscar.Size = new System.Drawing.Size(88, 23);
            this.btnBuscar.TabIndex = 8;
            this.btnBuscar.Text = "Buscar";
            this.btnBuscar.UseVisualStyleBackColor = true;
            this.btnBuscar.Click += new System.EventHandler(this.BtnBuscar_Click);
            // 
            // cmbCochePreferidoBusqueda
            // 
            this.cmbCochePreferidoBusqueda.DisplayMember = "Patente";
            this.cmbCochePreferidoBusqueda.FormattingEnabled = true;
            this.cmbCochePreferidoBusqueda.Location = new System.Drawing.Point(95, 99);
            this.cmbCochePreferidoBusqueda.Name = "cmbCochePreferidoBusqueda";
            this.cmbCochePreferidoBusqueda.Size = new System.Drawing.Size(135, 21);
            this.cmbCochePreferidoBusqueda.TabIndex = 7;
            // 
            // lblCochePreferidoBusqueda
            // 
            this.lblCochePreferidoBusqueda.AutoSize = true;
            this.lblCochePreferidoBusqueda.Location = new System.Drawing.Point(7, 102);
            this.lblCochePreferidoBusqueda.Name = "lblCochePreferidoBusqueda";
            this.lblCochePreferidoBusqueda.Size = new System.Drawing.Size(82, 13);
            this.lblCochePreferidoBusqueda.TabIndex = 6;
            this.lblCochePreferidoBusqueda.Text = "Coche preferido";
            // 
            // cmbDeLicencia
            // 
            this.cmbDeLicencia.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbDeLicencia.FormattingEnabled = true;
            this.cmbDeLicencia.Location = new System.Drawing.Point(95, 72);
            this.cmbDeLicencia.Name = "cmbDeLicencia";
            this.cmbDeLicencia.Size = new System.Drawing.Size(135, 21);
            this.cmbDeLicencia.TabIndex = 5;
            // 
            // lblDeLicencia
            // 
            this.lblDeLicencia.AutoSize = true;
            this.lblDeLicencia.Location = new System.Drawing.Point(29, 75);
            this.lblDeLicencia.Name = "lblDeLicencia";
            this.lblDeLicencia.Size = new System.Drawing.Size(60, 13);
            this.lblDeLicencia.TabIndex = 4;
            this.lblDeLicencia.Text = "De licencia";
            // 
            // txtDniBusqueda
            // 
            this.txtDniBusqueda.Location = new System.Drawing.Point(95, 46);
            this.txtDniBusqueda.Name = "txtDniBusqueda";
            this.txtDniBusqueda.Size = new System.Drawing.Size(135, 20);
            this.txtDniBusqueda.TabIndex = 3;
            this.txtDniBusqueda.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.TxtDniBusqueda_KeyPress);
            // 
            // lblDniBusqueda
            // 
            this.lblDniBusqueda.AutoSize = true;
            this.lblDniBusqueda.Location = new System.Drawing.Point(63, 49);
            this.lblDniBusqueda.Name = "lblDniBusqueda";
            this.lblDniBusqueda.Size = new System.Drawing.Size(26, 13);
            this.lblDniBusqueda.TabIndex = 2;
            this.lblDniBusqueda.Text = "DNI";
            // 
            // txtNombreBusqueda
            // 
            this.txtNombreBusqueda.Location = new System.Drawing.Point(95, 20);
            this.txtNombreBusqueda.Name = "txtNombreBusqueda";
            this.txtNombreBusqueda.Size = new System.Drawing.Size(135, 20);
            this.txtNombreBusqueda.TabIndex = 1;
            // 
            // lblNombreBusqueda
            // 
            this.lblNombreBusqueda.AutoSize = true;
            this.lblNombreBusqueda.Location = new System.Drawing.Point(45, 23);
            this.lblNombreBusqueda.Name = "lblNombreBusqueda";
            this.lblNombreBusqueda.Size = new System.Drawing.Size(44, 13);
            this.lblNombreBusqueda.TabIndex = 0;
            this.lblNombreBusqueda.Text = "Nombre";
            // 
            // btnNuevo
            // 
            this.btnNuevo.Location = new System.Drawing.Point(61, 199);
            this.btnNuevo.Name = "btnNuevo";
            this.btnNuevo.Size = new System.Drawing.Size(134, 23);
            this.btnNuevo.TabIndex = 1;
            this.btnNuevo.Text = "Nuevo";
            this.btnNuevo.UseVisualStyleBackColor = true;
            this.btnNuevo.Click += new System.EventHandler(this.BtnNuevo_Click);
            // 
            // lblResultadoBusqueda
            // 
            this.lblResultadoBusqueda.AutoSize = true;
            this.lblResultadoBusqueda.Location = new System.Drawing.Point(261, 13);
            this.lblResultadoBusqueda.Name = "lblResultadoBusqueda";
            this.lblResultadoBusqueda.Size = new System.Drawing.Size(131, 13);
            this.lblResultadoBusqueda.TabIndex = 2;
            this.lblResultadoBusqueda.Text = "Resultado de la búsqueda";
            // 
            // lstResultadoBusqueda
            // 
            this.lstResultadoBusqueda.HideSelection = false;
            this.lstResultadoBusqueda.Location = new System.Drawing.Point(261, 30);
            this.lstResultadoBusqueda.MultiSelect = false;
            this.lstResultadoBusqueda.Name = "lstResultadoBusqueda";
            this.lstResultadoBusqueda.Size = new System.Drawing.Size(474, 162);
            this.lstResultadoBusqueda.TabIndex = 3;
            this.lstResultadoBusqueda.UseCompatibleStateImageBehavior = false;
            this.lstResultadoBusqueda.View = System.Windows.Forms.View.List;
            this.lstResultadoBusqueda.SelectedIndexChanged += new System.EventHandler(this.LstResultadoBusqueda_SelectedIndexChanged);
            // 
            // btnEditar
            // 
            this.btnEditar.Location = new System.Drawing.Point(264, 199);
            this.btnEditar.Name = "btnEditar";
            this.btnEditar.Size = new System.Drawing.Size(75, 23);
            this.btnEditar.TabIndex = 11;
            this.btnEditar.Text = "Editar";
            this.btnEditar.UseVisualStyleBackColor = true;
            this.btnEditar.Click += new System.EventHandler(this.BtnEditar_Click);
            // 
            // btnEliminar
            // 
            this.btnEliminar.Location = new System.Drawing.Point(659, 199);
            this.btnEliminar.Name = "btnEliminar";
            this.btnEliminar.Size = new System.Drawing.Size(75, 23);
            this.btnEliminar.TabIndex = 12;
            this.btnEliminar.Text = "Eliminar";
            this.btnEliminar.UseVisualStyleBackColor = true;
            this.btnEliminar.Click += new System.EventHandler(this.BtnEliminar_Click);
            // 
            // grpDetalles
            // 
            this.grpDetalles.Controls.Add(this.cmbCochePreferidoDetalle);
            this.grpDetalles.Controls.Add(this.lblCochePreferidoDetalle);
            this.grpDetalles.Controls.Add(this.txtNombreDetalle);
            this.grpDetalles.Controls.Add(this.lblNombreDetalle);
            this.grpDetalles.Controls.Add(this.txtDniDetalle);
            this.grpDetalles.Controls.Add(this.lblDniDetalle);
            this.grpDetalles.Controls.Add(this.btnDescartar);
            this.grpDetalles.Controls.Add(this.btnGuardarChofer);
            this.grpDetalles.Location = new System.Drawing.Point(12, 228);
            this.grpDetalles.Name = "grpDetalles";
            this.grpDetalles.Size = new System.Drawing.Size(427, 122);
            this.grpDetalles.TabIndex = 13;
            this.grpDetalles.TabStop = false;
            this.grpDetalles.Text = "Detalles";
            // 
            // cmbCochePreferidoDetalle
            // 
            this.cmbCochePreferidoDetalle.DisplayMember = "Patente";
            this.cmbCochePreferidoDetalle.FormattingEnabled = true;
            this.cmbCochePreferidoDetalle.Location = new System.Drawing.Point(128, 46);
            this.cmbCochePreferidoDetalle.Name = "cmbCochePreferidoDetalle";
            this.cmbCochePreferidoDetalle.Size = new System.Drawing.Size(199, 21);
            this.cmbCochePreferidoDetalle.TabIndex = 10;
            this.cmbCochePreferidoDetalle.ValueMember = "Patente";
            // 
            // lblCochePreferidoDetalle
            // 
            this.lblCochePreferidoDetalle.AutoSize = true;
            this.lblCochePreferidoDetalle.Location = new System.Drawing.Point(40, 49);
            this.lblCochePreferidoDetalle.Name = "lblCochePreferidoDetalle";
            this.lblCochePreferidoDetalle.Size = new System.Drawing.Size(82, 13);
            this.lblCochePreferidoDetalle.TabIndex = 9;
            this.lblCochePreferidoDetalle.Text = "Coche preferido";
            // 
            // txtNombreDetalle
            // 
            this.txtNombreDetalle.Location = new System.Drawing.Point(69, 20);
            this.txtNombreDetalle.Name = "txtNombreDetalle";
            this.txtNombreDetalle.Size = new System.Drawing.Size(162, 20);
            this.txtNombreDetalle.TabIndex = 10;
            // 
            // lblNombreDetalle
            // 
            this.lblNombreDetalle.AutoSize = true;
            this.lblNombreDetalle.Location = new System.Drawing.Point(19, 23);
            this.lblNombreDetalle.Name = "lblNombreDetalle";
            this.lblNombreDetalle.Size = new System.Drawing.Size(44, 13);
            this.lblNombreDetalle.TabIndex = 9;
            this.lblNombreDetalle.Text = "Nombre";
            // 
            // txtDniDetalle
            // 
            this.txtDniDetalle.Location = new System.Drawing.Point(277, 20);
            this.txtDniDetalle.Name = "txtDniDetalle";
            this.txtDniDetalle.Size = new System.Drawing.Size(135, 20);
            this.txtDniDetalle.TabIndex = 10;
            this.txtDniDetalle.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.TxtDniDetalle_KeyPress);
            // 
            // lblDniDetalle
            // 
            this.lblDniDetalle.AutoSize = true;
            this.lblDniDetalle.Location = new System.Drawing.Point(245, 23);
            this.lblDniDetalle.Name = "lblDniDetalle";
            this.lblDniDetalle.Size = new System.Drawing.Size(26, 13);
            this.lblDniDetalle.TabIndex = 9;
            this.lblDniDetalle.Text = "DNI";
            // 
            // btnDescartar
            // 
            this.btnDescartar.Location = new System.Drawing.Point(334, 90);
            this.btnDescartar.Name = "btnDescartar";
            this.btnDescartar.Size = new System.Drawing.Size(75, 23);
            this.btnDescartar.TabIndex = 26;
            this.btnDescartar.Text = "Descartar";
            this.btnDescartar.UseVisualStyleBackColor = true;
            this.btnDescartar.Click += new System.EventHandler(this.BtnDescartar_Click);
            // 
            // btnGuardarChofer
            // 
            this.btnGuardarChofer.Location = new System.Drawing.Point(6, 90);
            this.btnGuardarChofer.Name = "btnGuardarChofer";
            this.btnGuardarChofer.Size = new System.Drawing.Size(75, 23);
            this.btnGuardarChofer.TabIndex = 25;
            this.btnGuardarChofer.Text = "Guardar";
            this.btnGuardarChofer.UseVisualStyleBackColor = true;
            this.btnGuardarChofer.Click += new System.EventHandler(this.BtnGuardarChofer_Click);
            // 
            // dtpFechaFinLicencia
            // 
            this.dtpFechaFinLicencia.CustomFormat = " ";
            this.dtpFechaFinLicencia.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpFechaFinLicencia.Location = new System.Drawing.Point(52, 42);
            this.dtpFechaFinLicencia.Name = "dtpFechaFinLicencia";
            this.dtpFechaFinLicencia.Size = new System.Drawing.Size(200, 20);
            this.dtpFechaFinLicencia.TabIndex = 28;
            // 
            // lblFechaFinLicencia
            // 
            this.lblFechaFinLicencia.AutoSize = true;
            this.lblFechaFinLicencia.Location = new System.Drawing.Point(89, 23);
            this.lblFechaFinLicencia.Name = "lblFechaFinLicencia";
            this.lblFechaFinLicencia.Size = new System.Drawing.Size(120, 13);
            this.lblFechaFinLicencia.TabIndex = 29;
            this.lblFechaFinLicencia.Text = "Fecha de fin de licencia";
            // 
            // btnCargarLicencia
            // 
            this.btnCargarLicencia.Location = new System.Drawing.Point(346, 199);
            this.btnCargarLicencia.Name = "btnCargarLicencia";
            this.btnCargarLicencia.Size = new System.Drawing.Size(93, 23);
            this.btnCargarLicencia.TabIndex = 14;
            this.btnCargarLicencia.Text = "Cargar licencia";
            this.btnCargarLicencia.UseVisualStyleBackColor = true;
            this.btnCargarLicencia.Click += new System.EventHandler(this.BtnCargarLicencia_Click);
            // 
            // grpLicencias
            // 
            this.grpLicencias.Controls.Add(this.btnGuardarLicencia);
            this.grpLicencias.Controls.Add(this.dtpFechaFinLicencia);
            this.grpLicencias.Controls.Add(this.lblFechaFinLicencia);
            this.grpLicencias.Location = new System.Drawing.Point(446, 228);
            this.grpLicencias.Name = "grpLicencias";
            this.grpLicencias.Size = new System.Drawing.Size(289, 122);
            this.grpLicencias.TabIndex = 30;
            this.grpLicencias.TabStop = false;
            this.grpLicencias.Text = "Licencias";
            // 
            // btnGuardarLicencia
            // 
            this.btnGuardarLicencia.Location = new System.Drawing.Point(108, 80);
            this.btnGuardarLicencia.Name = "btnGuardarLicencia";
            this.btnGuardarLicencia.Size = new System.Drawing.Size(75, 23);
            this.btnGuardarLicencia.TabIndex = 27;
            this.btnGuardarLicencia.Text = "Guardar";
            this.btnGuardarLicencia.UseVisualStyleBackColor = true;
            this.btnGuardarLicencia.Click += new System.EventHandler(this.BtnGuardarLicencia_Click);
            // 
            // ChoferesForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(746, 358);
            this.Controls.Add(this.grpLicencias);
            this.Controls.Add(this.btnCargarLicencia);
            this.Controls.Add(this.grpDetalles);
            this.Controls.Add(this.btnEliminar);
            this.Controls.Add(this.btnEditar);
            this.Controls.Add(this.lstResultadoBusqueda);
            this.Controls.Add(this.lblResultadoBusqueda);
            this.Controls.Add(this.btnNuevo);
            this.Controls.Add(this.grpBuscarChoferes);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "ChoferesForm";
            this.Text = "Choferes";
            this.Load += new System.EventHandler(this.ChoferesForm_Load);
            this.grpBuscarChoferes.ResumeLayout(false);
            this.grpBuscarChoferes.PerformLayout();
            this.grpDetalles.ResumeLayout(false);
            this.grpDetalles.PerformLayout();
            this.grpLicencias.ResumeLayout(false);
            this.grpLicencias.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.GroupBox grpBuscarChoferes;
        private System.Windows.Forms.ComboBox cmbCochePreferidoBusqueda;
        private System.Windows.Forms.Label lblCochePreferidoBusqueda;
        private System.Windows.Forms.ComboBox cmbDeLicencia;
        private System.Windows.Forms.Label lblDeLicencia;
        private System.Windows.Forms.TextBox txtDniBusqueda;
        private System.Windows.Forms.Label lblDniBusqueda;
        private System.Windows.Forms.TextBox txtNombreBusqueda;
        private System.Windows.Forms.Label lblNombreBusqueda;
        private System.Windows.Forms.Button btnBuscar;
        private System.Windows.Forms.Button btnNuevo;
        private System.Windows.Forms.Label lblResultadoBusqueda;
        private System.Windows.Forms.ListView lstResultadoBusqueda;
        private System.Windows.Forms.Button btnEditar;
        private System.Windows.Forms.Button btnEliminar;
        private System.Windows.Forms.GroupBox grpDetalles;
        private System.Windows.Forms.Button btnGuardarChofer;
        private System.Windows.Forms.Label lblFechaFinLicencia;
        private System.Windows.Forms.DateTimePicker dtpFechaFinLicencia;
        private System.Windows.Forms.ComboBox cmbCochePreferidoDetalle;
        private System.Windows.Forms.Label lblCochePreferidoDetalle;
        private System.Windows.Forms.TextBox txtNombreDetalle;
        private System.Windows.Forms.Label lblNombreDetalle;
        private System.Windows.Forms.TextBox txtDniDetalle;
        private System.Windows.Forms.Label lblDniDetalle;
        private System.Windows.Forms.Button btnDescartar;
        private System.Windows.Forms.Button btnCargarLicencia;
        private System.Windows.Forms.GroupBox grpLicencias;
        private System.Windows.Forms.Button btnGuardarLicencia;
    }
}