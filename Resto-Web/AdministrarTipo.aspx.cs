using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Resto_Web
{
    public partial class AdministrarTipo : System.Web.UI.Page
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
        protected void gvTipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            EtiquetaNegocio etiquetaNegocio = new EtiquetaNegocio();
            string id = gvTipo.SelectedDataKey.Value.ToString();
            etiquetaNegocio.eliminar(true, int.Parse(id));
            RecargarGrilla();
        }

        protected void RecargarGrilla()
        {
            EtiquetaNegocio etiquetaNegocio = new EtiquetaNegocio();
            gvTipo.DataSource = etiquetaNegocio.listar(true);
            gvTipo.DataBind();
        }

        protected void btnagregarTipo_Click(object sender, EventArgs e)
        {
            EtiquetaNegocio etiquetaNegocio = new EtiquetaNegocio();
            Etiqueta etiqueta = new Etiqueta();
            etiqueta.Descripcion = txtNuevoTipo.Text;
            etiquetaNegocio.agregar(true, etiqueta);
            RecargarGrilla();
        }
    }
}