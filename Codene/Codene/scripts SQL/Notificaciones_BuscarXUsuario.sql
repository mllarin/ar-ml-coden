Create Proc [dbo].[Notificaciones_BuscarXUsuario](@pE_idUsuario as varchar(50))

As

Select ND.idNotificacion
	, N.titulo
	, N.descripcion
	, ND.fechaAlta
	, ND.fechaLeida
From notificaciones n
Inner Join NotificacionesDetalle ND On (ND.idNotificacion = N.idNotificacion)
where ND.idUsuario = @pE_idUsuario
	and ND.leida = 0
	and N.DadoDeBaja = 0