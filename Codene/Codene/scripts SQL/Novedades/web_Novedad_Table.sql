create TABLE [dbo].[web_Novedades](
	[id] [int] NOT NULL,
	[titulo] [nvarchar](50) NOT NULL,
	[imagen] [nvarchar](50) NULL,
	[cuerpo] [varchar](max) NULL,
	[activo] [int] NOT NULL,
 CONSTRAINT [PK_web.Novedades] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[web_Novedades] ADD  CONSTRAINT [DF_web_Novedades_activo]  DEFAULT ((1)) FOR [activo]
GO


