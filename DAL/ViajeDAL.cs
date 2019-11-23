using BE;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace DAL
{
    public class ViajeDAL : IDigitoVerificable
    {
        public string ObtenerNombreTabla()
        {
            return "viaje";
        }

        public List<RegistroParaDV> ObtenerRegistrosParaDV()
        {
            string query = "SELECT id, planilla_horaria_id, es_ida, hora_salida, hora_estimada_llegada, hora_real_llegada, " +
                "completado, completitud_id, dvh FROM viaje";
            DataTable table = SqlHelper.Obtener(query, new SqlParameter[0]);

            return table.Select().Select(r => new RegistroParaDV
            {
                DVH = int.Parse(r["dvh"].ToString()),
                Registro = ObtenerRegistroDVH(new ViajeBE
                {
                    Completado = r.IsNull("completado") ? (bool?)null : bool.Parse(r["completado"].ToString()),
                    Completitud = (CompletitudViaje)(r.IsNull("completitud_id") ? 0 : int.Parse(r["completitud_id"].ToString())),
                    EsIda = bool.Parse(r["es_ida"].ToString()),
                    HoraEstimadaLlegada = new DateTime() + TimeSpan.Parse(r["hora_estimada_llegada"].ToString()),
                    HoraRealLlegada = r.IsNull("hora_real_llegada") ? (DateTime?)null : new DateTime() + TimeSpan.Parse(r["hora_real_llegada"].ToString()),
                    HoraSalida = new DateTime() + TimeSpan.Parse(r["hora_salida"].ToString()),
                    Id = int.Parse(r["id"].ToString())
                }, int.Parse(r["planilla_horaria_id"].ToString()))
            }).ToList();
        }

        public static void Guardar(ViajeBE viaje, int planillaHorariaId)
        {
            if(viaje.Id > 0)
            {
                Actualizar(viaje);
            }
            else
            {
                Insertar(viaje, planillaHorariaId);
            }

            int dvh = DigitoVerificadorDAL.CalcularDV(ObtenerRegistroDVH(viaje, planillaHorariaId));

            DigitoVerificadorDAL.ActualizarDVH("viaje", dvh, viaje.Id);
        }

        private static string ObtenerRegistroDVH(ViajeBE viaje, int planillaHorariaId)
        {
            return string.Format("{0}{1}{2}{3}{4}{5}{6}{7}", viaje.Id, planillaHorariaId, viaje.EsIda,
                viaje.HoraSalida.TimeOfDay.ToString(), viaje.HoraEstimadaLlegada.TimeOfDay.ToString(),
                viaje.HoraRealLlegada?.TimeOfDay.ToString(), viaje.Completado, (int)viaje.Completitud);
        }

        private static void Insertar(ViajeBE viaje, int planillaHorariaId)
        {
            string query = "INSERT INTO viaje (planilla_horaria_id, es_ida, hora_salida, hora_estimada_llegada, dvh) " +
                "OUTPUT INSERTED.id VALUES (@planillaHorariaId, @esIda, @horaSalida, @horaEstimadaLlegada, 0)";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@planillaHorariaId", planillaHorariaId),
                new SqlParameter("@esIda", viaje.EsIda),
                new SqlParameter("@horaSalida", viaje.HoraSalida.TimeOfDay),
                new SqlParameter("@horaEstimadaLlegada", viaje.HoraEstimadaLlegada.TimeOfDay)
            };

            viaje.Id = SqlHelper.Insertar(query, parameters);
        }

        private static void Actualizar(ViajeBE viaje)
        {
            string query = "UPDATE viaje SET hora_real_llegada = @horaRealLlegada, completado = @completado, " +
                "completitud_id = @idCompletitud WHERE id = @id";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@horaRealLlegada", viaje.HoraRealLlegada.HasValue ? (object)viaje.HoraRealLlegada.Value.TimeOfDay : DBNull.Value),
                new SqlParameter("@completado", (object)viaje.Completado ?? DBNull.Value),
                new SqlParameter("@idCompletitud", viaje.Completitud > 0 ? (object)(int)viaje.Completitud : DBNull.Value),
                new SqlParameter("@id", viaje.Id)
            };

            SqlHelper.Ejecutar(query, parameters);
        }

        public static void RecalcularDVV()
        {
            DigitoVerificadorDAL.RecalcularDVV("viaje");
        }

        public static List<ViajeBE> ObtenerPorPlanillaHoraria(int planillaHorariaId)
        {
            string query = "SELECT id, es_ida, hora_salida, hora_estimada_llegada, hora_real_llegada, completado, completitud_id " +
                "FROM viaje WHERE planilla_horaria_id = @planillaHorariaId";
            
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@planillaHorariaId", planillaHorariaId)
            };

            DataTable table = SqlHelper.Obtener(query, parameters);
            return table.Select().Select(r => new ViajeBE
            {
                Completado = r.IsNull("completado") ? (bool?)null : bool.Parse(r["completado"].ToString()),
                Completitud = (CompletitudViaje)(r.IsNull("completitud_id") ? 0 : int.Parse(r["completitud_id"].ToString())),
                EsIda = bool.Parse(r["es_ida"].ToString()),
                HoraEstimadaLlegada = new DateTime() + TimeSpan.Parse(r["hora_estimada_llegada"].ToString()),
                HoraRealLlegada = r.IsNull("hora_real_llegada") ? (DateTime?)null : new DateTime() + TimeSpan.Parse(r["hora_real_llegada"].ToString()),
                HoraSalida = new DateTime() + TimeSpan.Parse(r["hora_salida"].ToString()),
                Id = int.Parse(r["id"].ToString())
            }).ToList();
        }
    }
}
