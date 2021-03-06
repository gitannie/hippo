USE [hippo]
GO
/****** Object:  Table [dbo].[course]    Script Date: 08/30/2014 20:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[course](
	[id] [varchar](5) NOT NULL,
	[hippodrome] [varchar](50) NULL,
	[date] [date] NULL,
	[distance] [int] NULL,
 CONSTRAINT [PK_course] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[course] ([id], [hippodrome], [date], [distance]) VALUES (N'C07', N'Auteuil', CAST(0xFA380B00 AS Date), 4000)
INSERT [dbo].[course] ([id], [hippodrome], [date], [distance]) VALUES (N'C08', N'Longchamps', CAST(0xFA380B00 AS Date), 4000)
INSERT [dbo].[course] ([id], [hippodrome], [date], [distance]) VALUES (N'CO1', N'Vincennes', CAST(0xF3380B00 AS Date), 2500)
INSERT [dbo].[course] ([id], [hippodrome], [date], [distance]) VALUES (N'CO2', N'Cagnes sur Mer', CAST(0x08390B00 AS Date), 2500)
INSERT [dbo].[course] ([id], [hippodrome], [date], [distance]) VALUES (N'CO3', N'Vincennes', CAST(0x0F390B00 AS Date), 3000)
INSERT [dbo].[course] ([id], [hippodrome], [date], [distance]) VALUES (N'CO4', N'Saint cloud', CAST(0x08390B00 AS Date), 4000)
INSERT [dbo].[course] ([id], [hippodrome], [date], [distance]) VALUES (N'CO5', N'Vincennes', CAST(0xFA380B00 AS Date), 2500)
INSERT [dbo].[course] ([id], [hippodrome], [date], [distance]) VALUES (N'CO6', N'Auteuil', CAST(0xFA380B00 AS Date), 2500)
/****** Object:  Table [dbo].[cheval]    Script Date: 08/30/2014 20:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cheval](
	[id] [varchar](5) NOT NULL,
	[nomche] [varchar](50) NULL,
	[datenais] [date] NULL,
	[sexe] [varchar](1) NULL,
	[nomproprio] [varchar](50) NULL,
	[nbgains] [int] NULL,
 CONSTRAINT [PK_cheval] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[cheval] ([id], [nomche], [datenais], [sexe], [nomproprio], [nbgains]) VALUES (N'C1', N'Bricassard', CAST(0x74320B00 AS Date), N'm', N'Joe', 0)
INSERT [dbo].[cheval] ([id], [nomche], [datenais], [sexe], [nomproprio], [nbgains]) VALUES (N'C2', N'Vabellino', CAST(0x5E320B00 AS Date), N'm', N'Raffin', NULL)
INSERT [dbo].[cheval] ([id], [nomche], [datenais], [sexe], [nomproprio], [nbgains]) VALUES (N'C3', N'Victoire', CAST(0x36340B00 AS Date), N'f', N'Dupont', NULL)
INSERT [dbo].[cheval] ([id], [nomche], [datenais], [sexe], [nomproprio], [nbgains]) VALUES (N'C4', N'Very Nice', CAST(0x28310B00 AS Date), N'f', N'Brun', NULL)
INSERT [dbo].[cheval] ([id], [nomche], [datenais], [sexe], [nomproprio], [nbgains]) VALUES (N'C5', N'Vulcain de Vandel', CAST(0x2A310B00 AS Date), N'm', N'Cohen', NULL)
INSERT [dbo].[cheval] ([id], [nomche], [datenais], [sexe], [nomproprio], [nbgains]) VALUES (N'C6', N'Vicking de Val', CAST(0x34310B00 AS Date), N'm', N'Lambertz', NULL)
/****** Object:  Table [dbo].[participe]    Script Date: 08/30/2014 20:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[participe](
	[idche] [varchar](5) NOT NULL,
	[idcourse] [varchar](5) NOT NULL,
	[driver] [varchar](50) NULL,
	[place] [smallint] NULL,
 CONSTRAINT [PK_participe] PRIMARY KEY CLUSTERED 
(
	[idche] ASC,
	[idcourse] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[participe] ([idche], [idcourse], [driver], [place]) VALUES (N'C1', N'C07', N'Wield', NULL)
INSERT [dbo].[participe] ([idche], [idcourse], [driver], [place]) VALUES (N'C2', N'CO1', N'Meunier', NULL)
INSERT [dbo].[participe] ([idche], [idcourse], [driver], [place]) VALUES (N'C3', N'C07', N'Decaudin', NULL)
INSERT [dbo].[participe] ([idche], [idcourse], [driver], [place]) VALUES (N'C3', N'CO1', N'Decaudin', NULL)
INSERT [dbo].[participe] ([idche], [idcourse], [driver], [place]) VALUES (N'C4', N'C07', N'Durand', NULL)
INSERT [dbo].[participe] ([idche], [idcourse], [driver], [place]) VALUES (N'C5', N'C07', N'Edouardo', NULL)
INSERT [dbo].[participe] ([idche], [idcourse], [driver], [place]) VALUES (N'C6', N'C07', N'Torres', NULL)
/****** Object:  ForeignKey [FK_participe_cheval]    Script Date: 08/30/2014 20:18:25 ******/
ALTER TABLE [dbo].[participe]  WITH CHECK ADD  CONSTRAINT [FK_participe_cheval] FOREIGN KEY([idche])
REFERENCES [dbo].[cheval] ([id])
GO
ALTER TABLE [dbo].[participe] CHECK CONSTRAINT [FK_participe_cheval]
GO
/****** Object:  ForeignKey [FK_participe_course]    Script Date: 08/30/2014 20:18:25 ******/
ALTER TABLE [dbo].[participe]  WITH CHECK ADD  CONSTRAINT [FK_participe_course] FOREIGN KEY([idcourse])
REFERENCES [dbo].[course] ([id])
GO
ALTER TABLE [dbo].[participe] CHECK CONSTRAINT [FK_participe_course]
GO
