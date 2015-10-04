USE [Codene]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[web_Prensa_BuscarDocumento] (@pE_Documento varchar(150))

As

If Exists( Select documento
			From web_Prensa
			where Lower(documento) = Lower(@pE_Documento)
				And activo = 1
			)
			select resultado = 'true';
else
			select resultado = 'false';


