Create Proc Notificaciones_Leida (@pE_idNotificacion Numeric(10)
								, @pE_idUsuario as varchar(50)
								)

As

Update notificacionesDetalles
Set leida = 1
	, fechaLeida = getdate()
Where idNotificacion = @pE_idNotificacion