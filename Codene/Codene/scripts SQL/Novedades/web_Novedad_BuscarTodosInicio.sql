
Create Proc [dbo].[web_Novedad_BuscarTodosInicio]

As

Select id
	, titulo
	, imagen = '..\Novedades\' + imagen
	, cuerpo
From web_Novedades
where activo = 1