<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdministrarTipo.aspx.cs" Inherits="Resto_Web.AdministrarTipo" %>

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
                <h1>Tipos</h1>
                <hr />
                <asp:GridView ID="gvTipo" runat="server" AutoGenerateColumns="false" DataKeyNames="Id" CssClass="table" OnSelectedIndexChanged="gvTipo_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField HeaderText="Id" DataField="Id" HeaderStyle-CssClass="noMostrar" ItemStyle-CssClass="noMostrar" />
                        <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
                        <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="🗑️" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="row">
            <h1>Agregar Tipo</h1>
            <div class="row">
                <div class="col-auto">
                    <asp:TextBox ID="txtNuevoTipo" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-auto">
                    <asp:Button ID="btnagregarTipo" runat="server" Text="Agregar" CssClass="btn btn-primary mb-3" OnClick="btnagregarTipo_Click" />
                </div>
            </div>
            <div class="row">
                <a href="Menu.aspx" class="btn btn-warning">Volver</a>
            </div>
        </div>
    </div>
</asp:Content>
