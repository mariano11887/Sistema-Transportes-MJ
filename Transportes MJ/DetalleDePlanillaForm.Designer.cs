namespace UI
{
    partial class DetalleDePlanillaForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(DetalleDePlanillaForm));
            this.grpDatos = new System.Windows.Forms.GroupBox();
            this.lblValorCoche = new System.Windows.Forms.Label();
            this.lblValorFecha = new System.Windows.Forms.Label();
            this.lblValorRecorrido = new System.Windows.Forms.Label();
            this.lblValorChofer = new System.Windows.Forms.Label();
            this.lblValorNumeroPlanilla = new System.Windows.Forms.Label();
            this.lblRecorrido = new System.Windows.Forms.Label();
            this.lblCoche = new System.Windows.Forms.Label();
            this.lblChofer = new System.Windows.Forms.Label();
            this.lblFecha = new System.Windows.Forms.Label();
            this.lblNumeroPlanilla = new System.Windows.Forms.Label();
            this.grpViajes = new System.Windows.Forms.GroupBox();
            this.btnImprimir = new System.Windows.Forms.Button();
            this.btnGuardar = new System.Windows.Forms.Button();
            this.dgvViajes = new System.Windows.Forms.DataGridView();
            this.colOrigen = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colHoraSalida = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colDestino = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colHoraEstimadaLlegada = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colHoraRealLlegada = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colCompletado = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.colDensidadPasajeros = new System.Windows.Forms.DataGridViewComboBoxColumn();
            this.colViaje = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.grpDatos.SuspendLayout();
            this.grpViajes.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvViajes)).BeginInit();
            this.SuspendLayout();
            // 
            // grpDatos
            // 
            this.grpDatos.Controls.Add(this.lblValorCoche);
            this.grpDatos.Controls.Add(this.lblValorFecha);
            this.grpDatos.Controls.Add(this.lblValorRecorrido);
            this.grpDatos.Controls.Add(this.lblValorChofer);
            this.grpDatos.Controls.Add(this.lblValorNumeroPlanilla);
            this.grpDatos.Controls.Add(this.lblRecorrido);
            this.grpDatos.Controls.Add(this.lblCoche);
            this.grpDatos.Controls.Add(this.lblChofer);
            this.grpDatos.Controls.Add(this.lblFecha);
            this.grpDatos.Controls.Add(this.lblNumeroPlanilla);
            this.grpDatos.Location = new System.Drawing.Point(13, 13);
            this.grpDatos.Name = "grpDatos";
            this.grpDatos.Size = new System.Drawing.Size(759, 100);
            this.grpDatos.TabIndex = 0;
            this.grpDatos.TabStop = false;
            this.grpDatos.Text = "Datos";
            // 
            // lblValorCoche
            // 
            this.lblValorCoche.AutoSize = true;
            this.lblValorCoche.Location = new System.Drawing.Point(338, 46);
            this.lblValorCoche.Name = "lblValorCoche";
            this.lblValorCoche.Size = new System.Drawing.Size(61, 13);
            this.lblValorCoche.TabIndex = 9;
            this.lblValorCoche.Text = "Interno 107";
            // 
            // lblValorFecha
            // 
            this.lblValorFecha.AutoSize = true;
            this.lblValorFecha.Location = new System.Drawing.Point(337, 20);
            this.lblValorFecha.Name = "lblValorFecha";
            this.lblValorFecha.Size = new System.Drawing.Size(59, 13);
            this.lblValorFecha.TabIndex = 8;
            this.lblValorFecha.Text = "20/6/2018";
            // 
            // lblValorRecorrido
            // 
            this.lblValorRecorrido.AutoSize = true;
            this.lblValorRecorrido.Location = new System.Drawing.Point(78, 72);
            this.lblValorRecorrido.Name = "lblValorRecorrido";
            this.lblValorRecorrido.Size = new System.Drawing.Size(93, 13);
            this.lblValorRecorrido.TabIndex = 7;
            this.lblValorRecorrido.Text = "Línea 219 ramal 3";
            // 
            // lblValorChofer
            // 
            this.lblValorChofer.AutoSize = true;
            this.lblValorChofer.Location = new System.Drawing.Point(60, 46);
            this.lblValorChofer.Name = "lblValorChofer";
            this.lblValorChofer.Size = new System.Drawing.Size(76, 13);
            this.lblValorChofer.TabIndex = 6;
            this.lblValorChofer.Text = "Luciano Cuore";
            // 
            // lblValorNumeroPlanilla
            // 
            this.lblValorNumeroPlanilla.AutoSize = true;
            this.lblValorNumeroPlanilla.Location = new System.Drawing.Point(128, 20);
            this.lblValorNumeroPlanilla.Name = "lblValorNumeroPlanilla";
            this.lblValorNumeroPlanilla.Size = new System.Drawing.Size(31, 13);
            this.lblValorNumeroPlanilla.TabIndex = 5;
            this.lblValorNumeroPlanilla.Text = "1234";
            // 
            // lblRecorrido
            // 
            this.lblRecorrido.AutoSize = true;
            this.lblRecorrido.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblRecorrido.Location = new System.Drawing.Point(6, 72);
            this.lblRecorrido.Name = "lblRecorrido";
            this.lblRecorrido.Size = new System.Drawing.Size(66, 13);
            this.lblRecorrido.TabIndex = 4;
            this.lblRecorrido.Text = "Recorrido:";
            // 
            // lblCoche
            // 
            this.lblCoche.AutoSize = true;
            this.lblCoche.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCoche.Location = new System.Drawing.Point(285, 46);
            this.lblCoche.Name = "lblCoche";
            this.lblCoche.Size = new System.Drawing.Size(47, 13);
            this.lblCoche.TabIndex = 3;
            this.lblCoche.Text = "Coche:";
            // 
            // lblChofer
            // 
            this.lblChofer.AutoSize = true;
            this.lblChofer.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblChofer.Location = new System.Drawing.Point(6, 46);
            this.lblChofer.Name = "lblChofer";
            this.lblChofer.Size = new System.Drawing.Size(48, 13);
            this.lblChofer.TabIndex = 2;
            this.lblChofer.Text = "Chofer:";
            // 
            // lblFecha
            // 
            this.lblFecha.AutoSize = true;
            this.lblFecha.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblFecha.Location = new System.Drawing.Point(285, 20);
            this.lblFecha.Name = "lblFecha";
            this.lblFecha.Size = new System.Drawing.Size(46, 13);
            this.lblFecha.TabIndex = 1;
            this.lblFecha.Text = "Fecha:";
            // 
            // lblNumeroPlanilla
            // 
            this.lblNumeroPlanilla.AutoSize = true;
            this.lblNumeroPlanilla.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNumeroPlanilla.Location = new System.Drawing.Point(6, 20);
            this.lblNumeroPlanilla.Name = "lblNumeroPlanilla";
            this.lblNumeroPlanilla.Size = new System.Drawing.Size(116, 13);
            this.lblNumeroPlanilla.TabIndex = 0;
            this.lblNumeroPlanilla.Text = "Número de planilla:";
            // 
            // grpViajes
            // 
            this.grpViajes.Controls.Add(this.btnImprimir);
            this.grpViajes.Controls.Add(this.btnGuardar);
            this.grpViajes.Controls.Add(this.dgvViajes);
            this.grpViajes.Location = new System.Drawing.Point(13, 120);
            this.grpViajes.Name = "grpViajes";
            this.grpViajes.Size = new System.Drawing.Size(759, 317);
            this.grpViajes.TabIndex = 1;
            this.grpViajes.TabStop = false;
            this.grpViajes.Text = "Viajes";
            // 
            // btnImprimir
            // 
            this.btnImprimir.Location = new System.Drawing.Point(615, 282);
            this.btnImprimir.Name = "btnImprimir";
            this.btnImprimir.Size = new System.Drawing.Size(138, 23);
            this.btnImprimir.TabIndex = 2;
            this.btnImprimir.Text = "Imprimir";
            this.btnImprimir.UseVisualStyleBackColor = true;
            this.btnImprimir.Click += new System.EventHandler(this.BtnImprimir_Click);
            // 
            // btnGuardar
            // 
            this.btnGuardar.Location = new System.Drawing.Point(9, 282);
            this.btnGuardar.Name = "btnGuardar";
            this.btnGuardar.Size = new System.Drawing.Size(127, 23);
            this.btnGuardar.TabIndex = 2;
            this.btnGuardar.Text = "Guardar";
            this.btnGuardar.UseVisualStyleBackColor = true;
            this.btnGuardar.Click += new System.EventHandler(this.BtnGuardar_Click);
            // 
            // dgvViajes
            // 
            this.dgvViajes.AllowUserToAddRows = false;
            this.dgvViajes.AllowUserToDeleteRows = false;
            this.dgvViajes.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvViajes.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colOrigen,
            this.colHoraSalida,
            this.colDestino,
            this.colHoraEstimadaLlegada,
            this.colHoraRealLlegada,
            this.colCompletado,
            this.colDensidadPasajeros,
            this.colViaje});
            this.dgvViajes.Location = new System.Drawing.Point(6, 19);
            this.dgvViajes.Name = "dgvViajes";
            this.dgvViajes.Size = new System.Drawing.Size(744, 257);
            this.dgvViajes.TabIndex = 0;
            this.dgvViajes.CellEndEdit += new System.Windows.Forms.DataGridViewCellEventHandler(this.DgvViajes_CellEndEdit);
            this.dgvViajes.CellEnter += new System.Windows.Forms.DataGridViewCellEventHandler(this.DgvViajes_CellEnter);
            this.dgvViajes.EditingControlShowing += new System.Windows.Forms.DataGridViewEditingControlShowingEventHandler(this.DgvViajes_EditingControlShowing);
            // 
            // colOrigen
            // 
            this.colOrigen.DataPropertyName = "Origen";
            this.colOrigen.HeaderText = "Origen";
            this.colOrigen.Name = "colOrigen";
            this.colOrigen.ReadOnly = true;
            // 
            // colHoraSalida
            // 
            this.colHoraSalida.DataPropertyName = "HoraSalida";
            this.colHoraSalida.HeaderText = "Hora de salida";
            this.colHoraSalida.Name = "colHoraSalida";
            this.colHoraSalida.ReadOnly = true;
            // 
            // colDestino
            // 
            this.colDestino.DataPropertyName = "Destino";
            this.colDestino.HeaderText = "Destino";
            this.colDestino.Name = "colDestino";
            this.colDestino.ReadOnly = true;
            // 
            // colHoraEstimadaLlegada
            // 
            this.colHoraEstimadaLlegada.DataPropertyName = "HoraEstimadaLlegada";
            this.colHoraEstimadaLlegada.HeaderText = "Hora estimada de llegada";
            this.colHoraEstimadaLlegada.Name = "colHoraEstimadaLlegada";
            this.colHoraEstimadaLlegada.ReadOnly = true;
            // 
            // colHoraRealLlegada
            // 
            this.colHoraRealLlegada.DataPropertyName = "HoraRealLlegada";
            this.colHoraRealLlegada.HeaderText = "Hora real de llegada";
            this.colHoraRealLlegada.MaxInputLength = 5;
            this.colHoraRealLlegada.Name = "colHoraRealLlegada";
            // 
            // colCompletado
            // 
            this.colCompletado.DataPropertyName = "Completado";
            this.colCompletado.HeaderText = "Completado";
            this.colCompletado.Name = "colCompletado";
            this.colCompletado.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.colCompletado.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            // 
            // colDensidadPasajeros
            // 
            this.colDensidadPasajeros.DataPropertyName = "Completitud";
            this.colDensidadPasajeros.HeaderText = "Densidad de pasajeros";
            this.colDensidadPasajeros.Name = "colDensidadPasajeros";
            this.colDensidadPasajeros.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.colDensidadPasajeros.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            // 
            // colViaje
            // 
            this.colViaje.DataPropertyName = "Viaje";
            this.colViaje.HeaderText = "Viaje";
            this.colViaje.Name = "colViaje";
            this.colViaje.Visible = false;
            // 
            // DetalleDePlanillaForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(785, 447);
            this.Controls.Add(this.grpViajes);
            this.Controls.Add(this.grpDatos);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "DetalleDePlanillaForm";
            this.Text = "Detalle de planilla horaria";
            this.Load += new System.EventHandler(this.DetalleDePlanillaForm_Load);
            this.grpDatos.ResumeLayout(false);
            this.grpDatos.PerformLayout();
            this.grpViajes.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvViajes)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox grpDatos;
        private System.Windows.Forms.Label lblValorCoche;
        private System.Windows.Forms.Label lblValorFecha;
        private System.Windows.Forms.Label lblValorRecorrido;
        private System.Windows.Forms.Label lblValorChofer;
        private System.Windows.Forms.Label lblValorNumeroPlanilla;
        private System.Windows.Forms.Label lblRecorrido;
        private System.Windows.Forms.Label lblCoche;
        private System.Windows.Forms.Label lblChofer;
        private System.Windows.Forms.Label lblFecha;
        private System.Windows.Forms.Label lblNumeroPlanilla;
        private System.Windows.Forms.GroupBox grpViajes;
        private System.Windows.Forms.DataGridView dgvViajes;
        private System.Windows.Forms.Button btnImprimir;
        private System.Windows.Forms.Button btnGuardar;
        private System.Windows.Forms.DataGridViewTextBoxColumn colOrigen;
        private System.Windows.Forms.DataGridViewTextBoxColumn colHoraSalida;
        private System.Windows.Forms.DataGridViewTextBoxColumn colDestino;
        private System.Windows.Forms.DataGridViewTextBoxColumn colHoraEstimadaLlegada;
        private System.Windows.Forms.DataGridViewTextBoxColumn colHoraRealLlegada;
        private System.Windows.Forms.DataGridViewCheckBoxColumn colCompletado;
        private System.Windows.Forms.DataGridViewComboBoxColumn colDensidadPasajeros;
        private System.Windows.Forms.DataGridViewTextBoxColumn colViaje;
    }
}