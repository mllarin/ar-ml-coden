USE [Codene]
GO
/****** Object:  StoredProcedure [dbo].[Novedades_Modificar]    Script Date: 09/21/2015 13:48:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[web_Novedad_Modificar] (@pE_id as int
							, @pE_titulo as varchar(50)
							, @pE_imagen as varchar(100) = ''
							, @pE_cuerpo as varchar(500) = '')

As

if Len(@pE_imagen) > 0
	begin
		update web_Novedad
		set	titulo = @pE_titulo
			, imagen = @pE_imagen
			, cuerpo = @pE_cuerpo
		where id = @pE_id
	end
else
	begin
		update web_Novedad
		set	titulo = @pE_titulo
			, cuerpo = @pE_cuerpo
		where id = @pE_id
	end