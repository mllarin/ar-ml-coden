ALTER Proc [dbo].[Banner_Alta](@pE_nombre as varchar(50)
						, @pE_imagen as varchar(100)
						, @pE_activo as bit = 1
						, @pE_columna as varchar(1)
						, @pE_link as varchar(150) = '')

As


-- Obtengo el ultimo id + 1
Declare @id as int;

Select @id = isnull(max(id), 0) +1
From banners

Insert Into Banners 
	(id, nombre, imagen, activo, columna, link)
values
	(@id, @pE_nombre, @pE_imagen, @pE_activo, @pE_columna, @pE_link)

Select @id