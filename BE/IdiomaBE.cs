using System.Collections.Generic;

namespace BE
{
    public class IdiomaBE
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

        private bool _editable;
        public bool Editable
        {
            get { return _editable; }
            set { _editable = value; }
        }

        private List<LeyendaBE> _leyendas;
        public List<LeyendaBE> Leyendas
        {
            get { return _leyendas; }
            set { _leyendas = value; }
        }

        public override string ToString()
        {
            return Nombre;
        }

        public override bool Equals(object obj)
        {
            if (obj is IdiomaBE)
            {
                return Id == ((IdiomaBE)obj).Id;
            }
            return false;
        }
    }
}
