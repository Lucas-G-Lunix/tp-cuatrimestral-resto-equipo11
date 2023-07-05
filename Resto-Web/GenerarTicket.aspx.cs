using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Resto_Web
{
    public partial class GenerarTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Request.QueryString["NumeroMesa"] != null)
            {
                string numeroMesa = Request.QueryString["NumeroMesa"] != null ? Request.QueryString["NumeroMesa"].ToString() : "";
                string idPedido = Request.QueryString["IdPedido"] != null ? Request.QueryString["IdPedido"].ToString() : "";

                lblNumeroMesa.Text = "Numero Mesa: " + numeroMesa;


                DetallePedidoNegocio detallePedidoNegocio = new DetallePedidoNegocio();
                List<DetallePedido> detallePedidos = detallePedidoNegocio.listar(int.Parse(idPedido));
                int totalPagar = 0;
                foreach (DetallePedido item in detallePedidos)
                {
                    PlatoNegocio platoListar = new PlatoNegocio();
                    Plato plato = platoListar.listar(item.IdPlato);
                    totalPagar += item.Cantidad * (int)plato.Precio;
                }
                lblTotalPagar.Text = "Total a Pagar: " + totalPagar.ToString() + "$";

                PedidoNegocio pedidoNegocio = new PedidoNegocio();
                List<DetallePedido> detallePedido = detallePedidoNegocio.listar(int.Parse(idPedido));
                rpPlatosPedido.DataSource = detallePedido;
                rpPlatosPedido.DataBind();
            }
        }

        protected void rpPlatosPedido_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DetallePedido detallePedido = (DetallePedido)e.Item.DataItem;
                Label labelNombre = (Label)e.Item.FindControl("lblNombre");
                Label labelPrecio = (Label)e.Item.FindControl("lblPrecio");
                PlatoNegocio platoNegocio = new PlatoNegocio();
                Plato plato = platoNegocio.listar(detallePedido.IdPlato);
                labelNombre.Text = plato.Nombre;
                labelPrecio.Text = Convert.ToInt32(plato.Precio).ToString();
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            string idMesa = Request.QueryString["IdMesa"].ToString();
            Response.Redirect("CrearPedido.aspx?IdMesa=" + idMesa);
        }
    }
}