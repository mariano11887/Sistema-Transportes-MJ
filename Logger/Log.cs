using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace Logger
{
    public static class Log
    {
        private const string ARCHIVO_LOG = "TransportesMJ.log";
        private const string ARCHIVO_LOG_XML = "TransportesMJ.xml";

        public static void Grabar(Exception ex)
        {
            string ubicacionLog = ConfigurationManager.AppSettings.Get("ubicacionLog");
            if (!Directory.Exists(ubicacionLog))
            {
                Directory.CreateDirectory(ubicacionLog);
            }

            using (StreamWriter writer = new StreamWriter(ubicacionLog + ARCHIVO_LOG, true))
            {
                writer.WriteLine("Fecha: " + DateTime.Now.ToString() + Environment.NewLine +
                    "Mensaje: " + ex.Message + Environment.NewLine +
                    "Stack trace: " + ex.StackTrace);
                writer.WriteLine(Environment.NewLine + "--------------------------------------------------" + Environment.NewLine);
            }

            ObjetoLog objetoLog = new ObjetoLog
            {
                Fecha = DateTime.Now.ToString(),
                Mensaje = ex.Message,
                StackTrace = ex.StackTrace
            };
            using (Stream miStream = new FileStream(ubicacionLog + ARCHIVO_LOG_XML, FileMode.Append))
            {
                XmlSerializer serializador = new XmlSerializer(typeof(ObjetoLog));
                serializador.Serialize(miStream, objetoLog);
                miStream.Close();
            }
        }

        [Serializable]
        public class ObjetoLog
        {
            public string Fecha { get; set; }
            public string Mensaje { get; set; }
            public string StackTrace { get; set; }
        }
    }
}
