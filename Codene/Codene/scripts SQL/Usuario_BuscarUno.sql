Create Proc [dbo].[Usuario_BuscarUno] (@pE_id as int)

As

Select id
	, usuario
	, [password]
	, activo
From Usuarios
where id = @pE_id
GO


