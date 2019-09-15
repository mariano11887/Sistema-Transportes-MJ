using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace DAL
{
    public class DigitoVerificadorDAL
    {
        public static bool ChequearDVs()
        {
            List<IDigitoVerificable> verificables = new List<IDigitoVerificable>()
            {
                new PlanillaHorariaDAL(),
                new ViajeDAL()
            };

            foreach(IDigitoVerificable verificable in verificables)
            {
                List<RegistroParaDV> registrosAVerificar = verificable.ObtenerRegistrosParaDV();
                if(registrosAVerificar.Count == 0)
                {
                    // No hay registros para verificar, salteo esta tabla
                    break;
                }

                StringBuilder sb = new StringBuilder();
                foreach (RegistroParaDV registro in registrosAVerificar)
                {
                    int dvhCalculado = CalcularDV(registro.Registro);
                    if(dvhCalculado != registro.DVH)
                    {
                        return false;
                    }
                    sb.Append(dvhCalculado.ToString());
                }

                // Ahora los DVV
                string query = "SELECT dvv FROM digito_verificador WHERE tabla = @tabla";
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@tabla", verificable.ObtenerNombreTabla())
                };

                int dvvGuardado = SqlHelper.ObtenerValor<int>(query, parameters);
                int dvvCalculado = CalcularDV(sb.ToString());

                if(dvvCalculado != dvvGuardado)
                {
                    return false;
                }
            }

            return true;
        }

        internal static int CalcularDV(string registro)
        {
            int sum = 0;
            byte[] regBytes = Encoding.UTF8.GetBytes(registro);

            for(int pos = regBytes.Length - 1; pos >= 0; pos--)
            {
                sum += ObtenerDigito(regBytes[pos], pos);
            }

            int d = int.Parse(sum.ToString().Substring(sum.ToString().Length - 1));
            return (d == 0) ? 0 : (10 - d);
        }

        internal static void ActualizarDVH(string tabla, int dvh, int id)
        {
            string query = string.Format("UPDATE {0} SET dvh = @dvh WHERE id = @id", tabla);
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@dvh", dvh),
                new SqlParameter("@id", id)
            };
            SqlHelper.Ejecutar(query, parameters);
        }

        internal static void RecalcularDVV(string tabla)
        {
            string query = "SELECT dvh FROM " + tabla;

            StringBuilder sb = new StringBuilder();
            DataTable table = SqlHelper.Obtener(query, new SqlParameter[0]);
            table.Select().ToList().ForEach(r => sb.Append(r["dvh"].ToString()));

            int dvv = CalcularDV(sb.ToString());

            query = "UPDATE digito_verificador SET dvv = @dvv WHERE tabla = @tabla";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@dvv", dvv),
                new SqlParameter("@tabla", tabla)
            };
            SqlHelper.Ejecutar(query, parameters);
        }

        private static int ObtenerDigito(byte digito, int pos)
        {
            // Si es par, multiplico el dígito por 2
            if (pos % 2 == 0)
            {
                digito *= 2;
            }

            if(digito >= 10)
            {
                // Tengo que sumar cada dígito
                int resultado = 0;
                string digitoStr = digito.ToString();
                switch (digitoStr.Length)
                {
                    case 2:
                        resultado = int.Parse(digitoStr.Substring(0, 1)) +
                            int.Parse(digitoStr.Substring(1, 1));
                        break;
                    case 3:
                        resultado = int.Parse(digitoStr.Substring(0, 1)) +
                            int.Parse(digitoStr.Substring(1, 1)) +
                            int.Parse(digitoStr.Substring(2, 1));
                        break;
                }

                if (resultado >= 10)
                {
                    resultado = int.Parse(resultado.ToString().Substring(0, 1)) +
                            int.Parse(resultado.ToString().Substring(1, 1));
                }

                return resultado;
            }

            return digito;
        }
    }
}
