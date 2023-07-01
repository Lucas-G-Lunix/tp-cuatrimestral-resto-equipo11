using System;

namespace Resto_Web
{
    public partial class Error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Text = Session["error"].ToString();
        }
    }
}