alter Proc [dbo].[web_Novedad_Modificar] (@pE_id as int
							, @pE_titulo as varchar(50)
							, @pE_imagen as varchar(100) = ''
							, @pE_cuerpo as varchar(max) = '')

As

if Len(@pE_imagen) > 0
	begin
		update web_Novedades
		set	titulo = @pE_titulo
			, imagen = @pE_imagen
			, cuerpo = @pE_cuerpo
		where id = @pE_id
	end
else
	begin
		update web_Novedades
		set	titulo = @pE_titulo
			, cuerpo = @pE_cuerpo
		where id = @pE_id
	end