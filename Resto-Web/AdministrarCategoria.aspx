<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdministrarCategoria.aspx.cs" Inherits="Resto_Web.AdministrarCategoria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .noMostrar {
            display: none;
        }
        
        .alert-fixed {
            position: fixed;
            top: 0px;
            left: 0px;
            width: 100%;
            z-index: 9999;
            border-radius: 0px
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <asp:PlaceHolder ID="panelNotificaciones" runat="server">
            <div role="alert" id="divNotifications" runat="server" class="alert-fixed">
                <asp:Label ID="lblNotification" runat="server" Text="Label"></asp:Label>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </asp:PlaceHolder>
        <div class="row">
            <div class="col">
                <h1>Categorias</h1>
                <hr />
                <asp:GridView ID="gvCategoria" runat="server" AutoGenerateColumns="false" DataKeyNames="Id" CssClass="table" OnSelectedIndexChanged="gvCategoria_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField HeaderText="Id" DataField="Id" HeaderStyle-CssClass="noMostrar" ItemStyle-CssClass="noMostrar" />
                        <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
                        <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="🗑️" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="row">
            <h1>Agregar Categoria</h1>
            <hr />
            <div class="mb-3 row">
                <div class="col-auto">
                    <label for="txtNuevoCategoria" class="form-label">Nombre Categoria</label>
                </div>
                <div class="col-auto">
                    <asp:TextBox ID="txtNuevoCategoria" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-auto">
                    <asp:Button ID="btnAgregarCategoria" runat="server" Text="Agregar" CssClass="btn btn-primary mb-3" OnClick="btnAgregarCategoria_Click" OnClientClick="return validar();" autopostback="false" />
                </div>
            </div>
            <div class="row">
                <a href="Menu.aspx" class="btn btn-warning">Volver</a>
            </div>
        </div>
    </div>
    <script>
        function validar() {
            var nombreCategoria = document.getElementById("ContentPlaceHolder1_txtNuevoCategoria").value;
            var patternTexto = /^[A-Za-zñÑáéíóúÁÉÍÓÚ\s]*$/;
            if (nombreCategoria === "") {
                alert("Debes completar el campo con el nombre de la categoria");
                return false;
            }
            if (!patternTexto.test(nombreCategoria)) {
                alert("El campo nombre de la categoria solo puede contener texto");
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
