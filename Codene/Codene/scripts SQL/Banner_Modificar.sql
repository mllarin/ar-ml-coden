ALTER Proc [dbo].[Banner_Modificar] (@pE_id as int
							, @pE_nombre as varchar(50)
							, @pE_imagen as varchar(100) = ''
							, @pE_activo as bit
							, @pE_columna as varchar(1)
							, @pE_link as varchar(150) = '')

As

if Len(@pE_imagen) > 0
	begin
		update Banners
		set	nombre = @pE_nombre
			, imagen = @pE_imagen
			, activo = @pE_activo
			, columna = @pE_columna
			, link = @pE_link
		where id = @pE_id
	end
else
	begin
		update Banners
		set	nombre = @pE_nombre
			, activo = @pE_activo
			, columna = @pE_columna
			, link = @pE_link
		where id = @pE_id
	end