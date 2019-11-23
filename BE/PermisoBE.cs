using System.Collections.Generic;

namespace BE
{
    public abstract class PermisoBE
    {
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

        private string _descripcion;
        public string Descripcion
        {
            get { return _descripcion; }
            set { _descripcion = value; }
        }

        public abstract void AgregarPermisoHijo(PermisoBE permiso);

        public abstract void QuitarPermisoHijo(PermisoBE permiso);

        public abstract List<PermisoBE> DevolverPerfil();

        public override string ToString()
        {
            return _nombre;
        }

        public class Comparador : IEqualityComparer<PermisoBE>
        {
            public bool Equals(PermisoBE x, PermisoBE y)
            {
                return x.Id == y.Id;
            }

            public int GetHashCode(PermisoBE obj)
            {
                return obj.GetHashCode();
            }
        }
    }
}
