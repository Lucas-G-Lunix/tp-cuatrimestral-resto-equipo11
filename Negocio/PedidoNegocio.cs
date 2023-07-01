using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class PedidoNegocio
    {
        public void agregar(Pedido pedido)
        {
            AccesoDatos datos = new AccesoDatos();
            List<Mesa> mesas = new List<Mesa>();
            try
            {
                datos.setearConsulta("INSERT INTO PEDIDOS (NombreCliente, IdMesa, IdUser, Fecha) VALUES (@NombreCliente, @IdMesa, @IdUser, @Fecha)");
                datos.setearParametro("@NombreCliente", pedido.NombreCliente);
                datos.setearParametro("@IdMesa", pedido.IdMesa);
                datos.setearParametro("@IdUser", pedido.IdMesero);
                datos.setearParametro("@Fecha", pedido.FechaPedido);
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

        public int ultimoID()
        {
            AccesoDatos datos = new AccesoDatos();
            List<Mesa> mesas = new List<Mesa>();
            int id = 0;
            try
            {
                datos.setearProcedimiento("SP_LastIdPedidos");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    id = (int)datos.Lector["Id"];
                }
                return id;
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

        public Pedido listar(int idMesa)
        {
            AccesoDatos datos = new AccesoDatos();
            Pedido pedido = new Pedido();
            try
            {
                datos.setearConsulta("SELECT Id, NombreCliente, IdMesa, IdUser, Fecha FROM PEDIDOS WHERE IdMesa = @Id");
                datos.setearParametro("@Id", idMesa);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    if (!(datos.Lector["Id"] is DBNull))
                        pedido.Id = (int)datos.Lector["Id"];
                    if (!(datos.Lector["NombreCliente"] is DBNull))
                        pedido.NombreCliente = (string)datos.Lector["NombreCliente"];
                    if (!(datos.Lector["IdMesa"] is DBNull))
                        pedido.IdMesa = (int)datos.Lector["IdMesa"];
                    if (!(datos.Lector["IdUser"] is DBNull))
                        pedido.IdMesero = (int)datos.Lector["IdUser"];
                }
                return pedido;
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

        public bool tienePedido(int idMesa)
        {
            AccesoDatos datos = new AccesoDatos();
            Pedido pedido = new Pedido();
            try
            {
                datos.setearConsulta("SELECT Id, NombreCliente, IdMesa, IdUser, Fecha FROM PEDIDOS WHERE IdMesa = @Id");
                datos.setearParametro("@Id", idMesa);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    if (datos.Lector["Id"] is DBNull)
                    {
                        return true;
                    }
                }
                return false;
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
