USE [Codene]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Alter Proc [dbo].[web_Prensa_Eliminar] (@pE_id as int)

As

UPDATE [web_Prensa]
SET
	[activo] = '0'
WHERE
	[id] = @pE_id