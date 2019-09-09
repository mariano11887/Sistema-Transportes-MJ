using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class ViajeDAL
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
        
        private DateTime _horaSalida;

        public DateTime HoraSalida
        {
            get { return _horaSalida; }
            set { _horaSalida = value; }
        }
        private DateTime _horaEstimadaLlegada;

        public DateTime HoraEstimadaLlegada
        {
            get { return _horaEstimadaLlegada; }
            set { _horaEstimadaLlegada = value; }
        }

        private DateTime _horaRealLlegada;

        public DateTime HoraRealLlegada
        {
            get { return _horaRealLlegada; }
            set { _horaRealLlegada = value; }
        }

        private bool _completado;

        public bool Completado
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

            string registro = string.Format("{0}{1}{2}{3}{4}{5}{6}{7}", Id, PlanillaHorariaId, EsIda,
                HoraSalida.ToString("yyyyMMddHHmm"), HoraEstimadaLlegada.ToString("yyyyMMddHHmm"),
                HoraRealLlegada.ToString("yyyyMMddHHmm"), Completado, CompletitudId);
            _dvh = DigitoVerificador.CalcularDV(registro);

            DigitoVerificador.ActualizarDVH("viaje", _dvh, Id);
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

        }

        public static void RecalcularDVV()
        {
            DigitoVerificador.RecalcularDVV("viaje");
        }

        public static List<ViajeDAL> ObtenerPorPlanillaHoraria(int planillaHorariaId)
        {
            string query = "SELECT id, es_ida, hora_salida, hora_estimada_llegada, hora_real_llegada, completitud_id " +
                "FROM viaje WHERE planilla_horaria_id = @planillaHorariaId AND completado = 1";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@planillaHorariaId", planillaHorariaId)
            };

            DataTable table = SqlHelper.Obtener(query, parameters);
            return table.Select().Select(r => new ViajeDAL
            {
                Completado = true,
                CompletitudId = r.IsNull("completitud_id") ? 0 : int.Parse(r["completitud_id"].ToString()),
                EsIda = bool.Parse(r["es_ida"].ToString()),
                HoraEstimadaLlegada = DateTime.Parse(r["hora_estimada_llegada"].ToString()),
                HoraRealLlegada = r.IsNull("hora_real_llegada") ? default : DateTime.Parse(r["hora_real_llegada"].ToString()),
                HoraSalida = DateTime.Parse(r["hora_salida"].ToString()),
                Id = int.Parse(r["id"].ToString()),
                PlanillaHorariaId = planillaHorariaId
            }).ToList();
        }
    }
}
