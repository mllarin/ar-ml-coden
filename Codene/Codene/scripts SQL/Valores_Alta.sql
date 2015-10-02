Create Proc Valores_Alta (@pE_codeneVerde decimal(10,2) = 0
						, @pE_codeneAmarillo decimal(10,2) = 0
						, @pE_codeneRojo decimal(10,2) = 0
						)

As

Update Valores
set codeneVerde = @pE_codeneVerde
	, codeneAmarillo = @pE_codeneAmarillo
	, codeneRojo = @pE_codeneRojo
where id = 1