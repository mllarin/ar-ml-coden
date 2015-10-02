<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Codene.Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <link href="Content/jquery-ui-1.7.1.custom.css" rel="stylesheet" />
    <style type="text/css">
        a {
            padding: 0px;
        }
    </style>
    <%--<section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h3>Mi Codene </h3>
            </hgroup>
        </div>

    </section>--%>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div align="center">
        <div style="padding-top: 10px; position:relative;width:100%;display:block;" class="promos">
            <div>
                <div>
                    <asp:ImageButton runat="server" ID="imgMiCodene" PostBackUrl="AxpX/MiCodene/infPago.aspx" ImageUrl="Images/miCodeneVerde.png" border="0" />
                    <a href="masInfoPersonal.aspx" title="LEER MÁS" class="instructivo">LEER MÁS</a><%--style="margin-top: 25px; margin-left: -100px"--%>
                    <asp:Button ID="btnComprarPersonal" class="btnComprar" runat="server" Text="COMPRAR" ToolTip="COMPRAR" />
                </div>
                <div>
                    <asp:ImageButton runat="server" ID="imgCodeneTerceros" PostBackUrl="AspX/MiCodene/infTerceros.aspx" ImageUrl="Images/codeneTercerosAmarillo.png" border="0" />
                    <a href="masInfoComercial.aspx" title="LEER MÁS" class="instructivo">LEER MÁS</a>
                    <asp:Button ID="btnComprarTerceros" class="btnComprar" runat="server" Text="COMPRAR" ToolTip="COMPRAR" />
                </div>
                <div>
                    <asp:ImageButton runat="server" ID="imgRojo" PostBackUrl="AspX/MiCodene/infAlertasEstado.aspx" ImageUrl="Images/codeneAlertasRojo.png" border="0" />
                    <a href="masInfoAlertas.aspx" title="LEER MÁS" class="instructivo" style="color: #fff; top: -60px; left: 70px;">LEER MÁS</a>
                    <asp:Button ID="btnSuscribirmeAlertas" class="btnComprar" runat="server" Text="SUSCRIBIRME" ToolTip="SUSCRIBIRME" />
                </div>
                <asp:Label ID="lblValorVerde" runat="server" CssClass="valorVerde"></asp:Label>
                <asp:Label ID="lblValorAmarillo" runat="server" CssClass="valorAmarillo"></asp:Label>
            </div>
        </div>
        <div style="clear: both;"></div>
        <div class="tarjetas">
            <img src="Images/Tarjetas/mastercard.png" />
            <img src="Images/Tarjetas/visa.png" />
            <img src="Images/Tarjetas/amex.png" />
            <img src="Images/Tarjetas/naranja.png" />
            <img src="Images/Tarjetas/cabal.png" />
            <img src="Images/Tarjetas/diners.png" />
            <img src="Images/Tarjetas/shopping.png" />
            <img src="Images/Tarjetas/nativa.png" />
            <img src="Images/Tarjetas/cordoba.png" />
            <img src="Images/Tarjetas/kadicard.png" />
        </div>
        <hr />
        <div style="text-align: left;">
            <div class="news">
                <div>
                    <h3>ANSES</h3>
                    <a href="http://servicioswww.anses.gov.ar/ooss2/" target="_blank">
                        <img src="Images/default/Anses.jpg" /></a>
                    <a href="#">LEER MÁS</a>
                </div>
                <div>
                    <h3>PÁGINAS AMARILLAS</h3>
                    <a href="http://www.paginasamarillas.com.ar" target="_blank">
                        <img src="Images/default/paginasAmarillas.jpg" /></a>
                    <p>Buscá empresas en tu localidad </p>
                    <a href="#">LEER MÁS</a>
                </div>
                <div>
                    <h3>PDP</h3>
                    <a href="http://www.jus.gob.ar/datos-personales.aspx/" target="_blank">
                        <img src="Images/default/pdp.jpg" /></a>
                    <p>Dirección Nacional de Datos Personales</p>
                    <a href="#">LEER MÁS</a>
                </div>
            </div>
            <div class="news">
                <div>
                    <h3>AFIP</h3>
                    <a href="https://seti.afip.gob.ar/padron-puc-constancia-internet/ConsultaConstanciaAction.do" target="_blank">
                        <img src="Images/default/afip.jpg" /></a>
                    <p>Obtenga aqui el archivo completo de la condición tributaria.</p>
                    <a href="">LEER MÁS</a>
                </div>
                <div>
                    <h3>LINK Y BANELCO</h3>
                    <a href="http://www.mastercard.com/ar/consumidores/localizador-de-cajeros-automaticos.html" target="_blank">
                        <img src="Images/default/linkBanelco.jpg" /></a>
                    <p>Localizador de cajeros automáticos</p>
                    <a href="">LEER MÁS</a>
                </div>
                <div>
                    <h3>BCRA</h3>
                    <a href="http://www.bcra.gov.ar/" target="_blank">
                        <img src="Images/default/bcra.jpg" /></a>
                    <p>Información de deudores del sistema financiero</p>
                </div>
            </div>
            <div class="news">
                <div>
                    <h3>DEFIÉNDASE</h3>
                    <a href="http://www.defiendase.com/" target="_blank">
                        <img src="Images/default/defiendase.jpg" /></a>
                    <p>Más vale una consulta a tiempo, que un costoso pleito</p>
                    <a href="#">LEER MÁS</a>
                </div>
                <div>
                    <h3>CALCULÁ TU PRÉSTAMO</h3>
                    <a href="#" target="_blank">
                        <img src="Images/default/calculaPrestamo.jpg" /></a>
                    <a href="#">LEER MÁS</a>
                </div>
            </div>
        </div>
    </div>
    <%--<div style="width: 750px; display: inline-block;">
        <div style="width: 245px; text-align: center; display: inline-block;">
            <a href="masInfoPersonal.aspx" title="Más Info" style="text-align: center;">Más Info</a>
        </div>
        <div style="width: 245px; text-align: center; display: inline-block;">
            <a href="masInfoComercial.aspx" title="Más Info" style="text-align: center;">Más Info</a>
        </div>
    </div>--%>
    <%--<div style="width: 750px; display: inline-block;">
        <div style="width: 245px; text-align: center; display: inline-block;">
            <a href="http://www.codene.com.ar:8080/AspX/MiCodene/infPago.aspx" border="0">
                <img src="Images/ComprarPersonal.png" border="0" /></a>
        </div>
        <div style="width: 245px; text-align: center; display: inline-block;">
            <a href="http://www.codene.com.ar:8080/AspX/MiCodene/infTerceros.aspx" border="0">
                <img src="Images/ComprarComercial.png" border="0" /></a>
        </div>
    </div>--%>
</asp:Content>
