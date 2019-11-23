﻿using DAL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Vehiculo
    {
        #region Propiedades
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
        public DateTime FechaAdquisiquion
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

        private Terminal _ultimoEstacionamiento;

        public Terminal UltimoEstacionamiento
        {
            get
            {
                if(_ultimoEstacionamiento == null)
                {
                    _ultimoEstacionamiento = ObtenerUltimoEstacionamiento();
                }
                return _ultimoEstacionamiento;
            }
        }

        #endregion

        public void Guardar()
        {
            VehiculoDAL vehiculoDAL = new VehiculoDAL
            {
                AnioFabricacion = AnioFabricacion,
                Capacidad = Capacidad,
                EnCirculacion = EnCirculacion,
                FechaAdquisicion = FechaAdquisiquion,
                Habilitado = true,
                Marca = Marca,
                Modelo = Modelo,
                NumeroInterno = NumeroInterno,
                Patente = Patente,
                VehiculoId = Id
            };
            vehiculoDAL.Guardar();

            Bitacora.Loguear("Se guardó el vehículo con Id " + vehiculoDAL.VehiculoId);
        }

        public void Borrar()
        {
            VehiculoDAL.Borrar(Id);

            Bitacora.Loguear("Se borró vehículo con Id " + Id);
        }

        private Terminal ObtenerUltimoEstacionamiento()
        {
            int ultimaTerminalId = VehiculoDAL.ObtenerUltimaTerminalId(Id);
            if (ultimaTerminalId <= 0)
            {
                // No hay datos de este vehículo. Asumo que está en la terminal configurada en el config
                ultimaTerminalId = int.Parse(ConfigurationManager.AppSettings["terminalIdNuevoVehiculo"]);
            }

            return Terminal.Obtener(ultimaTerminalId);
        }

        public static Vehiculo Buscar(int id)
        {
            VehiculoDAL v = VehiculoDAL.Buscar(id);
            return new Vehiculo
            {
                AnioFabricacion = v.AnioFabricacion,
                Capacidad = v.Capacidad,
                EnCirculacion = v.EnCirculacion,
                FechaAdquisiquion = v.FechaAdquisicion,
                Id = v.VehiculoId,
                Marca = v.Marca,
                Modelo = v.Modelo,
                NumeroInterno = v.NumeroInterno,
                Patente = v.Patente
            };
        }

        public static List<Vehiculo> Buscar(string patente, int numeroDeInterno, bool? enCirculacion)
        {
            return VehiculoDAL.Buscar(patente, numeroDeInterno, enCirculacion).Select(v => new Vehiculo
            {
                AnioFabricacion = v.AnioFabricacion,
                Capacidad = v.Capacidad,
                EnCirculacion = v.EnCirculacion,
                FechaAdquisiquion = v.FechaAdquisicion,
                Id = v.VehiculoId,
                Marca = v.Marca,
                Modelo = v.Modelo,
                NumeroInterno = v.NumeroInterno,
                Patente = v.Patente
            }).ToList();
        }

        public static List<Vehiculo> ListarTodos()
        {
            return VehiculoDAL.ListarTodos().Select(v => new Vehiculo
            {
                AnioFabricacion = v.AnioFabricacion,
                Capacidad = v.Capacidad,
                EnCirculacion = v.EnCirculacion,
                FechaAdquisiquion = v.FechaAdquisicion,
                Id = v.VehiculoId,
                Marca = v.Marca,
                Modelo = v.Modelo,
                NumeroInterno = v.NumeroInterno,
                Patente = v.Patente
            }).ToList();
        }
    }
}
