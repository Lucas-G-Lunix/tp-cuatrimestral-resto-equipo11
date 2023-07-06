using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Resto_Web
{
    public partial class EstadisticasDiarias : System.Web.UI.Page
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
                EstadisticasDiaNegocio estadisticasDiaNegocio = new EstadisticasDiaNegocio();
                lblPedidosDelDia.Text = estadisticasDiaNegocio.pedidosDia().ToString();
                lblIngresosDelDia.Text = estadisticasDiaNegocio.ingresosDia().ToString() + " $";
            }
        }
    }
}