<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdministrarMesas.aspx.cs" Inherits="Resto_Web.AdministrarMesas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .hide {
            display: none;
        }
    </style>
    <asp:GridView ID="gvMesas" runat="server" CssClass="table" DataKeyNames="Id" AutoGenerateColumns="false" OnSelectedIndexChanged="gvMesas_SelectedIndexChanged">
        <Columns>
            <asp:BoundField HeaderText="Id" DataField="Id" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide"/>
            <asp:BoundField HeaderText="Numero Mesa" DataField="NumeroMesa" />
            <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="🗑️" />
        </Columns>
    </asp:GridView>
</asp:Content>
