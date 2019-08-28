using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Terminal
    {
        #region Propiedades
        private int _id;

        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        private string _nombre;

        public string Nombre
        {
            get { return _nombre; }
            set { _nombre = value; }
        }

        private string _direccion;

        public string Direccion
        {
            get { return _direccion; }
            set { _direccion = value; }
        }

        private decimal _latitud;

        public decimal Latitud
        {
            get { return _latitud; }
            set { _latitud = value; }
        }

        private decimal _longitud;

        public decimal Longitud
        {
            get { return _longitud; }
            set { _longitud = value; }
        }
        #endregion

        public static Terminal Obtener(int id)
        {
            TerminalDAL dal = TerminalDAL.Obtener(id);
            return new Terminal
            {
                Direccion = dal.Direccion,
                Id = dal.Id,
                Latitud = dal.Latitud,
                Longitud = dal.Longitud,
                Nombre = dal.Nombre
            };
        }
    }
}
