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
