<<<<<<< HEAD
USE [Codene]
GO

/****** Object:  StoredProcedure [dbo].[web_Banner_Alta]    Script Date: 03/07/2014 09:15:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Banner_Alta](@pE_nombre as varchar(50)
						, @pE_imagen as varchar(100)
						, @pE_activo as bit = 1
						, @pE_columna as varchar(1)
						, @pE_link as varchar(150) = '')

As


-- Obtengo el ultimo id + 1
Declare @id as int;

Select @id = isnull(max(id), 0) +1
From banners

Insert Into web_Banners 
	(id, nombre, imagen, activo, columna, link)
values
	(@id, @pE_nombre, @pE_imagen, @pE_activo, @pE_columna, @pE_link)

Select @id
GO

/****** Object:  StoredProcedure [dbo].[web_Banner_BuscarImagen]    Script Date: 03/07/2014 09:15:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Banner_BuscarImagen] (@pE_Imagen varchar(100))

As

If Exists( Select imagen
			From web_Banners
			where Lower(imagen) = Lower(@pE_Imagen)
				And activo = 1
			)
			select resultado = 'true';
else
			select resultado = 'false';


GO

/****** Object:  StoredProcedure [dbo].[web_Banner_BuscarTodos]    Script Date: 03/07/2014 09:15:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Banner_BuscarTodos]

As

Select id
	, nombre
	, imagen = '..\banners\' + imagen
	, activo
	, columna = case upper(columna)
				when 'D' then 'Derecha'
				else 'Izquierda'
				end
From web_Banners



GO

/****** Object:  StoredProcedure [dbo].[web_Banner_BuscarTodosInicio]    Script Date: 03/07/2014 09:15:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Banner_BuscarTodosInicio]

As

Select id
	, nombre
	, imagen = '..\banners\' + imagen
	, activo
	, columna = case upper(columna)
				when 'D' then 'Derecha'
				else 'Izquierda'
				end
	, link
From web_Banners
GO

/****** Object:  StoredProcedure [dbo].[web_Banner_BuscarUno]    Script Date: 03/07/2014 09:15:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Banner_BuscarUno] (@pE_id as int)

As

Select id
	, nombre
	, imagen = '..\banners\' + imagen
	, activo
	, columna
	, link
From web_Banners
where id = @pE_id
GO

/****** Object:  StoredProcedure [dbo].[web_Banner_Modificar]    Script Date: 03/07/2014 09:15:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Banner_Modificar] (@pE_id as int
							, @pE_nombre as varchar(50)
							, @pE_imagen as varchar(100) = ''
							, @pE_activo as bit
							, @pE_columna as varchar(1)
							, @pE_link as varchar(150) = '')

As

if Len(@pE_imagen) > 0
	begin
		update web_Banners
		set	nombre = @pE_nombre
			, imagen = @pE_imagen
			, activo = @pE_activo
			, columna = @pE_columna
			, link = @pE_link
		where id = @pE_id
	end
else
	begin
		update web_Banners
		set	nombre = @pE_nombre
			, activo = @pE_activo
			, columna = @pE_columna
			, link = @pE_link
		where id = @pE_id
	end
GO

/****** Object:  StoredProcedure [dbo].[web_Notificaciones_Alta]    Script Date: 03/07/2014 09:15:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Notificaciones_Alta] (@pE_titulo as varchar(200)
								, @pE_descripcion as text)

As
set nocount on
-- Obtengo el último nro de notificacion
-------------------------------------------
Declare @idNotificacion as numeric(10)

Select @idNotificacion = isnull(max(idnotificacion),0) + 1
From web_notificaciones

-- Hago el insert en Notificaciones para todos los usuarios creados
--------------------------------------------------------------------
Begin Tran

-- insert cabecera
Insert Into web_Notificaciones
	(idNotificacion
	, titulo
	, descripcion
	, dadoDeBaja)
Values (@idNotificacion
	, @pE_titulo
	, @pE_descripcion
	, 0)

-- insert detalle
insert Into web_NotificacionesDetalle
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
from web_UsuariosITSUR

Commit Tran
GO

/****** Object:  StoredProcedure [dbo].[web_Notificaciones_BuscarTodas]    Script Date: 03/07/2014 09:15:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Notificaciones_BuscarTodas]

As

Select idNotificacion
	, titulo
	, descripcion
From web_Notificaciones
Where dadoDeBaja = 0
Order by idNotificacion Desc
GO

/****** Object:  StoredProcedure [dbo].[web_Notificaciones_BuscarXUsuario]    Script Date: 03/07/2014 09:15:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Notificaciones_BuscarXUsuario](@pE_idUsuario as varchar(50))

As

Select ND.idNotificacion
	, N.titulo
	, N.descripcion
	, ND.fechaAlta
	, ND.fechaLeida
From web_notificaciones n
Inner Join web_NotificacionesDetalle ND On (ND.idNotificacion = N.idNotificacion)
where ND.idUsuario = @pE_idUsuario
	and ND.leida = 0
	and N.DadoDeBaja = 0
GO

/****** Object:  StoredProcedure [dbo].[web_Notificaciones_Leida]    Script Date: 03/07/2014 09:15:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Notificaciones_Leida] (@pE_idNotificacion Numeric(10)
								, @pE_idusuario as varchar(50)
								)

As

Update web_notificacionesDetalles
Set leida = 1
	, fechaLeida = getdate()
Where idNotificacion = @pE_idNotificacion
GO

/****** Object:  StoredProcedure [dbo].[web_Usuario_Alta]    Script Date: 03/07/2014 09:15:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Usuario_Alta](@pE_usuario as varchar(50)
						, @pE_password as varchar(50)
						, @pE_activo as bit = 1)

As


Insert Into web_Usuarios
	(usuario, [password], activo)
values
	(@pE_usuario, @pE_password, @pE_activo)
GO

/****** Object:  StoredProcedure [dbo].[web_Usuario_BuscarUno]    Script Date: 03/07/2014 09:15:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Usuario_BuscarUno] (@pE_id as int)

As

Select id
	, usuario
	, [password]
	, activo
From web_Usuarios
where id = @pE_id
GO

/****** Object:  StoredProcedure [dbo].[web_Usuario_Validar]    Script Date: 03/07/2014 09:15:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Usuario_Validar] (@pE_usuario as varchar(50)
							, @pE_password as varchar(50)
							)
As

Select id = isNull(id,0)
	, usuario
	, [password]
	, activo
From web_Usuarios
Where usuario = @pE_usuario
	and [password] = @pE_password
	and activo = 1
GO

/****** Object:  StoredProcedure [dbo].[web_UsuariosITSUR_Alta]    Script Date: 03/07/2014 09:15:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_UsuariosITSUR_Alta] (@pE_idUsuario as varchar(50))

As

If not exists (Select idUsuario From web_UsuariosITSUR Where idUsuario = @pE_idUsuario)
	begin
		Insert Into web_UsuariosITSUR (idUsuario) 
		Values (@pE_idUsuario)
	end
	
GO

/****** Object:  StoredProcedure [dbo].[web_Valores_Alta]    Script Date: 03/19/2014 14:40:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[web_Valores_Alta] (@pE_codeneVerde decimal(10,2) = 0
						, @pE_codeneAmarillo decimal(10,2) = 0
						, @pE_codeneRojo decimal(10,2) = 0
						)

As

Update Valores
set codeneVerde = @pE_codeneVerde
	, codeneAmarillo = @pE_codeneAmarillo
	, codeneRojo = @pE_codeneRojo
where id = 1
GO

/****** Object:  StoredProcedure [dbo].[web_Valores_Buscar]    Script Date: 03/19/2014 14:40:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Valores_Buscar]

As

Select codeneVerde = Convert(decimal(10,0), codeneVerde)
	, codeneAmarillo =  Convert(decimal(10,0), codeneAmarillo)
	, codeneRojo = Convert(decimal(10,0), codeneRojo)
From Valores
Where id = 1
GO

=======
USE [Codene]
GO

/****** Object:  StoredProcedure [dbo].[web_Banner_Alta]    Script Date: 03/07/2014 09:15:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Banner_Alta](@pE_nombre as varchar(50)
						, @pE_imagen as varchar(100)
						, @pE_activo as bit = 1
						, @pE_columna as varchar(1)
						, @pE_link as varchar(150) = '')

As


-- Obtengo el ultimo id + 1
Declare @id as int;

Select @id = isnull(max(id), 0) +1
From banners

Insert Into web_Banners 
	(id, nombre, imagen, activo, columna, link)
values
	(@id, @pE_nombre, @pE_imagen, @pE_activo, @pE_columna, @pE_link)

Select @id
GO

/****** Object:  StoredProcedure [dbo].[web_Banner_BuscarImagen]    Script Date: 03/07/2014 09:15:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Banner_BuscarImagen] (@pE_Imagen varchar(100))

As

If Exists( Select imagen
			From web_Banners
			where Lower(imagen) = Lower(@pE_Imagen)
				And activo = 1
			)
			select resultado = 'true';
else
			select resultado = 'false';


GO

/****** Object:  StoredProcedure [dbo].[web_Banner_BuscarTodos]    Script Date: 03/07/2014 09:15:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Banner_BuscarTodos]

As

Select id
	, nombre
	, imagen = '..\banners\' + imagen
	, activo
	, columna = case upper(columna)
				when 'D' then 'Derecha'
				else 'Izquierda'
				end
From web_Banners



GO

/****** Object:  StoredProcedure [dbo].[web_Banner_BuscarTodosInicio]    Script Date: 03/07/2014 09:15:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Banner_BuscarTodosInicio]

As

Select id
	, nombre
	, imagen = '..\banners\' + imagen
	, activo
	, columna = case upper(columna)
				when 'D' then 'Derecha'
				else 'Izquierda'
				end
	, link
From web_Banners
GO

/****** Object:  StoredProcedure [dbo].[web_Banner_BuscarUno]    Script Date: 03/07/2014 09:15:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Banner_BuscarUno] (@pE_id as int)

As

Select id
	, nombre
	, imagen = '..\banners\' + imagen
	, activo
	, columna
	, link
From web_Banners
where id = @pE_id
GO

/****** Object:  StoredProcedure [dbo].[web_Banner_Modificar]    Script Date: 03/07/2014 09:15:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Banner_Modificar] (@pE_id as int
							, @pE_nombre as varchar(50)
							, @pE_imagen as varchar(100) = ''
							, @pE_activo as bit
							, @pE_columna as varchar(1)
							, @pE_link as varchar(150) = '')

As

if Len(@pE_imagen) > 0
	begin
		update web_Banners
		set	nombre = @pE_nombre
			, imagen = @pE_imagen
			, activo = @pE_activo
			, columna = @pE_columna
			, link = @pE_link
		where id = @pE_id
	end
else
	begin
		update web_Banners
		set	nombre = @pE_nombre
			, activo = @pE_activo
			, columna = @pE_columna
			, link = @pE_link
		where id = @pE_id
	end
GO

/****** Object:  StoredProcedure [dbo].[web_Notificaciones_Alta]    Script Date: 03/07/2014 09:15:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Notificaciones_Alta] (@pE_titulo as varchar(200)
								, @pE_descripcion as text)

As
set nocount on
-- Obtengo el último nro de notificacion
-------------------------------------------
Declare @idNotificacion as numeric(10)

Select @idNotificacion = isnull(max(idnotificacion),0) + 1
From web_notificaciones

-- Hago el insert en Notificaciones para todos los usuarios creados
--------------------------------------------------------------------
Begin Tran

-- insert cabecera
Insert Into web_Notificaciones
	(idNotificacion
	, titulo
	, descripcion
	, dadoDeBaja)
Values (@idNotificacion
	, @pE_titulo
	, @pE_descripcion
	, 0)

-- insert detalle
insert Into web_NotificacionesDetalle
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
from web_UsuariosITSUR

Commit Tran
GO

/****** Object:  StoredProcedure [dbo].[web_Notificaciones_BuscarTodas]    Script Date: 03/07/2014 09:15:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Notificaciones_BuscarTodas]

As

Select idNotificacion
	, titulo
	, descripcion
From web_Notificaciones
Where dadoDeBaja = 0
Order by idNotificacion Desc
GO

/****** Object:  StoredProcedure [dbo].[web_Notificaciones_BuscarXUsuario]    Script Date: 03/07/2014 09:15:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Notificaciones_BuscarXUsuario](@pE_idUsuario as varchar(50))

As

Select ND.idNotificacion
	, N.titulo
	, N.descripcion
	, ND.fechaAlta
	, ND.fechaLeida
From web_notificaciones n
Inner Join web_NotificacionesDetalle ND On (ND.idNotificacion = N.idNotificacion)
where ND.idUsuario = @pE_idUsuario
	and ND.leida = 0
	and N.DadoDeBaja = 0
GO

/****** Object:  StoredProcedure [dbo].[web_Notificaciones_Leida]    Script Date: 03/07/2014 09:15:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Notificaciones_Leida] (@pE_idNotificacion Numeric(10)
								, @pE_idusuario as varchar(50)
								)

As

Update web_notificacionesDetalles
Set leida = 1
	, fechaLeida = getdate()
Where idNotificacion = @pE_idNotificacion
GO

/****** Object:  StoredProcedure [dbo].[web_Usuario_Alta]    Script Date: 03/07/2014 09:15:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Usuario_Alta](@pE_usuario as varchar(50)
						, @pE_password as varchar(50)
						, @pE_activo as bit = 1)

As


Insert Into web_Usuarios
	(usuario, [password], activo)
values
	(@pE_usuario, @pE_password, @pE_activo)
GO

/****** Object:  StoredProcedure [dbo].[web_Usuario_BuscarUno]    Script Date: 03/07/2014 09:15:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Usuario_BuscarUno] (@pE_id as int)

As

Select id
	, usuario
	, [password]
	, activo
From web_Usuarios
where id = @pE_id
GO

/****** Object:  StoredProcedure [dbo].[web_Usuario_Validar]    Script Date: 03/07/2014 09:15:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Usuario_Validar] (@pE_usuario as varchar(50)
							, @pE_password as varchar(50)
							)
As

Select id = isNull(id,0)
	, usuario
	, [password]
	, activo
From web_Usuarios
Where usuario = @pE_usuario
	and [password] = @pE_password
	and activo = 1
GO

/****** Object:  StoredProcedure [dbo].[web_UsuariosITSUR_Alta]    Script Date: 03/07/2014 09:15:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_UsuariosITSUR_Alta] (@pE_idUsuario as varchar(50))

As

If not exists (Select idUsuario From web_UsuariosITSUR Where idUsuario = @pE_idUsuario)
	begin
		Insert Into web_UsuariosITSUR (idUsuario) 
		Values (@pE_idUsuario)
	end
	
GO

/****** Object:  StoredProcedure [dbo].[web_Valores_Alta]    Script Date: 03/19/2014 14:40:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[web_Valores_Alta] (@pE_codeneVerde decimal(10,2) = 0
						, @pE_codeneAmarillo decimal(10,2) = 0
						, @pE_codeneRojo decimal(10,2) = 0
						)

As

Update Valores
set codeneVerde = @pE_codeneVerde
	, codeneAmarillo = @pE_codeneAmarillo
	, codeneRojo = @pE_codeneRojo
where id = 1
GO

/****** Object:  StoredProcedure [dbo].[web_Valores_Buscar]    Script Date: 03/19/2014 14:40:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Valores_Buscar]

As

Select codeneVerde = Convert(decimal(10,0), codeneVerde)
	, codeneAmarillo =  Convert(decimal(10,0), codeneAmarillo)
	, codeneRojo = Convert(decimal(10,0), codeneRojo)
From Valores
Where id = 1
GO

>>>>>>> refs/remotes/origin/mllarin
