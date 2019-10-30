using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class AlertaInsuficiencia
    {
        #region Propiedades
        private int _id;

        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        private DateTime _fecha;

        public DateTime Fecha
        {
            get { return _fecha; }
            set { _fecha = value; }
        }

        private int _choferesFaltantes;

        public int ChoferesFaltantes
        {
            get { return _choferesFaltantes; }
            set { _choferesFaltantes = value; }
        }

        private int _vehiculosFaltantes;

        public int VehiculosFaltantes
        {
            get { return _vehiculosFaltantes; }
            set { _vehiculosFaltantes = value; }
        }
        #endregion

        public void Guardar()
        {
            AlertaInsuficienciaDAL dal = new AlertaInsuficienciaDAL
            {
                Fecha = Fecha,
                ChoferesFaltantes = ChoferesFaltantes,
                VehiculosFaltanes = VehiculosFaltantes
            };
            dal.Guardar();

            Id = dal.Id;

            string mensaje = "Se generó una alerta de insuficiencia. Choferes faltantes: {0}. Vehículos faltantes. {1}";
            Bitacora.Loguear(string.Format(mensaje, ChoferesFaltantes, VehiculosFaltantes));
        }

        public static AlertaInsuficiencia ChequearAlerta()
        {
            int idUsuario = Sesion.Instancia().UsuarioLogueado.Id;
            AlertaInsuficienciaDAL dal = AlertaInsuficienciaDAL.ObtenerPorUsuario(idUsuario);
            if(dal != null)
            {
                AlertaInsuficiencia alerta = new AlertaInsuficiencia
                {
                    Id = dal.Id,
                    Fecha = dal.Fecha,
                    ChoferesFaltantes = dal.ChoferesFaltantes,
                    VehiculosFaltantes = dal.VehiculosFaltanes
                };

                // Ahora la marco para que no le vuelva a aparecer a este usuario
                dal.MarcarLeida(idUsuario);

                return alerta;
            }
            else
            {
                return null;
            }
        }
    }
}
