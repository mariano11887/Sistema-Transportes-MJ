using BL;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace UI
{
    public class GeneradorPdf
    {
        private readonly DataGridView dataGridView;
        private readonly FormGeneral formGeneral;

        private readonly Dictionary<string, string> datosPlanilla;
        private readonly List<string> columnasAImprimir;
        private StringFormat stringFormat; // Esto se usa para formatear las filas de la grilla
        private readonly List<int> margenesIzquierdoColumnas = new List<int>(); // Usado para guardar la distancia desde la izquierda de las columnas
        private readonly List<int> anchosColumnas = new List<int>(); // Usado para guardar los anchos de las columnas
        int anchoTotal; // Para calcular el ancho total de la grilla

        public GeneradorPdf(PlanillaHoraria planillaHoraria, DataGridView dataGridView, FormGeneral formGeneral)
        {
            this.dataGridView = dataGridView;
            this.formGeneral = formGeneral;

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

        public void Generar()
        {
            PrepararDatos();
            GuardarPdf();
        }

        private void PrepararDatos()
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
            foreach (string column in columnasAImprimir)
            {
                anchoTotal += dataGridView.Columns[column].Width;
            }
        }

        private void GuardarPdf()
        {
            Bitmap pg = new Bitmap((int)PageSize.A4.Height, (int)PageSize.A4.Width);
            Graphics gr = Graphics.FromImage(pg);

            int margenIzquierdo = 15;
            int margenSuperior = 15;

            // Imprimo los datos de la planilla
            System.Drawing.Font fuenteTitulo = new System.Drawing.Font(dataGridView.Font.FontFamily, 12, FontStyle.Bold);
            System.Drawing.Font fuenteDato = new System.Drawing.Font(dataGridView.Font.FontFamily, 12, FontStyle.Regular);

            foreach (KeyValuePair<string, string> dato in datosPlanilla)
            {
                string strDato = formGeneral.ObtenerLeyenda(dato.Key) + ":";
                gr.DrawString(strDato, fuenteTitulo, Brushes.Black, margenIzquierdo, margenSuperior);
                gr.DrawString(dato.Value, fuenteDato, Brushes.Black,
                    margenIzquierdo + (int)gr.MeasureString(strDato, fuenteTitulo).Width + 10, margenSuperior);
                margenSuperior += (int)gr.MeasureString(strDato, fuenteTitulo).Height + 13;
            }

            // Seteo el ancho y la altura de las celdas
            int alturaEncbezado = 0;
            foreach (string nombreColumna in columnasAImprimir)
            {
                DataGridViewColumn columna = dataGridView.Columns[nombreColumna];
                int ancho = (int)Math.Floor(columna.Width / (double)anchoTotal * anchoTotal *
                    ((double)PageSize.A4.Width / anchoTotal));

                alturaEncbezado = Math.Max(alturaEncbezado, (int)gr.MeasureString(columna.HeaderText, columna.InheritedStyle.Font, ancho).Height + 11);

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
                gr.DrawRectangle(Pens.Black,
                    new System.Drawing.Rectangle(margenesIzquierdoColumnas[i], margenSuperior, anchosColumnas[i], alturaEncbezado));
                // Relleno el rectángulo con gris
                gr.FillRectangle(new SolidBrush(Color.LightGray),
                    new System.Drawing.Rectangle(margenesIzquierdoColumnas[i], margenSuperior, anchosColumnas[i], alturaEncbezado));
                // Le pongo el texto adentro
                gr.DrawString(columna.HeaderText, columna.InheritedStyle.Font,
                    new SolidBrush(columna.InheritedStyle.ForeColor),
                    new RectangleF(margenesIzquierdoColumnas[i], margenSuperior, anchosColumnas[i], alturaEncbezado), stringFormat);
            }
            margenSuperior += alturaEncbezado;

            // Ahora imprimo todas las filas
            foreach (DataGridViewRow row in dataGridView.Rows)
            {
                int alturaCelda = row.Height + 5;

                for (int i = 0; i < columnasAImprimir.Count; i++)
                {
                    // Dibujo los bordes
                    gr.DrawRectangle(Pens.Black,
                        new System.Drawing.Rectangle(margenesIzquierdoColumnas[i], margenSuperior, anchosColumnas[i], alturaCelda));

                    // Dibujo el contenido (si hay)
                    DataGridViewCell cell = row.Cells[columnasAImprimir[i]];
                    if (row.Cells[i].Value != null)
                    {
                        if (cell.FormattedValue is bool)
                        {
                            if ((bool)cell.FormattedValue)
                            {
                                // Dibujo un check
                                Point point1 = new Point(margenesIzquierdoColumnas[i] + anchosColumnas[i] / 2 - 6,
                                                        margenSuperior + alturaCelda / 2 + 2);
                                Point point2 = new Point(margenesIzquierdoColumnas[i] + anchosColumnas[i] / 2,
                                                        margenSuperior + alturaCelda - 4);
                                Point point3 = new Point(margenesIzquierdoColumnas[i] + anchosColumnas[i] / 2 + 6,
                                                        margenSuperior + 6);
                                gr.DrawLine(Pens.Black, point1, point2);
                                gr.DrawLine(Pens.Black, point2, point3);
                            }
                        }
                        else
                        {
                            gr.DrawString(cell.FormattedValue.ToString(), cell.InheritedStyle.Font,
                                new SolidBrush(cell.InheritedStyle.ForeColor),
                                new RectangleF(margenesIzquierdoColumnas[i], margenSuperior, anchosColumnas[i], alturaEncbezado), stringFormat);
                        }
                    }
                }

                margenSuperior += alturaCelda;
            }



            //System.Drawing.Image image = System.Drawing.Image.FromFile("C:\\TransportesMJ\\foto.jpg");
            Document doc = new Document(PageSize.A4.Rotate());
            PdfWriter.GetInstance(doc, new FileStream("C:\\TransportesMJ\\ejemplo.pdf", FileMode.Create));
            doc.Open();
            iTextSharp.text.Image pdfImage = iTextSharp.text.Image.GetInstance(pg, BaseColor.WHITE);
            //iTextSharp.text.Image pdfImage = iTextSharp.text.Image.GetInstance(image, BaseColor.WHITE);
            doc.Add(pdfImage);
            doc.Close();


            // https://stackoverflow.com/questions/12882363/how-to-convert-graphics-into-image-or-bitmap
            // https://stackoverflow.com/questions/17145837/c-sharp-save-bitmap-as-pdf-with-itextsharp
        }
    }
}
