<<<<<<< HEAD
﻿//Ajax
function SendAjax(urlMethod, jsonData, returnFunction) {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: urlMethod,
        data: jsonData,
        dataType: "json",
        success: function (msg) {
            if (msg != null) {
                returnFunction(msg);
            }
        },
        error: function (xhr, status, error) {
            // Boil the ASP.NET AJAX error down to JSON.
            var err = eval("(" + xhr.responseText + ")");

            // Display the specific error raised by the server
            alert(err.Message);
        }
    });
}

function getNotificaciones(usuario) {
    var urlMethod = "Notificaciones.asmx/getNotificaciones";
    var jsonData = '{usuario:"' + usuario + '"}';
    SendAjax(urlMethod, jsonData, getNotificacionesArmado);
}

function getNotificacionesArmado(msg) {
    var lstNotificaciones = "";

    $.each(msg.d, function (key, val) {
        lstNotificaciones += "<div><div title='Marcar leído' onClick='MarcarLeido(" + val.idNotificacion + ");'>x</div>" +
            "<input id='" + val.idNotificacion + "' type='hidden'/>" +
            "<h3>" + val.Titulo + "</h3>" +
            "<p>" + val.Descripcion + "</p>" +
            "</div>";
    });

    $("#Notificaciones").html(lstNotificaciones);
    //StripeRows('#reservationsList');
}

function MarcarLeido(id){
    alert('La notificación ' + id + ' fue leída');
=======
﻿//Ajax
function SendAjax(urlMethod, jsonData, returnFunction) {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: urlMethod,
        data: jsonData,
        dataType: "json",
        success: function (msg) {
            if (msg != null) {
                returnFunction(msg);
            }
        },
        error: function (xhr, status, error) {
            // Boil the ASP.NET AJAX error down to JSON.
            var err = eval("(" + xhr.responseText + ")");

            // Display the specific error raised by the server
            alert(err.Message);
        }
    });
}

function getNotificaciones(usuario) {
    var urlMethod = "Notificaciones.asmx/getNotificaciones";
    var jsonData = '{usuario:"' + usuario + '"}';
    SendAjax(urlMethod, jsonData, getNotificacionesArmado);
}

function getNotificacionesArmado(msg) {
    var lstNotificaciones = "";

    $.each(msg.d, function (key, val) {
        lstNotificaciones += "<div><div title='Marcar leído' onClick='MarcarLeido(" + val.idNotificacion + ");'>x</div>" +
            "<input id='" + val.idNotificacion + "' type='hidden'/>" +
            "<h3>" + val.Titulo + "</h3>" +
            "<p>" + val.Descripcion + "</p>" +
            "</div>";
    });

    $("#Notificaciones").html(lstNotificaciones);
    //StripeRows('#reservationsList');
}

function MarcarLeido(id){
    alert('La notificación ' + id + ' fue leída');
>>>>>>> refs/remotes/origin/mllarin
}