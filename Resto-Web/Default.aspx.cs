using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace Resto_Web
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    recargarCards();
                    panelNotificaciones.Visible = false;
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx");
            }
        }

        protected void btnEliminarMesa_Click(object sender, EventArgs e)
        {
            try
            {
                string valor = ((Button)sender).CommandArgument;
                MesaNegocio mesaNegocio = new MesaNegocio();
                mesaNegocio.eliminar(Convert.ToInt32(valor));
                lblNotification.Text = "Mesa eliminada correctamente";
                divNotifications.Attributes["class"] = "alert alert-danger alert-dismissible fade show alert-fixed";
                panelNotificaciones.Visible = true;
                recargarCards();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx");
            }
        }

        protected void btnAgregarMesa_Click(object sender, EventArgs e)
        {
            try
            {
                string valor = ((Button)sender).CommandArgument;
                MesaNegocio mesaNegocio = new MesaNegocio();
                mesaNegocio.agregar();
                lblNotification.Text = "Mesa agregada correctamente";
                divNotifications.Attributes["class"] = "alert alert-success alert-dismissible fade show alert-fixed";
                panelNotificaciones.Visible = true;
                recargarCards();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx");
            }
        }

        protected void recargarCards()
        {
            try
            {
                MesaNegocio mesaNegocio = new MesaNegocio();
                if (Seguridad.esAdmin(Session["usuario"]))
                {
                    List<Mesa> mesas = mesaNegocio.listar();
                    rpMesas.DataSource = mesas;
                    rpMesas.DataBind();
                }
                else
                {
                    if ((Usuario)Session["usuario"] != null)
                    {
                        Usuario usuario = (Usuario)Session["usuario"];
                        List<Mesa> mesas = mesaNegocio.listarMesero(usuario.Id);
                        rpMesas.DataSource = mesas;
                        rpMesas.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx");
            }
        }

        protected void btnCrearPedido_Click(object sender, EventArgs e)
        {
            try
            {
                string valor = ((Button)sender).CommandArgument;
                Response.Redirect("CrearPedido.aspx?IdMesa=" + valor, false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx");
            }
        }
    }
}