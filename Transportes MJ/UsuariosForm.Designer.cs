namespace UI
{
    partial class UsuariosForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(UsuariosForm));
            this.lblUsuariosActuales = new System.Windows.Forms.Label();
            this.lstUsuariosActuales = new System.Windows.Forms.ListBox();
            this.btnCrearNuevo = new System.Windows.Forms.Button();
            this.btnEditar = new System.Windows.Forms.Button();
            this.btnEliminar = new System.Windows.Forms.Button();
            this.grpDetalles = new System.Windows.Forms.GroupBox();
            this.btnDescartar = new System.Windows.Forms.Button();
            this.btnGuardar = new System.Windows.Forms.Button();
            this.lblPermisos = new System.Windows.Forms.Label();
            this.trvPermisos = new System.Windows.Forms.TreeView();
            this.grpInfoLogin = new System.Windows.Forms.GroupBox();
            this.txtRepetirContrasenia = new System.Windows.Forms.TextBox();
            this.lblRepetirContrasenia = new System.Windows.Forms.Label();
            this.txtContrasenia = new System.Windows.Forms.TextBox();
            this.lblContrasenia = new System.Windows.Forms.Label();
            this.txtNombreUsuario = new System.Windows.Forms.TextBox();
            this.lblNombreUsuario = new System.Windows.Forms.Label();
            this.cmbIdioma = new System.Windows.Forms.ComboBox();
            this.txtNombre = new System.Windows.Forms.TextBox();
            this.lblIdiomaPreferido = new System.Windows.Forms.Label();
            this.lblNombre = new System.Windows.Forms.Label();
            this.grpDetalles.SuspendLayout();
            this.grpInfoLogin.SuspendLayout();
            this.SuspendLayout();
            // 
            // lblUsuariosActuales
            // 
            this.lblUsuariosActuales.AutoSize = true;
            this.lblUsuariosActuales.Location = new System.Drawing.Point(13, 13);
            this.lblUsuariosActuales.Name = "lblUsuariosActuales";
            this.lblUsuariosActuales.Size = new System.Drawing.Size(91, 13);
            this.lblUsuariosActuales.TabIndex = 0;
            this.lblUsuariosActuales.Text = "Usuarios actuales";
            // 
            // lstUsuariosActuales
            // 
            this.lstUsuariosActuales.FormattingEnabled = true;
            this.lstUsuariosActuales.Location = new System.Drawing.Point(13, 30);
            this.lstUsuariosActuales.Name = "lstUsuariosActuales";
            this.lstUsuariosActuales.Size = new System.Drawing.Size(120, 212);
            this.lstUsuariosActuales.TabIndex = 1;
            this.lstUsuariosActuales.SelectedIndexChanged += new System.EventHandler(this.lstUsuariosActuales_SelectedIndexChanged);
            // 
            // btnCrearNuevo
            // 
            this.btnCrearNuevo.Location = new System.Drawing.Point(13, 249);
            this.btnCrearNuevo.Name = "btnCrearNuevo";
            this.btnCrearNuevo.Size = new System.Drawing.Size(120, 23);
            this.btnCrearNuevo.TabIndex = 2;
            this.btnCrearNuevo.Text = "Crear nuevo";
            this.btnCrearNuevo.UseVisualStyleBackColor = true;
            this.btnCrearNuevo.Click += new System.EventHandler(this.btnCrearNuevo_Click);
            // 
            // btnEditar
            // 
            this.btnEditar.Location = new System.Drawing.Point(13, 278);
            this.btnEditar.Name = "btnEditar";
            this.btnEditar.Size = new System.Drawing.Size(120, 23);
            this.btnEditar.TabIndex = 3;
            this.btnEditar.Text = "Editar";
            this.btnEditar.UseVisualStyleBackColor = true;
            // 
            // btnEliminar
            // 
            this.btnEliminar.Location = new System.Drawing.Point(13, 307);
            this.btnEliminar.Name = "btnEliminar";
            this.btnEliminar.Size = new System.Drawing.Size(120, 23);
            this.btnEliminar.TabIndex = 4;
            this.btnEliminar.Text = "Eliminar";
            this.btnEliminar.UseVisualStyleBackColor = true;
            // 
            // grpDetalles
            // 
            this.grpDetalles.Controls.Add(this.btnDescartar);
            this.grpDetalles.Controls.Add(this.btnGuardar);
            this.grpDetalles.Controls.Add(this.lblPermisos);
            this.grpDetalles.Controls.Add(this.trvPermisos);
            this.grpDetalles.Controls.Add(this.grpInfoLogin);
            this.grpDetalles.Controls.Add(this.cmbIdioma);
            this.grpDetalles.Controls.Add(this.txtNombre);
            this.grpDetalles.Controls.Add(this.lblIdiomaPreferido);
            this.grpDetalles.Controls.Add(this.lblNombre);
            this.grpDetalles.Location = new System.Drawing.Point(148, 13);
            this.grpDetalles.Name = "grpDetalles";
            this.grpDetalles.Size = new System.Drawing.Size(622, 229);
            this.grpDetalles.TabIndex = 5;
            this.grpDetalles.TabStop = false;
            this.grpDetalles.Text = "Detalles";
            // 
            // btnDescartar
            // 
            this.btnDescartar.Location = new System.Drawing.Point(537, 196);
            this.btnDescartar.Name = "btnDescartar";
            this.btnDescartar.Size = new System.Drawing.Size(75, 23);
            this.btnDescartar.TabIndex = 10;
            this.btnDescartar.Text = "Descartar";
            this.btnDescartar.UseVisualStyleBackColor = true;
            this.btnDescartar.Click += new System.EventHandler(this.btnDescartar_Click);
            // 
            // btnGuardar
            // 
            this.btnGuardar.Location = new System.Drawing.Point(6, 196);
            this.btnGuardar.Name = "btnGuardar";
            this.btnGuardar.Size = new System.Drawing.Size(75, 23);
            this.btnGuardar.TabIndex = 9;
            this.btnGuardar.Text = "Guardar";
            this.btnGuardar.UseVisualStyleBackColor = true;
            this.btnGuardar.Click += new System.EventHandler(this.btnGuardar_Click);
            // 
            // lblPermisos
            // 
            this.lblPermisos.AutoSize = true;
            this.lblPermisos.Location = new System.Drawing.Point(326, 17);
            this.lblPermisos.Name = "lblPermisos";
            this.lblPermisos.Size = new System.Drawing.Size(49, 13);
            this.lblPermisos.TabIndex = 8;
            this.lblPermisos.Text = "Permisos";
            // 
            // trvPermisos
            // 
            this.trvPermisos.CheckBoxes = true;
            this.trvPermisos.Location = new System.Drawing.Point(329, 33);
            this.trvPermisos.Name = "trvPermisos";
            this.trvPermisos.Size = new System.Drawing.Size(283, 157);
            this.trvPermisos.TabIndex = 7;
            this.trvPermisos.BeforeCheck += new System.Windows.Forms.TreeViewCancelEventHandler(this.trvPermisos_BeforeCheck);
            this.trvPermisos.AfterCheck += new System.Windows.Forms.TreeViewEventHandler(this.trvPermisos_AfterCheck);
            // 
            // grpInfoLogin
            // 
            this.grpInfoLogin.Controls.Add(this.txtRepetirContrasenia);
            this.grpInfoLogin.Controls.Add(this.lblRepetirContrasenia);
            this.grpInfoLogin.Controls.Add(this.txtContrasenia);
            this.grpInfoLogin.Controls.Add(this.lblContrasenia);
            this.grpInfoLogin.Controls.Add(this.txtNombreUsuario);
            this.grpInfoLogin.Controls.Add(this.lblNombreUsuario);
            this.grpInfoLogin.Location = new System.Drawing.Point(6, 87);
            this.grpInfoLogin.Name = "grpInfoLogin";
            this.grpInfoLogin.Size = new System.Drawing.Size(317, 103);
            this.grpInfoLogin.TabIndex = 6;
            this.grpInfoLogin.TabStop = false;
            this.grpInfoLogin.Text = "Información de inicio de sesión";
            // 
            // txtRepetirContrasenia
            // 
            this.txtRepetirContrasenia.Location = new System.Drawing.Point(138, 71);
            this.txtRepetirContrasenia.Name = "txtRepetirContrasenia";
            this.txtRepetirContrasenia.Size = new System.Drawing.Size(173, 20);
            this.txtRepetirContrasenia.TabIndex = 9;
            this.txtRepetirContrasenia.UseSystemPasswordChar = true;
            // 
            // lblRepetirContrasenia
            // 
            this.lblRepetirContrasenia.AutoSize = true;
            this.lblRepetirContrasenia.Location = new System.Drawing.Point(35, 74);
            this.lblRepetirContrasenia.Name = "lblRepetirContrasenia";
            this.lblRepetirContrasenia.Size = new System.Drawing.Size(97, 13);
            this.lblRepetirContrasenia.TabIndex = 8;
            this.lblRepetirContrasenia.Text = "Repetir contraseña";
            // 
            // txtContrasenia
            // 
            this.txtContrasenia.Location = new System.Drawing.Point(138, 45);
            this.txtContrasenia.Name = "txtContrasenia";
            this.txtContrasenia.Size = new System.Drawing.Size(173, 20);
            this.txtContrasenia.TabIndex = 7;
            this.txtContrasenia.UseSystemPasswordChar = true;
            // 
            // lblContrasenia
            // 
            this.lblContrasenia.AutoSize = true;
            this.lblContrasenia.Location = new System.Drawing.Point(71, 48);
            this.lblContrasenia.Name = "lblContrasenia";
            this.lblContrasenia.Size = new System.Drawing.Size(61, 13);
            this.lblContrasenia.TabIndex = 6;
            this.lblContrasenia.Text = "Contraseña";
            // 
            // txtNombreUsuario
            // 
            this.txtNombreUsuario.Location = new System.Drawing.Point(138, 19);
            this.txtNombreUsuario.Name = "txtNombreUsuario";
            this.txtNombreUsuario.Size = new System.Drawing.Size(173, 20);
            this.txtNombreUsuario.TabIndex = 5;
            // 
            // lblNombreUsuario
            // 
            this.lblNombreUsuario.AutoSize = true;
            this.lblNombreUsuario.Location = new System.Drawing.Point(36, 22);
            this.lblNombreUsuario.Name = "lblNombreUsuario";
            this.lblNombreUsuario.Size = new System.Drawing.Size(96, 13);
            this.lblNombreUsuario.TabIndex = 4;
            this.lblNombreUsuario.Text = "Nombre de usuario";
            // 
            // cmbIdioma
            // 
            this.cmbIdioma.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbIdioma.FormattingEnabled = true;
            this.cmbIdioma.Location = new System.Drawing.Point(126, 46);
            this.cmbIdioma.Name = "cmbIdioma";
            this.cmbIdioma.Size = new System.Drawing.Size(191, 21);
            this.cmbIdioma.TabIndex = 3;
            // 
            // txtNombre
            // 
            this.txtNombre.Location = new System.Drawing.Point(126, 20);
            this.txtNombre.Name = "txtNombre";
            this.txtNombre.Size = new System.Drawing.Size(191, 20);
            this.txtNombre.TabIndex = 2;
            // 
            // lblIdiomaPreferido
            // 
            this.lblIdiomaPreferido.AutoSize = true;
            this.lblIdiomaPreferido.Location = new System.Drawing.Point(38, 49);
            this.lblIdiomaPreferido.Name = "lblIdiomaPreferido";
            this.lblIdiomaPreferido.Size = new System.Drawing.Size(82, 13);
            this.lblIdiomaPreferido.TabIndex = 1;
            this.lblIdiomaPreferido.Text = "Idioma preferido";
            // 
            // lblNombre
            // 
            this.lblNombre.AutoSize = true;
            this.lblNombre.Location = new System.Drawing.Point(76, 23);
            this.lblNombre.Name = "lblNombre";
            this.lblNombre.Size = new System.Drawing.Size(44, 13);
            this.lblNombre.TabIndex = 0;
            this.lblNombre.Text = "Nombre";
            // 
            // UsuariosForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(779, 343);
            this.Controls.Add(this.grpDetalles);
            this.Controls.Add(this.btnEliminar);
            this.Controls.Add(this.btnEditar);
            this.Controls.Add(this.btnCrearNuevo);
            this.Controls.Add(this.lstUsuariosActuales);
            this.Controls.Add(this.lblUsuariosActuales);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "UsuariosForm";
            this.Text = "Usuarios";
            this.Load += new System.EventHandler(this.UsuariosForm_Load);
            this.grpDetalles.ResumeLayout(false);
            this.grpDetalles.PerformLayout();
            this.grpInfoLogin.ResumeLayout(false);
            this.grpInfoLogin.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblUsuariosActuales;
        private System.Windows.Forms.ListBox lstUsuariosActuales;
        private System.Windows.Forms.Button btnCrearNuevo;
        private System.Windows.Forms.Button btnEditar;
        private System.Windows.Forms.Button btnEliminar;
        private System.Windows.Forms.GroupBox grpDetalles;
        private System.Windows.Forms.GroupBox grpInfoLogin;
        private System.Windows.Forms.TextBox txtRepetirContrasenia;
        private System.Windows.Forms.Label lblRepetirContrasenia;
        private System.Windows.Forms.TextBox txtContrasenia;
        private System.Windows.Forms.Label lblContrasenia;
        private System.Windows.Forms.TextBox txtNombreUsuario;
        private System.Windows.Forms.Label lblNombreUsuario;
        private System.Windows.Forms.ComboBox cmbIdioma;
        private System.Windows.Forms.TextBox txtNombre;
        private System.Windows.Forms.Label lblIdiomaPreferido;
        private System.Windows.Forms.Label lblNombre;
        private System.Windows.Forms.Button btnDescartar;
        private System.Windows.Forms.Button btnGuardar;
        private System.Windows.Forms.Label lblPermisos;
        private System.Windows.Forms.TreeView trvPermisos;
    }
}