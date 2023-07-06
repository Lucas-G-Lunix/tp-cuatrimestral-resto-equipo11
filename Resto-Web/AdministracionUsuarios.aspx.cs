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
                if (!IsPostBack)
                {
                    RecargarGrilla();
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx");
            }
        }

        protected void gvUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string id = gvUsuarios.SelectedDataKey.Value.ToString();
                UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
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
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx");
            }
        }
    }
}