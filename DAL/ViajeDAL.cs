using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace DAL
{
    public class ViajeDAL : IDigitoVerificable
    {
        #region Propiedades
        private int _id;

        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        private int _planillaHorariaId;

        public int PlanillaHorariaId
        {
            get { return _planillaHorariaId; }
            set { _planillaHorariaId = value; }
        }

        private bool _esIda;

        public bool EsIda
        {
            get { return _esIda; }
            set { _esIda = value; }
        }
        
        private TimeSpan _horaSalida;

        public TimeSpan HoraSalida
        {
            get { return _horaSalida; }
            set { _horaSalida = value; }
        }
        private TimeSpan _horaEstimadaLlegada;

        public TimeSpan HoraEstimadaLlegada
        {
            get { return _horaEstimadaLlegada; }
            set { _horaEstimadaLlegada = value; }
        }

        private TimeSpan? _horaRealLlegada;

        public TimeSpan? HoraRealLlegada
        {
            get { return _horaRealLlegada; }
            set { _horaRealLlegada = value; }
        }

        private bool? _completado;

        public bool? Completado
        {
            get { return _completado; }
            set { _completado = value; }
        }

        private int _completitudId;

        public int CompletitudId
        {
            get { return _completitudId; }
            set { _completitudId = value; }
        }

        private int _dvh;

        public int DVH
        {
            get { return _dvh; }
        }
        #endregion

        public string ObtenerNombreTabla()
        {
            return "viaje";
        }

        public List<RegistroParaDV> ObtenerRegistrosParaDV()
        {
            string query = "SELECT id, planilla_horaria_id, es_ida, hora_salida, hora_estimada_llegada, hora_real_llegada, " +
                "completado, completitud_id, dvh FROM viaje";
            DataTable table = SqlHelper.Obtener(query, new SqlParameter[0]);

            List<ViajeDAL> viajes = table.Select().Select(r => new ViajeDAL
            {
                Completado = r.IsNull("completado") ? (bool?)null : bool.Parse(r["completado"].ToString()),
                CompletitudId = r.IsNull("completitud_id") ? 0 : int.Parse(r["completitud_id"].ToString()),
                _dvh = int.Parse(r["dvh"].ToString()),
                EsIda = bool.Parse(r["es_ida"].ToString()),
                HoraEstimadaLlegada = TimeSpan.Parse(r["hora_estimada_llegada"].ToString()),
                HoraRealLlegada = r.IsNull("hora_real_llegada") ? (TimeSpan?)null : TimeSpan.Parse(r["hora_real_llegada"].ToString()),
                HoraSalida = TimeSpan.Parse(r["hora_salida"].ToString()),
                Id = int.Parse(r["id"].ToString()),
                PlanillaHorariaId = int.Parse(r["planilla_horaria_id"].ToString())
            }).ToList();

            return viajes.Select(v => new RegistroParaDV
            {
                Registro = v.ObtenerRegistroDVH(),
                DVH = v._dvh
            }).ToList();
        }

        public void Guardar()
        {
            if(Id > 0)
            {
                Actualizar();
            }
            else
            {
                Insertar();
            }

            _dvh = DigitoVerificadorDAL.CalcularDV(ObtenerRegistroDVH());

            DigitoVerificadorDAL.ActualizarDVH("viaje", _dvh, Id);
        }

        private string ObtenerRegistroDVH()
        {
            return string.Format("{0}{1}{2}{3}{4}{5}{6}{7}", Id, PlanillaHorariaId, EsIda,
                HoraSalida.ToString(), HoraEstimadaLlegada.ToString(),
                HoraRealLlegada.ToString(), Completado, CompletitudId);
        }

        private void Insertar()
        {
            string query = "INSERT INTO viaje (planilla_horaria_id, es_ida, hora_salida, hora_estimada_llegada, dvh) " +
                "OUTPUT INSERTED.id VALUES (@planillaHorariaId, @esIda, @horaSalida, @horaEstimadaLlegada, 0)";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@planillaHorariaId", PlanillaHorariaId),
                new SqlParameter("@esIda", EsIda),
                new SqlParameter("@horaSalida", HoraSalida),
                new SqlParameter("@horaEstimadaLlegada", HoraEstimadaLlegada)
            };

            Id = SqlHelper.Insertar(query, parameters);
        }

        private void Actualizar()
        {
            string query = "UPDATE viaje SET hora_real_llegada = @horaRealLlegada, completado = @completado, " +
                "completitud_id = @idCompletitud WHERE id = @id";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@horaRealLlegada", HoraRealLlegada.HasValue ? (object)HoraRealLlegada.Value : DBNull.Value),
                new SqlParameter("@completado", (object)Completado ?? DBNull.Value),
                new SqlParameter("@idCompletitud", CompletitudId > 0 ? (object)CompletitudId : DBNull.Value),
                new SqlParameter("@id", Id)
            };

            SqlHelper.Ejecutar(query, parameters);
        }

        public static void RecalcularDVV()
        {
            DigitoVerificadorDAL.RecalcularDVV("viaje");
        }

        public static List<ViajeDAL> ObtenerPorPlanillaHoraria(int planillaHorariaId)
        {
            string query = "SELECT id, es_ida, hora_salida, hora_estimada_llegada, hora_real_llegada, completado, completitud_id " +
                "FROM viaje WHERE planilla_horaria_id = @planillaHorariaId";
            
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@planillaHorariaId", planillaHorariaId)
            };

            DataTable table = SqlHelper.Obtener(query, parameters);
            return table.Select().Select(r => new ViajeDAL
            {
                Completado = r.IsNull("completado") ? (bool?)null : bool.Parse(r["completado"].ToString()),
                CompletitudId = r.IsNull("completitud_id") ? 0 : int.Parse(r["completitud_id"].ToString()),
                EsIda = bool.Parse(r["es_ida"].ToString()),
                HoraEstimadaLlegada = TimeSpan.Parse(r["hora_estimada_llegada"].ToString()),
                HoraRealLlegada = r.IsNull("hora_real_llegada") ? (TimeSpan?)null : TimeSpan.Parse(r["hora_real_llegada"].ToString()),
                HoraSalida = TimeSpan.Parse(r["hora_salida"].ToString()),
                Id = int.Parse(r["id"].ToString()),
                PlanillaHorariaId = planillaHorariaId
            }).ToList();
        }
    }
}
