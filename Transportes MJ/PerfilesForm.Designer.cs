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
            this.btnQuitar = new System.Windows.Forms.Button();
            this.grpFamiliasPermisos = new System.Windows.Forms.GroupBox();
            this.btnAgregarPermiso = new System.Windows.Forms.Button();
            this.cmbPermisos = new System.Windows.Forms.ComboBox();
            this.lblPermisosIndividuales = new System.Windows.Forms.Label();
            this.btnAgregarFamilia = new System.Windows.Forms.Button();
            this.cmbFamilias = new System.Windows.Forms.ComboBox();
            this.lblFamilias = new System.Windows.Forms.Label();
            this.lblPermisosAsignados = new System.Windows.Forms.Label();
            this.btnGuardar = new System.Windows.Forms.Button();
            this.txtDescripcion = new System.Windows.Forms.TextBox();
            this.lblDescripcion = new System.Windows.Forms.Label();
            this.txtNombre = new System.Windows.Forms.TextBox();
            this.lblNombre = new System.Windows.Forms.Label();
            this.trvPermisosAsignados = new System.Windows.Forms.TreeView();
            this.btnCrearNuevo = new System.Windows.Forms.Button();
            this.btnEditar = new System.Windows.Forms.Button();
            this.btnEliminar = new System.Windows.Forms.Button();
            this.grpDetalles.SuspendLayout();
            this.grpFamiliasPermisos.SuspendLayout();
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
            this.lstPerfilesActuales.SelectedIndexChanged += new System.EventHandler(this.LstPerfilesActuales_SelectedIndexChanged);
            // 
            // grpDetalles
            // 
            this.grpDetalles.Controls.Add(this.btnQuitar);
            this.grpDetalles.Controls.Add(this.grpFamiliasPermisos);
            this.grpDetalles.Controls.Add(this.lblPermisosAsignados);
            this.grpDetalles.Controls.Add(this.btnGuardar);
            this.grpDetalles.Controls.Add(this.txtDescripcion);
            this.grpDetalles.Controls.Add(this.lblDescripcion);
            this.grpDetalles.Controls.Add(this.txtNombre);
            this.grpDetalles.Controls.Add(this.lblNombre);
            this.grpDetalles.Controls.Add(this.trvPermisosAsignados);
            this.grpDetalles.Location = new System.Drawing.Point(152, 13);
            this.grpDetalles.Name = "grpDetalles";
            this.grpDetalles.Size = new System.Drawing.Size(638, 354);
            this.grpDetalles.TabIndex = 2;
            this.grpDetalles.TabStop = false;
            this.grpDetalles.Text = "Detalles";
            // 
            // btnQuitar
            // 
            this.btnQuitar.Location = new System.Drawing.Point(550, 321);
            this.btnQuitar.Name = "btnQuitar";
            this.btnQuitar.Size = new System.Drawing.Size(75, 23);
            this.btnQuitar.TabIndex = 10;
            this.btnQuitar.Text = "Quitar";
            this.btnQuitar.UseVisualStyleBackColor = true;
            this.btnQuitar.Click += new System.EventHandler(this.BtnQuitar_Click);
            // 
            // grpFamiliasPermisos
            // 
            this.grpFamiliasPermisos.Controls.Add(this.btnAgregarPermiso);
            this.grpFamiliasPermisos.Controls.Add(this.cmbPermisos);
            this.grpFamiliasPermisos.Controls.Add(this.lblPermisosIndividuales);
            this.grpFamiliasPermisos.Controls.Add(this.btnAgregarFamilia);
            this.grpFamiliasPermisos.Controls.Add(this.cmbFamilias);
            this.grpFamiliasPermisos.Controls.Add(this.lblFamilias);
            this.grpFamiliasPermisos.Location = new System.Drawing.Point(7, 78);
            this.grpFamiliasPermisos.Name = "grpFamiliasPermisos";
            this.grpFamiliasPermisos.Size = new System.Drawing.Size(312, 129);
            this.grpFamiliasPermisos.TabIndex = 9;
            this.grpFamiliasPermisos.TabStop = false;
            this.grpFamiliasPermisos.Text = "Agregar familias y permisos";
            // 
            // btnAgregarPermiso
            // 
            this.btnAgregarPermiso.Location = new System.Drawing.Point(231, 93);
            this.btnAgregarPermiso.Name = "btnAgregarPermiso";
            this.btnAgregarPermiso.Size = new System.Drawing.Size(74, 23);
            this.btnAgregarPermiso.TabIndex = 5;
            this.btnAgregarPermiso.Text = "Agregar";
            this.btnAgregarPermiso.UseVisualStyleBackColor = true;
            this.btnAgregarPermiso.Click += new System.EventHandler(this.BtnAgregarPermiso_Click);
            // 
            // cmbPermisos
            // 
            this.cmbPermisos.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbPermisos.FormattingEnabled = true;
            this.cmbPermisos.Location = new System.Drawing.Point(6, 93);
            this.cmbPermisos.Name = "cmbPermisos";
            this.cmbPermisos.Size = new System.Drawing.Size(219, 21);
            this.cmbPermisos.TabIndex = 4;
            // 
            // lblPermisosIndividuales
            // 
            this.lblPermisosIndividuales.AutoSize = true;
            this.lblPermisosIndividuales.Location = new System.Drawing.Point(6, 77);
            this.lblPermisosIndividuales.Name = "lblPermisosIndividuales";
            this.lblPermisosIndividuales.Size = new System.Drawing.Size(107, 13);
            this.lblPermisosIndividuales.TabIndex = 3;
            this.lblPermisosIndividuales.Text = "Permisos individuales";
            // 
            // btnAgregarFamilia
            // 
            this.btnAgregarFamilia.Location = new System.Drawing.Point(232, 37);
            this.btnAgregarFamilia.Name = "btnAgregarFamilia";
            this.btnAgregarFamilia.Size = new System.Drawing.Size(74, 23);
            this.btnAgregarFamilia.TabIndex = 2;
            this.btnAgregarFamilia.Text = "Agregar";
            this.btnAgregarFamilia.UseVisualStyleBackColor = true;
            this.btnAgregarFamilia.Click += new System.EventHandler(this.BtnAgregarFamilia_Click);
            // 
            // cmbFamilias
            // 
            this.cmbFamilias.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbFamilias.FormattingEnabled = true;
            this.cmbFamilias.Location = new System.Drawing.Point(7, 37);
            this.cmbFamilias.Name = "cmbFamilias";
            this.cmbFamilias.Size = new System.Drawing.Size(219, 21);
            this.cmbFamilias.TabIndex = 1;
            // 
            // lblFamilias
            // 
            this.lblFamilias.AutoSize = true;
            this.lblFamilias.Location = new System.Drawing.Point(7, 20);
            this.lblFamilias.Name = "lblFamilias";
            this.lblFamilias.Size = new System.Drawing.Size(44, 13);
            this.lblFamilias.TabIndex = 0;
            this.lblFamilias.Text = "Familias";
            // 
            // lblPermisosAsignados
            // 
            this.lblPermisosAsignados.AutoSize = true;
            this.lblPermisosAsignados.Location = new System.Drawing.Point(338, 16);
            this.lblPermisosAsignados.Name = "lblPermisosAsignados";
            this.lblPermisosAsignados.Size = new System.Drawing.Size(100, 13);
            this.lblPermisosAsignados.TabIndex = 8;
            this.lblPermisosAsignados.Text = "Permisos asignados";
            // 
            // btnGuardar
            // 
            this.btnGuardar.Enabled = false;
            this.btnGuardar.Location = new System.Drawing.Point(130, 242);
            this.btnGuardar.Name = "btnGuardar";
            this.btnGuardar.Size = new System.Drawing.Size(75, 23);
            this.btnGuardar.TabIndex = 6;
            this.btnGuardar.Text = "Guardar";
            this.btnGuardar.UseVisualStyleBackColor = true;
            this.btnGuardar.Click += new System.EventHandler(this.BtnGuardar_Click);
            // 
            // txtDescripcion
            // 
            this.txtDescripcion.Enabled = false;
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
            this.txtNombre.Enabled = false;
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
            // trvPermisosAsignados
            // 
            this.trvPermisosAsignados.Location = new System.Drawing.Point(341, 32);
            this.trvPermisosAsignados.Name = "trvPermisosAsignados";
            this.trvPermisosAsignados.Size = new System.Drawing.Size(284, 283);
            this.trvPermisosAsignados.TabIndex = 1;
            this.trvPermisosAsignados.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.TrvPermisosAsignados_AfterSelect);
            // 
            // btnCrearNuevo
            // 
            this.btnCrearNuevo.Location = new System.Drawing.Point(16, 197);
            this.btnCrearNuevo.Name = "btnCrearNuevo";
            this.btnCrearNuevo.Size = new System.Drawing.Size(120, 23);
            this.btnCrearNuevo.TabIndex = 3;
            this.btnCrearNuevo.Text = "Crear nuevo";
            this.btnCrearNuevo.UseVisualStyleBackColor = true;
            this.btnCrearNuevo.Click += new System.EventHandler(this.BtnCrearNuevo_Click);
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
            this.btnEditar.Click += new System.EventHandler(this.BtnEditar_Click);
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
            this.btnEliminar.Click += new System.EventHandler(this.BtnEliminar_Click);
            // 
            // PerfilesForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(814, 382);
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
            this.grpFamiliasPermisos.ResumeLayout(false);
            this.grpFamiliasPermisos.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblPerfilesActuales;
        private System.Windows.Forms.ListBox lstPerfilesActuales;
        private System.Windows.Forms.GroupBox grpDetalles;
        private System.Windows.Forms.TreeView trvPermisosAsignados;
        private System.Windows.Forms.Button btnGuardar;
        private System.Windows.Forms.TextBox txtDescripcion;
        private System.Windows.Forms.Label lblDescripcion;
        private System.Windows.Forms.TextBox txtNombre;
        private System.Windows.Forms.Label lblNombre;
        private System.Windows.Forms.Button btnCrearNuevo;
        private System.Windows.Forms.Button btnEditar;
        private System.Windows.Forms.Button btnEliminar;
        private System.Windows.Forms.GroupBox grpFamiliasPermisos;
        private System.Windows.Forms.Label lblFamilias;
        private System.Windows.Forms.Label lblPermisosAsignados;
        private System.Windows.Forms.Button btnAgregarFamilia;
        private System.Windows.Forms.ComboBox cmbFamilias;
        private System.Windows.Forms.Button btnQuitar;
        private System.Windows.Forms.Button btnAgregarPermiso;
        private System.Windows.Forms.ComboBox cmbPermisos;
        private System.Windows.Forms.Label lblPermisosIndividuales;
    }
}