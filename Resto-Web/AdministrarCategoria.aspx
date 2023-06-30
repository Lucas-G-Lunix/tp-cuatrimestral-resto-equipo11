<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdministrarCategoria.aspx.cs" Inherits="Resto_Web.AdministrarCategoria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .noMostrar {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col">
                <h1>Categorias</h1>
                <hr />
                <asp:GridView ID="gvCategoria" runat="server" AutoGenerateColumns="false" DataKeyNames="Id" CssClass="table" OnSelectedIndexChanged="gvCategoria_SelectedIndexChanged">
                    <columns>
                        <asp:BoundField HeaderText="Id" DataField="Id" HeaderStyle-CssClass="noMostrar" ItemStyle-CssClass="noMostrar" />
                        <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
                        <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="🗑️" />
                    </columns>
                </asp:GridView>
            </div>
        </div>
        <div class="row">
             <h1>Agregar Categoria</h1>
                <div class="row">
                    <div class="col-auto">
                        <asp:TextBox ID="txtNuevoCategoria" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-auto">
                        <asp:Button ID="btnAgregarCategoria" runat="server" Text="Agregar" CssClass="btn btn-primary mb-3" OnClick="btnAgregarCategoria_Click"/>
                    </div>
                </div>
            <div class="row">
                        <a href="Menu.aspx" class="btn btn-warning">Volver</a>
            </div>
        </div>
    </div>
</asp:Content>
