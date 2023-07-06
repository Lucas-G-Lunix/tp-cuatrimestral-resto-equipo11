<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="EstadisticasDiarias.aspx.cs" Inherits="Resto_Web.EstadisticasDiarias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="vh-100 gradient-custom">
        <div class="container py-5 h-100">
            <div class="row justify-content-center align-items-center h-100">
                <div class="col-12 col-lg-9 col-xl-7">
                    <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                        <div class="card-body p-4 p-md-5">
                            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Estadisticas del Dia</h3>
                            <div class="row">
                                <div class="mb-4 pb-2">
                                    <div class="form-outline">
                                        <label class="form-label" for="lblPedidosDelDia">Pedidos del Dia</label>
                                        <asp:Label ID="lblPedidosDelDia" runat="server" Text="" CssClass="form-control form-control-lg"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="mb-4 pb-2">
                                    <div class="form-outline">
                                        <label class="form-label" for="lblIngresosDelDia">Ingresos del Dia</label>
                                        <asp:Label ID="lblIngresosDelDia" runat="server" Text="" CssClass="form-control form-control-lg"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="mb-4 pb-2">
                                    <div class="form-outline">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
