<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="FormUsuario.aspx.cs" Inherits="Resto_Web.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <h1> Datos Usuario ...   </h1>
    <hr />
    <div class="col-6">
<div class="mb-3">
  <label for="txtID" class="form-label">ID</label>
  <asp:TextBox runat="server" ID="txtID"  CssClass ="form-control"/>
    </div>
        <div class="mb-3">
  <label for="txtNombre" class="form-label">Nombre</label>
  <asp:TextBox runat="server" ID="txtNombre"  CssClass ="form-control"/>  
</div>
    <div class="mb-3">
  <label for="txtApellido" class="form-label">Dirección</label>
        <asp:TextBox runat="server" ID="txtApellido"  CssClass ="form-control"/>  
</div>
  <div class="mb-3">
  <label for="txtEmail" class="form-label">Mail</label>
  <asp:TextBox runat="server" ID="txtEmail"  CssClass ="form-control"/>  
</div>
   
       <div class="mb-3">
  <label for="txtPass" class="form-label">Pass</label>
  <asp:TextBox runat="server" ID="txtPass"  CssClass ="form-control"/>  
</div>

     <div class="mb-3">
  <label for="txtFechaNacimiento" class="form-label">Fecha de Nacimiento</label>
  <asp:TextBox runat="server" ID="txtFechaNacimiento"  CssClass ="form-control" TextMode="Date" />  
</div>

</div>

    
    <div class="col-md-4">
        <div class="mb-3">
            
        <label class="form-label">Imagen Perfil</label>
            <input type="file" id="txtImagen" runat="server" class="form-control"/>
           
        </div>
       <asp:Image ID="ImagenPerfil" ImagenUrl="https://www.escapeauthority.com/wp-content/uploads/2116/11/No-image-found.jpg" runat="server" cssclass="img-fluid mb-3"/>
        </div>

    <div class="row">   
        <div class="col-md-4">
            <asp:Button Text="Guardar" CssClass="btn btn-primary" ID="btnGuardar" runat="server" />
            <a href="/">Volver</a>
        </div>

    </div>
        
    
</asp:Content>
