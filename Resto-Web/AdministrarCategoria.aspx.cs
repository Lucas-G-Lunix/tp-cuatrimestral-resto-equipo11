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
                RecargarGrilla();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx");
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