USE [Codene]
GO

/****** Object:  StoredProcedure [dbo].[web_Prensa_BuscarUno]    Script Date: 09/29/2015 22:12:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Prensa_BuscarUno] (@pE_id as int)

As

Select id
	, titulo
	, documento = '..\Prensa\' + documento
	
From web_Prensa
where id = @pE_id and [activo] = '1'
GO

