using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class PermisoDAL
    {
        private int _permisoId;
        public int PermisoId
        {
            get { return _permisoId; }
            set { _permisoId = value; }
        }

        private string _nommbre;
        public string Nombre
        {
            get { return _nommbre; }
            set { _nommbre = value; }
        }

        private List<PermisoDAL> _permisosHijos;
        public List<PermisoDAL> PermisosHijos
        {
            get { return _permisosHijos; }
            set { _permisosHijos = value; }
        }

        private string _descripcion;
        public string Descripcion
        {
            get { return _descripcion; }
            set { _descripcion = value; }
        }

        private bool _habilitado;
        public bool Habilitado
        {
            get { return _habilitado; }
            set { _habilitado = value; }
        }

        private void Guardar()
        {

        }

        private void Obtener()
        {

        }
    }
}
