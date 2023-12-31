USE [master]
GO
/****** Object:  Database [RESTO_DB]    Script Date: 7/14/2023 10:14:31 AM ******/
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
/****** Object:  Table [dbo].[CATEGORIAS_PLATOS]    Script Date: 7/14/2023 10:14:31 AM ******/
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
/****** Object:  Table [dbo].[DETALLE_PEDIDOS]    Script Date: 7/14/2023 10:14:31 AM ******/
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
/****** Object:  Table [dbo].[MESAS]    Script Date: 7/14/2023 10:14:31 AM ******/
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
/****** Object:  Table [dbo].[PEDIDOS]    Script Date: 7/14/2023 10:14:31 AM ******/
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
/****** Object:  Table [dbo].[PLATOS]    Script Date: 7/14/2023 10:14:31 AM ******/
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
	[Stock] [int] NULL,
 CONSTRAINT [PK_Platos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPOS_PLATOS]    Script Date: 7/14/2023 10:14:31 AM ******/
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
/****** Object:  Table [dbo].[USERS]    Script Date: 7/14/2023 10:14:31 AM ******/
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
INSERT [dbo].[CATEGORIAS_PLATOS] ([Id], [Categoria]) VALUES (6, N'Aperitivos')
INSERT [dbo].[CATEGORIAS_PLATOS] ([Id], [Categoria]) VALUES (7, N'Guarniciones')
SET IDENTITY_INSERT [dbo].[CATEGORIAS_PLATOS] OFF
GO
SET IDENTITY_INSERT [dbo].[DETALLE_PEDIDOS] ON 

INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (84, 13, 6, 2)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (85, 13, 7, 2)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (86, 13, 8, 1)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (87, 13, 15, 1)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (88, 13, 14, 2)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (89, 13, 16, 3)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (100, 15, 3, 4)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (101, 15, 2, 3)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (102, 15, 4, 3)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (103, 15, 35, 3)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (104, 16, 6, 2)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (105, 18, 3, 1)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (106, 18, 4, 1)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (107, 18, 2, 1)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (111, 17, 2, 4)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (112, 17, 3, 3)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (113, 22, 2, 5)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (114, 22, 3, 2)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (115, 24, 3, 5)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (116, 24, 2, 1)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (117, 24, 4, 1)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (119, 26, 2, 3)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (120, 26, 6, 1)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (121, 26, 7, 1)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (126, 41, 3, 3)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (127, 41, 7, 3)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (128, 41, 6, 3)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (129, 42, 2, 3)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (130, 42, 3, 3)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (131, 42, 7, 3)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (134, 43, 6, 2)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (136, 44, 2, 6)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (137, 44, 10, 4)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (139, 45, 2, 1)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (141, 45, 3, 1)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (142, 45, 5, 1)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (143, 46, 2, 3)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (144, 46, 3, 3)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (145, 46, 7, 3)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (155, 47, 2, 5)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (157, 47, 6, 5)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (1189, 50, 3, 2)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (1190, 50, 4, 2)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (1191, 50, 5, 2)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (1192, 50, 2, 2)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (1193, 50, 10, 3)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (1194, 50, 15, 4)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (1195, 51, 9, 3)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (1196, 51, 12, 3)
INSERT [dbo].[DETALLE_PEDIDOS] ([Id], [IdPedido], [IdPlato], [Cantidad]) VALUES (1199, 51, 20, 1)
SET IDENTITY_INSERT [dbo].[DETALLE_PEDIDOS] OFF
GO
SET IDENTITY_INSERT [dbo].[MESAS] ON 

