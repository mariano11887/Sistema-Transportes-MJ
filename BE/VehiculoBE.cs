using System;

namespace BE
{
    public class VehiculoBE
    {
        private int _id;
        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        private string _patente;
        public string Patente
        {
            get { return _patente; }
            set { _patente = value; }
        }

        private string _marca;
        public string Marca
        {
            get { return _marca; }
            set { _marca = value; }
        }

        private string _modelo;
        public string Modelo
        {
            get { return _modelo; }
            set { _modelo = value; }
        }

        private DateTime _fechaAdquisicion;
        public DateTime FechaAdquisicion
        {
            get { return _fechaAdquisicion; }
            set { _fechaAdquisicion = value; }
        }

        private int _anioFabricacion;
        public int AnioFabricacion
        {
            get { return _anioFabricacion; }
            set { _anioFabricacion = value; }
        }

        private int _numeroInterno;
        public int NumeroInterno
        {
            get { return _numeroInterno; }
            set { _numeroInterno = value; }
        }

        private int _capacidad;
        public int Capacidad
        {
            get { return _capacidad; }
            set { _capacidad = value; }
        }

        private bool _enCirculacion;
        public bool EnCirculacion
        {
            get { return _enCirculacion; }
            set { _enCirculacion = value; }
        }
    }
}
