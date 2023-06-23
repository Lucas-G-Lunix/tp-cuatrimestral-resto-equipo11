using Dominio;
using System;
using System.Collections.Generic;

namespace Negocio
{
    public class MesaNegocio
    {
        public List<Mesa> listar()
        {
            AccesoDatos datos = new AccesoDatos();
            List<Mesa> mesas = new List<Mesa>();
            try
            {
                datos.setearConsulta("SELECT Id, NumeroMesa, IdPedido, IdMesero FROM MESAS");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Mesa mesa = new Mesa();
                    mesa.Id = (int)datos.Lector["Id"];
                    mesa.NumeroMesa = (int)datos.Lector["NumeroMesa"];
                    if (!(datos.Lector["IdPedido"] is DBNull))
                    {
                        mesa.IdPedido = (int)datos.Lector["IdPedido"];
                    }
                    if (!(datos.Lector["IdMesero"] is DBNull))
                    {
                        mesa.IdMesero = (int)datos.Lector["IdMesero"];
                    }
                    mesas.Add(mesa);
                }
                return mesas;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        public void eliminar(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            List<Mesa> mesas = new List<Mesa>();
            try
            {
                datos.setearConsulta("DELETE FROM MESAS WHERE Id = @Id");
                datos.setearParametro("@Id", id);
                datos.ejecutarAccion();
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void agregar()
        {
            AccesoDatos datos = new AccesoDatos();
            List<Mesa> mesas = new List<Mesa>();
            try
            {
                datos.setearProcedimiento("SP_NuevaMesa");
                datos.ejecutarAccion();
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}