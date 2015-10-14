<<<<<<< HEAD
USE [Codene]
GO

/****** Object:  StoredProcedure [dbo].[web_Prensa_BuscarTodosInicio]    Script Date: 09/29/2015 22:08:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Prensa_BuscarTodosInicio]

As

Select id
	, titulo
	, documento = '..\Prensa\' + documento
From web_Prensa
where [activo]='1'
GO

=======

CREATE Proc [dbo].[web_Prensa_BuscarTodosInicio]

As

Select id
	, titulo
	, documento = '..\Prensa\' + documento
From web_Prensa
where [activo]='1'
GO

>>>>>>> refs/remotes/origin/mllarin
