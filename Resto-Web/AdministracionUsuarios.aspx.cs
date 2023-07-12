using Negocio;
using System;
using System.Web.UI.WebControls;

namespace Resto_Web
{
    public partial class AdministracionUsuarios : System.Web.UI.Page
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


        protected void RecargarGrilla()
        {
            try
            {
                UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
                gvUsuarios.DataSource = usuarioNegocio.listarTodos();
                gvUsuarios.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx");
            }
        }

        protected void btnCambiarAdmin_Click(object sender, EventArgs e)
        {
            try
            {
                UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
                int rowIndex = Convert.ToInt32(((LinkButton)sender).CommandArgument);
                int id = Convert.ToInt32(gvUsuarios.DataKeys[rowIndex].Value.ToString());
                usuarioNegocio.cambiarAdmin(id, true);
                RecargarGrilla();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx");
            }
        }

        protected void btnQuitarAdmin_Click(object sender, EventArgs e)
        {
            try
            {
                UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
                int rowIndex = Convert.ToInt32(((LinkButton)sender).CommandArgument);
                int id = Convert.ToInt32(gvUsuarios.DataKeys[rowIndex].Value.ToString());
                usuarioNegocio.cambiarAdmin(id, false);
                RecargarGrilla();
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
                UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
                int rowIndex = Convert.ToInt32(((LinkButton)sender).CommandArgument);
                int id = Convert.ToInt32(gvUsuarios.DataKeys[rowIndex].Value.ToString());
                usuarioNegocio.eliminar(id);
                RecargarGrilla();
            }
            catch (Exception ex)
            {
                string Error = "";
                if (ex.Message.Contains("El usuario esta asignado a una mesa"))
                {
                    Error = "El usuario esta asignado a una mesa";
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

        protected void gvUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}