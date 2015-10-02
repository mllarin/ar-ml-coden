USE [Codene]
GO
/****** Object:  StoredProcedure [dbo].[Novedades_BuscarUno]    Script Date: 09/21/2015 13:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[web_Novedad_BuscarUno] (@pE_id as int)

As

Select id
	, titulo
	, imagen = '..\Novedades\' + imagen
	, cuerpo
From web_Novedades
where id = @pE_id and
		[activo] = '1'