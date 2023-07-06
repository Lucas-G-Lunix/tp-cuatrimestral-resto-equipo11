using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class EstadisticasDiaNegocio
    {
        public int pedidosDia()
        {
			AccesoDatos datos = new AccesoDatos();
			int cantidadPedidos = 0;
			try
			{
				datos.setearConsulta("SELECT COUNT(*) AS PedidosDia FROM PEDIDOS WHERE DAY(Fecha) = DAY(GETDATE())");
				datos.ejecutarLectura();
				while (datos.Lector.Read())
				{
					cantidadPedidos = (int)datos.Lector["PedidosDia"];
				}
				return cantidadPedidos;
			}
			catch (Exception)
			{

				throw;
			}
        }

        public int ingresosDia()
        {
            AccesoDatos datos = new AccesoDatos();
            decimal ingresosDia = 0;
            try
            {
                datos.setearConsulta(" SELECT ISNULL(SUM(PL.Precio*DP.Cantidad), 0) AS IngresosDia FROM PEDIDOS P INNER JOIN DETALLE_PEDIDOS DP ON DP.IdPedido = P.Id INNER JOIN PLATOS PL ON PL.Id = DP.IdPlato WHERE DAY(Fecha) = DAY(GETDATE())");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    ingresosDia = (decimal)datos.Lector["IngresosDia"];
                }
                return Convert.ToInt32(ingresosDia);
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
