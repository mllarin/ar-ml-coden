
CREATE Proc [dbo].[web_Novedad_Eliminar] (@pE_id as int)

As

UPDATE [web_Novedades]
SET
	activo = 0
WHERE
	id = @pE_id