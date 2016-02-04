USE [Codene]
GO
CREATE Proc web_Notificaciones_BuscarUna (@pE_idNotificacion as int)

As

Select idNotificacion
	, Titulo
	, descripcion
From web_Notificaciones
where idNotificacion = @pE_idNotificacion and
		[dadoDeBaja] = '0'