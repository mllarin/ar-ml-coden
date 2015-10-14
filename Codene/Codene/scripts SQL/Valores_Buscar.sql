<<<<<<< HEAD
Alter Proc Valores_Buscar

As

Select codeneVerde = Convert(decimal(10,0), codeneVerde)
	, codeneAmarillo =  Convert(decimal(10,0), codeneAmarillo)
	, codeneRojo = Convert(decimal(10,0), codeneRojo)
From Valores
=======
Alter Proc Valores_Buscar

As

Select codeneVerde = Convert(decimal(10,0), codeneVerde)
	, codeneAmarillo =  Convert(decimal(10,0), codeneAmarillo)
	, codeneRojo = Convert(decimal(10,0), codeneRojo)
From Valores
>>>>>>> refs/remotes/origin/mllarin
Where id = 1