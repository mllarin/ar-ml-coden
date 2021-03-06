USE [Codene]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[web_Prensa_Modificar] (@pE_id as int
							, @pE_titulo as varchar(50)
							, @pE_documento as varchar(100) = '')

As

if Len(@pE_documento) > 0
	begin
		update web_Prensa
		set	titulo = @pE_titulo
			, documento = @pE_documento
		where id = @pE_id
	end
else
	begin
		update web_Prensa
		set	titulo = @pE_titulo
		where id = @pE_id
	end