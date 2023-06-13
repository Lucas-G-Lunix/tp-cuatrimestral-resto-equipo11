USE [RESTO_DB]
GO
/****** Object:  Table [dbo].[MESAS]    Script Date: 6/13/2023 2:28:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MESAS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numeroMesa] [int] NULL,
	[idMesero] [int] NULL,
	[idPedido] [int] NULL,
 CONSTRAINT [PK_MESAS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PEDIDOS]    Script Date: 6/13/2023 2:28:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PEDIDOS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombreCliente] [varchar](50) NULL,
 CONSTRAINT [PK_PEDIDOS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PLATOS]    Script Date: 6/13/2023 2:28:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PLATOS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[tipo] [varchar](50) NULL,
 CONSTRAINT [PK_Platos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 6/13/2023 2:28:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NULL,
	[pass] [varchar](50) NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[fechaNacimiento] [smalldatetime] NULL,
	[rolAdmin] [bit] NULL,
	[profileImage] [varchar](50) NULL,
 CONSTRAINT [PK_USERS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MESAS] ON 

INSERT [dbo].[MESAS] ([id], [numeroMesa], [idMesero], [idPedido]) VALUES (1, 1, NULL, NULL)
INSERT [dbo].[MESAS] ([id], [numeroMesa], [idMesero], [idPedido]) VALUES (2, 2, NULL, NULL)
INSERT [dbo].[MESAS] ([id], [numeroMesa], [idMesero], [idPedido]) VALUES (3, 3, NULL, NULL)
INSERT [dbo].[MESAS] ([id], [numeroMesa], [idMesero], [idPedido]) VALUES (4, 4, NULL, NULL)
INSERT [dbo].[MESAS] ([id], [numeroMesa], [idMesero], [idPedido]) VALUES (5, 5, NULL, NULL)
INSERT [dbo].[MESAS] ([id], [numeroMesa], [idMesero], [idPedido]) VALUES (6, 6, NULL, NULL)
INSERT [dbo].[MESAS] ([id], [numeroMesa], [idMesero], [idPedido]) VALUES (7, 7, NULL, NULL)
INSERT [dbo].[MESAS] ([id], [numeroMesa], [idMesero], [idPedido]) VALUES (8, 8, NULL, NULL)
INSERT [dbo].[MESAS] ([id], [numeroMesa], [idMesero], [idPedido]) VALUES (9, 9, NULL, NULL)
INSERT [dbo].[MESAS] ([id], [numeroMesa], [idMesero], [idPedido]) VALUES (10, 10, NULL, NULL)
SET IDENTITY_INSERT [dbo].[MESAS] OFF
GO
SET IDENTITY_INSERT [dbo].[PLATOS] ON 

INSERT [dbo].[PLATOS] ([Id], [nombre], [tipo]) VALUES (1, N'Hamburguesa clásica', N'Carnes')
INSERT [dbo].[PLATOS] ([Id], [nombre], [tipo]) VALUES (2, N'Sushi de salmón', N'Pescados y mariscos')
INSERT [dbo].[PLATOS] ([Id], [nombre], [tipo]) VALUES (3, N'Lasagna de carne', N'Pastas')
INSERT [dbo].[PLATOS] ([Id], [nombre], [tipo]) VALUES (4, N'Ensalada César', N'Ensaladas')
INSERT [dbo].[PLATOS] ([Id], [nombre], [tipo]) VALUES (5, N'Pizza margarita', N'Pizzas')
INSERT [dbo].[PLATOS] ([Id], [nombre], [tipo]) VALUES (6, N'Pollo a la parrilla', N'Carnes')
INSERT [dbo].[PLATOS] ([Id], [nombre], [tipo]) VALUES (7, N'Ceviche de camarón', N'Pescados y mariscos')
INSERT [dbo].[PLATOS] ([Id], [nombre], [tipo]) VALUES (8, N'Spaghetti a la bolognesa', N'Pastas')
INSERT [dbo].[PLATOS] ([Id], [nombre], [tipo]) VALUES (9, N'Ensalada griega', N'Ensaladas')
INSERT [dbo].[PLATOS] ([Id], [nombre], [tipo]) VALUES (10, N'Pizza hawaiana', N'Pizzas')
INSERT [dbo].[PLATOS] ([Id], [nombre], [tipo]) VALUES (11, N'Tacos al pastor', N'Carnes')
INSERT [dbo].[PLATOS] ([Id], [nombre], [tipo]) VALUES (12, N'Salmón a la plancha', N'Pescados y mariscos')
INSERT [dbo].[PLATOS] ([Id], [nombre], [tipo]) VALUES (13, N'Risotto de champiñones', N'Pastas')
INSERT [dbo].[PLATOS] ([Id], [nombre], [tipo]) VALUES (14, N'Ensalada de quinoa', N'Ensaladas')
INSERT [dbo].[PLATOS] ([Id], [nombre], [tipo]) VALUES (15, N'Pizza vegetariana', N'Pizzas')
INSERT [dbo].[PLATOS] ([Id], [nombre], [tipo]) VALUES (16, N'Camarones al ajillo', N'Pescados y mariscos')
INSERT [dbo].[PLATOS] ([Id], [nombre], [tipo]) VALUES (17, N'Fettuccine Alfredo', N'Pastas')
INSERT [dbo].[PLATOS] ([Id], [nombre], [tipo]) VALUES (18, N'Ensalada de pollo', N'Ensaladas')
INSERT [dbo].[PLATOS] ([Id], [nombre], [tipo]) VALUES (19, N'Pizza de pepperoni', N'Pizzas')
INSERT [dbo].[PLATOS] ([Id], [nombre], [tipo]) VALUES (20, N'Churrasco con chimichurri', N'Carnes')
INSERT [dbo].[PLATOS] ([Id], [nombre], [tipo]) VALUES (21, N'Pulpo a la gallega', N'Pescados y mariscos')
INSERT [dbo].[PLATOS] ([Id], [nombre], [tipo]) VALUES (22, N'Gnocchi con salsa pesto', N'Pastas')
INSERT [dbo].[PLATOS] ([Id], [nombre], [tipo]) VALUES (23, N'Ensalada caprese', N'Ensaladas')
INSERT [dbo].[PLATOS] ([Id], [nombre], [tipo]) VALUES (24, N'Pizza cuatro quesos', N'Pizzas')
INSERT [dbo].[PLATOS] ([Id], [nombre], [tipo]) VALUES (25, N'Chuletas de cerdo a la BBQ', N'Carnes')
INSERT [dbo].[PLATOS] ([Id], [nombre], [tipo]) VALUES (26, N'Ceviche de pescado', N'Pescados y mariscos')
INSERT [dbo].[PLATOS] ([Id], [nombre], [tipo]) VALUES (27, N'Raviolis rellenos de espinacas', N'Pastas')
INSERT [dbo].[PLATOS] ([Id], [nombre], [tipo]) VALUES (28, N'Ensalada de frutas', N'Ensaladas')
INSERT [dbo].[PLATOS] ([Id], [nombre], [tipo]) VALUES (29, N'Pizza de hongos', N'Pizzas')
SET IDENTITY_INSERT [dbo].[PLATOS] OFF
GO
SET IDENTITY_INSERT [dbo].[USERS] ON 

INSERT [dbo].[USERS] ([id], [email], [pass], [nombre], [apellido], [fechaNacimiento], [rolAdmin], [profileImage]) VALUES (1, N'gerente@resto.com', N'gerentepass', N'Gerente', N'Resto', CAST(N'1980-01-01T00:00:00' AS SmallDateTime), 1, NULL)
INSERT [dbo].[USERS] ([id], [email], [pass], [nombre], [apellido], [fechaNacimiento], [rolAdmin], [profileImage]) VALUES (2, N'mesero@resto.com', N'meseropass', N'Mesero', N'Resto', CAST(N'1988-10-22T00:00:00' AS SmallDateTime), 0, NULL)
SET IDENTITY_INSERT [dbo].[USERS] OFF
GO
ALTER TABLE [dbo].[MESAS]  WITH CHECK ADD  CONSTRAINT [FK_MESAS_PEDIDOS] FOREIGN KEY([idPedido])
REFERENCES [dbo].[PEDIDOS] ([id])
GO
ALTER TABLE [dbo].[MESAS] CHECK CONSTRAINT [FK_MESAS_PEDIDOS]
GO
ALTER TABLE [dbo].[MESAS]  WITH CHECK ADD  CONSTRAINT [FK_MESAS_USERS] FOREIGN KEY([idMesero])
REFERENCES [dbo].[USERS] ([id])
GO
ALTER TABLE [dbo].[MESAS] CHECK CONSTRAINT [FK_MESAS_USERS]
GO
