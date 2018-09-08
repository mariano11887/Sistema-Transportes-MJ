using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public abstract class Permiso
    {
        protected int _id;

        protected string _nombre;
        public string Nombre
        {
            get { return _nombre; }
            set { _nombre = value; }
        }

        protected string _descripcion;
        public string Descripcion
        {
            get { return _descripcion; }
            set { _descripcion = value; }
        }

        protected bool _editable;
        public bool Editable
        {
            get { return _editable; }
            set { _editable = value; }
        }


        public abstract void Guardar();

        public abstract void Borrar();

        public abstract List<Permiso> DevolverPerfil();

        public abstract List<Permiso> ObtenerPermisosHijos();

        public abstract void AgregarPermisoHijo();

        public static Permiso ObtenerPermisoRaiz()
        {
            PermisoDAL permisoDAL = new PermisoDAL()
            {
                Nombre = "root"
            };
            permisoDAL.Obtener();
            return ConvertirDesdeDAL(permisoDAL);
        }

        public override string ToString()
        {
            return _nombre;
        }

        public static Permiso ConvertirDesdeDAL(PermisoDAL permisoDAL)
        {
            Permiso permiso;
            if (permisoDAL.PermisosHijosIds.Count == 0)
            {
                permiso = new PermisoSimple();
            }
            else
            {
                permiso = new PermisoCompuesto();
            }

            permiso._id = permisoDAL.PermisoId;
            permiso.Nombre = permisoDAL.Nombre;
            permiso.Descripcion = permisoDAL.Descripcion;
            permiso.Editable = permisoDAL.Editable;

            return permiso;
        }
    }
}
