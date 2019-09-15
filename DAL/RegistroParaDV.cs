namespace DAL
{
    public class RegistroParaDV
    {
        private string _registro;

        public string Registro
        {
            get { return _registro; }
            set { _registro = value; }
        }

        private int _dvh;

        public int DVH
        {
            get { return _dvh; }
            set { _dvh = value; }
        }
    }
}
