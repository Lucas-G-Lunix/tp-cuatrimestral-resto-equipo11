<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Resto_Web.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="vh-100 gradient-custom">
        <div class="container py-5 h-100">
            <div class="row justify-content-center align-items-center h-100">
                <div class="col-12 col-lg-9 col-xl-7">
                    <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                        <div class="card-body p-4 p-md-5">
                            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Log In</h3>
                            <div class="row">
                                <div class="mb-4 pb-2">
                                    <div class="form-outline">
                                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control form-control-lg"></asp:TextBox>
                                        <label class="form-label" for="txtEmail">Email</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="mb-4 pb-2">
                                    <div class="form-outline">
                                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control form-control-lg" TextMode="Password"></asp:TextBox>
                                        <label class="form-label" for="txtPassword">Contraseña</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="mb-4 pb-2">
                                    <div class="form-outline">
                                        <asp:Button ID="btnConfirmar" runat="server" Text="Iniciar Sesion" CssClass="btn btn-success btn-block btn-lg text-body" OnClick="btnConfirmar_Click" OnClientClick="return validateEmail()" autopostback="false" />
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
