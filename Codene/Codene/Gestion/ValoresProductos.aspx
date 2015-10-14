<%@ Page Title="" Language="C#" MasterPageFile="~/Gestion/Gestion.Master" AutoEventWireup="true" CodeBehind="ValoresProductos.aspx.cs" Inherits="Codene.Gestion.ValoresProductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        label {
            width: 120px;
            margin-top:5px;
        }

        input, textarea {
            width:80px;
            margin-top:5px;
            margin-left: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h3>Gestión - Banners</h3>
            </hgroup>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div id="GestionBanners">
        <div>
            <h4>Valores Productos</h4>
            <br />
            <div>
                <label for="MiCodene">Mi Codene</label>
                <asp:TextBox ID="txtMiCodene" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="DeTercerosCodene">De Terceros Codene</label>
                <asp:TextBox ID="txtDeTercerosCodene" runat="server"></asp:TextBox>
            </div>
            <asp:Button ID="btnGuardar" runat="server" Style="margin-top: 10px;" Text="Guardar" OnClick="btnGuardar_Click" />
        </div>
        <div>
            <asp:Image ID="imgMuestra" runat="server" />
        </div>
    </div>
</asp:Content>
