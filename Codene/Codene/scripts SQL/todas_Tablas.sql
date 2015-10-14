<<<<<<< HEAD
USE [Codene]
GO

/****** Object:  Table [dbo].[web_Banners]    Script Date: 03/07/2014 09:15:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[web_Novedades](
	[id] [int] NOT NULL,
	[titulo] [nvarchar](50) NOT NULL,
	[imagen] [nvarchar](50) NULL,
	[cuerpo] [nvarchar](500) NULL,
 CONSTRAINT [PK_web.Novedades] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[web_Banners](
	[id] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[imagen] [varchar](100) NOT NULL,
	[activo] [bit] NOT NULL,
	[columna] [varchar](1) NULL,
	[link] [varchar](150) NULL,
 CONSTRAINT [PK_Banners] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [Codene]
GO

/****** Object:  Table [dbo].[web_Notificaciones]    Script Date: 03/07/2014 09:15:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[web_Notificaciones](
	[idNotificacion] [numeric](10, 0) NOT NULL,
	[titulo] [varchar](200) NOT NULL,
	[descripcion] [text] NOT NULL,
	[dadoDeBaja] [bit] NOT NULL,
 CONSTRAINT [PK_Notificaciones] PRIMARY KEY CLUSTERED 
(
	[idNotificacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [Codene]
GO

/****** Object:  Table [dbo].[web_NotificacionesDetalle]    Script Date: 03/07/2014 09:15:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[web_NotificacionesDetalle](
	[idNotificacion] [numeric](10, 0) NOT NULL,
	[idUsuario] [varchar](50) NOT NULL,
	[leida] [bit] NOT NULL,
	[fechaAlta] [date] NOT NULL,
	[fechaLeida] [date] NULL,
 CONSTRAINT [PK_NotificacionesDetalle] PRIMARY KEY CLUSTERED 
(
	[idNotificacion] ASC,
	[idUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [Codene]
GO

/****** Object:  Table [dbo].[web_Usuarios]    Script Date: 03/07/2014 09:15:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[web_Usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [Codene]
GO

/****** Object:  Table [dbo].[web_UsuariosITSUR]    Script Date: 03/07/2014 09:15:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[web_UsuariosITSUR](
	[idUsuario] [varchar](50) NOT NULL,
	[fechaAlta] [date] NULL,
 CONSTRAINT [PK_UsuariosITSUR] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[web_Notificaciones] ADD  CONSTRAINT [DF_Notificaciones_dadoDeBaja]  DEFAULT ((0)) FOR [dadoDeBaja]
GO

ALTER TABLE [dbo].[web_NotificacionesDetalle]  WITH CHECK ADD  CONSTRAINT [FK_NotificacionesDetalle_Notificaciones] FOREIGN KEY([idNotificacion])
REFERENCES [dbo].[web_Notificaciones] ([idNotificacion])
GO

ALTER TABLE [dbo].[web_NotificacionesDetalle] CHECK CONSTRAINT [FK_NotificacionesDetalle_Notificaciones]
GO

ALTER TABLE [dbo].[web_NotificacionesDetalle]  WITH CHECK ADD  CONSTRAINT [FK_NotificacionesDetalle_UsuariosITSUR] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[web_UsuariosITSUR] ([idUsuario])
GO

ALTER TABLE [dbo].[web_NotificacionesDetalle] CHECK CONSTRAINT [FK_NotificacionesDetalle_UsuariosITSUR]
GO

ALTER TABLE [dbo].[web_NotificacionesDetalle] ADD  CONSTRAINT [DF_NotificacionesDetalle_leida]  DEFAULT ((0)) FOR [leida]
GO

ALTER TABLE [dbo].[web_NotificacionesDetalle] ADD  CONSTRAINT [DF_NotificacionesDetalle_fechaAlta]  DEFAULT (getdate()) FOR [fechaAlta]
GO

ALTER TABLE [dbo].[web_UsuariosITSUR] ADD  CONSTRAINT [DF_UsuariosITSUR_fechaAlta]  DEFAULT (getdate()) FOR [fechaAlta]
GO

/****** Object:  Table [dbo].[Valores]    Script Date: 03/19/2014 14:38:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Valores](
	[id] [int] NOT NULL,
	[codeneVerde] [decimal](10, 2) NULL,
	[codeneAmarillo] [decimal](10, 2) NULL,
	[codeneRojo] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Valores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

=======
USE [Codene]
GO

/****** Object:  Table [dbo].[web_Banners]    Script Date: 03/07/2014 09:15:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[web_Banners](
	[id] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[imagen] [varchar](100) NOT NULL,
	[activo] [bit] NOT NULL,
	[columna] [varchar](1) NULL,
	[link] [varchar](150) NULL,
 CONSTRAINT [PK_Banners] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [Codene]
GO

/****** Object:  Table [dbo].[web_Notificaciones]    Script Date: 03/07/2014 09:15:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[web_Notificaciones](
	[idNotificacion] [numeric](10, 0) NOT NULL,
	[titulo] [varchar](200) NOT NULL,
	[descripcion] [text] NOT NULL,
	[dadoDeBaja] [bit] NOT NULL,
 CONSTRAINT [PK_Notificaciones] PRIMARY KEY CLUSTERED 
(
	[idNotificacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [Codene]
GO

/****** Object:  Table [dbo].[web_NotificacionesDetalle]    Script Date: 03/07/2014 09:15:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[web_NotificacionesDetalle](
	[idNotificacion] [numeric](10, 0) NOT NULL,
	[idUsuario] [varchar](50) NOT NULL,
	[leida] [bit] NOT NULL,
	[fechaAlta] [date] NOT NULL,
	[fechaLeida] [date] NULL,
 CONSTRAINT [PK_NotificacionesDetalle] PRIMARY KEY CLUSTERED 
(
	[idNotificacion] ASC,
	[idUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [Codene]
GO

/****** Object:  Table [dbo].[web_Usuarios]    Script Date: 03/07/2014 09:15:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[web_Usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [Codene]
GO

/****** Object:  Table [dbo].[web_UsuariosITSUR]    Script Date: 03/07/2014 09:15:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[web_UsuariosITSUR](
	[idUsuario] [varchar](50) NOT NULL,
	[fechaAlta] [date] NULL,
 CONSTRAINT [PK_UsuariosITSUR] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[web_Notificaciones] ADD  CONSTRAINT [DF_Notificaciones_dadoDeBaja]  DEFAULT ((0)) FOR [dadoDeBaja]
GO

ALTER TABLE [dbo].[web_NotificacionesDetalle]  WITH CHECK ADD  CONSTRAINT [FK_NotificacionesDetalle_Notificaciones] FOREIGN KEY([idNotificacion])
REFERENCES [dbo].[web_Notificaciones] ([idNotificacion])
GO

ALTER TABLE [dbo].[web_NotificacionesDetalle] CHECK CONSTRAINT [FK_NotificacionesDetalle_Notificaciones]
GO

ALTER TABLE [dbo].[web_NotificacionesDetalle]  WITH CHECK ADD  CONSTRAINT [FK_NotificacionesDetalle_UsuariosITSUR] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[web_UsuariosITSUR] ([idUsuario])
GO

ALTER TABLE [dbo].[web_NotificacionesDetalle] CHECK CONSTRAINT [FK_NotificacionesDetalle_UsuariosITSUR]
GO

ALTER TABLE [dbo].[web_NotificacionesDetalle] ADD  CONSTRAINT [DF_NotificacionesDetalle_leida]  DEFAULT ((0)) FOR [leida]
GO

ALTER TABLE [dbo].[web_NotificacionesDetalle] ADD  CONSTRAINT [DF_NotificacionesDetalle_fechaAlta]  DEFAULT (getdate()) FOR [fechaAlta]
GO

ALTER TABLE [dbo].[web_UsuariosITSUR] ADD  CONSTRAINT [DF_UsuariosITSUR_fechaAlta]  DEFAULT (getdate()) FOR [fechaAlta]
GO

/****** Object:  Table [dbo].[Valores]    Script Date: 03/19/2014 14:38:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Valores](
	[id] [int] NOT NULL,
	[codeneVerde] [decimal](10, 2) NULL,
	[codeneAmarillo] [decimal](10, 2) NULL,
	[codeneRojo] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Valores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

>>>>>>> refs/remotes/origin/mllarin
Insert Into Valores (id, codeneVerde, codeneAmarillo, codeneRojo) values (1, 52, 56, 0)