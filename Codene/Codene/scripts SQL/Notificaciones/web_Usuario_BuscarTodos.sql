USE [Codene]
GO
/****** Object:  StoredProcedure [dbo].[web_Novedad_BuscarTodos]    Script Date: 11/17/2015 18:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[web_Usuario_BuscarTodos]

As

Select id
      ,usuario
      ,password
      
From web_Usuario
where [activo] = '1'


