<<<<<<< HEAD
Create Proc [dbo].[UsuariosITSUR_Alta] (@pE_idUsuario as varchar(50))

As

If not exists (Select idUsuario From UsuariosITSUR Where idUsuario = @pE_idUsuario)
	begin
		Insert Into UsuariosITSUR (idUsuario) 
		Values (@pE_idUsuario)
	end
	
GO


=======
Create Proc [dbo].[UsuariosITSUR_Alta] (@pE_idUsuario as varchar(50))

As

If not exists (Select idUsuario From UsuariosITSUR Where idUsuario = @pE_idUsuario)
	begin
		Insert Into UsuariosITSUR (idUsuario) 
		Values (@pE_idUsuario)
	end
	
GO


>>>>>>> refs/remotes/origin/mllarin
