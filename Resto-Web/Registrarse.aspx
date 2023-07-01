<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Registrarse.aspx.cs" Inherits="Resto_Web.Registrarse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <section class="vh-100">
            <div class="container py-5 h-100">
                <div class="row justify-content-center align-items-center h-100">
                    <div class="col-12 col-lg-9 col-xl-7">
                        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                            <div class="card-body p-4 p-md-5">
                                <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Registrarse</h3>

                                <div class="row">
                                    <div class="col-md-6 mb-4">

                                        <div class="form-outline">
                                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control form-control-lg" type="text"></asp:TextBox>
                                            <label class="form-label" for="firstName">Nombre</label>
                                        </div>

                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <div class="form-outline">
                                            <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control form-control-lg" type="text"></asp:TextBox>
                                            <label class="form-label" for="lastName">Apellido</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="mb-4 pb-2">
                                        <div class="form-outline">
                                            <asp:TextBox ID="txtMail" runat="server" TextMode="Email" CssClass="form-control form-control-lg"></asp:TextBox>
                                            <label class="form-label" for="emailAddress">Email</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="mb-4 pb-2">
                                        <div class="form-outline">
                                            <asp:TextBox ID="txtContraseña" runat="server" CssClass="form-control form-control-lg" TextMode="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Debe contener al menos un numero, una letra Mayuscula y una letra minuscula, y por lo menos 8 caracteres"></asp:TextBox>
                                            <label class="form-label" for="txtContraseña">Contraseña</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 mb-4 pb-2">
                                        <div class="form-outline datepicker w-100">
                                            <asp:TextBox ID="txtNacimiento" runat="server" TextMode="Date" CssClass="form-control form-control-lg"></asp:TextBox>
                                            <label for="birthdayDate" class="form-label">Fecha Nacimiento</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6 d-flex justify-content-center">
                                        <div class="form-outline">
                                            <asp:Button ID="btnConfirmar" runat="server" Text="Confirmar Registro" CssClass="btn btn-success btn-block btn-lg text-body" OnClientClick="return validate()" OnClick="btnConfirmar_Click" autopostback="false" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
