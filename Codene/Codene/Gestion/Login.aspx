<%@ Page Title="" Language="C#" MasterPageFile="~/Gestion/Gestion.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Codene.Gestion.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h3>Gestión - Login</h3>
            </hgroup>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div id="loginGestion">
        <div>
            <asp:Label ID="lblUsuario" runat="server" Width="80px">Usuario</asp:Label>
            <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="lblContrasenia" runat="server" Width="80px">Contraseña</asp:Label>
            <asp:TextBox ID="txtContrasenia" runat="server" TextMode="Password"></asp:TextBox>
        </div>
        <asp:Label ID="lblError" runat="server" style="font-size:0.8em;color:red;padding-left:20px;"></asp:Label>
        <div>
            <asp:Button ID="btnLogin" runat="server" Text="Login" style="margin-left: 200px;" OnClick="btnLogin_Click" />
        </div>
    </div>
</asp:Content>
