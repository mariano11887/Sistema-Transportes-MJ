using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class LeyendaDAL
    {
        #region Propiedades
        private int _idiomaId;
        public int IdiomaId
        {
            get { return _idiomaId; }
            set { _idiomaId = value; }
        }

        private string _nombreForm;
        public string NombreForm
        {
            get { return _nombreForm; }
            set { _nombreForm = value; }
        }

        private string _nombreControl;
        public string NombreControl
        {
            get { return _nombreControl; }
            set { _nombreControl = value; }
        }

        private string _texto;
        public string Texto
        {
            get { return _texto; }
            set { _texto = value; }
        }
        #endregion

        #region Métodos públicos
        public static List<LeyendaDAL> Obtener(int IdiomaId)
        {
            string query = "SELECT nombre_form, nombre_control, texto FROM leyenda WHERE idioma_id = @idiomaId";
            SqlParameter[] parameters =
            {
                new SqlParameter("@idiomaId", IdiomaId)
            };
            DataTable table = SqlHelper.Instancia().Obtener(query, parameters);
            List<LeyendaDAL> leyendasDAL = new List<LeyendaDAL>();
            foreach(DataRow row in table.Rows)
            {
                leyendasDAL.Add(new LeyendaDAL()
                {
                    IdiomaId = IdiomaId,
                    NombreForm = row["nombre_form"].ToString(),
                    NombreControl = row["nombre_control"].ToString(),
                    Texto = row["texto"].ToString()
                });
            }
            return leyendasDAL;
        }
        #endregion
    }
}
