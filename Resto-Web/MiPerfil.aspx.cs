﻿using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Resto_Web
{
    public partial class MiPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Seguridad.sesionActiva(Session["usuario"]))
                {
                    Usuario user = (Usuario)Session["usuario"];
                    txtEmail.Text = user.Email;
                    txtEmail.ReadOnly = true;
                    txtNombre.Text = user.Nombre;
                    txtApellido.Text = user.Apellido;
                    txtFechaNacimiento.Text = user.FechaNacimiento.ToString("yyyy-MM-dd");
                    if (!string.IsNullOrEmpty(user.ImagenURL))
                        imgNuevoPerfil.ImageUrl = "./Images/Usuarios/" + user.ImagenURL;
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {

                Page.Validate();
                if (!Page.IsValid)
                    return;

                UsuarioNegocio negocio = new UsuarioNegocio();
                Usuario user = (Usuario)Session["usuario"];

                if (txtImagen.PostedFile.FileName != "")
                {
                    string ruta = Server.MapPath("./Images/Usuarios/");
                    txtImagen.PostedFile.SaveAs(ruta + "perfil-" + user.Id + ".jpg");
                    user.ImagenURL = "perfil-" + user.Id + ".jpg";
                }

                user.Nombre = txtNombre.Text;
                user.Apellido = txtApellido.Text;
                user.Email = txtEmail.Text;
                user.FechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text);

                negocio.actualizar(user);

                //leer img
                Image img = (Image)Master.FindControl("imgPerfil");
                img.ImageUrl = "/Images/Usuarios/" + user.ImagenURL;

                Response.Redirect("Default.aspx", false);

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
            }
        }
    }
}