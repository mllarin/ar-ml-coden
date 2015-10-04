USE [Codene]
GO
/****** Object:  StoredProcedure [dbo].[Novedades_BuscarImagen]    Script Date: 09/21/2015 13:47:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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


