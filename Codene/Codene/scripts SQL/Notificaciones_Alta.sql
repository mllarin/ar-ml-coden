
ALTER Proc [dbo].[Notificaciones_Alta] (@pE_titulo as varchar(200)
								, @pE_descripcion as text)

As
set nocount on
-- Obtengo el último nro de notificacion
-------------------------------------------
Declare @idNotificacion as numeric(10)

Select @idNotificacion = isnull(max(idnotificacion),0) + 1
From notificaciones

-- Hago el insert en Notificaciones para todos los usuarios creados
--------------------------------------------------------------------
Begin Tran

-- insert cabecera
Insert Into Notificaciones
	(idNotificacion
	, titulo
	, descripcion
	, dadoDeBaja)
Values (@idNotificacion
	, @pE_titulo
	, @pE_descripcion
	, 0)

-- insert detalle
insert Into NotificacionesDetalle
	(idNotificacion
	, idUsuario
	, leida
	, fechaAlta
	, fechaLeida)
Select idNotificacion = @idNotificacion
	, idUsuario = lower(idUsuario)
	, leida = 0
	, fechaAlta = getdate()
	, fechaLeida = null
from UsuariosITSUR

Commit Tran