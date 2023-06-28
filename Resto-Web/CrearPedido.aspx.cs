using Dominio;
using Negocio;
using System;
using System.Collections.Generic;

namespace Resto_Web
{
    public partial class CrearPedido : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.esAdmin(Session["usuario"]))
            {
                Session.Add("error", "Se requiere permisos de admin para acceder a esta pantalla");
                Response.Redirect("Error.aspx");
            }
            try
            {
                //configuración inicial de la pantalla.
                if (!IsPostBack)
                {
                    UsuarioNegocio negocio = new UsuarioNegocio();
                    List<Usuario> listaUsuarios = negocio.listar();

                    ddlMesero.DataSource = listaUsuarios;
                    ddlMesero.DataValueField = "Id";
                    ddlMesero.DataTextField = "Nombre";
                    ddlMesero.DataBind();
                }

                string id = Request.QueryString["IdMesa"] != null ? Request.QueryString["IdMesa"].ToString() : "";
                if (!IsPostBack)
                {
                    MesaNegocio mesaNegocio = new MesaNegocio();

                    PedidoNegocio pedidoNegocio = new PedidoNegocio();

                    Mesa seleccionada = mesaNegocio.listar(int.Parse(id));

                    txtNumeroMesa.Text = seleccionada.NumeroMesa.ToString();

                    txtNumeroPedido.Text = pedidoNegocio.ultimoID().ToString();
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

                Response.Redirect("Default.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx");
            }
        }
    }
}