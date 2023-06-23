<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="FormPlato.aspx.cs" Inherits="Resto_Web.FormPlato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Plato</h1>
    <hr />
    <div class="container">
        <div class="row">
            <div class="col-6">
                <div class="mb-3">
                    <label for="txtNombre" class="form-label">Id</label>
                    <asp:TextBox runat="server" ID="txtId" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <label for="txtID" class="form-label">Nombre</label>
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
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
                    <label for="txtPrecio" class="form-label">Url Imagen</label>
                    <asp:TextBox runat="server" ID="txtImagen" CssClass="form-control" />
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <asp:Button Text="Guardar" CssClass="btn btn-primary" ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" />
                        <a href="Menu.aspx" class="btn btn-warning">Volver</a>
                    </div>
                </div>
            </div>
            <div class="col-6">
                <asp:Image ID="imgPlato" runat="server" CssClass="img-fluid" />
            </div>
        </div>
    </div>
</asp:Content>
