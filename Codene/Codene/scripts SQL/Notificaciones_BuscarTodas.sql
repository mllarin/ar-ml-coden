Create Proc Notificaciones_BuscarTodas

As

Select idNotificacion
	, titulo
	, descripcion
From Notificaciones
Where dadoDeBaja = 0
Order by idNotificacion Desc