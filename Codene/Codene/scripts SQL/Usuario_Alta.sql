CREATE Proc [dbo].[Usuario_Alta](@pE_usuario as varchar(50)
						, @pE_password as varchar(50)
						, @pE_activo as bit = 1)

As


Insert Into Usuarios
	(usuario, [password], activo)
values
	(@pE_usuario, @pE_password, @pE_activo)
GO


