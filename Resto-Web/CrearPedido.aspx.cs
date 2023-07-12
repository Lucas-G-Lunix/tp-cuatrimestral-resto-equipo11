using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace Resto_Web
{
    public partial class CrearPedido : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string idMesa = Request.QueryString["IdMesa"] != null ? Request.QueryString["IdMesa"].ToString() : "";
                PedidoNegocio pedidoNegocio = new PedidoNegocio();
                MesaNegocio mesaNegocio = new MesaNegocio();
                PlatoNegocio platoNegocio = new PlatoNegocio();
                

                if (Request.QueryString["IdMesa"] != null)
                {
                    panelNotificaciones.Visible = false;
                    if (!IsPostBack)
                    {
                        UsuarioNegocio negocio = new UsuarioNegocio();
                        List<Usuario> listaUsuarios = negocio.listar();

                        ddlMesero.DataSource = listaUsuarios;
                        ddlMesero.DataValueField = "Id";
                        ddlMesero.DataTextField = "Nombre";
                        ddlMesero.DataBind();
                    }
                    if (!IsPostBack && (mesaNegocio.listar(int.Parse(idMesa))).IdPedido == null)
                    {
                        // Setup Pantalla

                        Mesa seleccionada = mesaNegocio.listar(int.Parse(idMesa));

                        txtNumeroMesa.Text = seleccionada.NumeroMesa.ToString();

                        txtNumeroPedido.Text = pedidoNegocio.ultimoID().ToString();

                       
                        btnAgregarProductos.Enabled = false;
                        btnFinalizarPedido.Enabled = false;
                        btnGenerarTicket.Enabled = false;
                    }
                    else if (!IsPostBack && (mesaNegocio.listar(int.Parse(idMesa))).IdPedido != null)
                    {
                        Pedido pedido = pedidoNegocio.listar(int.Parse(idMesa));
                        DetallePedidoNegocio detallePedidoNegocio = new DetallePedidoNegocio();
                        List<DetallePedido> detallePedidos = detallePedidoNegocio.listar(pedido.Id);

                        txtNumeroPedido.Text = pedido.Id.ToString();
                        Mesa seleccionada = mesaNegocio.listar(pedido.IdMesa);
                        txtNumeroMesa.Text = seleccionada.NumeroMesa.ToString();
                        txtNombreCliente.Text = pedido.NombreCliente;
                        ddlMesero.SelectedValue = pedido.IdMesero.ToString();
                        btnGuardar.Enabled = false;
                        RecargarPlatos();
                    }
                }

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                string idMesa = Request.QueryString["IdMesa"] != null ? Request.QueryString["IdMesa"].ToString() : "";
                PedidoNegocio pedidoNegocio = new PedidoNegocio();
                MesaNegocio mesaNegocio = new MesaNegocio();
                Pedido nuevo = new Pedido();
                Mesa mesa = new Mesa();

                nuevo.IdMesa = int.Parse(idMesa);
                nuevo.NombreCliente = txtNombreCliente.Text;
                nuevo.IdMesero = int.Parse(ddlMesero.SelectedValue);
                nuevo.FechaPedido = DateTime.Now;

                mesa.Id = int.Parse(idMesa);
                mesa.IdPedido = pedidoNegocio.ultimoID();
                mesa.IdMesero = int.Parse(ddlMesero.SelectedValue);

                pedidoNegocio.agregar(nuevo);
                mesaNegocio.modificar(mesa);


                Response.Redirect("CrearPedido.aspx?IdMesa=" + idMesa, false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx");
            }
        }

        protected void btnAgregarProductos_Click(object sender, EventArgs e)
        {
            try
            {
                string idMesa = Request.QueryString["IdMesa"] != null ? Request.QueryString["IdMesa"].ToString() : "";
                Response.Redirect("Menu.aspx?IdPedido=" + txtNumeroPedido.Text + "&IdMesa=" + idMesa, false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx");
            }
        }

        protected void btnFinalizarPedido_Click(object sender, EventArgs e)
        {
            try
            {
                string idMesa = Request.QueryString["IdMesa"] != null ? Request.QueryString["IdMesa"].ToString() : "";
                if (idMesa != "")
                {
                    MesaNegocio mesaNegocio = new MesaNegocio();
                    Mesa mesa = new Mesa();
                    mesa = mesaNegocio.listar(int.Parse(idMesa));
                    mesa.IdMesero = null;
                    mesa.IdPedido = null;
                    mesaNegocio.modificar(mesa);
                    Response.Redirect("Default.aspx", false);
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx");
            }
        }

        protected void rpPlatosPedido_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
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
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx");
            }
        }

        protected void cambiarCantidadDB(object sender)
        {
            try
            {
                panelNotificaciones.Visible = false;
                string idPlato = ((LinkButton)sender).CommandArgument;
                string idPedido = txtNumeroPedido.Text;
                string cantidad = String.Format("{0}", Request.Form["txtCantidad" + idPlato]);
                DetallePedido detallePedido = new DetallePedido();
                detallePedido.IdPlato = int.Parse(idPlato);
                detallePedido.IdPedido = int.Parse(idPedido);
                detallePedido.Cantidad = int.Parse(cantidad);
                DetallePedidoNegocio detallePedidoNegocio = new DetallePedidoNegocio();
                detallePedidoNegocio.modificar(detallePedido);
                RecargarPlatos();
            }
            catch (Exception ex)
            {
                string Error = "";
                if (ex.Message.Contains("No hay suficiente stock"))
                {
                    Error = "No hay suficiente stock";
                }
                else
                {
                    Error = "Otro Error";
                }
                lblNotification.Text = Error;
                divNotifications.Attributes["class"] = "alert alert-warning alert-dismissible fade show alert-fixed";
                panelNotificaciones.Visible = true;
            }
        }

        protected void btnMenosCantidad_Click(object sender, EventArgs e)
        {
            try
            {
                cambiarCantidadDB(sender);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx");
            }
        }

        protected void btnMasCantidad_Click(object sender, EventArgs e)
        {
            try
            {
                cambiarCantidadDB(sender);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx");
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                string id = ((LinkButton)sender).CommandArgument;
                DetallePedidoNegocio detallePedidoNegocio = new DetallePedidoNegocio();
                detallePedidoNegocio.eliminar(int.Parse(id));
                RecargarPlatos();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx");
            }
        }

        protected void RecargarPlatos()
        {
            try
            {
                string idMesa = Request.QueryString["IdMesa"] != null ? Request.QueryString["IdMesa"].ToString() : "";
                PedidoNegocio pedidoNegocio = new PedidoNegocio();
                Pedido pedido = pedidoNegocio.listar(int.Parse(idMesa));
                DetallePedidoNegocio detallePedidoNegocio = new DetallePedidoNegocio();
                List<DetallePedido> detallePedido = detallePedidoNegocio.listar(pedido.Id);
                PlatoNegocio platoNegocio = new PlatoNegocio();
                int totalPagar = 0;
                foreach (DetallePedido item in detallePedido)
                {
                    Plato plato = platoNegocio.listar(item.IdPlato);
                    totalPagar += item.Cantidad * (int)plato.Precio;
                }
                lblTotalPagar.Text = "Total a Pagar: " + totalPagar.ToString() + "$";
                rpPlatosPedido.DataSource = detallePedido;
                rpPlatosPedido.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx");
            }
        }

        protected void btnGenerarTicket_Click(object sender, EventArgs e)
        {
            try
            {
                string idMesa = Request.QueryString["IdMesa"] != null ? Request.QueryString["IdMesa"].ToString() : "";
                Response.Redirect("GenerarTicket.aspx?IdPedido=" + txtNumeroPedido.Text + "&NumeroMesa=" + txtNumeroMesa.Text + "&IdMesa=" + idMesa, false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx");
            }
        }
    }
}