<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="dondeEstamos.aspx.cs" Inherits="Codene.dondeEstamos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <%--<section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h3>Donde Estamos?</h3>
            </hgroup>
        </div>
    </section>--%>

    <style type="text/css">
        #map {
            width: 600px;
            height: 400px;
            float: left;
            font-family: Verdana;
            font-size: 10px;
        }

        #sideBar {
            overflow: auto;
            width: 100px;
            height: 400px;
            text-align: left;
            background: #53b460; /* #fff; */
            float: right;
            font-family: Verdana;
            font-size: 0.85em;
            font-weight:bold;
        }

            #sideBar div {
                padding: 2px 0;
                cursor: pointer;
            }

                #sideBar div:hover {
                    text-decoration: underline;
                }

        #buttons {
            clear: both;
            text-align: center;
        }

        .bSideSelect {
            background: #dadae3;
        }
    </style>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
    <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=ABQIAAAAaRoqzcRy2v2I5JBkPgH_zRRHjUsJI7DNKF68cqqC8qnuMp2xrBQ4Ozhdo-LdUCwAFbuSVTuSFTeHgA"
        type="text/javascript"></script>
    <script src="Scripts/jQuery.bMap.1.2.3.js"></script>

    <script type="text/javascript">

        $("#map").bMap
        $(document).ready(function () {
            $("#map").bMap({
                mapZoom: 16,
                mapCenter: [-38.958291, -68.06007],
                mapSidebar: "sideBar",
                markers: {
                    "data": [
                     { "lat": "-38.958291", "lng": "-68.06007", "title": "Codene S.A.", "rnd": "1", "body": "<strong>Codene S.A.</strong> <p>Ministro Alcorta 30 - 3° piso oficinas 3 y 4.</p>" }]
                },
                mapType: G_NORMAL_MAP,
                mapLayerbar: "layerBar"
            });
        });

    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Donde Estamos?</h2>
    <div style="height: 400px; margin-top: 50px; border: solid 1px black;">
        <div id="map">
        </div>
        <div id="sideBar">
        </div>
    </div>
</asp:Content>
