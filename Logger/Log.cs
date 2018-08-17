using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logger
{
    public static class Log
    {
        private static string _logDirectory = "C:/TransportesMJ/";
        private static string _logFile = _logDirectory + "Transportes MJ.log";

        public static void Grabar(Exception ex)
        {
            if (!Directory.Exists(_logDirectory))
            {
                Directory.CreateDirectory(_logDirectory);
            }

            using (StreamWriter writer = new StreamWriter(_logFile, true))
            {
                writer.WriteLine("Fecha: " + DateTime.Now.ToString() + Environment.NewLine +
                    "Mensaje: " + ex.Message + Environment.NewLine +
                    "Stack trace: " + ex.StackTrace);
                writer.WriteLine(Environment.NewLine + "--------------------------------------------------" + Environment.NewLine);
            }
        }
    }
}
