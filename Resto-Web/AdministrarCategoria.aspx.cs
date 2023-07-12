using Dominio;
using Negocio;
using System;

namespace Resto_Web
{
    public partial class AdministrarCategoria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Seguridad.esAdmin(Session["usuario"]))
                {
                    Session.Add("error", "Se requiere permisos de admin para acceder a esta pantalla");
                    Response.Redirect("Error.aspx");
                }
                if (!IsPostBack)
                {
                    RecargarGrilla();
                    panelNotificaciones.Visible = false;
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx");
            }
        }

        protected void gvCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                EtiquetaNegocio etiquetaNegocio = new EtiquetaNegocio();
                string id = gvCategoria.SelectedDataKey.Value.ToString();
                etiquetaNegocio.eliminar(false, int.Parse(id));
                lblNotification.Text = "Categoria eliminada correctamente";
                divNotifications.Attributes["class"] = "alert alert-warning alert-dismissible fade show alert-fixed";
                panelNotificaciones.Visible = true;
                RecargarGrilla();
            }
            catch (Exception ex)
            {
                string Error = "";
                if (ex.Message.Contains("La categoria esta asiganada a un plato"))
                {
                    Error = "La categoria se encuentra asignada a un plato";
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

        protected void btnAgregarCategoria_Click(object sender, EventArgs e)
        {
            try
            {
                EtiquetaNegocio etiquetaNegocio = new EtiquetaNegocio();
                Etiqueta etiqueta = new Etiqueta();
                etiqueta.Descripcion = txtNuevoCategoria.Text;
                etiquetaNegocio.agregar(false, etiqueta);
                lblNotification.Text = "Categoria Agregada";
                divNotifications.Attributes["class"] = "alert alert-success alert-dismissible fade show alert-fixed";
                panelNotificaciones.Visible = true;
                RecargarGrilla();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx");
            }

        }
        protected void RecargarGrilla()
        {
            try
            {
                EtiquetaNegocio etiquetaNegocio = new EtiquetaNegocio();
                gvCategoria.DataSource = etiquetaNegocio.listar(false);
                gvCategoria.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx");
            }
        }
    }
}