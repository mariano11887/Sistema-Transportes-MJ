namespace UI
{
    partial class VehiculosForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(VehiculosForm));
            this.grpBuscarCoches = new System.Windows.Forms.GroupBox();
            this.chkEnCirculacionBusqueda = new System.Windows.Forms.CheckBox();
            this.btnBuscar = new System.Windows.Forms.Button();
            this.txtNumeroDeInternoBusqueda = new System.Windows.Forms.TextBox();
            this.lblNumeroDeInterno = new System.Windows.Forms.Label();
            this.txtPatenteBusqueda = new System.Windows.Forms.TextBox();
            this.lblPatente = new System.Windows.Forms.Label();
            this.lstResultadoBusqueda = new System.Windows.Forms.ListView();
            this.grpDetalles = new System.Windows.Forms.GroupBox();
            this.btnDescartar = new System.Windows.Forms.Button();
            this.btnGuardar = new System.Windows.Forms.Button();
            this.chkEnCirculacionDetalles = new System.Windows.Forms.CheckBox();
            this.txtCapacidad = new System.Windows.Forms.TextBox();
            this.lblCapacidad = new System.Windows.Forms.Label();
            this.txtNumeroDeInternoDetalles = new System.Windows.Forms.TextBox();
            this.lblNumeroDeInternoDetalles = new System.Windows.Forms.Label();
            this.txtAnioFabricacion = new System.Windows.Forms.TextBox();
            this.lblAnioFabricacion = new System.Windows.Forms.Label();
            this.dtpFechaDeAdquisicion = new System.Windows.Forms.DateTimePicker();
            this.lblFechaAdquisicion = new System.Windows.Forms.Label();
            this.txtModelo = new System.Windows.Forms.TextBox();
            this.lblModelo = new System.Windows.Forms.Label();
            this.txtMarca = new System.Windows.Forms.TextBox();
            this.lblMarca = new System.Windows.Forms.Label();
            this.txtPatenteDetalles = new System.Windows.Forms.TextBox();
            this.lblPatenteDetalles = new System.Windows.Forms.Label();
            this.lblResultadoBusqueda = new System.Windows.Forms.Label();
            this.btnNuevo = new System.Windows.Forms.Button();
            this.btnEditar = new System.Windows.Forms.Button();
            this.btnEliminar = new System.Windows.Forms.Button();
            this.grpBuscarCoches.SuspendLayout();
            this.grpDetalles.SuspendLayout();
            this.SuspendLayout();
            // 
            // grpBuscarCoches
            // 
            this.grpBuscarCoches.Controls.Add(this.chkEnCirculacionBusqueda);
            this.grpBuscarCoches.Controls.Add(this.btnBuscar);
            this.grpBuscarCoches.Controls.Add(this.txtNumeroDeInternoBusqueda);
            this.grpBuscarCoches.Controls.Add(this.lblNumeroDeInterno);
            this.grpBuscarCoches.Controls.Add(this.txtPatenteBusqueda);
            this.grpBuscarCoches.Controls.Add(this.lblPatente);
            this.grpBuscarCoches.Location = new System.Drawing.Point(13, 13);
            this.grpBuscarCoches.Name = "grpBuscarCoches";
            this.grpBuscarCoches.Size = new System.Drawing.Size(216, 145);
            this.grpBuscarCoches.TabIndex = 0;
            this.grpBuscarCoches.TabStop = false;
            this.grpBuscarCoches.Text = "Buscar coches";
            // 
            // chkEnCirculacionBusqueda
            // 
            this.chkEnCirculacionBusqueda.AutoSize = true;
            this.chkEnCirculacionBusqueda.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.chkEnCirculacionBusqueda.Checked = true;
            this.chkEnCirculacionBusqueda.CheckState = System.Windows.Forms.CheckState.Checked;
            this.chkEnCirculacionBusqueda.Location = new System.Drawing.Point(26, 74);
            this.chkEnCirculacionBusqueda.Name = "chkEnCirculacionBusqueda";
            this.chkEnCirculacionBusqueda.Size = new System.Drawing.Size(93, 17);
            this.chkEnCirculacionBusqueda.TabIndex = 26;
            this.chkEnCirculacionBusqueda.Text = "En circulación";
            this.chkEnCirculacionBusqueda.UseVisualStyleBackColor = true;
            // 
            // btnBuscar
            // 
            this.btnBuscar.Location = new System.Drawing.Point(68, 109);
            this.btnBuscar.Name = "btnBuscar";
            this.btnBuscar.Size = new System.Drawing.Size(75, 23);
            this.btnBuscar.TabIndex = 6;
            this.btnBuscar.Text = "Buscar";
            this.btnBuscar.UseVisualStyleBackColor = true;
            this.btnBuscar.Click += new System.EventHandler(this.BtnBuscar_Click);
            // 
            // txtNumeroDeInternoBusqueda
            // 
            this.txtNumeroDeInternoBusqueda.Location = new System.Drawing.Point(106, 48);
            this.txtNumeroDeInternoBusqueda.MaxLength = 5;
            this.txtNumeroDeInternoBusqueda.Name = "txtNumeroDeInternoBusqueda";
            this.txtNumeroDeInternoBusqueda.Size = new System.Drawing.Size(100, 20);
            this.txtNumeroDeInternoBusqueda.TabIndex = 3;
            this.txtNumeroDeInternoBusqueda.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.TxtNumeroDeInterno_KeyPress);
            // 
            // lblNumeroDeInterno
            // 
            this.lblNumeroDeInterno.AutoSize = true;
            this.lblNumeroDeInterno.Location = new System.Drawing.Point(6, 51);
            this.lblNumeroDeInterno.Name = "lblNumeroDeInterno";
            this.lblNumeroDeInterno.Size = new System.Drawing.Size(94, 13);
            this.lblNumeroDeInterno.TabIndex = 2;
            this.lblNumeroDeInterno.Text = "Número de interno";
            // 
            // txtPatenteBusqueda
            // 
            this.txtPatenteBusqueda.Location = new System.Drawing.Point(106, 19);
            this.txtPatenteBusqueda.MaxLength = 7;
            this.txtPatenteBusqueda.Name = "txtPatenteBusqueda";
            this.txtPatenteBusqueda.Size = new System.Drawing.Size(100, 20);
            this.txtPatenteBusqueda.TabIndex = 1;
            // 
            // lblPatente
            // 
            this.lblPatente.AutoSize = true;
            this.lblPatente.Location = new System.Drawing.Point(56, 22);
            this.lblPatente.Name = "lblPatente";
            this.lblPatente.Size = new System.Drawing.Size(44, 13);
            this.lblPatente.TabIndex = 0;
            this.lblPatente.Text = "Patente";
            // 
            // lstResultadoBusqueda
            // 
            this.lstResultadoBusqueda.HideSelection = false;
            this.lstResultadoBusqueda.Location = new System.Drawing.Point(241, 32);
            this.lstResultadoBusqueda.MultiSelect = false;
            this.lstResultadoBusqueda.Name = "lstResultadoBusqueda";
            this.lstResultadoBusqueda.Size = new System.Drawing.Size(547, 159);
            this.lstResultadoBusqueda.TabIndex = 7;
            this.lstResultadoBusqueda.UseCompatibleStateImageBehavior = false;
            this.lstResultadoBusqueda.View = System.Windows.Forms.View.List;
            this.lstResultadoBusqueda.SelectedIndexChanged += new System.EventHandler(this.LstResultadoBusqueda_SelectedIndexChanged);
            // 
            // grpDetalles
            // 
            this.grpDetalles.Controls.Add(this.btnDescartar);
            this.grpDetalles.Controls.Add(this.btnGuardar);
            this.grpDetalles.Controls.Add(this.chkEnCirculacionDetalles);
            this.grpDetalles.Controls.Add(this.txtCapacidad);
            this.grpDetalles.Controls.Add(this.lblCapacidad);
            this.grpDetalles.Controls.Add(this.txtNumeroDeInternoDetalles);
            this.grpDetalles.Controls.Add(this.lblNumeroDeInternoDetalles);
            this.grpDetalles.Controls.Add(this.txtAnioFabricacion);
            this.grpDetalles.Controls.Add(this.lblAnioFabricacion);
            this.grpDetalles.Controls.Add(this.dtpFechaDeAdquisicion);
            this.grpDetalles.Controls.Add(this.lblFechaAdquisicion);
            this.grpDetalles.Controls.Add(this.txtModelo);
            this.grpDetalles.Controls.Add(this.lblModelo);
            this.grpDetalles.Controls.Add(this.txtMarca);
            this.grpDetalles.Controls.Add(this.lblMarca);
            this.grpDetalles.Controls.Add(this.txtPatenteDetalles);
            this.grpDetalles.Controls.Add(this.lblPatenteDetalles);
            this.grpDetalles.Enabled = false;
            this.grpDetalles.Location = new System.Drawing.Point(238, 226);
            this.grpDetalles.Name = "grpDetalles";
            this.grpDetalles.Size = new System.Drawing.Size(557, 165);
            this.grpDetalles.TabIndex = 1;
            this.grpDetalles.TabStop = false;
            this.grpDetalles.Text = "Detalles";
            // 
            // btnDescartar
            // 
            this.btnDescartar.Location = new System.Drawing.Point(476, 136);
            this.btnDescartar.Name = "btnDescartar";
            this.btnDescartar.Size = new System.Drawing.Size(75, 23);
            this.btnDescartar.TabIndex = 25;
            this.btnDescartar.Text = "Descartar";
            this.btnDescartar.UseVisualStyleBackColor = true;
            this.btnDescartar.Click += new System.EventHandler(this.BtnDescartar_Click);
            // 
            // btnGuardar
            // 
            this.btnGuardar.Location = new System.Drawing.Point(7, 136);
            this.btnGuardar.Name = "btnGuardar";
            this.btnGuardar.Size = new System.Drawing.Size(75, 23);
            this.btnGuardar.TabIndex = 24;
            this.btnGuardar.Text = "Guardar";
            this.btnGuardar.UseVisualStyleBackColor = true;
            this.btnGuardar.Click += new System.EventHandler(this.BtnGuardar_Click);
            // 
            // chkEnCirculacionDetalles
            // 
            this.chkEnCirculacionDetalles.AutoSize = true;
            this.chkEnCirculacionDetalles.Location = new System.Drawing.Point(347, 98);
            this.chkEnCirculacionDetalles.Name = "chkEnCirculacionDetalles";
            this.chkEnCirculacionDetalles.Size = new System.Drawing.Size(93, 17);
            this.chkEnCirculacionDetalles.TabIndex = 23;
            this.chkEnCirculacionDetalles.Text = "En circulación";
            this.chkEnCirculacionDetalles.UseVisualStyleBackColor = true;
            // 
            // txtCapacidad
            // 
            this.txtCapacidad.Location = new System.Drawing.Point(89, 97);
            this.txtCapacidad.MaxLength = 2;
            this.txtCapacidad.Name = "txtCapacidad";
            this.txtCapacidad.Size = new System.Drawing.Size(138, 20);
            this.txtCapacidad.TabIndex = 21;
            this.txtCapacidad.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.TxtCapacidad_KeyPress);
            // 
            // lblCapacidad
            // 
            this.lblCapacidad.AutoSize = true;
            this.lblCapacidad.Location = new System.Drawing.Point(25, 100);
            this.lblCapacidad.Name = "lblCapacidad";
            this.lblCapacidad.Size = new System.Drawing.Size(58, 13);
            this.lblCapacidad.TabIndex = 20;
            this.lblCapacidad.Text = "Capacidad";
            // 
            // txtNumeroDeInternoDetalles
            // 
            this.txtNumeroDeInternoDetalles.Location = new System.Drawing.Point(347, 71);
            this.txtNumeroDeInternoDetalles.MaxLength = 5;
            this.txtNumeroDeInternoDetalles.Name = "txtNumeroDeInternoDetalles";
            this.txtNumeroDeInternoDetalles.Size = new System.Drawing.Size(200, 20);
            this.txtNumeroDeInternoDetalles.TabIndex = 19;
            this.txtNumeroDeInternoDetalles.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.TxtNumeroDeInternoDetalles_KeyPress);
            // 
            // lblNumeroDeInternoDetalles
            // 
            this.lblNumeroDeInternoDetalles.AutoSize = true;
            this.lblNumeroDeInternoDetalles.Location = new System.Drawing.Point(247, 74);
            this.lblNumeroDeInternoDetalles.Name = "lblNumeroDeInternoDetalles";
            this.lblNumeroDeInternoDetalles.Size = new System.Drawing.Size(94, 13);
            this.lblNumeroDeInternoDetalles.TabIndex = 18;
            this.lblNumeroDeInternoDetalles.Text = "Número de interno";
            // 
            // txtAnioFabricacion
            // 
            this.txtAnioFabricacion.Location = new System.Drawing.Point(347, 45);
            this.txtAnioFabricacion.MaxLength = 4;
            this.txtAnioFabricacion.Name = "txtAnioFabricacion";
            this.txtAnioFabricacion.Size = new System.Drawing.Size(200, 20);
            this.txtAnioFabricacion.TabIndex = 17;
            this.txtAnioFabricacion.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.TxtAnioFabricacion_KeyPress);
            // 
            // lblAnioFabricacion
            // 
            this.lblAnioFabricacion.AutoSize = true;
            this.lblAnioFabricacion.Location = new System.Drawing.Point(245, 48);
            this.lblAnioFabricacion.Name = "lblAnioFabricacion";
            this.lblAnioFabricacion.Size = new System.Drawing.Size(96, 13);
            this.lblAnioFabricacion.TabIndex = 16;
            this.lblAnioFabricacion.Text = "Año de fabricación";
            // 
            // dtpFechaDeAdquisicion
            // 
            this.dtpFechaDeAdquisicion.Location = new System.Drawing.Point(347, 19);
            this.dtpFechaDeAdquisicion.Name = "dtpFechaDeAdquisicion";
            this.dtpFechaDeAdquisicion.Size = new System.Drawing.Size(200, 20);
            this.dtpFechaDeAdquisicion.TabIndex = 15;
            // 
            // lblFechaAdquisicion
            // 
            this.lblFechaAdquisicion.AutoSize = true;
            this.lblFechaAdquisicion.Location = new System.Drawing.Point(233, 22);
            this.lblFechaAdquisicion.Name = "lblFechaAdquisicion";
            this.lblFechaAdquisicion.Size = new System.Drawing.Size(108, 13);
            this.lblFechaAdquisicion.TabIndex = 14;
            this.lblFechaAdquisicion.Text = "Fecha de adquisición";
            // 
            // txtModelo
            // 
            this.txtModelo.Location = new System.Drawing.Point(89, 71);
            this.txtModelo.Name = "txtModelo";
            this.txtModelo.Size = new System.Drawing.Size(138, 20);
            this.txtModelo.TabIndex = 13;
            // 
            // lblModelo
            // 
            this.lblModelo.AutoSize = true;
            this.lblModelo.Location = new System.Drawing.Point(41, 74);
            this.lblModelo.Name = "lblModelo";
            this.lblModelo.Size = new System.Drawing.Size(42, 13);
            this.lblModelo.TabIndex = 12;
            this.lblModelo.Text = "Modelo";
            // 
            // txtMarca
            // 
            this.txtMarca.Location = new System.Drawing.Point(89, 45);
            this.txtMarca.Name = "txtMarca";
            this.txtMarca.Size = new System.Drawing.Size(138, 20);
            this.txtMarca.TabIndex = 11;
            // 
            // lblMarca
            // 
            this.lblMarca.AutoSize = true;
            this.lblMarca.Location = new System.Drawing.Point(46, 48);
            this.lblMarca.Name = "lblMarca";
            this.lblMarca.Size = new System.Drawing.Size(37, 13);
            this.lblMarca.TabIndex = 10;
            this.lblMarca.Text = "Marca";
            // 
            // txtPatenteDetalles
            // 
            this.txtPatenteDetalles.Location = new System.Drawing.Point(89, 19);
            this.txtPatenteDetalles.MaxLength = 7;
            this.txtPatenteDetalles.Name = "txtPatenteDetalles";
            this.txtPatenteDetalles.Size = new System.Drawing.Size(138, 20);
            this.txtPatenteDetalles.TabIndex = 9;
            // 
            // lblPatenteDetalles
            // 
            this.lblPatenteDetalles.AutoSize = true;
            this.lblPatenteDetalles.Location = new System.Drawing.Point(39, 22);
            this.lblPatenteDetalles.Name = "lblPatenteDetalles";
            this.lblPatenteDetalles.Size = new System.Drawing.Size(44, 13);
            this.lblPatenteDetalles.TabIndex = 8;
            this.lblPatenteDetalles.Text = "Patente";
            // 
            // lblResultadoBusqueda
            // 
            this.lblResultadoBusqueda.AutoSize = true;
            this.lblResultadoBusqueda.Location = new System.Drawing.Point(241, 13);
            this.lblResultadoBusqueda.Name = "lblResultadoBusqueda";
            this.lblResultadoBusqueda.Size = new System.Drawing.Size(131, 13);
            this.lblResultadoBusqueda.TabIndex = 8;
            this.lblResultadoBusqueda.Text = "Resultado de la búsqueda";
            // 
            // btnNuevo
            // 
            this.btnNuevo.Location = new System.Drawing.Point(61, 165);
            this.btnNuevo.Name = "btnNuevo";
            this.btnNuevo.Size = new System.Drawing.Size(113, 23);
            this.btnNuevo.TabIndex = 9;
            this.btnNuevo.Text = "Nuevo";
            this.btnNuevo.UseVisualStyleBackColor = true;
            this.btnNuevo.Click += new System.EventHandler(this.BtnNuevo_Click);
            // 
            // btnEditar
            // 
            this.btnEditar.Enabled = false;
            this.btnEditar.Location = new System.Drawing.Point(238, 197);
            this.btnEditar.Name = "btnEditar";
            this.btnEditar.Size = new System.Drawing.Size(75, 23);
            this.btnEditar.TabIndex = 10;
            this.btnEditar.Text = "Editar";
            this.btnEditar.UseVisualStyleBackColor = true;
            this.btnEditar.Click += new System.EventHandler(this.BtnEditar_Click);
            // 
            // btnEliminar
            // 
            this.btnEliminar.Enabled = false;
            this.btnEliminar.Location = new System.Drawing.Point(709, 196);
            this.btnEliminar.Name = "btnEliminar";
            this.btnEliminar.Size = new System.Drawing.Size(75, 23);
            this.btnEliminar.TabIndex = 11;
            this.btnEliminar.Text = "Eliminar";
            this.btnEliminar.UseVisualStyleBackColor = true;
            this.btnEliminar.Click += new System.EventHandler(this.BtnEliminar_Click);
            // 
            // VehiculosForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(807, 402);
            this.Controls.Add(this.btnEliminar);
            this.Controls.Add(this.btnEditar);
            this.Controls.Add(this.btnNuevo);
            this.Controls.Add(this.lblResultadoBusqueda);
            this.Controls.Add(this.lstResultadoBusqueda);
            this.Controls.Add(this.grpDetalles);
            this.Controls.Add(this.grpBuscarCoches);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "VehiculosForm";
            this.Text = "Vehículos";
            this.Load += new System.EventHandler(this.VehiculosForm_Load);
            this.grpBuscarCoches.ResumeLayout(false);
            this.grpBuscarCoches.PerformLayout();
            this.grpDetalles.ResumeLayout(false);
            this.grpDetalles.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.GroupBox grpBuscarCoches;
        private System.Windows.Forms.Button btnBuscar;
        private System.Windows.Forms.TextBox txtNumeroDeInternoBusqueda;
        private System.Windows.Forms.Label lblNumeroDeInterno;
        private System.Windows.Forms.TextBox txtPatenteBusqueda;
        private System.Windows.Forms.Label lblPatente;
        private System.Windows.Forms.ListView lstResultadoBusqueda;
        private System.Windows.Forms.GroupBox grpDetalles;
        private System.Windows.Forms.TextBox txtCapacidad;
        private System.Windows.Forms.Label lblCapacidad;
        private System.Windows.Forms.TextBox txtNumeroDeInternoDetalles;
        private System.Windows.Forms.Label lblNumeroDeInternoDetalles;
        private System.Windows.Forms.TextBox txtAnioFabricacion;
        private System.Windows.Forms.Label lblAnioFabricacion;
        private System.Windows.Forms.DateTimePicker dtpFechaDeAdquisicion;
        private System.Windows.Forms.Label lblFechaAdquisicion;
        private System.Windows.Forms.TextBox txtModelo;
        private System.Windows.Forms.Label lblModelo;
        private System.Windows.Forms.TextBox txtMarca;
        private System.Windows.Forms.Label lblMarca;
        private System.Windows.Forms.TextBox txtPatenteDetalles;
        private System.Windows.Forms.Label lblPatenteDetalles;
        private System.Windows.Forms.CheckBox chkEnCirculacionDetalles;
        private System.Windows.Forms.Label lblResultadoBusqueda;
        private System.Windows.Forms.Button btnNuevo;
        private System.Windows.Forms.Button btnDescartar;
        private System.Windows.Forms.Button btnGuardar;
        private System.Windows.Forms.Button btnEditar;
        private System.Windows.Forms.Button btnEliminar;
        private System.Windows.Forms.CheckBox chkEnCirculacionBusqueda;
    }
}