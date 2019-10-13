namespace UI
{
    partial class PlanillasHorariasForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(PlanillasHorariasForm));
            this.grpBuscarPlanillas = new System.Windows.Forms.GroupBox();
            this.chkFecha = new System.Windows.Forms.CheckBox();
            this.txtNumeroPlanilla = new System.Windows.Forms.TextBox();
            this.lblNumeroDePlanilla = new System.Windows.Forms.Label();
            this.btnBuscar = new System.Windows.Forms.Button();
            this.lblRecorrido = new System.Windows.Forms.Label();
            this.cmbRecorrido = new System.Windows.Forms.ComboBox();
            this.lblCoche = new System.Windows.Forms.Label();
            this.cmbCoche = new System.Windows.Forms.ComboBox();
            this.lblFecha = new System.Windows.Forms.Label();
            this.dtpFecha = new System.Windows.Forms.DateTimePicker();
            this.lblChofer = new System.Windows.Forms.Label();
            this.cmbChofer = new System.Windows.Forms.ComboBox();
            this.dgvResultadoBusqueda = new System.Windows.Forms.DataGridView();
            this.grpGenerarPlanillas = new System.Windows.Forms.GroupBox();
            this.btnGenerarPlanillas = new System.Windows.Forms.Button();
            this.lblUltimaPlanillaInfo = new System.Windows.Forms.Label();
            this.colNumeroPlanilla = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colFecha = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colChofer = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colCoche = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colRecorrido = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colDetalles = new System.Windows.Forms.DataGridViewButtonColumn();
            this.colPlanilla = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.grpBuscarPlanillas.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvResultadoBusqueda)).BeginInit();
            this.grpGenerarPlanillas.SuspendLayout();
            this.SuspendLayout();
            // 
            // grpBuscarPlanillas
            // 
            this.grpBuscarPlanillas.Controls.Add(this.chkFecha);
            this.grpBuscarPlanillas.Controls.Add(this.txtNumeroPlanilla);
            this.grpBuscarPlanillas.Controls.Add(this.lblNumeroDePlanilla);
            this.grpBuscarPlanillas.Controls.Add(this.btnBuscar);
            this.grpBuscarPlanillas.Controls.Add(this.lblRecorrido);
            this.grpBuscarPlanillas.Controls.Add(this.cmbRecorrido);
            this.grpBuscarPlanillas.Controls.Add(this.lblCoche);
            this.grpBuscarPlanillas.Controls.Add(this.cmbCoche);
            this.grpBuscarPlanillas.Controls.Add(this.lblFecha);
            this.grpBuscarPlanillas.Controls.Add(this.dtpFecha);
            this.grpBuscarPlanillas.Controls.Add(this.lblChofer);
            this.grpBuscarPlanillas.Controls.Add(this.cmbChofer);
            this.grpBuscarPlanillas.Location = new System.Drawing.Point(13, 13);
            this.grpBuscarPlanillas.Name = "grpBuscarPlanillas";
            this.grpBuscarPlanillas.Size = new System.Drawing.Size(292, 182);
            this.grpBuscarPlanillas.TabIndex = 0;
            this.grpBuscarPlanillas.TabStop = false;
            this.grpBuscarPlanillas.Text = "Buscar planillas";
            // 
            // chkFecha
            // 
            this.chkFecha.AutoSize = true;
            this.chkFecha.Location = new System.Drawing.Point(86, 50);
            this.chkFecha.Name = "chkFecha";
            this.chkFecha.Size = new System.Drawing.Size(15, 14);
            this.chkFecha.TabIndex = 10;
            this.chkFecha.UseVisualStyleBackColor = true;
            this.chkFecha.CheckedChanged += new System.EventHandler(this.ChkFecha_CheckedChanged);
            // 
            // txtNumeroPlanilla
            // 
            this.txtNumeroPlanilla.Location = new System.Drawing.Point(86, 19);
            this.txtNumeroPlanilla.Name = "txtNumeroPlanilla";
            this.txtNumeroPlanilla.Size = new System.Drawing.Size(200, 20);
            this.txtNumeroPlanilla.TabIndex = 1;
            this.txtNumeroPlanilla.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.TxtNumeroPlanilla_KeyPress);
            // 
            // lblNumeroDePlanilla
            // 
            this.lblNumeroDePlanilla.AutoSize = true;
            this.lblNumeroDePlanilla.Location = new System.Drawing.Point(11, 22);
            this.lblNumeroDePlanilla.Name = "lblNumeroDePlanilla";
            this.lblNumeroDePlanilla.Size = new System.Drawing.Size(69, 13);
            this.lblNumeroDePlanilla.TabIndex = 9;
            this.lblNumeroDePlanilla.Text = "N° de planilla";
            // 
            // btnBuscar
            // 
            this.btnBuscar.Location = new System.Drawing.Point(125, 152);
            this.btnBuscar.Name = "btnBuscar";
            this.btnBuscar.Size = new System.Drawing.Size(75, 23);
            this.btnBuscar.TabIndex = 6;
            this.btnBuscar.Text = "Buscar";
            this.btnBuscar.UseVisualStyleBackColor = true;
            this.btnBuscar.Click += new System.EventHandler(this.BtnBuscar_Click);
            // 
            // lblRecorrido
            // 
            this.lblRecorrido.AutoSize = true;
            this.lblRecorrido.Location = new System.Drawing.Point(27, 128);
            this.lblRecorrido.Name = "lblRecorrido";
            this.lblRecorrido.Size = new System.Drawing.Size(53, 13);
            this.lblRecorrido.TabIndex = 7;
            this.lblRecorrido.Text = "Recorrido";
            // 
            // cmbRecorrido
            // 
            this.cmbRecorrido.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbRecorrido.FormattingEnabled = true;
            this.cmbRecorrido.Location = new System.Drawing.Point(86, 125);
            this.cmbRecorrido.Name = "cmbRecorrido";
            this.cmbRecorrido.Size = new System.Drawing.Size(200, 21);
            this.cmbRecorrido.TabIndex = 5;
            // 
            // lblCoche
            // 
            this.lblCoche.AutoSize = true;
            this.lblCoche.Location = new System.Drawing.Point(42, 101);
            this.lblCoche.Name = "lblCoche";
            this.lblCoche.Size = new System.Drawing.Size(38, 13);
            this.lblCoche.TabIndex = 5;
            this.lblCoche.Text = "Coche";
            // 
            // cmbCoche
            // 
            this.cmbCoche.DisplayMember = "Patente";
            this.cmbCoche.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCoche.FormattingEnabled = true;
            this.cmbCoche.Location = new System.Drawing.Point(86, 98);
            this.cmbCoche.Name = "cmbCoche";
            this.cmbCoche.Size = new System.Drawing.Size(200, 21);
            this.cmbCoche.TabIndex = 4;
            // 
            // lblFecha
            // 
            this.lblFecha.AutoSize = true;
            this.lblFecha.Location = new System.Drawing.Point(43, 51);
            this.lblFecha.Name = "lblFecha";
            this.lblFecha.Size = new System.Drawing.Size(37, 13);
            this.lblFecha.TabIndex = 3;
            this.lblFecha.Text = "Fecha";
            // 
            // dtpFecha
            // 
            this.dtpFecha.Enabled = false;
            this.dtpFecha.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpFecha.Location = new System.Drawing.Point(107, 45);
            this.dtpFecha.Name = "dtpFecha";
            this.dtpFecha.Size = new System.Drawing.Size(179, 20);
            this.dtpFecha.TabIndex = 2;
            // 
            // lblChofer
            // 
            this.lblChofer.AutoSize = true;
            this.lblChofer.Location = new System.Drawing.Point(42, 74);
            this.lblChofer.Name = "lblChofer";
            this.lblChofer.Size = new System.Drawing.Size(38, 13);
            this.lblChofer.TabIndex = 1;
            this.lblChofer.Text = "Chofer";
            // 
            // cmbChofer
            // 
            this.cmbChofer.DisplayMember = "Nombre";
            this.cmbChofer.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbChofer.FormattingEnabled = true;
            this.cmbChofer.Location = new System.Drawing.Point(86, 71);
            this.cmbChofer.Name = "cmbChofer";
            this.cmbChofer.Size = new System.Drawing.Size(200, 21);
            this.cmbChofer.TabIndex = 3;
            // 
            // dgvResultadoBusqueda
            // 
            this.dgvResultadoBusqueda.AllowUserToAddRows = false;
            this.dgvResultadoBusqueda.AllowUserToDeleteRows = false;
            this.dgvResultadoBusqueda.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvResultadoBusqueda.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colNumeroPlanilla,
            this.colFecha,
            this.colChofer,
            this.colCoche,
            this.colRecorrido,
            this.colDetalles,
            this.colPlanilla});
            this.dgvResultadoBusqueda.Location = new System.Drawing.Point(13, 201);
            this.dgvResultadoBusqueda.Name = "dgvResultadoBusqueda";
            this.dgvResultadoBusqueda.ReadOnly = true;
            this.dgvResultadoBusqueda.Size = new System.Drawing.Size(722, 237);
            this.dgvResultadoBusqueda.TabIndex = 1;
            // 
            // grpGenerarPlanillas
            // 
            this.grpGenerarPlanillas.Controls.Add(this.btnGenerarPlanillas);
            this.grpGenerarPlanillas.Controls.Add(this.lblUltimaPlanillaInfo);
            this.grpGenerarPlanillas.Location = new System.Drawing.Point(322, 13);
            this.grpGenerarPlanillas.Name = "grpGenerarPlanillas";
            this.grpGenerarPlanillas.Size = new System.Drawing.Size(413, 182);
            this.grpGenerarPlanillas.TabIndex = 2;
            this.grpGenerarPlanillas.TabStop = false;
            this.grpGenerarPlanillas.Text = "Generar planillas";
            // 
            // btnGenerarPlanillas
            // 
            this.btnGenerarPlanillas.Location = new System.Drawing.Point(121, 88);
            this.btnGenerarPlanillas.Name = "btnGenerarPlanillas";
            this.btnGenerarPlanillas.Size = new System.Drawing.Size(163, 38);
            this.btnGenerarPlanillas.TabIndex = 7;
            this.btnGenerarPlanillas.Text = "Generar planillas para el 21/6/2018";
            this.btnGenerarPlanillas.UseVisualStyleBackColor = true;
            this.btnGenerarPlanillas.Click += new System.EventHandler(this.BtnGenerarPlanillas_Click);
            // 
            // lblUltimaPlanillaInfo
            // 
            this.lblUltimaPlanillaInfo.AutoSize = true;
            this.lblUltimaPlanillaInfo.Location = new System.Drawing.Point(47, 52);
            this.lblUltimaPlanillaInfo.Name = "lblUltimaPlanillaInfo";
            this.lblUltimaPlanillaInfo.Size = new System.Drawing.Size(308, 13);
            this.lblUltimaPlanillaInfo.TabIndex = 0;
            this.lblUltimaPlanillaInfo.Text = "Las últimas planillas generadas corresponden al día 20/6/2018.";
            // 
            // colNumeroPlanilla
            // 
            this.colNumeroPlanilla.DataPropertyName = "Id";
            this.colNumeroPlanilla.HeaderText = "N° planilla";
            this.colNumeroPlanilla.Name = "colNumeroPlanilla";
            this.colNumeroPlanilla.ReadOnly = true;
            // 
            // colFecha
            // 
            this.colFecha.DataPropertyName = "Fecha";
            this.colFecha.HeaderText = "Fecha";
            this.colFecha.Name = "colFecha";
            this.colFecha.ReadOnly = true;
            // 
            // colChofer
            // 
            this.colChofer.DataPropertyName = "Chofer";
            this.colChofer.HeaderText = "Chofer";
            this.colChofer.Name = "colChofer";
            this.colChofer.ReadOnly = true;
            // 
            // colCoche
            // 
            this.colCoche.DataPropertyName = "Vehiculo";
            this.colCoche.HeaderText = "Coche";
            this.colCoche.Name = "colCoche";
            this.colCoche.ReadOnly = true;
            // 
            // colRecorrido
            // 
            this.colRecorrido.DataPropertyName = "Recorrido";
            this.colRecorrido.HeaderText = "Recorrido";
            this.colRecorrido.Name = "colRecorrido";
            this.colRecorrido.ReadOnly = true;
            // 
            // colDetalles
            // 
            this.colDetalles.DataPropertyName = "Detalles";
            this.colDetalles.HeaderText = "Detalles";
            this.colDetalles.Name = "colDetalles";
            this.colDetalles.ReadOnly = true;
            this.colDetalles.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.colDetalles.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.colDetalles.Text = "";
            // 
            // colPlanilla
            // 
            this.colPlanilla.DataPropertyName = "Planilla";
            this.colPlanilla.HeaderText = "Planilla";
            this.colPlanilla.Name = "colPlanilla";
            this.colPlanilla.ReadOnly = true;
            this.colPlanilla.Visible = false;
            // 
            // PlanillasHorariasForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(750, 450);
            this.Controls.Add(this.grpGenerarPlanillas);
            this.Controls.Add(this.dgvResultadoBusqueda);
            this.Controls.Add(this.grpBuscarPlanillas);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "PlanillasHorariasForm";
            this.Text = "Planillas Horarias";
            this.Load += new System.EventHandler(this.PlanillasHorariasForm_Load);
            this.grpBuscarPlanillas.ResumeLayout(false);
            this.grpBuscarPlanillas.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvResultadoBusqueda)).EndInit();
            this.grpGenerarPlanillas.ResumeLayout(false);
            this.grpGenerarPlanillas.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox grpBuscarPlanillas;
        private System.Windows.Forms.Button btnBuscar;
        private System.Windows.Forms.Label lblRecorrido;
        private System.Windows.Forms.ComboBox cmbRecorrido;
        private System.Windows.Forms.Label lblCoche;
        private System.Windows.Forms.ComboBox cmbCoche;
        private System.Windows.Forms.Label lblFecha;
        private System.Windows.Forms.DateTimePicker dtpFecha;
        private System.Windows.Forms.Label lblChofer;
        private System.Windows.Forms.ComboBox cmbChofer;
        private System.Windows.Forms.DataGridView dgvResultadoBusqueda;
        private System.Windows.Forms.GroupBox grpGenerarPlanillas;
        private System.Windows.Forms.Button btnGenerarPlanillas;
        private System.Windows.Forms.Label lblUltimaPlanillaInfo;
        private System.Windows.Forms.TextBox txtNumeroPlanilla;
        private System.Windows.Forms.Label lblNumeroDePlanilla;
        private System.Windows.Forms.CheckBox chkFecha;
        private System.Windows.Forms.DataGridViewTextBoxColumn colNumeroPlanilla;
        private System.Windows.Forms.DataGridViewTextBoxColumn colFecha;
        private System.Windows.Forms.DataGridViewTextBoxColumn colChofer;
        private System.Windows.Forms.DataGridViewTextBoxColumn colCoche;
        private System.Windows.Forms.DataGridViewTextBoxColumn colRecorrido;
        private System.Windows.Forms.DataGridViewButtonColumn colDetalles;
        private System.Windows.Forms.DataGridViewTextBoxColumn colPlanilla;
    }
}