USE [Codene]
GO
/****** Object:  StoredProcedure [dbo].[web_Notificaciones_Leida]    Script Date: 11/14/2015 17:51:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Notificaciones_ModificarTitulo] (@pE_idNotificacion Numeric(10)
								, @pE_idusuario as varchar(50) , @pE_texto as varchar(450)
								)

As

Update web_notificaciones
Set titulo = @pE_texto
	
Where idNotificacion = @pE_idNotificacion
