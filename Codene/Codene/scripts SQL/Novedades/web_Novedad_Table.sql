USE [Codene]
GO

/****** Object:  Table [dbo].[web_Novedades]    Script Date: 10/04/2015 00:25:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[web_Novedades](
	[id] [int] NOT NULL,
	[titulo] [nvarchar](50) NOT NULL,
	[imagen] [nvarchar](50) NULL,
	[cuerpo] [nvarchar](500) NULL,
	[activo] [int] NOT NULL,
 CONSTRAINT [PK_web.Novedades] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[web_Novedades] ADD  CONSTRAINT [DF_web_Novedades_activo]  DEFAULT ((1)) FOR [activo]
GO


