<<<<<<< HEAD
USE [Codene]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[web_Prensa_Alta](@pE_titulo as varchar(50)
						, @pE_documento as varchar(150))

As


-- Obtengo el ultimo id + 1
Declare @id as int;

Select @id = isnull(max(id), 0) +1
From web_Prensa

Insert Into web_Prensa
	(id, titulo, documento)
values
	(@id, @pE_titulo, @pE_documento)

Select @id
GO


=======
CREATE Proc [dbo].[web_Prensa_Alta](@pE_titulo as varchar(50)
						, @pE_documento as varchar(150))

As

-- Obtengo el ultimo id + 1
Declare @id as int;

Select @id = isnull(max(id), 0) +1
From web_Prensa

Insert Into web_Prensa
	(id, titulo, documento)
values
	(@id, @pE_titulo, @pE_documento)

Select @id
GO


>>>>>>> refs/remotes/origin/mllarin
