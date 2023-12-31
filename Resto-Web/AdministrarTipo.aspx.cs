﻿using Dominio;
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
                    panelNotificaciones.Visible = false;
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
                lblNotification.Text = "Tipo eliminada correctamente";
                divNotifications.Attributes["class"] = "alert alert-warning alert-dismissible fade show alert-fixed";
                RecargarGrilla();
            }
            catch (Exception ex)
            {
                string Error = "";
                if (ex.Message.Contains("El tipo esta asiganado a un plato"))
                {
                    Error = "El tipo se encuentra asignado a un plato";
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
                lblNotification.Text = "Tipo Agregado";
                divNotifications.Attributes["class"] = "alert alert-success alert-dismissible fade show alert-fixed";
                panelNotificaciones.Visible = true;
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