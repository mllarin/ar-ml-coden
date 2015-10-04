USE [Codene]
GO

/****** Object:  StoredProcedure [dbo].[web_Prensa_BuscarTodos]    Script Date: 09/29/2015 22:06:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Prensa_BuscarTodos]

As

Select id
	, titulo
	, documento = '..\Prensa\' + documento
	
From web_Prensa
where [activo]='1'



GO


