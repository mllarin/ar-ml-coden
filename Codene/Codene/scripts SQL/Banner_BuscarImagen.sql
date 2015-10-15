CREATE Proc [dbo].[Banner_BuscarImagen] (@pE_Imagen varchar(100))

As

If Exists( Select imagen
			From Banners
			where Lower(imagen) = Lower(@pE_Imagen)
				And activo = 1
			)
			select resultado = 'true';
else
			select resultado = 'false';


GO


