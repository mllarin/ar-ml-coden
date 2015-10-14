CREATE Proc [dbo].[Banner_BuscarTodos]

As

Select id
	, nombre
	, imagen = '..\banners\' + imagen
	, activo
	, columna = case upper(columna)
				when 'D' then 'Derecha'
				else 'Izquierda'
				end
From Banners


GO


