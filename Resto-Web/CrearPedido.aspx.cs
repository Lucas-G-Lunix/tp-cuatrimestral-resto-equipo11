using Dominio;
using Negocio;
using System;
using System.Collections.Generic;

namespace Resto_Web
{
    public partial class CrearPedido : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.esAdmin(Session["usuario"]))
            {
                Session.Add("error", "Se requiere permisos de admin para acceder a esta pantalla");
                Response.Redirect("Error.aspx");
            }
            try
            {
                //configuración inicial de la pantalla.
                if (!IsPostBack)
                {
                    UsuarioNegocio negocio = new UsuarioNegocio();
                    List<Usuario> listaUsuarios = negocio.listar();

                    ddlMesero.DataSource = listaUsuarios;
                    ddlMesero.DataValueField = "Id";
                    ddlMesero.DataTextField = "Nombre";
                    ddlMesero.DataBind();
                }

                string id = Request.QueryString["IdMesa"] != null ? Request.QueryString["IdMesa"].ToString() : "";
                if (!IsPostBack)
                {
                    MesaNegocio mesaNegocio = new MesaNegocio();

                    Mesa seleccionada = mesaNegocio.listar(int.Parse(id));

                    txtNumeroMesa.Text = seleccionada.NumeroMesa.ToString();

                    txtNumeroPedido.Text = seleccionada.IdPedido.ToString();
                }

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
        //    try
        //    {
        //        Pedido nuevo = new Pedido();


        //        Session.Add("pedido" + id, seleccionada);
        //        Pedido negocio = new PlatoNegocio();

        //        nuevo.Id = negocio.ultimoId();
        //        nuevo.Nombre = txtNombre.Text;
        //        nuevo.Stock = int.Parse(txtStock.Text);
        //        nuevo.Precio = decimal.Parse(txtPrecio.Text);

        //        if (txtImagen.PostedFile.FileName != "")
        //        {
        //            string ruta = Server.MapPath("./Images/Platos");
        //            txtImagen.PostedFile.SaveAs(ruta + "plato-" + nuevo.Id + ".jpg");
        //            nuevo.ImagenURL = "plato-" + nuevo.Id + ".jpg";
        //        }

        //        nuevo.Tipo = new Etiqueta();
        //        nuevo.Tipo.Id = int.Parse(ddlTipo.SelectedValue);
        //        nuevo.Categoria = new Etiqueta();
        //        nuevo.Categoria.Id = int.Parse(ddlCategoria.SelectedValue);

        //        if (Request.QueryString["IdPlato"] != null)
        //        {
        //            nuevo.Id = int.Parse(txtId.Text);
        //            negocio.modificar(nuevo);
        //        }
        //        else
        //        {
        //            negocio.agregar(nuevo);
        //        }

        //        Response.Redirect("Menu.aspx", false);
        //    }
        //    catch (Exception ex)
        //    {
        //        Session.Add("error", ex.ToString());
        //        Response.Redirect("Error.aspx");
        //    }
        }
    }
}