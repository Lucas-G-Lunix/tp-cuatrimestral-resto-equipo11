﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdministracionUsuarios.aspx.cs" Inherits="Resto_Web.AdministracionUsuarios" %>

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
                <h1>Usuarios</h1>
                <hr />
                <asp:GridView ID="gvUsuarios" runat="server" AutoGenerateColumns="false" DataKeyNames="Id" CssClass="table" OnSelectedIndexChanged="gvUsuarios_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField HeaderText="Id" DataField="Id" HeaderStyle-CssClass="noMostrar" ItemStyle-CssClass="noMostrar" />
                        <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                        <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                        <asp:BoundField HeaderText="Email" DataField="Email" />
                        <asp:CheckBoxField HeaderText="Es Admin" DataField="RolAdmin" ValidateRequestMode="Enabled" />
                        <asp:TemplateField HeaderText="Acciones">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnCambiarAdmin" runat="server" OnClick="btnCambiarAdmin_Click" CommandName="Id" CommandArgument='<%# ((GridViewRow) Container).RowIndex %>'>🔐</asp:LinkButton>
                                <asp:LinkButton ID="btnQuitarAdmin" runat="server" OnClick="btnQuitarAdmin_Click" CommandName="Id" CommandArgument='<%# ((GridViewRow) Container).RowIndex %>'>🔓</asp:LinkButton>
                                <asp:LinkButton ID="btnEliminar" runat="server" OnClick="btnEliminar_Click" CommandName="Id" CommandArgument='<%# ((GridViewRow) Container).RowIndex %>'>🗑️</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
