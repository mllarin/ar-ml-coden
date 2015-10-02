<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MensajeEnviadoCV.aspx.cs" Inherits="Codene.MensajeEnviadoCV" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div style="font-size: 12px; font-family: Segoe UI; width: 500px;">
        <div style="text-align: left; padding-left: 10px; padding-top: 5px; font-size: 1.3em; font-weight: bold; letter-spacing: 1px; color: #3e5667; background-color: #16a864; border-top-left-radius: 5px; border-top-right-radius: 5px;">
            Gracias por enviarnos tu CV!
        </div>
        <div style="color: #16a864; border-color: #16a864; border-bottom-left-radius: 5px; border-bottom-right-radius: 5px; padding: 5px; background-color: #e1e1e1; font-size: 1.1em;">
            <img src="Images/MailEnviado.png" alt=""/>
            <br />
            El mail fue recibido correctamente.
        </div>
    </div>
</asp:Content>
