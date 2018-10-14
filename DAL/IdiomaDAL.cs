using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class IdiomaDAL
    {
        #region Propiedades
        private int _idiomaId;
        public int IdiomaId
        {
            get { return _idiomaId; }
            set { _idiomaId = value; }
        }

        private string _nombre;
        public string Nombre
        {
            get { return _nombre; }
            set { _nombre = value; }
        }

        private bool _editable;
        public bool Editable
        {
            get { return _editable; }
            set { _editable = value; }
        }
        #endregion

        #region Métodos públicos
        public void Guardar()
        {
            if(IdiomaId > 0)
            {
                Actualizar();
            }
            else
            {
                Insertar();
            }
        }

        public static IdiomaDAL Obtener(int Id)
        {
            string query = "SELECT id, nombre, editable FROM idioma WHERE id = @id";
            SqlParameter[] parameters =
            {
                new SqlParameter("@id", Id)
            };
            DataTable table = SqlHelper.Instancia().Obtener(query, parameters);
            IdiomaDAL idiomaDAL = new IdiomaDAL();
            if(table.Rows.Count > 0)
            {
                idiomaDAL.IdiomaId = int.Parse(table.Rows[0]["id"].ToString());
                idiomaDAL.Nombre = table.Rows[0]["nombre"].ToString();
                idiomaDAL.Editable = bool.Parse(table.Rows[0]["editable"].ToString());
            }
            return idiomaDAL;
        }

        public void Borrar()
        {

        }

        public static List<IdiomaDAL> ObtenerTodos()
        {
            string query = "SELECT id, nombre, editable FROM idioma";
            SqlParameter[] parameters = new SqlParameter[0];
            DataTable table = SqlHelper.Instancia().Obtener(query, parameters);
            List<IdiomaDAL> idiomasDAL = new List<IdiomaDAL>();
            foreach(DataRow row in table.Rows)
            {
                IdiomaDAL idiomaDAL = new IdiomaDAL
                {
                    IdiomaId = int.Parse(row["id"].ToString()),
                    Nombre = row["nombre"].ToString(),
                    Editable = bool.Parse(row["editable"].ToString())
                };
                idiomasDAL.Add(idiomaDAL);
            }
            return idiomasDAL;
        }
        #endregion

        #region Métodos privados
        private void Insertar()
        {
            string query = "INSERT INTO idioma (nombre) OUTPUT INSERTED.id VALUES (@nombre)";
            SqlParameter[] parameters = new SqlParameter[1]
            {
                new SqlParameter("@nombre", Nombre)
            };
            IdiomaId = SqlHelper.Instancia().Insertar(query, parameters);
        }

        private void Actualizar()
        {
            string query = "UPDATE idioma SET nombre = @nombre WHERE id = @id AND editable = 1";
            SqlParameter[] parameters = new SqlParameter[2]
            {
                new SqlParameter("@nombre", Nombre),
                new SqlParameter("@id", IdiomaId)
            };
            SqlHelper.Instancia().Ejecutar(query, parameters);
        }
        #endregion
    }
}
