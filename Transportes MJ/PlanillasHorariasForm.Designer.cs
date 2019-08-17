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
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.lblNumeroDePlanilla = new System.Windows.Forms.Label();
            this.btnBuscar = new System.Windows.Forms.Button();
            this.lblRecorrido = new System.Windows.Forms.Label();
            this.comboBox3 = new System.Windows.Forms.ComboBox();
            this.lblCoche = new System.Windows.Forms.Label();
            this.comboBox2 = new System.Windows.Forms.ComboBox();
            this.lblFecha = new System.Windows.Forms.Label();
            this.dateTimePicker1 = new System.Windows.Forms.DateTimePicker();
            this.lblChofer = new System.Windows.Forms.Label();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
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
            this.grpBuscarPlanillas.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvResultadoBusqueda)).BeginInit();
            this.grpGenerarPlanillas.SuspendLayout();
            this.SuspendLayout();
            // 
            // grpBuscarPlanillas
            // 
            this.grpBuscarPlanillas.Controls.Add(this.textBox1);
            this.grpBuscarPlanillas.Controls.Add(this.lblNumeroDePlanilla);
            this.grpBuscarPlanillas.Controls.Add(this.btnBuscar);
            this.grpBuscarPlanillas.Controls.Add(this.lblRecorrido);
            this.grpBuscarPlanillas.Controls.Add(this.comboBox3);
            this.grpBuscarPlanillas.Controls.Add(this.lblCoche);
            this.grpBuscarPlanillas.Controls.Add(this.comboBox2);
            this.grpBuscarPlanillas.Controls.Add(this.lblFecha);
            this.grpBuscarPlanillas.Controls.Add(this.dateTimePicker1);
            this.grpBuscarPlanillas.Controls.Add(this.lblChofer);
            this.grpBuscarPlanillas.Controls.Add(this.comboBox1);
            this.grpBuscarPlanillas.Location = new System.Drawing.Point(13, 13);
            this.grpBuscarPlanillas.Name = "grpBuscarPlanillas";
            this.grpBuscarPlanillas.Size = new System.Drawing.Size(292, 182);
            this.grpBuscarPlanillas.TabIndex = 0;
            this.grpBuscarPlanillas.TabStop = false;
            this.grpBuscarPlanillas.Text = "Buscar planillas";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(86, 19);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(200, 20);
            this.textBox1.TabIndex = 10;
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
            this.btnBuscar.TabIndex = 8;
            this.btnBuscar.Text = "Buscar";
            this.btnBuscar.UseVisualStyleBackColor = true;
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
            // comboBox3
            // 
            this.comboBox3.FormattingEnabled = true;
            this.comboBox3.Location = new System.Drawing.Point(86, 125);
            this.comboBox3.Name = "comboBox3";
            this.comboBox3.Size = new System.Drawing.Size(200, 21);
            this.comboBox3.TabIndex = 6;
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
            // comboBox2
            // 
            this.comboBox2.FormattingEnabled = true;
            this.comboBox2.Location = new System.Drawing.Point(86, 98);
            this.comboBox2.Name = "comboBox2";
            this.comboBox2.Size = new System.Drawing.Size(200, 21);
            this.comboBox2.TabIndex = 4;
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
            // dateTimePicker1
            // 
            this.dateTimePicker1.Location = new System.Drawing.Point(86, 45);
            this.dateTimePicker1.Name = "dateTimePicker1";
            this.dateTimePicker1.Size = new System.Drawing.Size(200, 20);
            this.dateTimePicker1.TabIndex = 2;
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
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(86, 71);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(200, 21);
            this.comboBox1.TabIndex = 0;
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
            this.colDetalles});
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
            this.btnGenerarPlanillas.TabIndex = 1;
            this.btnGenerarPlanillas.Text = "Generar planillas para el 21/6/2018";
            this.btnGenerarPlanillas.UseVisualStyleBackColor = true;
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
            this.colNumeroPlanilla.HeaderText = "N° planilla";
            this.colNumeroPlanilla.Name = "colNumeroPlanilla";
            this.colNumeroPlanilla.ReadOnly = true;
            // 
            // colFecha
            // 
            this.colFecha.HeaderText = "Fecha";
            this.colFecha.Name = "colFecha";
            this.colFecha.ReadOnly = true;
            // 
            // colChofer
            // 
            this.colChofer.HeaderText = "Chofer";
            this.colChofer.Name = "colChofer";
            this.colChofer.ReadOnly = true;
            // 
            // colCoche
            // 
            this.colCoche.HeaderText = "Coche";
            this.colCoche.Name = "colCoche";
            this.colCoche.ReadOnly = true;
            // 
            // colRecorrido
            // 
            this.colRecorrido.HeaderText = "Recorrido";
            this.colRecorrido.Name = "colRecorrido";
            this.colRecorrido.ReadOnly = true;
            // 
            // colDetalles
            // 
            this.colDetalles.HeaderText = "Detalles";
            this.colDetalles.Name = "colDetalles";
            this.colDetalles.ReadOnly = true;
            this.colDetalles.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.colDetalles.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
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
        private System.Windows.Forms.ComboBox comboBox3;
        private System.Windows.Forms.Label lblCoche;
        private System.Windows.Forms.ComboBox comboBox2;
        private System.Windows.Forms.Label lblFecha;
        private System.Windows.Forms.DateTimePicker dateTimePicker1;
        private System.Windows.Forms.Label lblChofer;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.DataGridView dgvResultadoBusqueda;
        private System.Windows.Forms.GroupBox grpGenerarPlanillas;
        private System.Windows.Forms.Button btnGenerarPlanillas;
        private System.Windows.Forms.Label lblUltimaPlanillaInfo;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Label lblNumeroDePlanilla;
        private System.Windows.Forms.DataGridViewTextBoxColumn colNumeroPlanilla;
        private System.Windows.Forms.DataGridViewTextBoxColumn colFecha;
        private System.Windows.Forms.DataGridViewTextBoxColumn colChofer;
        private System.Windows.Forms.DataGridViewTextBoxColumn colCoche;
        private System.Windows.Forms.DataGridViewTextBoxColumn colRecorrido;
        private System.Windows.Forms.DataGridViewButtonColumn colDetalles;
    }
}