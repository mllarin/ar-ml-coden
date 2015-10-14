<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="masInfoComercial.aspx.cs" Inherits="Codene.masInfoComercial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <img src="Images/codeneTercerosAmarillo.png" border="0" />
    <asp:Label ID="lblValorAmarillo" runat="server" CssClass="valorAmarillo" style="top:-149px;left:-229px;"></asp:Label>
    <div style="padding-left: 5px;">
        <h4>Codene de Terceros brinda información detallada acerca de</h4>
        <ul>
            <li>La validación de la identidad de tu persona, como están tus datos.</li>
            <li>La base de relaciones existentes con terceras personas o empresas (estado civil en caso de individuos, sociedades, etc.)</li>
            <li>El historial financiero de adquisición o cancelación de créditos y/o deudas en bancos pertenecientes Codene Record de Creditos.</li>
            <li>Datos acerca del cumplimiento de compromisos publicados por el Banco Central, y los aportados por nuestros propios clientes a la base Codene.</li>
            <li>Cheques rechazados los últimos 24 meses, rescatados y multas canceladas o no.</li>
            <li>Procesos judiciales y extrajudiciales.</li>
        </ul>
        <h4>¿Cuáles son los pasos para adquirir Codene Comercial?</h4>
        <ol>
            <li>Haga click en "Comprar", lea y acepte los términos y condiciones de uso.</li>
            <li>Complete los datos personales solicitados en pantalla.</li>
            <li>Introduzca los datos de su tarjeta de crédito.</li>
            <li>Complete los datos de la persona a quien quiere consultar solicitados en pantalla.</li>
            <li>Presione "Enviar Datos" y en instantes recibirá en pantalla el Codene Comercial.</li>
        </ol>
        <h4>Muy Importante</h4>
        <ul>
            <li>Imprima el informe al momento de visualizarlo en pantalla.</li>
            <li>Al comprar su informe, todos sus datos personales y de su tarjeta de crédito, ingresarán y viajarán por la red en forma absolutamente segura.</li>
        </ul>
    </div>
</asp:Content>
