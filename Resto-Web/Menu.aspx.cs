using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace Resto_Web
{
    public partial class Menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                panelNotificaciones.Visible = false;
                if (!IsPostBack)
                {
                    RecargarMenu();
                    EtiquetaNegocio negocio = new EtiquetaNegocio();
                    List<Etiqueta> listaTipo = negocio.listar(true);

                    ddlTipo.DataSource = listaTipo;
                    ddlTipo.DataValueField = "Id";
                    ddlTipo.DataTextField = "Descripcion";
                    ddlTipo.DataBind();

                    listaTipo = negocio.listar(false);
                    ddlCategoria.DataSource = listaTipo;
                    ddlCategoria.DataValueField = "Id";
                    ddlCategoria.DataTextField = "Descripcion";
                    ddlCategoria.DataBind();
                }
                if (Request.QueryString["plato"] != null)
                {
                    if (Convert.ToBoolean(Request.QueryString["plato"]))
                    {
                        lblNotification.Text = "Plato agregado";
                        divNotifications.Attributes["class"] = "alert alert-success alert-dismissible fade show alert-fixed";
                        panelNotificaciones.Visible = true;
                    }
                    else
                    {
                        lblNotification.Text = "Plato modificado";
                        divNotifications.Attributes["class"] = "alert alert-info alert-dismissible fade show alert-fixed";
                        panelNotificaciones.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx");
            }
        }

        protected void btnModificarPlato_Click(object sender, EventArgs e)
        {
            string valor = ((Button)sender).CommandArgument;
            Response.Redirect("FormPlato.aspx?IdPlato=" + valor, false);
        }

        protected void btnEliminarPlato_Click(object sender, EventArgs e)
        {
            string valor = ((Button)sender).CommandArgument;
            PlatoNegocio platoNegocio = new PlatoNegocio();
            platoNegocio.eliminar(Convert.ToInt32(valor));
            RecargarMenu();
        }

        protected void txtFiltrar_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string filtro = txtFiltrar.Text;
                PlatoNegocio platoNegocio = new PlatoNegocio();
                List<Plato> listaPlatos = platoNegocio.listar();
                List<Plato> listaFiltrada;
                listaFiltrada = listaPlatos.FindAll(x =>
                    x.Nombre.ToLower().Contains(filtro.ToLower()));
                rpMenu.DataSource = listaFiltrada;
                rpMenu.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
            }
        }

        protected void ddlTipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                int filtroTipo = int.Parse(ddlTipo.SelectedValue);
                int filtroCategoria = int.Parse(ddlCategoria.SelectedValue);
                PlatoNegocio platoNegocio = new PlatoNegocio();
                List<Plato> listaPlatos = platoNegocio.listar();
                List<Plato> listaFiltrada;
                if (chkCombinarFiltros.Checked)
                {
                    listaFiltrada = listaPlatos.FindAll(x =>
                        x.Categoria.Id == filtroCategoria && x.Tipo.Id == filtroTipo);
                    rpMenu.DataSource = listaFiltrada;
                    rpMenu.DataBind();
                }
                else
                {
                    listaFiltrada = listaPlatos.FindAll(x =>
                        x.Tipo.Id == filtroTipo);
                    rpMenu.DataSource = listaFiltrada;
                    rpMenu.DataBind();
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
            }
        }

        protected void ddlCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int filtroTipo = int.Parse(ddlTipo.SelectedValue);
                int filtroCategoria = int.Parse(ddlCategoria.SelectedValue);
                PlatoNegocio platoNegocio = new PlatoNegocio();
                List<Plato> listaPlatos = platoNegocio.listar();
                List<Plato> listaFiltrada;
                if (chkCombinarFiltros.Checked)
                {
                    listaFiltrada = listaPlatos.FindAll(x =>
                        x.Categoria.Id == filtroCategoria && x.Tipo.Id == filtroTipo);
                    rpMenu.DataSource = listaFiltrada;
                    rpMenu.DataBind();
                }
                else
                {
                    listaFiltrada = listaPlatos.FindAll(x =>
                        x.Tipo.Id == filtroCategoria);
                    rpMenu.DataSource = listaFiltrada;
                    rpMenu.DataBind();
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
            }
        }

        protected void RecargarMenu()
        {
            PlatoNegocio platoNegocio = new PlatoNegocio();
            List<Plato> platos = platoNegocio.listar();
            rpMenu.DataSource = platos;
            rpMenu.DataBind();
        }

        protected void btnRecargarFiltros_Click(object sender, EventArgs e)
        {
            RecargarMenu();
        }

        protected void btnAgregarAlPedido_Click(object sender, EventArgs e)
        {
            string idPlato = ((Button)sender).CommandArgument;
            try
            {
                string idPedido = Request.QueryString["IdPedido"] != null ? Request.QueryString["IdPedido"].ToString() : "";
                string cantidad = String.Format("{0}", Request.Form["txtCantidad" + idPlato]);
                DetallePedido detallePedido = new DetallePedido();
                detallePedido.IdPlato = int.Parse(idPlato);
                detallePedido.IdPedido = int.Parse(idPedido);
                detallePedido.Cantidad = int.Parse(cantidad);
                DetallePedidoNegocio detallePedidoNegocio = new DetallePedidoNegocio();
                detallePedidoNegocio.agregar(detallePedido);
                lblNotification.Text = "Plato agregado al pedido";
                divNotifications.Attributes["class"] = "alert alert-success alert-dismissible fade show alert-fixed";
                panelNotificaciones.Visible = true;
            }
            catch (Exception ex)
            {
                string Error = ex.Message.Contains("Hay platos duplicados") ? "El plato ya se encuentra en el pedido" : "Otro Error";
                lblNotification.Text = Error;
                divNotifications.Attributes["class"] = "alert alert-warning alert-dismissible fade show alert-fixed";
                panelNotificaciones.Visible = true;
            }
        }

        protected void btnFinalizarPedido_Click(object sender, EventArgs e)
        {
            try
            {
                string idMesa = Request.QueryString["IdMesa"] != null ? Request.QueryString["IdMesa"].ToString() : "";
                Response.Redirect("CrearPedido.aspx?IdMesa=" + idMesa);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx");
            }
        }
    }
}