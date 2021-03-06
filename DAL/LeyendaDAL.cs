﻿using BE;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class LeyendaDAL
    {
        private enum FormaGuardado
        {
            Insertar,
            Actualizar,
            Mixto,
            NoSeSabe
        }

        private FormaGuardado _formaGuardado = FormaGuardado.NoSeSabe;
        private readonly int idiomaId;

        public LeyendaDAL(int idiomaId)
        {
            this.idiomaId = idiomaId;
        }

        #region Métodos públicos
        public static List<LeyendaBE> Obtener(int IdiomaId)
        {
            string query = "SELECT nombre_form, nombre_control, texto FROM leyenda WHERE idioma_id = @idiomaId";
            SqlParameter[] parameters =
            {
                new SqlParameter("@idiomaId", IdiomaId)
            };
            DataTable table = SqlHelper.Obtener(query, parameters);
            List<LeyendaBE> leyendas = new List<LeyendaBE>();
            foreach(DataRow row in table.Rows)
            {
                leyendas.Add(new LeyendaBE()
                {
                    NombreForm = row["nombre_form"].ToString(),
                    NombreControl = row["nombre_control"].ToString(),
                    Texto = row["texto"].ToString()
                });
            }
            return leyendas;
        }

        public void Guardar(LeyendaBE leyenda)
        {
            DeterminarFormaGuardado();
            if(_formaGuardado == FormaGuardado.Insertar)
            {
                Insertar(leyenda);
            }
            else if (_formaGuardado == FormaGuardado.Actualizar)
            {
                Actualizar(leyenda);
            }
            else if (_formaGuardado == FormaGuardado.Mixto)
            {
                // Como no hay certeza de si existe o no, hacer el chequeo antes de insertar o actualizar
                string query = "SELECT idioma_id FROM leyenda WHERE idioma_id = @idiomaId AND nombre_form = @nombreForm AND nombre_control = @nombreControl";
                SqlParameter[] parameters =
                {
                    new SqlParameter("@idiomaId", idiomaId),
                    new SqlParameter("@nombreForm", leyenda.NombreForm),
                    new SqlParameter("@nombreControl", leyenda.NombreControl)
                };
                DataTable table = SqlHelper.Obtener(query, parameters);
                if(table.Rows.Count == 0)
                {
                    Insertar(leyenda);
                }
                else
                {
                    Actualizar(leyenda);
                }
            }
        }

        public static void EliminarPorIdioma(int IdiomaId)
        {
            string query = "DELETE FROM leyenda WHERE idioma_id = @idiomaId";
            SqlParameter[] parameters =
            {
                new SqlParameter("@idiomaId", IdiomaId)
            };
            SqlHelper.Ejecutar(query, parameters);
        }
        #endregion

        #region Métodos privados
        private void DeterminarFormaGuardado()
        {
            if (_formaGuardado == FormaGuardado.NoSeSabe)
            {
                // Mirar si hay leyendas con ese id de idioma.
                //string query = "SELECT TOP 1 idioma_id FROM leyenda WHERE idioma_id = @idioma_id";
                string query = "SELECT idioma_id, COUNT(*) AS cantidad FROM leyenda WHERE idioma_id IN (1, @idiomaId) GROUP BY idioma_id";
                SqlParameter[] parameters =
                {
                    new SqlParameter("@idiomaId", idiomaId)
                };
                DataTable table = SqlHelper.Obtener(query, parameters);
                if (table.Rows.Count == 1)
                {
                    // Significa que no hay leyendas del idioma nuevo
                    _formaGuardado = FormaGuardado.Insertar;
                }
                else if(table.Rows.Count > 1 && table.Rows[0]["cantidad"].ToString() == table.Rows[1]["cantidad"].ToString())
                {
                    // Existe la misma cantidad de leyendas del idioma Español que del idioma que se quiere guardar.
                    // Se puede actualizar tranquilo.
                    _formaGuardado = FormaGuardado.Actualizar;
                }
                else
                {
                    // No hay igual cantidad de leyendas del idioma Español que del idioma que se quiere guardar.
                    // Hay que chequear para cada leyenda si es un insert o un update.
                    _formaGuardado = FormaGuardado.Mixto;
                }
            }
        }

        private void Insertar(LeyendaBE leyenda)
        {
            string query = "INSERT INTO leyenda (idioma_id, nombre_form, nombre_control, texto) VALUES (@idiomaId, @nombreForm, @nombreControl, @texto)";
            SqlParameter[] parameters =
            {
                new SqlParameter("@idiomaId", idiomaId),
                new SqlParameter("@nombreForm", leyenda.NombreForm),
                new SqlParameter("@nombreControl", leyenda.NombreControl),
                new SqlParameter("@texto", leyenda.Texto)
            };
            SqlHelper.Ejecutar(query, parameters);
        }

        private void Actualizar(LeyendaBE leyenda)
        {
            string query = "UPDATE leyenda SET texto = @texto WHERE idioma_id = @idiomaId AND nombre_form = @nombreForm AND nombre_control = @nombreControl";
            SqlParameter[] parameters =
            {
                new SqlParameter("@idiomaId", idiomaId),
                new SqlParameter("@nombreForm", leyenda.NombreForm),
                new SqlParameter("@nombreControl", leyenda.NombreControl),
                new SqlParameter("@texto", leyenda.Texto)
            };
            SqlHelper.Ejecutar(query, parameters);
        }
        #endregion
    }
}
