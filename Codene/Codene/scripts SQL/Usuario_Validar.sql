<<<<<<< HEAD
CREATE Proc [dbo].[Usuario_Validar] (@pE_usuario as varchar(50)
							, @pE_password as varchar(50)
							)
As

Select id = isNull(id,0)
	, usuario
	, [password]
	, activo
From Usuarios
Where usuario = @pE_usuario
	and [password] = @pE_password
	and activo = 1
GO


=======
CREATE Proc [dbo].[Usuario_Validar] (@pE_usuario as varchar(50)
							, @pE_password as varchar(50)
							)
As

Select id = isNull(id,0)
	, usuario
	, [password]
	, activo
From Usuarios
Where usuario = @pE_usuario
	and [password] = @pE_password
	and activo = 1
GO


>>>>>>> refs/remotes/origin/mllarin
