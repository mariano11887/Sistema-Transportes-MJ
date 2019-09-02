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

        private short _dvh;

        public short DVH
        {
            get { return _dvh; }
            set { _dvh = value; }
        }
        #endregion

        public static List<ViajeDAL> ObtenerPorPlanillaHoraria(int planillaHorariaId)
        {
            string query = "SELECT id, hora_salida, hora_estimada_llegada, hora_real_llegada, completitud_id " +
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
                HoraEstimadaLlegada = DateTime.Parse(r["hora_estimada_llegada"].ToString()),
                HoraRealLlegada = r.IsNull("hora_real_llegada") ? default : DateTime.Parse(r["hora_real_llegada"].ToString()),
                HoraSalida = DateTime.Parse(r["hora_salida"].ToString()),
                Id = int.Parse(r["id"].ToString()),
                PlanillaHorariaId = planillaHorariaId
            }).ToList();
        }
    }
}
