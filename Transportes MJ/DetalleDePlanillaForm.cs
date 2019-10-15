﻿using BL;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace UI
{
    public partial class DetalleDePlanillaForm : FormGeneral
    {
        private readonly PlanillaHoraria planillaHoraria;
        private const string MASCARA_TIEMPO = "HH:mm";
        private readonly Dictionary<CompletitudViaje, string> completitudes = new Dictionary<CompletitudViaje, string>();

        public DetalleDePlanillaForm(PlanillaHoraria planillaHoraria)
        {
            InitializeComponent();
            this.planillaHoraria = planillaHoraria;
        }

        private void DetalleDePlanillaForm_Load(object sender, EventArgs e)
        {
            Abrir();

            // Completo la sección de Datos
            lblValorNumeroPlanilla.Text = planillaHoraria.Id.ToString();
            lblValorChofer.Text = planillaHoraria.Chofer.Nombre;
            lblValorRecorrido.Text = planillaHoraria.Recorrido.ToString();
            lblValorFecha.Text = planillaHoraria.Fecha.ToString("dd/MM/yyyy");
            lblValorCoche.Text = ObtenerLeyenda("valInterno") + " " + planillaHoraria.Vehiculo.NumeroInterno +
                " (" + planillaHoraria.Vehiculo.Patente + ")";

            // Lleno la grilla con los viajes
            dgvViajes.DataSource = planillaHoraria.Viajes.Select(v => new GridItem
            {
                Viaje = v,
                HoraSalida = v.HoraSalida.ToString(MASCARA_TIEMPO),
                HoraEstimadaLlegada = v.HoraEstimadaLlegada.ToString(MASCARA_TIEMPO),
                HoraRealLlegada = v.HoraRealLlegada?.ToString(MASCARA_TIEMPO)
            }).ToList();

            // Lleno los dropdown de densidad de pasajeros
            completitudes.Add(CompletitudViaje.Vacio, ObtenerLeyenda("valVacio"));
            completitudes.Add(CompletitudViaje.Moderado, ObtenerLeyenda("valModerado"));
            completitudes.Add(CompletitudViaje.Lleno, ObtenerLeyenda("valLleno"));
            (dgvViajes.Columns["colDensidadPasajeros"] as DataGridViewComboBoxColumn).DataSource = completitudes.Values.ToList();
        }

        private void DgvViajes_EditingControlShowing(object sender, DataGridViewEditingControlShowingEventArgs e)
        {
            if (e.Control is DataGridViewTextBoxEditingControl textbox)
            {
                textbox.KeyPress -= DgvViajesTextBox_KeyPress;
                textbox.KeyPress += DgvViajesTextBox_KeyPress;
            }
        }

        private void DgvViajesTextBox_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsDigit(e.KeyChar) && e.KeyChar != ':' && e.KeyChar != (char)Keys.Back)
            {
                e.Handled = true;
            }
        }

        private void DgvViajes_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {
            if(dgvViajes.Columns[e.ColumnIndex].Name == "colHoraRealLlegada")
            {
                bool ok = false;
                DataGridViewCell celda = dgvViajes.Rows[e.RowIndex].Cells[e.ColumnIndex];
                string texto = celda.Value?.ToString() ?? "";
                if (string.IsNullOrEmpty(texto))
                {
                    ok = true;
                }
                else
                {
                    int cantDosPuntos = texto.Where(c => c == ':').Count();
                    if (cantDosPuntos == 0 && texto.Length == 4)
                    {
                        texto = texto.Insert(2, ":");
                        cantDosPuntos = 1;
                    }

                    if (cantDosPuntos == 1)
                    {
                        string[] partes = texto.Split(':');
                        int hora = int.Parse(partes[0]);
                        int minutos = int.Parse(partes[1]);
                        if (hora < 24 && minutos < 60)
                        {
                            ok = true;
                            texto = partes[0].PadLeft(2, '0') + ":" + partes[1].PadLeft(2, '0');
                        }
                    }
                }

                if (ok)
                {
                    celda.Value = texto;
                    celda.ErrorText = "";
                }
                else
                {
                    celda.ErrorText = ObtenerLeyenda("msgHoraMal");
                }
            }
        }

        private void DgvViajes_CellEnter(object sender, DataGridViewCellEventArgs e)
        {
            // Esto es para que los dropdown se expandan al primer clic
            if (dgvViajes.Columns[e.ColumnIndex] is DataGridViewComboBoxColumn)
            {
                dgvViajes.BeginEdit(true);
                ((ComboBox)dgvViajes.EditingControl).DroppedDown = true;
            }
        }

        private void BtnGuardar_Click(object sender, EventArgs e)
        {
            if (ValidarGrilla())
            {
                foreach (DataGridViewRow row in dgvViajes.Rows)
                {
                    GridItem gridItem = row.DataBoundItem as GridItem;
                    // TODO: Modificar directamente los viajes de la planilla horaria y hacer un Guardar de la planilla.
                    Viaje viaje = gridItem.Viaje;
                    viaje.Completado = row.Cells["colCompletado"].Value != null && (bool)row.Cells["colCompletado"].Value;
                    
                    if(row.Cells["colHoraRealLlegada"].Value != null)
                    {
                        viaje.HoraRealLlegada = new DateTime() + TimeSpan.Parse(row.Cells["colHoraRealLlegada"].Value.ToString());
                    }

                    if(row.Cells["colDensidadPasajeros"].Value != null)
                    {
                        viaje.Completitud = completitudes.First(c => c.Value == row.Cells["colDensidadPasajeros"].Value.ToString()).Key;
                    }

                    viaje.Guardar();
                }
            }
        }

        private bool ValidarGrilla()
        {
            foreach (DataGridViewRow row in dgvViajes.Rows)
            {
                if(!string.IsNullOrEmpty(row.Cells["colHoraRealLlegada"].ErrorText))
                {
                    MessageBox.Show(ObtenerLeyenda("msgCeldasConError"), "", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    return false;
                }

                if (row.Cells["colCompletado"].Value != null && (bool)row.Cells["colCompletado"].Value)
                {
                    if (string.IsNullOrEmpty(row.Cells["colHoraRealLlegada"].Value?.ToString()))
                    {
                        MessageBox.Show(ObtenerLeyenda("msgFaltaHoraLlegada"), "", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        return false;
                    }

                    if (string.IsNullOrEmpty(row.Cells["colDensidadPasajeros"].Value?.ToString()))
                    {
                        MessageBox.Show(ObtenerLeyenda("msgFaltaDensidad"), "", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        return false;
                    }
                }
            }

            return true;
        }

        private class GridItem
        {
            public Viaje Viaje { get; set; }
            public string HoraSalida { get; set; }
            public string HoraEstimadaLlegada { get; set; }
            public string HoraRealLlegada { get; set; }
        }
    }
}
