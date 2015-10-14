<<<<<<< HEAD
Create Proc Notificaciones_BuscarTodas

As

Select idNotificacion
	, titulo
	, descripcion
From Notificaciones
Where dadoDeBaja = 0
=======
Create Proc Notificaciones_BuscarTodas

As

Select idNotificacion
	, titulo
	, descripcion
From Notificaciones
Where dadoDeBaja = 0
>>>>>>> refs/remotes/origin/mllarin
Order by idNotificacion Desc