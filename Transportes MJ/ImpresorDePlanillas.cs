using BE;
using BL;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Printing;
using System.Windows.Forms;

namespace UI
{
    public class ImpresorDePlanillas
    {
        private readonly DataGridView dataGridView;
        private readonly FormGeneral formGeneral;

        private readonly Dictionary<string, string> datosPlanilla;
        private readonly List<string> columnasAImprimir;
        private readonly PrintDocument printDocument = new PrintDocument();
        private StringFormat stringFormat; // Esto se usa para formatear las filas de la grilla
        private readonly List<int> margenesIzquierdoColumnas = new List<int>(); // Usado para guardar la distancia desde la izquierda de las columnas
        private readonly List<int> anchosColumnas = new List<int>(); // Usado para guardar los anchos de las columnas
        int anchoTotal; // Para calcular el ancho total de la grilla

        public ImpresorDePlanillas(PlanillaHorariaBE planillaHoraria, DataGridView dataGridView, FormGeneral formGeneral)
        {
            this.dataGridView = dataGridView;
            this.formGeneral = formGeneral;

            printDocument.PrintPage += PrintDocument_PrintPage;
            printDocument.BeginPrint += PrintDocument_BeginPrint;

            datosPlanilla = new Dictionary<string, string>
            {
                { "lblNumeroPlanilla", planillaHoraria.Id.ToString() },
                { "lblChofer", planillaHoraria.Chofer.Nombre },
                { "lblRecorrido", planillaHoraria.Recorrido.ToString() },
                { "lblFecha", planillaHoraria.Fecha.ToString("dd/MM/yyyy") },
                { "lblCoche", formGeneral.ObtenerLeyenda("valInterno") + " " + planillaHoraria.Vehiculo.NumeroInterno +
                    " (" + planillaHoraria.Vehiculo.Patente + ")" },
            };

            columnasAImprimir = new List<string>
            {
                "colOrigen",
                "colHoraSalida",
                "colDestino",
                "colHoraEstimadaLlegada",
                "colHoraRealLlegada",
                "colCompletado",
                "colDensidadPasajeros"
            };
        }

        public void Imprimir()
        {
            PrintDialog printDialog = new PrintDialog
            {
                Document = printDocument
            };

            if (printDialog.ShowDialog() == DialogResult.OK)
            {
                printDocument.Print();
            }
        }