INSERT [dbo].[MESAS] ([Id], [NumeroMesa], [IdMesero], [IdPedido]) VALUES (1, 1, NULL, NULL)
INSERT [dbo].[MESAS] ([Id], [NumeroMesa], [IdMesero], [IdPedido]) VALUES (2, 2, NULL, NULL)
INSERT [dbo].[MESAS] ([Id], [NumeroMesa], [IdMesero], [IdPedido]) VALUES (3, 3, NULL, NULL)
INSERT [dbo].[MESAS] ([Id], [NumeroMesa], [IdMesero], [IdPedido]) VALUES (4, 4, NULL, NULL)
INSERT [dbo].[MESAS] ([Id], [NumeroMesa], [IdMesero], [IdPedido]) VALUES (5, 5, NULL, NULL)
INSERT [dbo].[MESAS] ([Id], [NumeroMesa], [IdMesero], [IdPedido]) VALUES (46, 6, NULL, NULL)
SET IDENTITY_INSERT [dbo].[MESAS] OFF
GO
SET IDENTITY_INSERT [dbo].[PEDIDOS] ON 

INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (9, N'Pedro Caseres', 1, 2, CAST(N'2023-06-28' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (10, N'Pedro Caseres', 1, 19, CAST(N'2023-06-28' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (11, N'Pedro Caseres', 2, 2, CAST(N'2023-06-30' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (12, N'Regina', 3, 19, CAST(N'2023-06-30' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (13, N'Pedro Meloni', 1, 2, CAST(N'2023-07-04' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (14, N'Pedro Meloni', 1, 19, CAST(N'2023-07-04' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (15, N'Pedro Meloni', 1, 2, CAST(N'2023-07-04' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (16, N'Pedro Meloni', 1, 2, CAST(N'2023-07-04' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (17, N'Pedro Caseres', 2, 19, CAST(N'2023-07-04' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (18, N'Regina', 3, 19, CAST(N'2023-07-04' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (19, N'Regina', 4, 2, CAST(N'2023-07-04' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (20, N'Marta', 5, 19, CAST(N'2023-07-04' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (22, N'Pedro Caseres', 2, 19, CAST(N'2023-07-04' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (23, N'Pedro Caseres', 2, 19, CAST(N'2023-07-04' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (25, N'Pedro Caseres', 2, 2, CAST(N'2023-07-04' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (27, N'', 3, 2, CAST(N'2023-07-05' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (28, N'', 3, 2, CAST(N'2023-07-05' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (29, N'', 4, 2, CAST(N'2023-07-05' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (30, N'', 3, 2, CAST(N'2023-07-05' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (31, N'', 3, 2, CAST(N'2023-07-05' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (32, N'', 3, 2, CAST(N'2023-07-05' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (33, N'gegerger45', 3, 2, CAST(N'2023-07-05' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (34, N'Pedro Meloni', 3, 2, CAST(N'2023-07-05' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (35, N'cwefwe345', 4, 2, CAST(N'2023-07-05' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (36, N'csdcsd54', 3, 2, CAST(N'2023-07-05' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (37, N'cdwedfwe54', 3, 2, CAST(N'2023-07-05' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (38, N'sdsfsdfds', 3, 2, CAST(N'2023-07-05' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (39, N'Pedro Meloni', 3, 2, CAST(N'2023-07-06' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (40, N'Pedro Meloni', 4, 19, CAST(N'2023-07-06' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (41, N'Regina', 1, 2, CAST(N'2023-07-06' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (42, N'Pedro Meloni', 1, 19, CAST(N'2023-07-06' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (47, N'Marta', 1, 2, CAST(N'2023-07-11' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (50, N'Marta', 1, 22, CAST(N'2023-07-14' AS Date))
INSERT [dbo].[PEDIDOS] ([Id], [NombreCliente], [IdMesa], [IdUser], [Fecha]) VALUES (51, N'Marta', 2, 22, CAST(N'2023-07-14' AS Date))
SET IDENTITY_INSERT [dbo].[PEDIDOS] OFF
GO
SET IDENTITY_INSERT [dbo].[PLATOS] ON 

INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (2, N'Sushi de salmón', 4, 1300.0000, 2, N'plato-2.jpg', 0)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (3, N'Lasagna de carne', 3, 1000.0000, 2, N'plato-3.jpg', 56)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (4, N'Ensalada César', 2, 900.0000, 1, N'plato-4.jpg', 40)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (5, N'Pizza margarita', 5, 1200.0000, 2, N'plato-5.jpg', 66)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (6, N'Pollo a la parrilla', 1, 1050.0000, 2, N'plato-6.jpg', 17)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (7, N'Ceviche de camarón', 4, 1400.0000, 2, N'plato-7.jpg', 33)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (8, N'Spaghetti a la bolognesa', 3, 950.0000, 2, N'plato-8.jpg', 7)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (9, N'Ensalada griega', 2, 900.0000, 1, N'plato-9.jpg', 94)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (10, N'Pizza hawaiana', 5, 1200.0000, 2, N'plato-10.jpg', 34)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (11, N'Tacos al pastor', 1, 1000.0000, 2, N'plato-11.jpg', 42)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (12, N'Salmón a la plancha', 4, 1400.0000, 2, N'plato-12.jpg', 6)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (13, N'Risotto de champiñones', 3, 1050.0000, 2, N'plato-13.jpg', 86)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (14, N'Ensalada de quinoa', 2, 900.0000, 1, N'plato-14.jpg', 56)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (15, N'Pizza vegetariana', 5, 1200.0000, 2, N'plato-15.jpg', 4)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (16, N'Camarones al ajillo', 4, 1500.0000, 2, N'plato-16.jpg', 0)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (17, N'Fettuccine Alfredo', 3, 1000.0000, 2, N'plato-17.jpg', 28)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (18, N'Ensalada de pollo', 2, 900.0000, 1, N'plato-18.jpg', 4)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (19, N'Pizza de pepperoni', 5, 1200.0000, 2, N'plato-19.jpg', 68)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (20, N'Churrasco con chimichurri', 1, 1350.0000, 2, N'plato-20.jpg', 0)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (21, N'Pulpo a la gallega', 4, 1600.0000, 2, N'plato-21.jpg', 48)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (22, N'Gnocchi con salsa pesto', 3, 1100.0000, 2, N'plato-22.jpg', 64)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (23, N'Ensalada caprese', 2, 900.0000, 1, N'plato-23.jpg', 5)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (24, N'Pizza cuatro quesos', 5, 1200.0000, 2, NULL, 46)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (25, N'Chuletas de cerdo a la BBQ', 1, 1250.0000, 2, N'plato-25.jpg', 21)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (26, N'Ceviche de pescado', 4, 1500.0000, 2, NULL, 76)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (27, N'Raviolis rellenos de espinacas', 3, 1100.0000, 2, N'plato-27.jpg', 50)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (28, N'Ensalada de frutas', 2, 800.0000, 4, N'plato-28.jpg', 67)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (29, N'Pizza de hongos', 5, 1200.0000, 2, NULL, 34)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (32, N'Risotto de mariscos', 4, 1350.0000, 2, N'plato-32.jpg', 8)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (35, N'Coca Cola', 6, 230.0000, 1, N'plato-35.jpg', 100)
INSERT [dbo].[PLATOS] ([Id], [Nombre], [Tipo], [Precio], [Categoria], [ImagenUrl], [Stock]) VALUES (37, N'Risotto de mariscos', 4, 12336.0000, 2, N'plato-37.jpg', 100)
SET IDENTITY_INSERT [dbo].[PLATOS] OFF
GO
SET IDENTITY_INSERT [dbo].[TIPOS_PLATOS] ON 

INSERT [dbo].[TIPOS_PLATOS] ([Id], [Tipo]) VALUES (1, N'Carnes')
INSERT [dbo].[TIPOS_PLATOS] ([Id], [Tipo]) VALUES (2, N'Ensaladas')
INSERT [dbo].[TIPOS_PLATOS] ([Id], [Tipo]) VALUES (3, N'Pastas')
INSERT [dbo].[TIPOS_PLATOS] ([Id], [Tipo]) VALUES (4, N'Pescados y mariscos')
INSERT [dbo].[TIPOS_PLATOS] ([Id], [Tipo]) VALUES (5, N'Pizzas')
INSERT [dbo].[TIPOS_PLATOS] ([Id], [Tipo]) VALUES (6, N'Bebidas')
INSERT [dbo].[TIPOS_PLATOS] ([Id], [Tipo]) VALUES (7, N'Sopas y cremas')
INSERT [dbo].[TIPOS_PLATOS] ([Id], [Tipo]) VALUES (11, N'Pizzas Napolitanas')
SET IDENTITY_INSERT [dbo].[TIPOS_PLATOS] OFF
GO
SET IDENTITY_INSERT [dbo].[USERS] ON 

INSERT [dbo].[USERS] ([Id], [Email], [Pass], [Nombre], [Apellido], [FechaNacimiento], [RolAdmin], [ProfileImage]) VALUES (1, N'gerente@resto.com', N'gerentepass', N'Gerente', N'Resto', CAST(N'1980-01-01T00:00:00' AS SmallDateTime), 1, N'perfil-1.jpg')
INSERT [dbo].[USERS] ([Id], [Email], [Pass], [Nombre], [Apellido], [FechaNacimiento], [RolAdmin], [ProfileImage]) VALUES (2, N'mesero@resto.com', N'meseropass', N'Mesero', N'Resto', CAST(N'1988-10-22T00:00:00' AS SmallDateTime), 0, NULL)
INSERT [dbo].[USERS] ([Id], [Email], [Pass], [Nombre], [Apellido], [FechaNacimiento], [RolAdmin], [ProfileImage]) VALUES (19, N'mesero2@resto.com', N'Mesero2@resto.com', N'mesero2', N'mesero2', CAST(N'2023-07-01T00:00:00' AS SmallDateTime), 0, NULL)
INSERT [dbo].[USERS] ([Id], [Email], [Pass], [Nombre], [Apellido], [FechaNacimiento], [RolAdmin], [ProfileImage]) VALUES (22, N'luketube54@gmail.com', N'Pepe2023$', N'Lucas', N'Gruden', CAST(N'2023-07-17T00:00:00' AS SmallDateTime), 0, NULL)
SET IDENTITY_INSERT [dbo].[USERS] OFF
GO
ALTER TABLE [dbo].[DETALLE_PEDIDOS]  WITH NOCHECK ADD  CONSTRAINT [FK_DETALLEPEDIDOS_PEDIDOS] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[PEDIDOS] ([Id])
GO
ALTER TABLE [dbo].[DETALLE_PEDIDOS] CHECK CONSTRAINT [FK_DETALLEPEDIDOS_PEDIDOS]
GO
ALTER TABLE [dbo].[DETALLE_PEDIDOS]  WITH NOCHECK ADD  CONSTRAINT [FK_DETALLEPEDIDOS_PLATO] FOREIGN KEY([IdPlato])
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
ALTER TABLE [dbo].[PEDIDOS]  WITH NOCHECK ADD  CONSTRAINT [FK_PEDIDOS_MESAS] FOREIGN KEY([IdMesa])
REFERENCES [dbo].[MESAS] ([Id])
GO
ALTER TABLE [dbo].[PEDIDOS] CHECK CONSTRAINT [FK_PEDIDOS_MESAS]
GO
ALTER TABLE [dbo].[PEDIDOS]  WITH NOCHECK ADD  CONSTRAINT [FK_PEDIDOS_USERS] FOREIGN KEY([IdUser])
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
/****** Object:  StoredProcedure [dbo].[SP_LastIdPedidos]    Script Date: 7/14/2023 10:14:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LastIdPedidos]
AS
BEGIN
	DECLARE @LastId INT
    SELECT @LastId = IDENT_CURRENT('Pedidos')
	SELECT @LastId + 1 AS Id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LastIdPlato]    Script Date: 7/14/2023 10:14:31 AM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Login]    Script Date: 7/14/2023 10:14:31 AM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_NuevaMesa]    Script Date: 7/14/2023 10:14:31 AM ******/
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
