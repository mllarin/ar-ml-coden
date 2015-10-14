ALTER Proc [dbo].[Banner_BuscarTodosInicio]

As

Select id
	, nombre
	, imagen = '..\banners\' + imagen
	, activo
	, columna = case upper(columna)
				when 'D' then 'Derecha'
				else 'Izquierda'
				end
	, link
From Banners