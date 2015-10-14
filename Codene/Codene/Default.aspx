<<<<<<< HEAD
﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Codene.Default" %>

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
=======
<%@ Page Language="C#" MasterPageFile="Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Codene.Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <link href="http://fonts.googleapis.com/css?family=Droid+Sans:400,700" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="css/flexslider.css">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.flexslider-min.js"></script>
    <script type="text/javascript" charset="utf-8">
        $(window).load(function () {
            $('.flexslider').flexslider({
                controlsContainer: '.flex-container'
            });
        });
</script>
    <style type="text/css">
        a {
            padding: 0px;
            text-decoration:none;
        }
        .flex-direction-nav{
        display:none;
        }
    </style>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
                        <div class="flex-container" style="z-index:1;">
                            <div class="flexslider">
                                <ul class="slides">
                                    <li><a href="masinfocomercial.aspx"><img src="Images/slide/slide01.jpg"/></a></li>
                                    <li><a href="masinfopersonal.aspx"><img src="Images/slide/slide02.jpg"/></a></li>
                                    <li><a href="masinfoalertas.aspx"><img src="Images/slide/slide03.jpg"/></a> </li>     
                                </ul>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div class="clear"></div>
    <div align="center">
        <div class="promos"style="height: 259px;">
                        <div id="wb_Image2" style="position:absolute;margin-left: 250px;margin-top: 15px;width:225px;height:192px;z-index:4;">
                        <a href="masinfocomercial.aspx"><img src="images/03.png" id="Image2" alt=""></div></a>
                        <div id="wb_Image3" style="position:absolute;margin-left: 250px;margin-top: 207px;width:225px;height:38px;z-index:5;">
                        <a href="AspX/MiCodene/infTerceros.aspx"><img src="images/b2tercerosz.png" id="Image3" alt=""></div></a>
                        <div id="wb_Image4" style="position:absolute;margin-left: 507px;margin-top: 15px;height:192px;z-index:6;">
                        <a href="masinfoalertas.aspx"><img src="images/01.png" id="Image4" alt=""></div></a>
                        <div id="wb_Image5" style="position:absolute;margin-left: 507px;margin-top: 207px;width:225px;height:38px;z-index:7;">
                        <a href="AspX/MiCodene/infAlertasEstado.aspx"><img src="images/b2alertaz.png" id="Image5" alt=""></div></a>
                        <div id="wb_Image6" style="position:absolute;margin-top: 15px;width:225px;height:192px;z-index:8;">
                        <a href="masinfopersonal.aspx"><img src="images/02.png" id="Image6" alt=""></div></a>
                        <div id="wb_Image7" style="position:absolute;margin-top: 207px;width:225px;height:38px;z-index:9;">
                        <a href="AspX/MiCodene/infPago.aspx"><img src="images/b2codenez.png" id="Image7" alt=""></div></a>
            <div>
                <asp:Label ID="lblValorVerde" runat="server" CssClass="valorVerde"></asp:Label>
                <asp:Label ID="lblValorAmarillo" runat="server" CssClass="valorAmarillo"></asp:Label>
                <div class="clear"></div>
            </div> 
            <div class="clear"></div>
        </div>
        <div style="clear: both;"></div>
        <div class="tarjetas">
           <div id="container">
            
            <div class="contenedor1 contenedorm"style="margin-top: 28px;">
              <a href="http://afip.gov.ar" target="_blank">
                <img src="images/afip_color.png"style="width:100px;" /></a>
            </div>
                           
            <div class="contenedor2 contenedorm"style="margin-top: 5px;margin-left: 40px;">
               <a href="http://www.bcra.gov.ar/" target="_blank">
                  <img src="images/bcra_color.png" /></a>
            </div>
             
            <div class="contenedor3 contenedorm"style="margin-top: 3px;margin-left: 40px;">
              <a href="http://www.anses.gob.ar/" target="_blank">
                <img src="images/anses_color.png"style="width: 75px;" /></a>
                </div>

           <div class="contenedor4 contenedorm"style="margin-top: 11px;margin-left: 40px;">
             <a href="http://www.redlink.com.ar/" target="_blank">
               <img src="images/link_color.png"style="width: 55px;" /></a>
           </div>
                
            <div class="contenedor5 contenedorm"style="margin-left:20px;margin-top: 15px;">
             <a href="http://www.banelco.com/" target="_blank">
               <img src="images/banelco_color.png"style="width: 75px;" /></a>
           </div>

           <div class="contenedor6 contenedorm"style="margin-left: 30px;">
            <a href="http://www.paginasamarillas.com.ar/" target="_blank">
              <img src="images/paginas_color.png"style="width:130px;" /></a>
           </div>

            <div class="contenedor7 contenedorm"style="margin-top: 17px;margin-left: 100px;">
              <a href="http://www.defiendase.com/" target="_blank">
                <img src="images/defiendase_color.png"style="width: 100px;" /></a>
            </div>
          </div>
       </div>         

</asp:Content>
>>>>>>> refs/remotes/origin/mllarin
