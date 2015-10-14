
CREATE Proc [dbo].[web_Prensa_BuscarTodosInicio]

As

Select id
	, titulo
	, documento = '..\Prensa\' + documento
From web_Prensa
where [activo]='1'
GO

