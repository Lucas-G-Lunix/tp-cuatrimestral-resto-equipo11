using Dominio;
using Negocio;
using System;

namespace Resto_Web
{
    public partial class AdministrarTipo : System.Web.UI.Page
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
        protected void gvTipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                EtiquetaNegocio etiquetaNegocio = new EtiquetaNegocio();
                string id = gvTipo.SelectedDataKey.Value.ToString();
                etiquetaNegocio.eliminar(true, int.Parse(id));
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
                gvTipo.DataSource = etiquetaNegocio.listar(true);
                gvTipo.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx");
            }
        }

        protected void btnagregarTipo_Click(object sender, EventArgs e)
        {
            try
            {
                EtiquetaNegocio etiquetaNegocio = new EtiquetaNegocio();
                Etiqueta etiqueta = new Etiqueta();
                etiqueta.Descripcion = txtNuevoTipo.Text;
                etiquetaNegocio.agregar(true, etiqueta);
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