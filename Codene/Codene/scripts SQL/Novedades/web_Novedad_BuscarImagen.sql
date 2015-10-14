
CREATE Proc [dbo].[web_Novedad_BuscarImagen] (@pE_Imagen varchar(100))

As

If Exists( Select imagen
			From web_Novedades
			where Lower(imagen) = Lower(@pE_Imagen)
				And activo = 1
			)
			select resultado = 'true';
else
			select resultado = 'false';


