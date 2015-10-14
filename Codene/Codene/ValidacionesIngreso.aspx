<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ValidacionesIngreso.aspx.cs" Inherits="Codene.ValidacionesIngreso" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.8.2.min.js"></script>
    <script src="Scripts/notificaciones.js"></script>
    <link href="Content/notificaciones.css" rel="stylesheet" />
</head>

<script type="text/javascript">

    function getParameterByName(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
        return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }

    var usuario = getParameterByName("UserID");
    $(document).ready(function () {
        getNotificaciones(usuario);
    });
</script>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="Notificaciones" class="notificaciones"></div>
        </div>
    </form>
</body>
</html>
