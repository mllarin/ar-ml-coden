USE [Codene]
GO
/****** Object:  StoredProcedure [dbo].[Novedades_BuscarTodosInicio]    Script Date: 09/21/2015 13:47:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[web_Novedad_BuscarTodosInicio]

As

Select id
	, titulo
	, imagen = '..\Novedades\' + imagen
	, cuerpo
From web_Novedades
where [activo] = '1'