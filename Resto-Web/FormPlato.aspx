﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="FormPlato.aspx.cs" Inherits="Resto_Web.FormPlato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Plato</h1>
    <hr />
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <% if (Request.QueryString["IdPlato"] != null)
                    {%>
                <div class="mb-3">
                    <label for="txtNombre" class="form-label">Id</label>
                    <asp:TextBox runat="server" ID="txtId" CssClass="form-control" />
                </div>
                <% } %>

                <div class="mb-3">
                    <label for="txtID" class="form-label">Nombre</label>
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <label for="txtStock" class="form-label">Stock</label>
                    <asp:TextBox runat="server" ID="txtStock" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <label for="txtTipo" class="form-label">Tipo</label>
                    <asp:DropDownList ID="ddlTipo" CssClass="form-select" runat="server"></asp:DropDownList>
                </div>

                <div class="mb-3">
                    <label for="txtCategoria" class="form-label">Categoria</label>
                    <asp:DropDownList ID="ddlCategoria" CssClass="form-select" runat="server"></asp:DropDownList>
                </div>

                <div class="mb-3">
                    <label for="txtPrecio" class="form-label">Precio</label>
                    <asp:TextBox runat="server" ID="txtPrecio" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <label class="form-label">Imagen Plato</label>
                    <input type="file" id="txtImagen" runat="server" class="form-control" />
                </div>

                <div class="row">
                    <div class="col">
                        <asp:Button Text="Guardar" CssClass="btn btn-primary" ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" OnClientClick="return validar();" autopostback="false" />
                        <a href="Menu.aspx" class="btn btn-warning">Volver</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <asp:Image ID="imgPlato" ImageUrl="/Images/Design/no_image.svg" onerror="this.onerror=null; this.src='Images/Design/no_image.svg'"
                    runat="server" CssClass="img-fluid mb-3" />
            </div>
        </div>
    </div>
    <script>
        function validar() {
            var nombrePlato = document.getElementById("ContentPlaceHolder1_txtNombre").value;
            var stock = document.getElementById("ContentPlaceHolder1_txtStock").value;
            var precio = document.getElementById("ContentPlaceHolder1_txtPrecio").value;
            var patternNumeros = /^[0-9]*$/;
            var patternTexto = /^[A-Za-zñÑáéíóúÁÉÍÓÚ\s]*$/;
            if (nombrePlato === "") {
                alert("Debes completar el campo nombre del plato");
                return false;
            }
            if (!patternTexto.test(nombrePlato)) {
                alert("El campo nombre del plato solo puede contener texto");
                return false;
            }
            if (!patternNumeros.test(stock)) {
                alert("Solo se admite numeros en el campo stock");
                return false;
            }
            if (!patternNumeros.test(precio)) {
                alert("Solo se admite numeros en el campo precio");
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
