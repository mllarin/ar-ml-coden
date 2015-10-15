
CREATE Proc [dbo].[web_Novedad_BuscarUno] (@pE_id as int)

As

Select id
	, titulo
	, imagen = '..\Novedades\' + imagen
	, cuerpo
From web_Novedades
where id = @pE_id and
		[activo] = '1'