
CREATE Proc [dbo].[web_Prensa_BuscarUno] (@pE_id as int)

As

Select id
	, titulo
	, documento = '..\Prensa\' + documento
	
From web_Prensa
where id = @pE_id and [activo] = '1'
GO