        private void PrintDocument_PrintPage(object sender, PrintPageEventArgs e)
        {
            int margenIzquierdo = e.MarginBounds.Left;
            int margenSuperior = e.MarginBounds.Top;

            // Imprimo los datos de la planilla
            Font fuenteTitulo = new Font(dataGridView.Font.FontFamily, 12, FontStyle.Bold);
            Font fuenteDato = new Font(dataGridView.Font.FontFamily, 12, FontStyle.Regular);

            foreach (KeyValuePair<string, string> dato in datosPlanilla)
            {
                string strDato = formGeneral.ObtenerLeyenda(dato.Key) + ":";
                e.Graphics.DrawString(strDato, fuenteTitulo, Brushes.Black, margenIzquierdo, margenSuperior);
                e.Graphics.DrawString(dato.Value, fuenteDato, Brushes.Black,
                    margenIzquierdo + (int)e.Graphics.MeasureString(strDato, fuenteTitulo).Width + 10, margenSuperior);
                margenSuperior += (int)e.Graphics.MeasureString(strDato, fuenteTitulo).Height + 13;
            }

            // Seteo el ancho y la altura de las celdas
            int alturaEncbezado = 0;
            foreach (string nombreColumna in columnasAImprimir)
            {
                DataGridViewColumn columna = dataGridView.Columns[nombreColumna];
                int ancho = (int)Math.Floor(columna.Width / (double)anchoTotal * anchoTotal *
                    ((double)e.MarginBounds.Width / anchoTotal));

                alturaEncbezado = Math.Max(alturaEncbezado, (int)e.Graphics.MeasureString(columna.HeaderText, columna.InheritedStyle.Font, ancho).Height + 11);

                // Guardo el ancho y alto de los encabezados
                margenesIzquierdoColumnas.Add(margenIzquierdo);
                anchosColumnas.Add(ancho);
                margenIzquierdo += ancho;
            }

            // Dibujo los encabezados
            for (int i = 0; i < columnasAImprimir.Count; i++)
            {
                DataGridViewColumn columna = dataGridView.Columns[columnasAImprimir[i]];

                // Dibujo el rectángulo
                e.Graphics.DrawRectangle(Pens.Black,
                    new Rectangle(margenesIzquierdoColumnas[i], margenSuperior, anchosColumnas[i], alturaEncbezado));
                // Relleno el rectángulo con gris
                e.Graphics.FillRectangle(new SolidBrush(Color.LightGray),
                    new Rectangle(margenesIzquierdoColumnas[i], margenSuperior, anchosColumnas[i], alturaEncbezado));
                // Le pongo el texto adentro
                e.Graphics.DrawString(columna.HeaderText, columna.InheritedStyle.Font,
                    new SolidBrush(columna.InheritedStyle.ForeColor),
                    new RectangleF(margenesIzquierdoColumnas[i], margenSuperior, anchosColumnas[i], alturaEncbezado), stringFormat);
            }
            margenSuperior += alturaEncbezado;

            // Ahora imprimo todas las filas
            foreach(DataGridViewRow row in dataGridView.Rows)
            {
                int alturaCelda = row.Height + 5;

                for (int i = 0; i < columnasAImprimir.Count; i++)
                {
                    // Dibujo los bordes
                    e.Graphics.DrawRectangle(Pens.Black,
                        new Rectangle(margenesIzquierdoColumnas[i], margenSuperior, anchosColumnas[i], alturaCelda));

                    // Dibujo el contenido (si hay)
                    DataGridViewCell cell = row.Cells[columnasAImprimir[i]];
                    if(row.Cells[i].Value != null)
                    {
                        if (cell.FormattedValue is bool)
                        {
                            if((bool)cell.FormattedValue)
                            {
                                // Dibujo un check
                                Point point1 = new Point(margenesIzquierdoColumnas[i] + anchosColumnas[i] / 2 - 6,
                                                        margenSuperior + alturaCelda / 2 + 2);
                                Point point2 = new Point(margenesIzquierdoColumnas[i] + anchosColumnas[i] / 2,
                                                        margenSuperior + alturaCelda - 4);
                                Point point3 = new Point(margenesIzquierdoColumnas[i] + anchosColumnas[i] / 2 + 6,
                                                        margenSuperior + 6);
                                e.Graphics.DrawLine(Pens.Black, point1, point2);
                                e.Graphics.DrawLine(Pens.Black, point2, point3);
                            }
                        }
                        else
                        {
                            e.Graphics.DrawString(cell.FormattedValue.ToString(), cell.InheritedStyle.Font,
                                new SolidBrush(cell.InheritedStyle.ForeColor),
                                new RectangleF(margenesIzquierdoColumnas[i], margenSuperior, anchosColumnas[i], alturaEncbezado), stringFormat);
                        }
                    }
                }

                margenSuperior += alturaCelda;
            }
        }

        private void PrintDocument_BeginPrint(object sender, PrintEventArgs e)
        {
            stringFormat = new StringFormat
            {
                Alignment = StringAlignment.Center,
                LineAlignment = StringAlignment.Center,
                Trimming = StringTrimming.EllipsisCharacter
            };

            margenesIzquierdoColumnas.Clear();
            anchosColumnas.Clear();
            anchoTotal = 0;
            foreach(string column in columnasAImprimir)
            {
                anchoTotal += dataGridView.Columns[column].Width;
            }
        }
    }
}
