USE [Codene]
GO

/****** Object:  Table [dbo].[web_Prensa]    Script Date: 09/29/2015 20:32:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[web_Prensa](
	[id] [int] NOT NULL,
	[titulo] [varchar](50) NOT NULL,
	[documento] [varchar](150) NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_web_Prensa] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[web_Prensa] ADD  CONSTRAINT [DF_web_Prensa_activo]  DEFAULT ((1)) FOR [activo]
GO

