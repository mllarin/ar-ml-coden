ALTER Proc [dbo].[Banner_BuscarUno] (@pE_id as int)

As

Select id
	, nombre
	, imagen = '..\banners\' + imagen
	, activo
	, columna
	, link
From Banners
where id = @pE_id