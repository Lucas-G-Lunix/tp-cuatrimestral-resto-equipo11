using Dominio;
using Negocio;
using System;

namespace Resto_Web
{
    public partial class AdministrarCategoria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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

        protected void gvCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            EtiquetaNegocio etiquetaNegocio = new EtiquetaNegocio();
            string id = gvCategoria.SelectedDataKey.Value.ToString();
            etiquetaNegocio.eliminar(false, int.Parse(id));
            RecargarGrilla();
        }

        protected void btnAgregarCategoria_Click(object sender, EventArgs e)
        {
            EtiquetaNegocio etiquetaNegocio = new EtiquetaNegocio();
            Etiqueta etiqueta = new Etiqueta();
            etiqueta.Descripcion = txtNuevoCategoria.Text;
            etiquetaNegocio.agregar(false, etiqueta);
            RecargarGrilla();

        }
        protected void RecargarGrilla()
        {
            EtiquetaNegocio etiquetaNegocio = new EtiquetaNegocio();
            gvCategoria.DataSource = etiquetaNegocio.listar(false);
            gvCategoria.DataBind();
        }
    }
}