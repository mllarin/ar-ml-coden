USE [Codene]
GO

/****** Object:  StoredProcedure [dbo].[Novedades_Alta]    Script Date: 09/21/2015 13:45:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Novedad_Alta](@pE_titulo as varchar(50)
						, @pE_imagen as varchar(100)
						, @pE_cuerpo as varchar(500) = '')

As


-- Obtengo el ultimo id + 1
Declare @id as int;

Select @id = isnull(max(id), 0) +1
From web_Novedades

Insert Into web_Novedades
	(id, titulo, imagen, cuerpo)
values
	(@id, @pE_titulo, @pE_imagen, @pE_cuerpo)

Select @id
GO


