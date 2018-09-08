namespace UI
{
    partial class PerfilesForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(PerfilesForm));
            this.lblPerfilesActuales = new System.Windows.Forms.Label();
            this.lstPerfilesActuales = new System.Windows.Forms.ListBox();
            this.grpDetalles = new System.Windows.Forms.GroupBox();
            this.btnDescartar = new System.Windows.Forms.Button();
            this.btnGuardar = new System.Windows.Forms.Button();
            this.txtDescripcion = new System.Windows.Forms.TextBox();
            this.lblDescripcion = new System.Windows.Forms.Label();
            this.txtNombre = new System.Windows.Forms.TextBox();
            this.lblNombre = new System.Windows.Forms.Label();
            this.trvPermisosInteriores = new System.Windows.Forms.TreeView();
            this.lblPermisosInteriores = new System.Windows.Forms.Label();
            this.btnCrearNuevo = new System.Windows.Forms.Button();
            this.btnEditar = new System.Windows.Forms.Button();
            this.btnEliminar = new System.Windows.Forms.Button();
            this.grpDetalles.SuspendLayout();
            this.SuspendLayout();
            // 
            // lblPerfilesActuales
            // 
            this.lblPerfilesActuales.AutoSize = true;
            this.lblPerfilesActuales.Location = new System.Drawing.Point(13, 13);
            this.lblPerfilesActuales.Name = "lblPerfilesActuales";
            this.lblPerfilesActuales.Size = new System.Drawing.Size(84, 13);
            this.lblPerfilesActuales.TabIndex = 0;
            this.lblPerfilesActuales.Text = "Perfiles actuales";
            // 
            // lstPerfilesActuales
            // 
            this.lstPerfilesActuales.FormattingEnabled = true;
            this.lstPerfilesActuales.Location = new System.Drawing.Point(16, 30);
            this.lstPerfilesActuales.Name = "lstPerfilesActuales";
            this.lstPerfilesActuales.Size = new System.Drawing.Size(120, 160);
            this.lstPerfilesActuales.TabIndex = 1;
            this.lstPerfilesActuales.SelectedIndexChanged += new System.EventHandler(this.lstPerfilesActuales_SelectedIndexChanged);
            // 
            // grpDetalles
            // 
            this.grpDetalles.Controls.Add(this.btnDescartar);
            this.grpDetalles.Controls.Add(this.btnGuardar);
            this.grpDetalles.Controls.Add(this.txtDescripcion);
            this.grpDetalles.Controls.Add(this.lblDescripcion);
            this.grpDetalles.Controls.Add(this.txtNombre);
            this.grpDetalles.Controls.Add(this.lblNombre);
            this.grpDetalles.Controls.Add(this.trvPermisosInteriores);
            this.grpDetalles.Controls.Add(this.lblPermisosInteriores);
            this.grpDetalles.Enabled = false;
            this.grpDetalles.Location = new System.Drawing.Point(152, 13);
            this.grpDetalles.Name = "grpDetalles";
            this.grpDetalles.Size = new System.Drawing.Size(334, 363);
            this.grpDetalles.TabIndex = 2;
            this.grpDetalles.TabStop = false;
            this.grpDetalles.Text = "Detalles";
            // 
            // btnDescartar
            // 
            this.btnDescartar.Location = new System.Drawing.Point(253, 334);
            this.btnDescartar.Name = "btnDescartar";
            this.btnDescartar.Size = new System.Drawing.Size(75, 23);
            this.btnDescartar.TabIndex = 7;
            this.btnDescartar.Text = "Descartar";
            this.btnDescartar.UseVisualStyleBackColor = true;
            // 
            // btnGuardar
            // 
            this.btnGuardar.Location = new System.Drawing.Point(6, 334);
            this.btnGuardar.Name = "btnGuardar";
            this.btnGuardar.Size = new System.Drawing.Size(75, 23);
            this.btnGuardar.TabIndex = 6;
            this.btnGuardar.Text = "Guardar";
            this.btnGuardar.UseVisualStyleBackColor = true;
            // 
            // txtDescripcion
            // 
            this.txtDescripcion.Location = new System.Drawing.Point(79, 45);
            this.txtDescripcion.Name = "txtDescripcion";
            this.txtDescripcion.Size = new System.Drawing.Size(240, 20);
            this.txtDescripcion.TabIndex = 5;
            // 
            // lblDescripcion
            // 
            this.lblDescripcion.AutoSize = true;
            this.lblDescripcion.Location = new System.Drawing.Point(10, 48);
            this.lblDescripcion.Name = "lblDescripcion";
            this.lblDescripcion.Size = new System.Drawing.Size(63, 13);
            this.lblDescripcion.TabIndex = 4;
            this.lblDescripcion.Text = "Descripción";
            // 
            // txtNombre
            // 
            this.txtNombre.Location = new System.Drawing.Point(79, 19);
            this.txtNombre.Name = "txtNombre";
            this.txtNombre.Size = new System.Drawing.Size(240, 20);
            this.txtNombre.TabIndex = 3;
            // 
            // lblNombre
            // 
            this.lblNombre.AutoSize = true;
            this.lblNombre.Location = new System.Drawing.Point(29, 22);
            this.lblNombre.Name = "lblNombre";
            this.lblNombre.Size = new System.Drawing.Size(44, 13);
            this.lblNombre.TabIndex = 2;
            this.lblNombre.Text = "Nombre";
            // 
            // trvPermisosInteriores
            // 
            this.trvPermisosInteriores.CheckBoxes = true;
            this.trvPermisosInteriores.Location = new System.Drawing.Point(23, 98);
            this.trvPermisosInteriores.Name = "trvPermisosInteriores";
            this.trvPermisosInteriores.Size = new System.Drawing.Size(296, 217);
            this.trvPermisosInteriores.TabIndex = 1;
            // 
            // lblPermisosInteriores
            // 
            this.lblPermisosInteriores.AutoSize = true;
            this.lblPermisosInteriores.Location = new System.Drawing.Point(20, 81);
            this.lblPermisosInteriores.Name = "lblPermisosInteriores";
            this.lblPermisosInteriores.Size = new System.Drawing.Size(113, 13);
            this.lblPermisosInteriores.TabIndex = 0;
            this.lblPermisosInteriores.Text = "Permisos y sub-perfiles";
            // 
            // btnCrearNuevo
            // 
            this.btnCrearNuevo.Location = new System.Drawing.Point(16, 197);
            this.btnCrearNuevo.Name = "btnCrearNuevo";
            this.btnCrearNuevo.Size = new System.Drawing.Size(120, 23);
            this.btnCrearNuevo.TabIndex = 3;
            this.btnCrearNuevo.Text = "Crear nuevo";
            this.btnCrearNuevo.UseVisualStyleBackColor = true;
            // 
            // btnEditar
            // 
            this.btnEditar.Enabled = false;
            this.btnEditar.Location = new System.Drawing.Point(16, 226);
            this.btnEditar.Name = "btnEditar";
            this.btnEditar.Size = new System.Drawing.Size(120, 23);
            this.btnEditar.TabIndex = 4;
            this.btnEditar.Text = "Editar";
            this.btnEditar.UseVisualStyleBackColor = true;
            // 
            // btnEliminar
            // 
            this.btnEliminar.Enabled = false;
            this.btnEliminar.Location = new System.Drawing.Point(16, 255);
            this.btnEliminar.Name = "btnEliminar";
            this.btnEliminar.Size = new System.Drawing.Size(120, 23);
            this.btnEliminar.TabIndex = 5;
            this.btnEliminar.Text = "Eliminar";
            this.btnEliminar.UseVisualStyleBackColor = true;
            // 
            // PerfilesForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(511, 390);
            this.Controls.Add(this.btnEliminar);
            this.Controls.Add(this.btnEditar);
            this.Controls.Add(this.btnCrearNuevo);
            this.Controls.Add(this.grpDetalles);
            this.Controls.Add(this.lstPerfilesActuales);
            this.Controls.Add(this.lblPerfilesActuales);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "PerfilesForm";
            this.Text = "Perfiles";
            this.Load += new System.EventHandler(this.PerfilesForm_Load);
            this.grpDetalles.ResumeLayout(false);
            this.grpDetalles.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblPerfilesActuales;
        private System.Windows.Forms.ListBox lstPerfilesActuales;
        private System.Windows.Forms.GroupBox grpDetalles;
        private System.Windows.Forms.TreeView trvPermisosInteriores;
        private System.Windows.Forms.Label lblPermisosInteriores;
        private System.Windows.Forms.Button btnDescartar;
        private System.Windows.Forms.Button btnGuardar;
        private System.Windows.Forms.TextBox txtDescripcion;
        private System.Windows.Forms.Label lblDescripcion;
        private System.Windows.Forms.TextBox txtNombre;
        private System.Windows.Forms.Label lblNombre;
        private System.Windows.Forms.Button btnCrearNuevo;
        private System.Windows.Forms.Button btnEditar;
        private System.Windows.Forms.Button btnEliminar;
    }
}