<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="GenerarTicket.aspx.cs" Inherits="Resto_Web.GenerarTicket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js">
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-3" id="listaPedidos">
        <div class="row">
           <h1><asp:Label ID="lblNumeroMesa" runat="server" Text=""></asp:Label></h1>
        </div>
        <div class="row">
        <div class="col">
        <div class="d-flex">
             <div class="col">
            <asp:Repeater ID="rpPlatosPedido" runat="server" OnItemDataBound="rpPlatosPedido_ItemDataBound">
                <ItemTemplate>
                    <div class="card mb-3" style="width:1000px">
                        <div class="row g-0">
                            <div class="col-md-3 d-flex">
                                <img style="width: 100%; object-fit: cover" src="/Images/Platos/plato-<%# Eval("IdPlato") %>.jpg" class="img-fluid rounded-start" onerror="this.onerror=null; this.src='Images/Design/no_image.svg'" />
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <div class="container mb-3">
                                        <asp:Label ID="lblNombre" runat="server" Text="" CssClass="card-title" Style="display: block;"></asp:Label>
                                        <span style="display: block;">
                                            <asp:Label ID="lblPrecio" runat="server" Text=""></asp:Label>$</span>
                                        <span style="display: block;">Cantidad: <asp:Label ID="lblCantidad" runat="server" Text='<%# Eval("Cantidad") %>'></asp:Label></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
                 </div>
            </div>
        </div>
            
        </div>
        <div class="row">
            <h1><asp:Label ID="lblTotalPagar" runat="server" Text=""></asp:Label></h1>
        </div>
    </div>
    <div class="row">
        <asp:LinkButton ID="btnVolver" runat="server" CssClass="btn btn-warning" OnClick="btnVolver_Click">Volver</asp:LinkButton>
            </div>
    <script>
        window.onload = function () {
            generatePDF();
            console.log("Runned");
        };

        function generatePDF() {
            let idPedido = getCurrentURL().split("?")[1].split("&")[0].split("=")[1];
            // Choose the element that your content will be rendered to.
            const element = document.getElementById('listaPedidos');
            // Choose the element and save the PDF for your user.
            html2pdf().from(element).save("ticketPedido-" + idPedido);
        }

        function getCurrentURL() {
            return window.location.href
        }
    </script>
</asp:Content>
