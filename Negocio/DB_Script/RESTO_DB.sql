USE [master]
GO
/****** Object:  Database [RESTO_DB]    Script Date: 6/23/2023 4:34:16 PM ******/
CREATE DATABASE [RESTO_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RESTO_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\RESTO_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RESTO_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\RESTO_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [RESTO_DB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RESTO_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RESTO_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RESTO_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RESTO_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RESTO_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RESTO_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [RESTO_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RESTO_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RESTO_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RESTO_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RESTO_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RESTO_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RESTO_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RESTO_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RESTO_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RESTO_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RESTO_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RESTO_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RESTO_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RESTO_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RESTO_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RESTO_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RESTO_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RESTO_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RESTO_DB] SET  MULTI_USER 
GO
ALTER DATABASE [RESTO_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RESTO_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RESTO_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RESTO_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RESTO_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RESTO_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [RESTO_DB] SET QUERY_STORE = ON
GO
ALTER DATABASE [RESTO_DB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [RESTO_DB]
GO
/****** Object:  Table [dbo].[CATEGORIAS_PLATOS]    Script Date: 6/23/2023 4:34:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIAS_PLATOS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Categoria] [varchar](50) NULL,
 CONSTRAINT [PK_CATEGORIAS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE_PEDIDOS]    Script Date: 6/23/2023 4:34:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE_PEDIDOS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPedido] [int] NULL,
	[IdPlato] [int] NULL,
	[Cantidad] [int] NULL,
 CONSTRAINT [PK_DETALLE_PEDIDOS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MESAS]    Script Date: 6/23/2023 4:34:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MESAS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NumeroMesa] [int] NULL,
	[IdMesero] [int] NULL,
	[IdPedido] [int] NULL,
 CONSTRAINT [PK_MESAS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PEDIDOS]    Script Date: 6/23/2023 4:34:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PEDIDOS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NombreCliente] [varchar](50) NULL,
	[IdMesa] [int] NULL,
	[IdUser] [int] NULL,
	[Fecha] [date] NULL,
 CONSTRAINT [PK_PEDIDOS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PLATOS]    Script Date: 6/23/2023 4:34:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PLATOS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Tipo] [int] NULL,
	[Precio] [money] NULL,
	[Categoria] [int] NULL,
	[ImagenUrl] [varchar](250) NULL,
 CONSTRAINT [PK_Platos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPOS_PLATOS]    Script Date: 6/23/2023 4:34:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPOS_PLATOS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 6/23/2023 4:34:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NULL,
	[Pass] [varchar](50) NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[FechaNacimiento] [smalldatetime] NULL,
	[RolAdmin] [bit] NULL,
	[ProfileImage] [varchar](50) NULL,
 CONSTRAINT [PK_USERS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CATEGORIAS_PLATOS] ON 

INSERT [dbo].[CATEGORIAS_PLATOS] ([Id], [Categoria]) VALUES (1, N'Entrada')
INSERT [dbo].[CATEGORIAS_PLATOS] ([Id], [Categoria]) VALUES (2, N'Plato principal')
INSERT [dbo].[CATEGORIAS_PLATOS] ([Id], [Categoria]) VALUES (3, N'Desayuno')
INSERT [dbo].[CATEGORIAS_PLATOS] ([Id], [Categoria]) VALUES (4, N'Postre')
INSERT [dbo].[CATEGORIAS_PLATOS] ([Id], [Categoria]) VALUES (5, N'Bebidas')
INSERT [dbo].[CATEGORIAS_PLATOS] ([Id], [Categoria]) VALUES (6, N'Aperitivos')
INSERT [dbo].[CATEGORIAS_PLATOS] ([Id], [Categoria]) VALUES (7, N'Guarniciones')
INSERT [dbo].[CATEGORIAS_PLATOS] ([Id], [Categoria]) VALUES (8, N'Sopas y cremas')
SET IDENTITY_INSERT [dbo].[CATEGORIAS_PLATOS] OFF
GO
SET IDENTITY_INSERT [dbo].[MESAS] ON 

INSERT [dbo].[MESAS] ([Id], [NumeroMesa], [IdMesero], [IdPedido]) VALUES (1, 1, NULL, NULL)
INSERT [dbo].[MESAS] ([Id], [NumeroMesa], [IdMesero], [IdPedido]) VALUES (2, 2, NULL, NULL)
INSERT [dbo].[MESAS] ([Id], [NumeroMesa], [IdMesero], [IdPedido]) VALUES (3, 3, NULL, NULL)
INSERT [dbo].[MESAS] ([Id], [NumeroMesa], [IdMesero], [IdPedido]) VALUES (4, 4, NULL, NULL)
INSERT [dbo].[MESAS] ([Id], [NumeroMesa], [IdMesero], [IdPedido]) VALUES (5, 5, NULL, NULL)
INSERT [dbo].[MESAS] ([Id], [NumeroMesa], [IdMesero], [IdPedido]) VALUES (6, 6, NULL, NULL)
INSERT [dbo].[MESAS] ([Id], [NumeroMesa], [IdMesero], [IdPedido]) VALUES (15, 7, NULL, NULL)
INSERT [dbo].[MESAS] ([Id], [NumeroMesa], [IdMesero], [IdPedido]) VALUES (16, 8, NULL, NULL)
INSERT [dbo].[MESAS] ([Id], [NumeroMesa], [IdMesero], [IdPedido]) VALUES (17, 9, NULL, NULL)
SET IDENTITY_INSERT [dbo].[MESAS] OFF
GO
SET IDENTITY_INSERT [dbo].[PLATOS] ON 

INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl]) VALUES (1, N'Hamburguesa clásica', 1, 1100.0000, 2, N'https://www.serargentino.com/public/images/2021/01/16109941330-17-burger-773x458.jpg')
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl]) VALUES (2, N'Sushi de salmón', 4, 1300.0000, 2, N'https://s1.eestatic.com/2019/06/18/cocinillas/actualidad-gastronomica/sushi-pescado-salmon_407220618_125852168_1706x960.jpg')
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl]) VALUES (3, N'Lasagna de carne', 3, 1000.0000, 2, NULL)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl]) VALUES (4, N'Ensalada César', 2, 900.0000, 1, NULL)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl]) VALUES (5, N'Pizza margarita', 5, 1200.0000, 2, NULL)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl]) VALUES (6, N'Pollo a la parrilla', 1, 1050.0000, 2, NULL)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl]) VALUES (7, N'Ceviche de camarón', 4, 1400.0000, 2, NULL)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl]) VALUES (8, N'Spaghetti a la bolognesa', 3, 950.0000, 2, NULL)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl]) VALUES (9, N'Ensalada griega', 2, 900.0000, 1, NULL)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl]) VALUES (10, N'Pizza hawaiana', 5, 1200.0000, 2, NULL)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl]) VALUES (11, N'Tacos al pastor', 1, 1000.0000, 2, NULL)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl]) VALUES (12, N'Salmón a la plancha', 4, 1400.0000, 2, NULL)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl]) VALUES (13, N'Risotto de champiñones', 3, 1050.0000, 2, NULL)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl]) VALUES (14, N'Ensalada de quinoa', 2, 900.0000, 1, NULL)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl]) VALUES (15, N'Pizza vegetariana', 5, 1200.0000, 2, NULL)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl]) VALUES (16, N'Camarones al ajillo', 4, 1500.0000, 2, NULL)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl]) VALUES (17, N'Fettuccine Alfredo', 3, 1000.0000, 2, NULL)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl]) VALUES (18, N'Ensalada de pollo', 2, 900.0000, 1, NULL)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl]) VALUES (19, N'Pizza de pepperoni', 5, 1200.0000, 2, NULL)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl]) VALUES (20, N'Churrasco con chimichurri', 1, 1350.0000, 2, NULL)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl]) VALUES (21, N'Pulpo a la gallega', 4, 1600.0000, 2, NULL)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl]) VALUES (22, N'Gnocchi con salsa pesto', 3, 1100.0000, 2, NULL)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl]) VALUES (23, N'Ensalada caprese', 2, 900.0000, 1, NULL)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl]) VALUES (24, N'Pizza cuatro quesos', 5, 1200.0000, 2, NULL)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl]) VALUES (25, N'Chuletas de cerdo a la BBQ', 1, 1250.0000, 2, NULL)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl]) VALUES (26, N'Ceviche de pescado', 4, 1500.0000, 2, NULL)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl]) VALUES (27, N'Raviolis rellenos de espinacas', 3, 1100.0000, 2, NULL)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl]) VALUES (28, N'Ensalada de frutas', 2, 800.0000, 1, NULL)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl]) VALUES (29, N'Pizza de hongos', 5, 1200.0000, 2, NULL)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl]) VALUES (32, N'Risotto de mariscos', 4, 1350.0000, 2, N'https://www.deliciosi.com/images/1400/1481/risotto-de-mariscos.jpg')
SET IDENTITY_INSERT [dbo].[PLATOS] OFF
GO
SET IDENTITY_INSERT [dbo].[TIPOS_PLATOS] ON 

INSERT [dbo].[TIPOS_PLATOS] ([Id], [Tipo]) VALUES (1, N'Carnes')
INSERT [dbo].[TIPOS_PLATOS] ([Id], [Tipo]) VALUES (2, N'Ensaladas')
INSERT [dbo].[TIPOS_PLATOS] ([Id], [Tipo]) VALUES (3, N'Pastas')
INSERT [dbo].[TIPOS_PLATOS] ([Id], [Tipo]) VALUES (4, N'Pescados y mariscos')
INSERT [dbo].[TIPOS_PLATOS] ([Id], [Tipo]) VALUES (5, N'Pizzas')
SET IDENTITY_INSERT [dbo].[TIPOS_PLATOS] OFF
GO
SET IDENTITY_INSERT [dbo].[USERS] ON 

INSERT [dbo].[USERS] ([Id], [Email], [Pass], [Nombre], [Apellido], [FechaNacimiento], [RolAdmin], [ProfileImage]) VALUES (1, N'gerente@resto.com', N'gerentepass', N'Gerente', N'Resto', CAST(N'1980-01-01T00:00:00' AS SmallDateTime), 1, N'perfil-1.jpg')
INSERT [dbo].[USERS] ([Id], [Email], [Pass], [Nombre], [Apellido], [FechaNacimiento], [RolAdmin], [ProfileImage]) VALUES (2, N'mesero@resto.com', N'meseropass', N'Mesero', N'Resto', CAST(N'1988-10-22T00:00:00' AS SmallDateTime), 0, NULL)
SET IDENTITY_INSERT [dbo].[USERS] OFF
GO
ALTER TABLE [dbo].[DETALLE_PEDIDOS]  WITH CHECK ADD  CONSTRAINT [FK_DETALLEPEDIDOS_PEDIDOS] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[PEDIDOS] ([Id])
GO
ALTER TABLE [dbo].[DETALLE_PEDIDOS] CHECK CONSTRAINT [FK_DETALLEPEDIDOS_PEDIDOS]
GO
ALTER TABLE [dbo].[DETALLE_PEDIDOS]  WITH CHECK ADD  CONSTRAINT [FK_DETALLEPEDIDOS_PLATO] FOREIGN KEY([IdPlato])
REFERENCES [dbo].[PLATOS] ([Id])
GO
ALTER TABLE [dbo].[DETALLE_PEDIDOS] CHECK CONSTRAINT [FK_DETALLEPEDIDOS_PLATO]
GO
ALTER TABLE [dbo].[MESAS]  WITH CHECK ADD  CONSTRAINT [FK_MESAS_PEDIDOS] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[PEDIDOS] ([Id])
GO
ALTER TABLE [dbo].[MESAS] CHECK CONSTRAINT [FK_MESAS_PEDIDOS]
GO
ALTER TABLE [dbo].[MESAS]  WITH CHECK ADD  CONSTRAINT [FK_MESAS_USERS] FOREIGN KEY([IdMesero])
REFERENCES [dbo].[USERS] ([Id])
GO
ALTER TABLE [dbo].[MESAS] CHECK CONSTRAINT [FK_MESAS_USERS]
GO
ALTER TABLE [dbo].[PEDIDOS]  WITH CHECK ADD  CONSTRAINT [FK_PEDIDOS_MESAS] FOREIGN KEY([IdMesa])
REFERENCES [dbo].[MESAS] ([Id])
GO
ALTER TABLE [dbo].[PEDIDOS] CHECK CONSTRAINT [FK_PEDIDOS_MESAS]
GO
ALTER TABLE [dbo].[PEDIDOS]  WITH CHECK ADD  CONSTRAINT [FK_PEDIDOS_USERS] FOREIGN KEY([IdUser])
REFERENCES [dbo].[USERS] ([Id])
GO
ALTER TABLE [dbo].[PEDIDOS] CHECK CONSTRAINT [FK_PEDIDOS_USERS]
GO
ALTER TABLE [dbo].[PLATOS]  WITH CHECK ADD  CONSTRAINT [FK_PLATOS_CATEGORIAS] FOREIGN KEY([Categoria])
REFERENCES [dbo].[CATEGORIAS_PLATOS] ([Id])
GO
ALTER TABLE [dbo].[PLATOS] CHECK CONSTRAINT [FK_PLATOS_CATEGORIAS]
GO
ALTER TABLE [dbo].[PLATOS]  WITH CHECK ADD  CONSTRAINT [FK_PLATOS_TIPOSPLATOS] FOREIGN KEY([Tipo])
REFERENCES [dbo].[TIPOS_PLATOS] ([Id])
GO
ALTER TABLE [dbo].[PLATOS] CHECK CONSTRAINT [FK_PLATOS_TIPOSPLATOS]
GO
/****** Object:  StoredProcedure [dbo].[SP_LastIdPlato]    Script Date: 6/23/2023 4:34:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LastIdPlato]
AS
BEGIN
	DECLARE @LastId INT
	SELECT TOP 1 @LastId = Id FROM PLATOS ORDER BY ID DESC
	SELECT @LastId + 1 AS Id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Login]    Script Date: 6/23/2023 4:34:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Login](
	@Email varchar(50),
	@Pass varchar(50)
) AS
BEGIN
	SELECT Id, Email, Pass, Nombre, Apellido, FechaNacimiento, RolAdmin, ProfileImage FROM USERS WHERE Email = @Email AND Pass = @Pass
END
GO
/****** Object:  StoredProcedure [dbo].[SP_NuevaMesa]    Script Date: 6/23/2023 4:34:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_NuevaMesa] AS
Begin
	Declare @UltimoNumeroMesa int
	SELECT TOP 1 @UltimoNumeroMesa = NumeroMesa FROM MESAS ORDER BY NumeroMesa DESC
	Insert into MESAS (NumeroMesa)
	Values(@UltimoNumeroMesa+1)
end
GO
USE [master]
GO
ALTER DATABASE [RESTO_DB] SET  READ_WRITE 
GO
