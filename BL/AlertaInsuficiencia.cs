using BE;
using DAL;

namespace BL
{
    public class AlertaInsuficiencia
    {
        public static void Guardar(AlertaInsuficienciaBE alertaInsuficiencia)
        {
            AlertaInsuficienciaDAL.Guardar(alertaInsuficiencia);

            string mensaje = "Se generó una alerta de insuficiencia. Choferes faltantes: {0}. Vehículos faltantes. {1}";
            Bitacora.Loguear(string.Format(mensaje, alertaInsuficiencia.ChoferesFaltantes, alertaInsuficiencia.VehiculosFaltantes));
        }

        public static AlertaInsuficienciaBE ChequearAlerta()
        {
            int idUsuario = Sesion.Instancia().UsuarioLogueado.Id;
            AlertaInsuficienciaBE alertaInsuficiencia = AlertaInsuficienciaDAL.ObtenerPorUsuario(idUsuario);
            if(alertaInsuficiencia != null)
            {
                // Ahora la marco para que no le vuelva a aparecer a este usuario
                AlertaInsuficienciaDAL.MarcarLeida(alertaInsuficiencia, idUsuario);

                return alertaInsuficiencia;
            }
            else
            {
                return null;
            }
        }
    }
}
