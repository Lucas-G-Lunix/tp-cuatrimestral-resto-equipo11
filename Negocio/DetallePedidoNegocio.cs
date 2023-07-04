using Dominio;
using System;
using System.Collections.Generic;

namespace Negocio
{
    public class DetallePedidoNegocio
    {
        public List<DetallePedido> listar()
        {
            AccesoDatos datos = new AccesoDatos();
            List<DetallePedido> detallePedidos = new List<DetallePedido>();
            try
            {
                datos.setearConsulta("SELECT Id, IdPedido, IdPlato, Cantidad FROM DETALLE_PEDIDOS");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    DetallePedido detallePedido = new DetallePedido();
                    detallePedido.Id = (int)datos.Lector["Id"];
                    if (!(datos.Lector["IdPedido"] is DBNull))
                    {
                        detallePedido.IdPedido = (int)datos.Lector["IdPedido"];
                    }
                    if (!(datos.Lector["IdPlato"] is DBNull))
                    {
                        detallePedido.IdPlato = (int)datos.Lector["IdPlato"];
                    }
                    if (!(datos.Lector["Cantidad"] is DBNull))
                    {
                        detallePedido.Cantidad = (int)datos.Lector["Cantidad"];
                    }
                    detallePedidos.Add(detallePedido);
                }
                return detallePedidos;
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

        public List<DetallePedido> listar(int idPedido)
        {
            AccesoDatos datos = new AccesoDatos();
            List<DetallePedido> detallePedidos = new List<DetallePedido>();
            try
            {
                datos.setearConsulta("SELECT Id, IdPedido, IdPlato, Cantidad FROM DETALLE_PEDIDOS WHERE IdPedido = @IdPedido");
                datos.setearParametro("@IdPedido", idPedido);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    DetallePedido detallePedido = new DetallePedido();
                    detallePedido.Id = (int)datos.Lector["Id"];
                    if (!(datos.Lector["IdPedido"] is DBNull))
                    {
                        detallePedido.IdPedido = (int)datos.Lector["IdPedido"];
                    }
                    if (!(datos.Lector["IdPlato"] is DBNull))
                    {
                        detallePedido.IdPlato = (int)datos.Lector["IdPlato"];
                    }
                    if (!(datos.Lector["Cantidad"] is DBNull))
                    {
                        detallePedido.Cantidad = (int)datos.Lector["Cantidad"];
                    }
                    detallePedidos.Add(detallePedido);
                }
                return detallePedidos;
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

        public void agregar(DetallePedido detallePedido)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT INTO DETALLE_PEDIDOS (IdPedido, IdPlato, Cantidad) VALUES (@IdPedido, @IdPlato, @Cantidad)");
                datos.setearParametro("@IdPedido", detallePedido.IdPedido);
                datos.setearParametro("@IdPlato", detallePedido.IdPlato);
                datos.setearParametro("@Cantidad", detallePedido.Cantidad);
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

        public void modificar(DetallePedido detallePedido)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE DETALLE_PEDIDOS SET Cantidad = @Cantidad WHERE IdPedido = @IdPedido AND IdPlato = @IdPlato");
                datos.setearParametro("@Cantidad", detallePedido.Cantidad);
                datos.setearParametro("@IdPedido", detallePedido.IdPedido);
                datos.setearParametro("@IdPlato", detallePedido.IdPlato);
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

        public void eliminar(int Id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("DELETE DETALLE_PEDIDOS WHERE Id = @Id");
                datos.setearParametro("@Id", Id);
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
