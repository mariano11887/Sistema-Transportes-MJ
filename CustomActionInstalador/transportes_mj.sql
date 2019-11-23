USE [master]
GO
/****** Object:  Database [transportes_mj]    Script Date: 23/11/2019 18:20:00 ******/
IF EXISTS(select * from sys.databases where name='transportes_mj')
DROP DATABASE [transportes_mj]
GO
CREATE DATABASE [transportes_mj]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [transportes_mj].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [transportes_mj] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [transportes_mj] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [transportes_mj] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [transportes_mj] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [transportes_mj] SET ARITHABORT OFF 
GO
ALTER DATABASE [transportes_mj] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [transportes_mj] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [transportes_mj] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [transportes_mj] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [transportes_mj] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [transportes_mj] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [transportes_mj] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [transportes_mj] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [transportes_mj] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [transportes_mj] SET  DISABLE_BROKER 
GO
ALTER DATABASE [transportes_mj] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [transportes_mj] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [transportes_mj] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [transportes_mj] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [transportes_mj] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [transportes_mj] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [transportes_mj] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [transportes_mj] SET RECOVERY FULL 
GO
ALTER DATABASE [transportes_mj] SET  MULTI_USER 
GO
ALTER DATABASE [transportes_mj] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [transportes_mj] SET DB_CHAINING OFF 
GO
ALTER DATABASE [transportes_mj] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [transportes_mj] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [transportes_mj] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'transportes_mj', N'ON'
GO
USE [transportes_mj]
GO
/****** Object:  Table [dbo].[alerta_insuficiencia]    Script Date: 23/11/2019 18:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[alerta_insuficiencia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[choferes_faltantes] [int] NOT NULL,
	[coches_faltantes] [int] NOT NULL,
 CONSTRAINT [PK_alerta_insuficiencia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[alerta_usuario]    Script Date: 23/11/2019 18:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[alerta_usuario](
	[alerta_id] [int] NOT NULL,
	[usuario_id] [int] NOT NULL,
 CONSTRAINT [PK_alerta_usuario] PRIMARY KEY CLUSTERED 
(
	[alerta_id] ASC,
	[usuario_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chofer]    Script Date: 23/11/2019 18:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chofer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[dni] [int] NOT NULL,
	[coche_preferido_id] [int] NULL,
	[fecha_fin_licencia] [date] NULL,
	[habilitado] [bit] NOT NULL,
 CONSTRAINT [PK_chofer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[coche]    Script Date: 23/11/2019 18:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[coche](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patente] [varchar](10) NOT NULL,
	[marca] [varchar](50) NULL,
	[modelo] [varchar](50) NULL,
	[fecha_adquisicion] [date] NULL,
	[anio_fabricacion] [int] NOT NULL,
	[numero_interno] [int] NOT NULL,
	[capacidad] [int] NULL,
	[en_circulacion] [bit] NOT NULL,
	[habilitado] [bit] NOT NULL,
 CONSTRAINT [PK_coche] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[completitud_viaje]    Script Date: 23/11/2019 18:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[completitud_viaje](
	[id] [int] NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_completitud_viaje] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[digito_verificador]    Script Date: 23/11/2019 18:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[digito_verificador](
	[tabla] [varchar](50) NOT NULL,
	[dvv] [numeric](1, 0) NOT NULL,
 CONSTRAINT [PK_digito_verificador] PRIMARY KEY CLUSTERED 
(
	[tabla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[idioma]    Script Date: 23/11/2019 18:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[idioma](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[editable] [bit] NOT NULL,
 CONSTRAINT [PK_idioma] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[leyenda]    Script Date: 23/11/2019 18:20:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[leyenda](
	[idioma_id] [int] NOT NULL,
	[nombre_form] [varchar](50) NOT NULL,
	[nombre_control] [varchar](50) NOT NULL,
	[texto] [varchar](max) NOT NULL,
 CONSTRAINT [PK_leyenda] PRIMARY KEY CLUSTERED 
(
	[idioma_id] ASC,
	[nombre_form] ASC,
	[nombre_control] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permiso]    Script Date: 23/11/2019 18:20:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permiso](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](500) NULL,
	[habilitado] [bit] NOT NULL,
 CONSTRAINT [PK_permiso] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permiso_permiso]    Script Date: 23/11/2019 18:20:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permiso_permiso](
	[permiso_padre_id] [int] NOT NULL,
	[permiso_hijo_id] [int] NOT NULL,
 CONSTRAINT [PK_permiso_permiso] PRIMARY KEY CLUSTERED 
(
	[permiso_padre_id] ASC,
	[permiso_hijo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[planilla_horaria]    Script Date: 23/11/2019 18:20:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[planilla_horaria](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[chofer_id] [int] NOT NULL,
	[coche_id] [int] NOT NULL,
	[recorrido_id] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[dvh] [numeric](1, 0) NOT NULL,
 CONSTRAINT [PK_planilla_horaria] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recorrido]    Script Date: 23/11/2019 18:20:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recorrido](
	[id] [int] NOT NULL,
	[linea] [int] NOT NULL,
	[ramal] [varchar](50) NULL,
	[terminal_inicio_id] [int] NOT NULL,
	[terminal_fin_id] [int] NOT NULL,
 CONSTRAINT [PK_recorrido] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[terminal]    Script Date: 23/11/2019 18:20:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[terminal](
	[id] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[direccion] [varchar](150) NOT NULL,
	[latitud] [decimal](9, 6) NOT NULL,
	[longitud] [decimal](9, 6) NOT NULL,
 CONSTRAINT [PK_terminal] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 23/11/2019 18:20:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[idioma_id] [int] NOT NULL,
	[nombre_usuario] [varchar](50) NOT NULL,
	[contrasenia] [varchar](100) NOT NULL,
	[habilitado] [bit] NOT NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario_historial]    Script Date: 23/11/2019 18:20:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario_historial](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[idioma] [varchar](50) NOT NULL,
	[nombre_usuario] [varchar](50) NOT NULL,
	[contrasenia] [varchar](100) NOT NULL,
	[permisos] [varchar](1000) NULL,
	[habilitado] [bit] NOT NULL,
 CONSTRAINT [PK_usuario_historial] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario_permiso]    Script Date: 23/11/2019 18:20:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario_permiso](
	[usuario_id] [int] NOT NULL,
	[permiso_id] [int] NOT NULL,
 CONSTRAINT [PK_usuario_permiso] PRIMARY KEY CLUSTERED 
(
	[usuario_id] ASC,
	[permiso_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[viaje]    Script Date: 23/11/2019 18:20:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[viaje](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[planilla_horaria_id] [int] NOT NULL,
	[es_ida] [bit] NOT NULL,
	[hora_salida] [time](0) NOT NULL,
	[hora_estimada_llegada] [time](0) NOT NULL,
	[hora_real_llegada] [time](0) NULL,
	[completado] [bit] NULL,
	[completitud_id] [int] NULL,
	[dvh] [numeric](1, 0) NOT NULL,
 CONSTRAINT [PK_viaje] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[alerta_insuficiencia] ON 
GO
INSERT [dbo].[alerta_insuficiencia] ([id], [fecha], [choferes_faltantes], [coches_faltantes]) VALUES (1, CAST(N'2019-10-29T20:14:49.757' AS DateTime), 62, 0)
GO
INSERT [dbo].[alerta_insuficiencia] ([id], [fecha], [choferes_faltantes], [coches_faltantes]) VALUES (2, CAST(N'2019-10-29T20:16:17.843' AS DateTime), 62, 0)
GO
INSERT [dbo].[alerta_insuficiencia] ([id], [fecha], [choferes_faltantes], [coches_faltantes]) VALUES (3, CAST(N'2019-10-29T20:32:13.763' AS DateTime), 62, 0)
GO
INSERT [dbo].[alerta_insuficiencia] ([id], [fecha], [choferes_faltantes], [coches_faltantes]) VALUES (4, CAST(N'2019-11-23T16:21:14.023' AS DateTime), 62, 0)
GO
INSERT [dbo].[alerta_insuficiencia] ([id], [fecha], [choferes_faltantes], [coches_faltantes]) VALUES (5, CAST(N'2019-11-23T16:29:11.420' AS DateTime), 62, 0)
GO
INSERT [dbo].[alerta_insuficiencia] ([id], [fecha], [choferes_faltantes], [coches_faltantes]) VALUES (6, CAST(N'2019-11-23T16:32:39.787' AS DateTime), 62, 0)
GO
SET IDENTITY_INSERT [dbo].[alerta_insuficiencia] OFF
GO
INSERT [dbo].[alerta_usuario] ([alerta_id], [usuario_id]) VALUES (2, 1)
GO
INSERT [dbo].[alerta_usuario] ([alerta_id], [usuario_id]) VALUES (3, 1)
GO
INSERT [dbo].[alerta_usuario] ([alerta_id], [usuario_id]) VALUES (4, 1)
GO
INSERT [dbo].[alerta_usuario] ([alerta_id], [usuario_id]) VALUES (5, 1)
GO
INSERT [dbo].[alerta_usuario] ([alerta_id], [usuario_id]) VALUES (6, 1)
GO
SET IDENTITY_INSERT [dbo].[chofer] ON 
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (1, N'Alonso Ibañez Blanco', 12514822, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (2, N'Pablo Vidal Montero', 21976314, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (3, N'Juan José Riera', 20859583, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (4, N'Jan Pascual', 24015964, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (5, N'Alfredo Manuel Bautista Mejía', 21849089, 112, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (6, N'Alejandro Bautista Vázquez', 31657894, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (7, N'Juan Miguel de Jesús Benítez', 19228469, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (8, N'Gregorio Bermúdez', 37822840, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (9, N'José Antonio Manrique', 11930594, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (10, N'Salvador Antonio Bernal', 36496290, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (11, N'Gigliola Taide Betancourt', 22541035, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (12, N'Miguel Ángel Betanzos', 39379438, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (13, N'Noel Blanco', 35985682, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (14, N'Humberto Alejandro Bolaños', 11216584, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (15, N'César Bremermann Borraz', 36218961, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (16, N'Moisés Briseño Arias', 34264680, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (17, N'Abel Buenfil Díaz', 36617655, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (18, N'Iván Burguete', 19980930, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (19, N'Miguel Ángel Bustamante', 18976430, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (20, N'Guadalupe Caballero', 18696566, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (21, N'Francisco Loranca', 32238135, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (22, N'Marcela Aguilar', 11981453, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (23, N'Fredy Francisco Alarcón', 12298005, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (24, N'Gerardo Genaro Alatriste', 11917656, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (25, N'Hipólito Alcántar', 28581540, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (26, N'José Israel Alcoverde', 10139009, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (27, N'Roberto Antonio Alderete', 25058945, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (28, N'Jacinta Guillermina Vargas', 13036971, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (29, N'Adolfo Alejo Guerrero', 15731970, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (30, N'Víctor Hugo Alemán', 17717722, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (31, N'Marcial Almogabar Santos', 10412426, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (32, N'Rocío Alonso Ibarra', 39237533, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (33, N'Pascual Gerardo Alonso', 36608409, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (34, N'Jadilson Altamirano García', 39365390, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (35, N'Rodolfo De Lira', 39278406, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (36, N'Adán Del Razo', 38008144, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (37, N'Armando Del Toro', 10190343, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (38, N'David Delgado', 11569284, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (39, N'Norma Delgado', 20833089, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (40, N'Héctor Federico Salgado', 19969773, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (41, N'Clemente Díaz Cruz', 29454968, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (42, N'Carlos Díaz', 25231443, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (43, N'Julio César Díaz Núñez', 36637627, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (44, N'Juan Manuel Díaz Sánchez', 35329852, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (45, N'Julio Eduardo Díaz Vivaldo', 37099048, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (46, N'José Vicente Domínguez', 12194277, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (47, N'Gabriel Domínguez', 32361991, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (48, N'Gerardo Domínguez', 15036552, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (49, N'Miguel Ángel Duarte', 22822585, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (50, N'Jesús Alfredo Durán', 28457449, NULL, NULL, 1)
GO
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (51, N'Mariano Jorreto', 323243245, 4, CAST(N'2019-08-20' AS Date), 0)
GO
SET IDENTITY_INSERT [dbo].[chofer] OFF
GO
SET IDENTITY_INSERT [dbo].[coche] ON 
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (1, N'ABC123', N'Mercedes Benz', N'Loppny', CAST(N'2019-04-09' AS Date), 2018, 3, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (2, N'ABC124', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 4, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (3, N'ABC125', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 5, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (4, N'ABC126', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 6, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (5, N'ABC127', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 7, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (6, N'ABC128', N'Mercedes Benz', N'Mewtwo', CAST(N'2018-05-16' AS Date), 2017, 8, 41, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (7, N'ABC129', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 9, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (8, N'ABC130', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 10, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (9, N'ABC131', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 11, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (10, N'ABC132', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 12, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (11, N'ABC133', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 13, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (12, N'ABC134', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 14, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (13, N'ABC135', N'Mercedes Benz', N'Bulbasaur', CAST(N'2018-05-16' AS Date), 2017, 15, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (14, N'ABC136', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 16, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (15, N'ABC137', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 17, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (16, N'ABC138', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 18, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (17, N'ABC139', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 19, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (18, N'ABC140', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 20, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (19, N'ABC141', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 21, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (20, N'ABC142', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 22, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (21, N'ABC143', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 23, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (22, N'ABC144', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 24, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (23, N'ABC145', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 25, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (24, N'ABC146', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 26, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (25, N'ABC147', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 27, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (26, N'ABC148', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 28, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (27, N'ABC149', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 29, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (28, N'ABC150', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 30, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (29, N'ABC151', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 31, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (30, N'ABC152', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 32, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (31, N'ABC153', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 33, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (32, N'ABC154', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 34, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (33, N'ABC155', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 35, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (34, N'ABC156', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 36, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (35, N'ABC157', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 37, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (36, N'ABC158', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 38, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (37, N'ABC159', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 39, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (38, N'ABC160', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 40, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (39, N'ABC161', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 41, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (40, N'ABC162', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 42, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (41, N'ABC163', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 43, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (42, N'ABC164', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 44, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (43, N'ABC165', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 45, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (44, N'ABC166', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 46, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (45, N'ABC167', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 47, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (46, N'ABC168', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 48, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (47, N'ABC169', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 49, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (48, N'ABC170', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 50, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (49, N'ABC171', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 51, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (50, N'ABC172', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 52, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (51, N'ABC173', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 53, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (52, N'ABC174', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 54, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (53, N'ABC175', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 55, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (54, N'ABC176', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 56, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (55, N'ABC177', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 57, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (56, N'ABC178', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 58, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (57, N'ABC179', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 59, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (58, N'ABC180', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 60, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (59, N'ABC181', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 61, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (60, N'ABC182', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 62, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (61, N'ABC183', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 63, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (62, N'ABC184', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 64, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (63, N'ABC185', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 65, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (64, N'ABC186', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 66, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (65, N'ABC187', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 67, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (66, N'ABC188', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 68, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (67, N'ABC189', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 69, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (68, N'ABC190', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 70, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (69, N'ABC191', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 71, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (70, N'ABC192', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 72, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (71, N'ABC193', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 73, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (72, N'ABC194', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 74, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (73, N'ABC195', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 75, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (74, N'ABC196', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 76, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (75, N'ABC197', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 77, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (76, N'ABC198', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 78, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (77, N'ABC199', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 79, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (78, N'ABC200', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 80, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (79, N'ABC201', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 81, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (80, N'ABC202', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 82, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (81, N'ABC203', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 83, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (82, N'ABC204', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 84, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (83, N'ABC205', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 85, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (84, N'ABC206', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 86, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (85, N'ABC207', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 87, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (86, N'ABC208', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 88, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (87, N'ABC209', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 89, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (88, N'ABC210', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 90, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (89, N'ABC211', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 91, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (90, N'ABC212', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 92, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (91, N'ABC213', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 93, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (92, N'ABC214', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 94, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (93, N'ABC215', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 95, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (94, N'ABC216', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 96, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (95, N'ABC217', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 97, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (96, N'ABC218', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 98, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (97, N'ABC219', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 99, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (98, N'ABC220', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 100, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (99, N'ABC221', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 101, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (100, N'ABC222', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 102, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (101, N'ABC223', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 103, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (102, N'ABC224', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 104, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (103, N'ABC225', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 105, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (104, N'ABC226', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 106, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (105, N'ABC227', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 107, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (106, N'ABC228', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 108, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (107, N'ABC229', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 109, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (108, N'ABC230', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 110, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (109, N'ABC231', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 111, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (110, N'ABC232', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 112, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (111, N'ABC233', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 113, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (112, N'ABC234', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 114, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (113, N'ABC235', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 115, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (114, N'ABC236', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 116, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (115, N'ABC237', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 117, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (116, N'ABC238', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 118, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (117, N'ABC239', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 119, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (118, N'ABC240', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 120, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (119, N'ABC241', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 121, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (120, N'ABC242', N'Mercedes Benz', N'Heracross', CAST(N'2018-05-16' AS Date), 2017, 122, 40, 1, 1)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (121, N'ABC243', N'Chevrolet', N'Charizard', CAST(N'2019-08-17' AS Date), 2019, 123, 30, 1, 0)
GO
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (123, N'SEG', N'Chevrolet', N'S', CAST(N'2019-11-03' AS Date), 2017, 24, 45, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[coche] OFF
GO
INSERT [dbo].[completitud_viaje] ([id], [descripcion]) VALUES (1, N'Totalmente lleno')
GO
INSERT [dbo].[completitud_viaje] ([id], [descripcion]) VALUES (2, N'Moderado')
GO
INSERT [dbo].[completitud_viaje] ([id], [descripcion]) VALUES (3, N'Mayormente vacío')
GO
INSERT [dbo].[digito_verificador] ([tabla], [dvv]) VALUES (N'planilla_horaria', CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[digito_verificador] ([tabla], [dvv]) VALUES (N'viaje', CAST(6 AS Numeric(1, 0)))
GO
SET IDENTITY_INSERT [dbo].[idioma] ON 
GO
INSERT [dbo].[idioma] ([id], [nombre], [editable]) VALUES (1, N'Español', 0)
GO
INSERT [dbo].[idioma] ([id], [nombre], [editable]) VALUES (5, N'English', 1)
GO
INSERT [dbo].[idioma] ([id], [nombre], [editable]) VALUES (8, N'Jeringoso', 1)
GO
SET IDENTITY_INSERT [dbo].[idioma] OFF
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'BackupForm', N'BackupForm', N'Copia de seguridad')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'BackupForm', N'btnCrearBackup', N'Crear copia de seguridad')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'BackupForm', N'btnExaminarRestaurar', N'Examinar…')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'BackupForm', N'btnRestaurarBackup', N'Restaurar copia de seguridad')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'BackupForm', N'grpCrearBackup', N'Crear copia de seguridad')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'BackupForm', N'grpRestaurarBackup', N'Restaurar copia de seguridad')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'BackupForm', N'lblUbicacionRestaurarBackup', N'Indique la ubicación de la copia de seguridad que desea restaurar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'BackupForm', N'msgArchivoBackupInvalido', N'El archivo seleccionado es inválido. Por favor seleccione una copia de seguridad generada por esta aplicación')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'BackupForm', N'msgArchivoBackupInvalidoTitulo', N'Archivo inválido')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'BackupForm', N'msgBackupCreado', N'La copia de seguridad se realizó satisfactoriamente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'BackupForm', N'msgBackupCreadoTitulo', N'Completo')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'BackupForm', N'msgConfirmacionRestaurar', N'Está a punto de restaurar una copia de seguridad. Todas las modificaciones realizadas con posterioridad a la copia de seguridad se perderán. ¿Está seguro que quiere continuar?')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'BackupForm', N'msgConfirmacionRestaurarTitulo', N'Confirmación')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'BackupForm', N'msgPruebaDVMal', N'No se puede crear una copia de seguridad porque la base de datos no pasó la prueba de integridad. Contacte al administrador del sistema.')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'BackupForm', N'msgRestauracionCompleta', N'La copia de seguridad fue restaurada con éxito. Se cerrará la sesión.')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'BackupForm', N'msgRestauracionCompletaTitulo', N'Finalizado')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'BackupForm', N'msgUbicacionVaciaCrear', N'Seleccione una ubicación y nombre de archivo para guardar la copia de seguridad')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'BackupForm', N'msgUbicacionVaciaCrearTitulo', N'Ubicación requerida')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'BitacoraForm', N'BitacoraForm', N'Bitácora')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'BitacoraForm', N'colDetalle', N'Detalle')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'BitacoraForm', N'colFecha', N'Fecha')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'BitacoraForm', N'colUsuario', N'Usuario')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'BitacoraForm', N'grpFiltros', N'Filtros')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'BitacoraForm', N'lblFechaFin', N'Fecha fin')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'BitacoraForm', N'lblFechaInicio', N'Fecha inicio')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'BitacoraForm', N'lblParteDelTexto', N'Parte del texto')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'BitacoraForm', N'lblUsuario', N'Usuario')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'ChoferesForm', N'btnBuscar', N'Buscar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'ChoferesForm', N'btnCargarLicencia', N'Cargar licencia')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'ChoferesForm', N'btnDescartar', N'Descartar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'ChoferesForm', N'btnEditar', N'Editar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'ChoferesForm', N'btnEliminar', N'Eliminar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'ChoferesForm', N'btnGuardarChofer', N'Guardar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'ChoferesForm', N'btnGuardarLicencia', N'Guardar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'ChoferesForm', N'btnNuevo', N'Nuevo')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'ChoferesForm', N'ChoferesForm', N'Choferes')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'ChoferesForm', N'grpBuscarChoferes', N'Buscar choferes')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'ChoferesForm', N'grpDetalles', N'Detalles')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'ChoferesForm', N'grpLicencias', N'Licencias')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'ChoferesForm', N'lblCochePreferidoBusqueda', N'Coche preferido')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'ChoferesForm', N'lblCochePreferidoDetalle', N'Coche preferido')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'ChoferesForm', N'lblDeLicencia', N'De licencia')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'ChoferesForm', N'lblDniBusqueda', N'DNI')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'ChoferesForm', N'lblDniDetalle', N'DNI')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'ChoferesForm', N'lblFechaFinLicencia', N'Fecha de fin de licencia')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'ChoferesForm', N'lblNombreBusqueda', N'Nombre')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'ChoferesForm', N'lblNombreDetalle', N'Nombre')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'ChoferesForm', N'lblResultadoBusqueda', N'Resultado de la búsqueda')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'ChoferesForm', N'msgChoferBorrado', N'El chofer se eliminó correctamente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'ChoferesForm', N'msgChoferGuardado', N'Los datos del chofer se guardaron con éxito')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'ChoferesForm', N'msgDniInvalido', N'El DNI ingresado no es válido')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'ChoferesForm', N'msgDniVacio', N'El DNI no puede estar vacío')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'ChoferesForm', N'msgLicenciaGuardada', N'La licencia se guardó correctamente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'ChoferesForm', N'msgNombreVacio', N'El nombre no puede estar vacío')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'ChoferesForm', N'optNo', N'No')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'ChoferesForm', N'optSi', N'Sí')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'DetalleDePlanillaForm', N'btnExportarPdf', N'Exportar a PDF')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'DetalleDePlanillaForm', N'btnGuardar', N'Guardar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'DetalleDePlanillaForm', N'btnImprimir', N'Imprimir')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'DetalleDePlanillaForm', N'colCompletado', N'Completado')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'DetalleDePlanillaForm', N'colDensidadPasajeros', N'Densidad de pasajeros')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'DetalleDePlanillaForm', N'colDestino', N'Destino')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'DetalleDePlanillaForm', N'colHoraEstimadaLlegada', N'Hora estimada de llegada')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'DetalleDePlanillaForm', N'colHoraRealLlegada', N'Hora real de llegada')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'DetalleDePlanillaForm', N'colHoraSalida', N'Hora de salida')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'DetalleDePlanillaForm', N'colOrigen', N'Origen')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'DetalleDePlanillaForm', N'DetalleDePlanillaForm', N'Detalle de planilla horaria')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'DetalleDePlanillaForm', N'grpDatos', N'Datos')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'DetalleDePlanillaForm', N'grpViajes', N'Viajes')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'DetalleDePlanillaForm', N'lblChofer', N'Chofer')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'DetalleDePlanillaForm', N'lblCoche', N'Coche')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'DetalleDePlanillaForm', N'lblFecha', N'Fecha')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'DetalleDePlanillaForm', N'lblNumeroPlanilla', N'Número de planilla')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'DetalleDePlanillaForm', N'lblRecorrido', N'Recorrido')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'DetalleDePlanillaForm', N'msgCeldasConError', N'Existen celdas con error')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'DetalleDePlanillaForm', N'msgErrorExportacionPdf', N'Ocurrió un error con la exportación del archivo')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'DetalleDePlanillaForm', N'msgFaltaDensidad', N'Debe completarse la densidad de pasajeros de los viajes completos')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'DetalleDePlanillaForm', N'msgFaltaHoraLlegada', N'Debe completarse la hora real de llegada de los viajes completos')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'DetalleDePlanillaForm', N'msgHoraMal', N'La hora está mal')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'DetalleDePlanillaForm', N'msgPdfExportadoBien', N'El archivo se exportó correctamente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'DetalleDePlanillaForm', N'msgPlanillaActualizada', N'Se actualizaron los viajes de la planilla')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'DetalleDePlanillaForm', N'valInterno', N'Interno')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'DetalleDePlanillaForm', N'valLleno', N'Lleno')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'DetalleDePlanillaForm', N'valModerado', N'Moderado')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'DetalleDePlanillaForm', N'valVacio', N'Vacío')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'IdiomasForm', N'btnCrearNuevo', N'Crear nuevo')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'IdiomasForm', N'btnDescartar', N'Descartar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'IdiomasForm', N'btnEditar', N'Editar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'IdiomasForm', N'btnEliminar', N'Eliminar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'IdiomasForm', N'btnGuardar', N'Guardar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'IdiomasForm', N'colIdentifiador', N'Identificador')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'IdiomasForm', N'colTextoEspaniol', N'Texto en Español')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'IdiomasForm', N'colTextoIdioma', N'Texto en idioma seleccionado')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'IdiomasForm', N'grpDetalles', N'Detalles')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'IdiomasForm', N'grpLeyendas', N'Leyendas')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'IdiomasForm', N'IdiomasForm', N'Idiomas')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'IdiomasForm', N'lblIdiomasActuales', N'Idiomas actuales')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'IdiomasForm', N'lblNombre', N'Nombre')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'IdiomasForm', N'msgCompletarDatos', N'Debe completar al menos el nombre del idioma para continuar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'IdiomasForm', N'msgCompletarDatosTitulo', N'Datos incompletos')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'IdiomasForm', N'msgEliminar', N'Estás a punto de eliminar el idioma seleccionado. ¿Estás seguro?')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'IdiomasForm', N'msgEliminarTitulo', N'Eliminar idioma')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'IdiomasForm', N'msgGuardado', N'Se guardó el idioma correctamente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'IdiomasForm', N'msgGuardadoTitulo', N'Guardado')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'IdiomasForm', N'msgPerderCambios', N'Está a punto de perder los cambios. ¿Desea continuar?')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'IdiomasForm', N'msgPerderCambiosTitulo', N'Cambios realizados')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'MainForm', N'MainForm', N'Transportes MJ')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'MainForm', N'mniAcercaDe', N'Acerca de…')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'MainForm', N'mniAdministrar', N'Administrar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'MainForm', N'mniAyuda', N'Ayuda')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'MainForm', N'mniAyudaEnLinea', N'Ayuda en línea')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'MainForm', N'mniChoferes', N'Choferes')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'MainForm', N'mniControlDeCambios', N'Control de cambios de usuarios')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'MainForm', N'mniCopiaDeSeguridad', N'Copia de seguridad')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'MainForm', N'mniFicheroLeame', N'Fichero léame')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'MainForm', N'mniGestionar', N'Gestionar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'MainForm', N'mniIdiomas', N'Idiomas')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'MainForm', N'mniLogout', N'Cerrar Sesión')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'MainForm', N'mniOpciones', N'Opciones')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'MainForm', N'mniPerfilesDeUsuario', N'Perfiles de usuario')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'MainForm', N'mniPersonalizar', N'Personalizar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'MainForm', N'mniPlanillasHorarias', N'Planillas horarias')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'MainForm', N'mniSalir', N'Salir del sistema')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'MainForm', N'mniSistema', N'Sistema')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'MainForm', N'mniUsuarios', N'Usuarios')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'MainForm', N'mniVehiculos', N'Vehículos')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'MainForm', N'mniVerBitacora', N'Ver bitácora')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'MainForm', N'msgAlertaInsuficiencia', N'Durante la última generación de planillas horarias, no se pudo aplicar la frecuencia recomendada debido a falta de recursos.')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'MainForm', N'msgChoferesFaltantes', N'Choferes faltantes: {0}')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'MainForm', N'msgErrorBD', N'No se pudo conectar a la base de datos. Contacte al administrador del sistema')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'MainForm', N'msgErrorBDTitulo', N'Error')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'MainForm', N'msgPruebaDVMal', N'La base de datos no pasó la prueba de integridad. Contacte al administrador del sistema.')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'MainForm', N'msgVehiculosFaltantes', N'Vehiculos faltantes: {0}')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PerfilesForm', N'btnAgregarFamilia', N'Agregar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PerfilesForm', N'btnAgregarPermiso', N'Agregar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PerfilesForm', N'btnCrearNuevo', N'Crear nuevo')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PerfilesForm', N'btnEditar', N'Editar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PerfilesForm', N'btnEliminar', N'Eliminar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PerfilesForm', N'btnGuardar', N'Guardar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PerfilesForm', N'btnQuitar', N'Quitar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PerfilesForm', N'grpDetalles', N'Detalles')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PerfilesForm', N'grpFamiliasPermisos', N'Agregar familias y permisos')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PerfilesForm', N'lblDescripcion', N'Descripción')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PerfilesForm', N'lblFamilias', N'Familias')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PerfilesForm', N'lblNombre', N'Nombre')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PerfilesForm', N'lblPerfilesActuales', N'Perfiles actuales')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PerfilesForm', N'lblPermisosAsignados', N'Permisos asignados')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PerfilesForm', N'lblPermisosIndividuales', N'Permisos individuales')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PerfilesForm', N'msgDatosIncompletos', N'Complete todos los datos antes de guardar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PerfilesForm', N'msgDatosIncompletosTitulo', N'Datos incompletos')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PerfilesForm', N'msgDescartar', N'Está a punto de descartar los cambios. ¿Desea continuar?')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PerfilesForm', N'msgDescartarTitulo', N'Descartar cambios')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PerfilesForm', N'msgEliminar', N'¿Está seguro que desea eliminar el perfil?')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PerfilesForm', N'msgEliminarTitulo', N'Eliminar perfil')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PerfilesForm', N'msgGuardado', N'Perfil guardado correctamente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PerfilesForm', N'msgGuardadoTitulo', N'Guardado')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PerfilesForm', N'PerfilesForm', N'Perfiles')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PersonalizacionForm', N'btnAceptar', N'Aceptar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PersonalizacionForm', N'btnCancelar', N'Cancelar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PersonalizacionForm', N'grpIdioma', N'Idioma')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PersonalizacionForm', N'lblIdioma', N'Idioma')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PersonalizacionForm', N'PersonalizacionForm', N'Personalizar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PlanillasHorariasForm', N'btnBuscar', N'Buscar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PlanillasHorariasForm', N'btnGenerarPlanillas', N'Generar planillas para el {0}')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PlanillasHorariasForm', N'btnVer', N'Ver')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PlanillasHorariasForm', N'colChofer', N'Chofer')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PlanillasHorariasForm', N'colCoche', N'Coche')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PlanillasHorariasForm', N'colDetalles', N'Detalles')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PlanillasHorariasForm', N'colFecha', N'Fecha')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PlanillasHorariasForm', N'colNumeroPlanilla', N'N° planilla')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PlanillasHorariasForm', N'colRecorrido', N'Recorrido')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PlanillasHorariasForm', N'grpBuscarPlanillas', N'Buscar planillas')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PlanillasHorariasForm', N'grpGenerarPlanillas', N'Generar planillas')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PlanillasHorariasForm', N'lblChofer', N'Chofer')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PlanillasHorariasForm', N'lblCoche', N'Coche')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PlanillasHorariasForm', N'lblFecha', N'Fecha')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PlanillasHorariasForm', N'lblNumeroDePlanilla', N'N° de planilla')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PlanillasHorariasForm', N'lblRecorrido', N'Recorrido')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PlanillasHorariasForm', N'lblUltimaPlanillaInfo', N'Las últimas planillas generadas corresponden al día {0}.')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PlanillasHorariasForm', N'msgConfirmacionGenerarPlanillas', N'Se van a generar las planillas horarias para el día mencionado. ¿Continuar?')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PlanillasHorariasForm', N'msgErrorAlGenerarPlanillas', N'Ocurrió un error al generar las planillas horarias. Por favor contacte al administrador del sistema')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PlanillasHorariasForm', N'msgGeneracionPlanillasOk', N'Las planillas horarias se generaron correctamente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PlanillasHorariasForm', N'msgNoHayPlanillas', N'Todavía no hay planillas horarias creadas')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'PlanillasHorariasForm', N'PlanillasHorariasForm', N'Planillas Horarias')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuarioHistorialForm', N'btnBuscar', N'Buscar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuarioHistorialForm', N'colContraseniaEncriptada', N'Contraseña encriptada')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuarioHistorialForm', N'colFecha', N'Fecha')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuarioHistorialForm', N'colHabilitado', N'Habilitado')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuarioHistorialForm', N'colIdioma', N'Idioma')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuarioHistorialForm', N'colIdUsuario', N'ID Usuario')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuarioHistorialForm', N'colNombre', N'Nombre')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuarioHistorialForm', N'colNombreUsuario', N'Nombre de usuario')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuarioHistorialForm', N'colPermisos', N'Permisos')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuarioHistorialForm', N'grpFiltros', N'Filtros')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuarioHistorialForm', N'lblFecha', N'Fecha')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuarioHistorialForm', N'lblFechaA', N'a')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuarioHistorialForm', N'lblNombre', N'Nombre')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuarioHistorialForm', N'lblNombreDeUsuario', N'Nombre de usuario')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuarioHistorialForm', N'UsuarioHistorialForm', N'Control de cambios de usuarios')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuariosForm', N'btnCrearNuevo', N'Crear nuevo')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuariosForm', N'btnDescartar', N'Descartar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuariosForm', N'btnEditar', N'Editar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuariosForm', N'btnEliminar', N'Eliminar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuariosForm', N'btnGuardar', N'Guardar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuariosForm', N'grpDetalles', N'Detalles')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuariosForm', N'grpInfoLogin', N'Información de inicio de sesión')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuariosForm', N'lblContrasenia', N'Contraseña')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuariosForm', N'lblIdiomaPreferido', N'Idioma preferido')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuariosForm', N'lblNombre', N'Nombre')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuariosForm', N'lblNombreUsuario', N'Nombre de usuario')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuariosForm', N'lblPermisos', N'Permisos')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuariosForm', N'lblRepetirContrasenia', N'Repetir contraseña')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuariosForm', N'lblUsuariosActuales', N'Usuarios actuales')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuariosForm', N'msgConfContrasenia', N'Los campos de contraseña y repetir contraseña no coinciden')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuariosForm', N'msgConfContraseniaTitulo', N'Contraseña')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuariosForm', N'msgConfEliminar', N'¿Está seguro que desea eliminar el usuario seleccionado?')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuariosForm', N'msgConfEliminarTitulo', N'Eliminar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuariosForm', N'msgDescartar', N'Está a punto de descartar los cambios. ¿Desea continuar?')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuariosForm', N'msgDescartarTitulo', N'Descartar cambios')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuariosForm', N'msgEliminado', N'El usuario se eliminó correctamente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuariosForm', N'msgEliminadoTitulo', N'Eliminado')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuariosForm', N'msgGuardado', N'Usuario guardado correctamente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuariosForm', N'msgGuardadoTitulo', N'Guardado')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuariosForm', N'msgIncompleto', N'Por favor complete los campos requeridos')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'UsuariosForm', N'msgIncompletoTitulo', N'Datos incompletos')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'VehiculosForm', N'btnBuscar', N'Buscar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'VehiculosForm', N'btnDescartar', N'Descartar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'VehiculosForm', N'btnEditar', N'Editar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'VehiculosForm', N'btnEliminar', N'Eliminar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'VehiculosForm', N'btnGuardar', N'Guardar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'VehiculosForm', N'btnNuevo', N'Nuevo')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'VehiculosForm', N'chkEnCirculacionBusqueda', N'En circulación')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'VehiculosForm', N'chkEnCirculacionDetalles', N'En circulación')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'VehiculosForm', N'grpBuscarCoches', N'Buscar coches')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'VehiculosForm', N'grpDetalles', N'Detalles')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'VehiculosForm', N'lblAnioFabricacion', N'Año de fabricación')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'VehiculosForm', N'lblCapacidad', N'Capacidad')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'VehiculosForm', N'lblFechaAdquisicion', N'Fecha de adquisición')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'VehiculosForm', N'lblMarca', N'Marca')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'VehiculosForm', N'lblModelo', N'Modelo')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'VehiculosForm', N'lblNumeroDeInterno', N'Número de interno')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'VehiculosForm', N'lblNumeroDeInternoDetalles', N'Número de interno')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'VehiculosForm', N'lblPatente', N'Patente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'VehiculosForm', N'lblPatenteDetalles', N'Patente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'VehiculosForm', N'lblResultadoBusqueda', N'Resultado de la búsqueda')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'VehiculosForm', N'msgCompletarCampos', N'Complete todos los campos antes de guardar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'VehiculosForm', N'msgCompletarCamposTitulo', N'Error')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'VehiculosForm', N'msgVehiculoBorrado', N'El vehículo se borró correctamente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'VehiculosForm', N'msgVehiculoGuardado', N'El vehículo se guardó con éxito')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (1, N'VehiculosForm', N'VehiculosForm', N'Vehículos')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'BackupForm', N'BackupForm', N'Backup')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'BackupForm', N'btnCrearBackup', N'Create backup')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'BackupForm', N'btnExaminarRestaurar', N'Examine...')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'BackupForm', N'btnRestaurarBackup', N'Restore backup')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'BackupForm', N'grpCrearBackup', N'Create backup')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'BackupForm', N'grpRestaurarBackup', N'Restore backup')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'BackupForm', N'lblUbicacionRestaurarBackup', N'Indique la ubicación de la copia de seguridad que desea restaurar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'BackupForm', N'msgArchivoBackupInvalido', N'El archivo seleccionado es inválido. Por favor seleccione una copia de seguridad generada por esta aplicación')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'BackupForm', N'msgArchivoBackupInvalidoTitulo', N'Invalid file')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'BackupForm', N'msgBackupCreado', N'La copia de seguridad se realizó satisfactoriamente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'BackupForm', N'msgBackupCreadoTitulo', N'Completed')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'BackupForm', N'msgConfirmacionRestaurar', N'Está a punto de restaurar una copia de seguridad. Todas las modificaciones realizadas con posterioridad a la copia de seguridad se perderán. ¿Está seguro que quiere continuar?')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'BackupForm', N'msgConfirmacionRestaurarTitulo', N'Confirmación')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'BackupForm', N'msgPruebaDVMal', N'No se puede crear una copia de seguridad porque la base de datos no pasó la prueba de integridad. Contacte al administrador del sistema.')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'BackupForm', N'msgRestauracionCompleta', N'La copia de seguridad fue restaurada con éxito. Se cerrará la sesión.')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'BackupForm', N'msgRestauracionCompletaTitulo', N'Finalizado')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'BackupForm', N'msgUbicacionVaciaCrear', N'Seleccione una ubicación y nombre de archivo para guardar la copia de seguridad')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'BackupForm', N'msgUbicacionVaciaCrearTitulo', N'Ubicación requerida')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'BitacoraForm', N'BitacoraForm', N'Log')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'BitacoraForm', N'colDetalle', N'Detail')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'BitacoraForm', N'colFecha', N'Date')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'BitacoraForm', N'colUsuario', N'User')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'BitacoraForm', N'grpFiltros', N'Filters')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'BitacoraForm', N'lblFechaFin', N'End date')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'BitacoraForm', N'lblFechaInicio', N'Start data')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'BitacoraForm', N'lblParteDelTexto', N'Part of the text')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'BitacoraForm', N'lblUsuario', N'User')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'ChoferesForm', N'btnBuscar', N'Buscar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'ChoferesForm', N'btnCargarLicencia', N'Cargar licencia')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'ChoferesForm', N'btnDescartar', N'Descartar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'ChoferesForm', N'btnEditar', N'Editar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'ChoferesForm', N'btnEliminar', N'Eliminar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'ChoferesForm', N'btnGuardarChofer', N'Guardar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'ChoferesForm', N'btnGuardarLicencia', N'Guardar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'ChoferesForm', N'btnNuevo', N'Nuevo')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'ChoferesForm', N'ChoferesForm', N'Choferes')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'ChoferesForm', N'grpBuscarChoferes', N'Buscar choferes')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'ChoferesForm', N'grpDetalles', N'Detalles')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'ChoferesForm', N'grpLicencias', N'Licencias')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'ChoferesForm', N'lblCochePreferidoBusqueda', N'Coche preferido')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'ChoferesForm', N'lblCochePreferidoDetalle', N'Coche preferido')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'ChoferesForm', N'lblDeLicencia', N'De licencia')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'ChoferesForm', N'lblDniBusqueda', N'DNI')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'ChoferesForm', N'lblDniDetalle', N'DNI')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'ChoferesForm', N'lblFechaFinLicencia', N'Fecha de fin de licencia')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'ChoferesForm', N'lblNombreBusqueda', N'Nombre')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'ChoferesForm', N'lblNombreDetalle', N'Nombre')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'ChoferesForm', N'lblResultadoBusqueda', N'Resultado de la búsqueda')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'ChoferesForm', N'msgChoferBorrado', N'El chofer se eliminó correctamente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'ChoferesForm', N'msgChoferGuardado', N'Los datos del chofer se guardaron con éxito')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'ChoferesForm', N'msgDniInvalido', N'El DNI ingresado no es válido')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'ChoferesForm', N'msgDniVacio', N'El DNI no puede estar vacío')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'ChoferesForm', N'msgLicenciaGuardada', N'La licencia se guardó correctamente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'ChoferesForm', N'msgNombreVacio', N'El nombre no puede estar vacío')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'ChoferesForm', N'optNo', N'No')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'ChoferesForm', N'optSi', N'Sí')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'IdiomasForm', N'btnCrearNuevo', N'Create new')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'IdiomasForm', N'btnDescartar', N'Discard')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'IdiomasForm', N'btnEditar', N'Edit')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'IdiomasForm', N'btnEliminar', N'Delete')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'IdiomasForm', N'btnGuardar', N'Save')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'IdiomasForm', N'colIdentifiador', N'Identifier')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'IdiomasForm', N'colTextoEspaniol', N'Text in Spanish')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'IdiomasForm', N'colTextoIdioma', N'Text in selected language')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'IdiomasForm', N'grpDetalles', N'Details')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'IdiomasForm', N'grpLeyendas', N'Caption')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'IdiomasForm', N'IdiomasForm', N'Languages')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'IdiomasForm', N'lblIdiomasActuales', N'Current languages')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'IdiomasForm', N'lblNombre', N'Name')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'IdiomasForm', N'msgCompletarDatos', N'Debe completar al menos el nombre del idioma para continuar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'IdiomasForm', N'msgCompletarDatosTitulo', N'Datos incompletos')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'IdiomasForm', N'msgEliminar', N'Estás a punto de eliminar el idioma seleccionado. ¿Estás seguro?')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'IdiomasForm', N'msgEliminarTitulo', N'Eliminar idioma')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'IdiomasForm', N'msgGuardado', N'Se guardó el idioma correctamente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'IdiomasForm', N'msgGuardadoTitulo', N'Guardado')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'IdiomasForm', N'msgPerderCambios', N'Está a punto de perder los cambios. ¿Desea continuar?')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'IdiomasForm', N'msgPerderCambiosTitulo', N'Cambios realizados')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'MainForm', N'MainForm', N'Transportes MJ')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'MainForm', N'mniAcercaDe', N'About...')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'MainForm', N'mniAdministrar', N'Admin')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'MainForm', N'mniAyuda', N'Help')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'MainForm', N'mniAyudaEnLinea', N'Online help')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'MainForm', N'mniChoferes', N'Driver')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'MainForm', N'mniCopiaDeSeguridad', N'Backup')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'MainForm', N'mniFicheroLeame', N'Readme file')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'MainForm', N'mniGestionar', N'Manage')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'MainForm', N'mniIdiomas', N'Languages')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'MainForm', N'mniLogout', N'Log out')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'MainForm', N'mniOpciones', N'Options')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'MainForm', N'mniPerfilesDeUsuario', N'User profiles')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'MainForm', N'mniPersonalizar', N'Customize')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'MainForm', N'mniPlanillasHorarias', N'Time sheets')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'MainForm', N'mniSalir', N'Quit')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'MainForm', N'mniSistema', N'System')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'MainForm', N'mniUsuarios', N'Users')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'MainForm', N'mniVehiculos', N'Vehicles')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'MainForm', N'mniVerBitacora', N'View log')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'MainForm', N'msgPruebaDVMal', N'La base de datos no pasó la prueba de integridad. Contacte al administrador del sistema.')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PerfilesForm', N'btnCrearNuevo', N'Create new')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PerfilesForm', N'btnEditar', N'Edit')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PerfilesForm', N'btnEliminar', N'Delete')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PerfilesForm', N'btnGuardar', N'Save')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PerfilesForm', N'grpDetalles', N'Details')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PerfilesForm', N'lblDescripcion', N'Description')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PerfilesForm', N'lblNombre', N'Name')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PerfilesForm', N'lblPerfilesActuales', N'Current profiles')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PerfilesForm', N'msgDatosIncompletos', N'Complete todos los datos antes de guardar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PerfilesForm', N'msgDatosIncompletosTitulo', N'Datos incompletos')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PerfilesForm', N'msgDescartar', N'Está a punto de descartar los cambios. ¿Desea continuar?')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PerfilesForm', N'msgDescartarTitulo', N'Descartar cambios')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PerfilesForm', N'msgEliminar', N'¿Está seguro que desea eliminar el perfil?')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PerfilesForm', N'msgEliminarTitulo', N'Eliminar perfil')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PerfilesForm', N'msgGuardado', N'Perfil guardado correctamente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PerfilesForm', N'msgGuardadoTitulo', N'Guardado')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PerfilesForm', N'PerfilesForm', N'Profiles')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PersonalizacionForm', N'btnAceptar', N'OK')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PersonalizacionForm', N'btnCancelar', N'Cancel')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PersonalizacionForm', N'grpIdioma', N'Language')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PersonalizacionForm', N'lblIdioma', N'Language')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PersonalizacionForm', N'PersonalizacionForm', N'Customize')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PlanillasHorariasForm', N'btnBuscar', N'Buscar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PlanillasHorariasForm', N'btnGenerarPlanillas', N'Generar planillas para el {0}')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PlanillasHorariasForm', N'colChofer', N'Chofer')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PlanillasHorariasForm', N'colCoche', N'Coche')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PlanillasHorariasForm', N'colDetalles', N'Detalles')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PlanillasHorariasForm', N'colFecha', N'Fecha')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PlanillasHorariasForm', N'colNumeroPlanilla', N'N° planilla')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PlanillasHorariasForm', N'colRecorrido', N'Recorrido')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PlanillasHorariasForm', N'grpBuscarPlanillas', N'Buscar planillas')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PlanillasHorariasForm', N'grpGenerarPlanillas', N'Generar planillas')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PlanillasHorariasForm', N'lblChofer', N'Chofer')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PlanillasHorariasForm', N'lblCoche', N'Coche')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PlanillasHorariasForm', N'lblFecha', N'Fecha')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PlanillasHorariasForm', N'lblNumeroDePlanilla', N'N° de planilla')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PlanillasHorariasForm', N'lblRecorrido', N'Recorrido')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PlanillasHorariasForm', N'lblUltimaPlanillaInfo', N'Las últimas planillas generadas corresponden al día {0}.')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PlanillasHorariasForm', N'msgConfirmacionGenerarPlanillas', N'Se van a generar las planillas horarias para el día mencionado. ¿Continuar?')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PlanillasHorariasForm', N'msgGeneracionPlanillasOk', N'Las planillas horarias se generaron correctamente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'PlanillasHorariasForm', N'PlanillasHorariasForm', N'Planillas Horarias')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'UsuariosForm', N'btnCrearNuevo', N'Create new')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'UsuariosForm', N'btnDescartar', N'Discard')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'UsuariosForm', N'btnEditar', N'Edit')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'UsuariosForm', N'btnEliminar', N'Delete')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'UsuariosForm', N'btnGuardar', N'Save')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'UsuariosForm', N'grpDetalles', N'Details')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'UsuariosForm', N'grpInfoLogin', N'Log in info')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'UsuariosForm', N'lblContrasenia', N'Password')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'UsuariosForm', N'lblIdiomaPreferido', N'Preferred language')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'UsuariosForm', N'lblNombre', N'Name')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'UsuariosForm', N'lblNombreUsuario', N'Username')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'UsuariosForm', N'lblPermisos', N'Permissions')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'UsuariosForm', N'lblRepetirContrasenia', N'Repeat password')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'UsuariosForm', N'lblUsuariosActuales', N'Current users')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'UsuariosForm', N'msgConfContrasenia', N'Los campos de contraseña y repetir contraseña no coinciden')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'UsuariosForm', N'msgConfContraseniaTitulo', N'Contraseña')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'UsuariosForm', N'msgConfEliminar', N'¿Está seguro que desea eliminar el usuario seleccionado?')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'UsuariosForm', N'msgConfEliminarTitulo', N'Eliminar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'UsuariosForm', N'msgDescartar', N'Está a punto de descartar los cambios. ¿Desea continuar?')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'UsuariosForm', N'msgDescartarTitulo', N'Descartar cambios')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'UsuariosForm', N'msgEliminado', N'El usuario se eliminó correctamente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'UsuariosForm', N'msgEliminadoTitulo', N'Eliminado')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'UsuariosForm', N'msgGuardado', N'Usuario guardado correctamente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'UsuariosForm', N'msgGuardadoTitulo', N'Guardado')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'UsuariosForm', N'msgIncompleto', N'Por favor complete los campos requeridos')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'UsuariosForm', N'msgIncompletoTitulo', N'Datos incompletos')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'VehiculosForm', N'btnBuscar', N'Buscar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'VehiculosForm', N'btnDescartar', N'Descartar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'VehiculosForm', N'btnEditar', N'Editar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'VehiculosForm', N'btnEliminar', N'Eliminar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'VehiculosForm', N'btnGuardar', N'Guardar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'VehiculosForm', N'btnNuevo', N'Nuevo')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'VehiculosForm', N'chkEnCirculacionBusqueda', N'En circulación')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'VehiculosForm', N'chkEnCirculacionDetalles', N'En circulación')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'VehiculosForm', N'grpBuscarCoches', N'Buscar coches')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'VehiculosForm', N'grpDetalles', N'Detalles')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'VehiculosForm', N'lblAnioFabricacion', N'Año de fabricación')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'VehiculosForm', N'lblCapacidad', N'Capacidad')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'VehiculosForm', N'lblFechaAdquisicion', N'Fecha de adquisición')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'VehiculosForm', N'lblMarca', N'Marca')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'VehiculosForm', N'lblModelo', N'Modelo')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'VehiculosForm', N'lblNumeroDeInterno', N'Número de interno')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'VehiculosForm', N'lblNumeroDeInternoDetalles', N'Número de interno')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'VehiculosForm', N'lblPatente', N'Patente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'VehiculosForm', N'lblPatenteDetalles', N'Patente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'VehiculosForm', N'lblResultadoBusqueda', N'Resultado de la búsqueda')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'VehiculosForm', N'msgCompletarCampos', N'Complete todos los campos antes de guardar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'VehiculosForm', N'msgCompletarCamposTitulo', N'Error')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'VehiculosForm', N'msgVehiculoBorrado', N'El vehículo se borró correctamente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'VehiculosForm', N'msgVehiculoGuardado', N'El vehículo se guardó con éxito')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (5, N'VehiculosForm', N'VehiculosForm', N'Vehículos')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'BackupForm', N'BackupForm', N'Lalalala')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'BackupForm', N'btnCrearBackup', N'Crear copia de seguridad')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'BackupForm', N'btnExaminarRestaurar', N'Examinar…')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'BackupForm', N'btnRestaurarBackup', N'Restaurar copia de seguridad')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'BackupForm', N'grpCrearBackup', N'Crear copia de seguridad')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'BackupForm', N'grpRestaurarBackup', N'Restaurar copia de seguridad')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'BackupForm', N'lblUbicacionRestaurarBackup', N'Indique la ubicación de la copia de seguridad que desea restaurar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'BackupForm', N'msgArchivoBackupInvalido', N'El archivo seleccionado es inválido. Por favor seleccione una copia de seguridad generada por esta aplicación')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'BackupForm', N'msgArchivoBackupInvalidoTitulo', N'Archivo inválido')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'BackupForm', N'msgBackupCreado', N'La copia de seguridad se realizó satisfactoriamente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'BackupForm', N'msgBackupCreadoTitulo', N'Completo')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'BackupForm', N'msgConfirmacionRestaurar', N'Está a punto de restaurar una copia de seguridad. Todas las modificaciones realizadas con posterioridad a la copia de seguridad se perderán. ¿Está seguro que quiere continuar?')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'BackupForm', N'msgConfirmacionRestaurarTitulo', N'Confirmación')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'BackupForm', N'msgPruebaDVMal', N'No se puede crear una copia de seguridad porque la base de datos no pasó la prueba de integridad. Contacte al administrador del sistema.')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'BackupForm', N'msgRestauracionCompleta', N'La copia de seguridad fue restaurada con éxito. Se cerrará la sesión.')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'BackupForm', N'msgRestauracionCompletaTitulo', N'Finalizado')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'BackupForm', N'msgUbicacionVaciaCrear', N'Seleccione una ubicación y nombre de archivo para guardar la copia de seguridad')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'BackupForm', N'msgUbicacionVaciaCrearTitulo', N'Ubicación requerida')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'BitacoraForm', N'BitacoraForm', N'Bitácora')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'BitacoraForm', N'colDetalle', N'Detalle')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'BitacoraForm', N'colFecha', N'Fecha')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'BitacoraForm', N'colUsuario', N'Usuario')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'BitacoraForm', N'grpFiltros', N'Filtros')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'BitacoraForm', N'lblFechaFin', N'Fecha fin')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'BitacoraForm', N'lblFechaInicio', N'Fecha inicio')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'BitacoraForm', N'lblParteDelTexto', N'Parte del texto')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'BitacoraForm', N'lblUsuario', N'Usuario')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'ChoferesForm', N'btnBuscar', N'Buscar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'ChoferesForm', N'btnCargarLicencia', N'Cargar licencia')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'ChoferesForm', N'btnDescartar', N'Descartar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'ChoferesForm', N'btnEditar', N'Editar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'ChoferesForm', N'btnEliminar', N'Eliminar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'ChoferesForm', N'btnGuardarChofer', N'Guardar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'ChoferesForm', N'btnGuardarLicencia', N'Guardar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'ChoferesForm', N'btnNuevo', N'Nuevo')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'ChoferesForm', N'ChoferesForm', N'Choferes')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'ChoferesForm', N'grpBuscarChoferes', N'Buscar choferes')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'ChoferesForm', N'grpDetalles', N'Detalles')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'ChoferesForm', N'grpLicencias', N'Licencias')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'ChoferesForm', N'lblCochePreferidoBusqueda', N'Coche preferido')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'ChoferesForm', N'lblCochePreferidoDetalle', N'Coche preferido')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'ChoferesForm', N'lblDeLicencia', N'De licencia')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'ChoferesForm', N'lblDniBusqueda', N'DNI')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'ChoferesForm', N'lblDniDetalle', N'DNI')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'ChoferesForm', N'lblFechaFinLicencia', N'Fecha de fin de licencia')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'ChoferesForm', N'lblNombreBusqueda', N'Nombre')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'ChoferesForm', N'lblNombreDetalle', N'Nombre')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'ChoferesForm', N'lblResultadoBusqueda', N'Resultado de la búsqueda')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'ChoferesForm', N'msgChoferBorrado', N'El chofer se eliminó correctamente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'ChoferesForm', N'msgChoferGuardado', N'Los datos del chofer se guardaron con éxito')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'ChoferesForm', N'msgDniInvalido', N'El DNI ingresado no es válido')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'ChoferesForm', N'msgDniVacio', N'El DNI no puede estar vacío')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'ChoferesForm', N'msgLicenciaGuardada', N'La licencia se guardó correctamente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'ChoferesForm', N'msgNombreVacio', N'El nombre no puede estar vacío')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'ChoferesForm', N'optNo', N'No')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'ChoferesForm', N'optSi', N'Sí')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'IdiomasForm', N'btnCrearNuevo', N'Crear nuevo')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'IdiomasForm', N'btnDescartar', N'Descartar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'IdiomasForm', N'btnEditar', N'Editar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'IdiomasForm', N'btnEliminar', N'Eliminar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'IdiomasForm', N'btnGuardar', N'Guardar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'IdiomasForm', N'colIdentifiador', N'Identificador')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'IdiomasForm', N'colTextoEspaniol', N'Texto en Español')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'IdiomasForm', N'colTextoIdioma', N'Texto en idioma seleccionado')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'IdiomasForm', N'grpDetalles', N'Detalles')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'IdiomasForm', N'grpLeyendas', N'Leyendas')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'IdiomasForm', N'IdiomasForm', N'Idiomas')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'IdiomasForm', N'lblIdiomasActuales', N'Idiomas actuales')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'IdiomasForm', N'lblNombre', N'Nombre')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'IdiomasForm', N'msgCompletarDatos', N'Debe completar al menos el nombre del idioma para continuar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'IdiomasForm', N'msgCompletarDatosTitulo', N'Datos incompletos')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'IdiomasForm', N'msgEliminar', N'Estás a punto de eliminar el idioma seleccionado. ¿Estás seguro?')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'IdiomasForm', N'msgEliminarTitulo', N'Eliminar idioma')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'IdiomasForm', N'msgGuardado', N'Se guardó el idioma correctamente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'IdiomasForm', N'msgGuardadoTitulo', N'Guardado')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'IdiomasForm', N'msgPerderCambios', N'Está a punto de perder los cambios. ¿Desea continuar?')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'IdiomasForm', N'msgPerderCambiosTitulo', N'Cambios realizados')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'MainForm', N'MainForm', N'Transportes MJ')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'MainForm', N'mniAcercaDe', N'Acerca de…')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'MainForm', N'mniAdministrar', N'Administrar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'MainForm', N'mniAyuda', N'Ayuda')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'MainForm', N'mniAyudaEnLinea', N'Ayuda en línea')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'MainForm', N'mniChoferes', N'Choferes')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'MainForm', N'mniCopiaDeSeguridad', N'Copia de seguridad')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'MainForm', N'mniFicheroLeame', N'Fichero léame')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'MainForm', N'mniGestionar', N'Gestionar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'MainForm', N'mniIdiomas', N'Idiomas')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'MainForm', N'mniLogout', N'Cerrar Sesión')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'MainForm', N'mniOpciones', N'Opciones')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'MainForm', N'mniPerfilesDeUsuario', N'Perfiles de usuario')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'MainForm', N'mniPersonalizar', N'Personalizar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'MainForm', N'mniPlanillasHorarias', N'Planillas horarias')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'MainForm', N'mniSalir', N'Salir del sistema')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'MainForm', N'mniSistema', N'Sistema')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'MainForm', N'mniUsuarios', N'Usuarios')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'MainForm', N'mniVehiculos', N'Vehículos')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'MainForm', N'mniVerBitacora', N'Ver bitácora')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'MainForm', N'msgPruebaDVMal', N'La base de datos no pasó la prueba de integridad. Contacte al administrador del sistema.')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PerfilesForm', N'btnAgregarFamilia', N'Agregar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PerfilesForm', N'btnAgregarPermiso', N'Agregar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PerfilesForm', N'btnCrearNuevo', N'Crear nuevo')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PerfilesForm', N'btnEditar', N'Editar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PerfilesForm', N'btnEliminar', N'Eliminar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PerfilesForm', N'btnGuardar', N'Guardar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PerfilesForm', N'btnQuitar', N'Quitar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PerfilesForm', N'grpDetalles', N'Detalles')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PerfilesForm', N'grpFamiliasPermisos', N'Agregar familias y permisos')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PerfilesForm', N'lblDescripcion', N'Descripción')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PerfilesForm', N'lblFamilias', N'Familias')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PerfilesForm', N'lblNombre', N'Nombre')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PerfilesForm', N'lblPerfilesActuales', N'Perfiles actuales')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PerfilesForm', N'lblPermisosAsignados', N'Permisos asignados')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PerfilesForm', N'lblPermisosIndividuales', N'Permisos individuales')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PerfilesForm', N'msgDatosIncompletos', N'Complete todos los datos antes de guardar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PerfilesForm', N'msgDatosIncompletosTitulo', N'Datos incompletos')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PerfilesForm', N'msgDescartar', N'Está a punto de descartar los cambios. ¿Desea continuar?')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PerfilesForm', N'msgDescartarTitulo', N'Descartar cambios')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PerfilesForm', N'msgEliminar', N'¿Está seguro que desea eliminar el perfil?')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PerfilesForm', N'msgEliminarTitulo', N'Eliminar perfil')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PerfilesForm', N'msgGuardado', N'Perfil guardado correctamente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PerfilesForm', N'msgGuardadoTitulo', N'Guardado')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PerfilesForm', N'PerfilesForm', N'Perfiles')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PersonalizacionForm', N'btnAceptar', N'Aceptar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PersonalizacionForm', N'btnCancelar', N'Cancelar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PersonalizacionForm', N'grpIdioma', N'Idioma')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PersonalizacionForm', N'lblIdioma', N'Idioma')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PersonalizacionForm', N'PersonalizacionForm', N'Personalizar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PlanillasHorariasForm', N'btnBuscar', N'Buscar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PlanillasHorariasForm', N'btnGenerarPlanillas', N'Generar planillas para el {0}')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PlanillasHorariasForm', N'colChofer', N'Chofer')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PlanillasHorariasForm', N'colCoche', N'Coche')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PlanillasHorariasForm', N'colDetalles', N'Detalles')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PlanillasHorariasForm', N'colFecha', N'Fecha')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PlanillasHorariasForm', N'colNumeroPlanilla', N'N° planilla')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PlanillasHorariasForm', N'colRecorrido', N'Recorrido')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PlanillasHorariasForm', N'grpBuscarPlanillas', N'Buscar planillas')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PlanillasHorariasForm', N'grpGenerarPlanillas', N'Generar planillas')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PlanillasHorariasForm', N'lblChofer', N'Chofer')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PlanillasHorariasForm', N'lblCoche', N'Coche')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PlanillasHorariasForm', N'lblFecha', N'Fecha')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PlanillasHorariasForm', N'lblNumeroDePlanilla', N'N° de planilla')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PlanillasHorariasForm', N'lblRecorrido', N'Recorrido')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PlanillasHorariasForm', N'lblUltimaPlanillaInfo', N'Las últimas planillas generadas corresponden al día {0}.')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PlanillasHorariasForm', N'msgConfirmacionGenerarPlanillas', N'Se van a generar las planillas horarias para el día mencionado. ¿Continuar?')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PlanillasHorariasForm', N'msgGeneracionPlanillasOk', N'Las planillas horarias se generaron correctamente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'PlanillasHorariasForm', N'PlanillasHorariasForm', N'Planillas Horarias')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'UsuariosForm', N'btnCrearNuevo', N'Crear nuevo')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'UsuariosForm', N'btnDescartar', N'Descartar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'UsuariosForm', N'btnEditar', N'Editar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'UsuariosForm', N'btnEliminar', N'Eliminar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'UsuariosForm', N'btnGuardar', N'Guardar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'UsuariosForm', N'grpDetalles', N'Detalles')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'UsuariosForm', N'grpInfoLogin', N'Información de inicio de sesión')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'UsuariosForm', N'lblContrasenia', N'Contraseña')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'UsuariosForm', N'lblIdiomaPreferido', N'Idioma preferido')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'UsuariosForm', N'lblNombre', N'Nombre')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'UsuariosForm', N'lblNombreUsuario', N'Nombre de usuario')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'UsuariosForm', N'lblPermisos', N'Permisos')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'UsuariosForm', N'lblRepetirContrasenia', N'Repetir contraseña')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'UsuariosForm', N'lblUsuariosActuales', N'Usuarios actuales')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'UsuariosForm', N'msgConfContrasenia', N'Los campos de contraseña y repetir contraseña no coinciden')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'UsuariosForm', N'msgConfContraseniaTitulo', N'Contraseña')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'UsuariosForm', N'msgConfEliminar', N'¿Está seguro que desea eliminar el usuario seleccionado?')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'UsuariosForm', N'msgConfEliminarTitulo', N'Eliminar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'UsuariosForm', N'msgDescartar', N'Está a punto de descartar los cambios. ¿Desea continuar?')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'UsuariosForm', N'msgDescartarTitulo', N'Descartar cambios')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'UsuariosForm', N'msgEliminado', N'El usuario se eliminó correctamente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'UsuariosForm', N'msgEliminadoTitulo', N'Eliminado')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'UsuariosForm', N'msgGuardado', N'Usuario guardado correctamente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'UsuariosForm', N'msgGuardadoTitulo', N'Guardado')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'UsuariosForm', N'msgIncompleto', N'Por favor complete los campos requeridos')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'UsuariosForm', N'msgIncompletoTitulo', N'Datos incompletos')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'VehiculosForm', N'btnBuscar', N'Buscar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'VehiculosForm', N'btnDescartar', N'Descartar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'VehiculosForm', N'btnEditar', N'Editar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'VehiculosForm', N'btnEliminar', N'Eliminar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'VehiculosForm', N'btnGuardar', N'Guardar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'VehiculosForm', N'btnNuevo', N'Nuevo')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'VehiculosForm', N'chkEnCirculacionBusqueda', N'En circulación')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'VehiculosForm', N'chkEnCirculacionDetalles', N'En circulación')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'VehiculosForm', N'grpBuscarCoches', N'Buscar coches')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'VehiculosForm', N'grpDetalles', N'Detalles')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'VehiculosForm', N'lblAnioFabricacion', N'Año de fabricación')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'VehiculosForm', N'lblCapacidad', N'Capacidad')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'VehiculosForm', N'lblFechaAdquisicion', N'Fecha de adquisición')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'VehiculosForm', N'lblMarca', N'Marca')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'VehiculosForm', N'lblModelo', N'Modelo')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'VehiculosForm', N'lblNumeroDeInterno', N'Número de interno')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'VehiculosForm', N'lblNumeroDeInternoDetalles', N'Número de interno')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'VehiculosForm', N'lblPatente', N'Patente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'VehiculosForm', N'lblPatenteDetalles', N'Patente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'VehiculosForm', N'lblResultadoBusqueda', N'Resultado de la búsqueda')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'VehiculosForm', N'msgCompletarCampos', N'Complete todos los campos antes de guardar')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'VehiculosForm', N'msgCompletarCamposTitulo', N'Error')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'VehiculosForm', N'msgVehiculoBorrado', N'El vehículo se borró correctamente')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'VehiculosForm', N'msgVehiculoGuardado', N'El vehículo se guardó con éxito')
GO
INSERT [dbo].[leyenda] ([idioma_id], [nombre_form], [nombre_control], [texto]) VALUES (8, N'VehiculosForm', N'VehiculosForm', N'Vehículos')
GO
SET IDENTITY_INSERT [dbo].[permiso] ON 
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (2, N'Admin del sistema', N'Perfil de administrador de las características no funcionales', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (3, N'Login', N'Permiso para que el usuario pueda loguearse', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (4, N'Ver perfiles', N'Ver perfiles actuales', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (5, N'Crear perfiles', N'Crear perfiles de usuario', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (6, N'Modificar perfiles', N'Modificar perfiles de usuario', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (7, N'Borrar perfiles', N'Eliminar perfiles de usuario', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (8, N'Administrar perfiles', N'Administración completa de perfiles de usuario', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (9, N'Gestionar backups', N'Realizar backups de la base de datos y restaurarlos', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (10, N'Ver idiomas', N'Ver idiomas actuales', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (11, N'Crear idiomas', N'Dar de alta nuevos idiomas en el sistema', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (12, N'Modificar idiomas', N'Modificar idiomas existentes en el sistema', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (13, N'Borrar idiomas', N'Eliminar un idioma del sistema', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (14, N'Administrar idiomas', N'Administración completa de idiomas del sistema', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (15, N'Ver usuarios', N'Ver usuarios del sistema', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (16, N'Crear usuarios', N'Dar de alta nuevos usuarios en el sistema', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (17, N'Modificar usuarios', N'Modificar usuarios existentes en el sistema', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (18, N'Borrar usuarios', N'Eliminar un usuario del sistema', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (19, N'Administrar usuarios', N'Administración completa de usuarios del sistema', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (20, N'Ver bitácora', N'Ver bitácora del sistema', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (21, N'Admin del negocio', N'Perfil de administrador de las características funcionales', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (22, N'Ver planillas', N'Ver planillas horarias de los recorridos', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (23, N'Imprimir planillas', N'Imprimir planillas horarias de los recorridos', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (24, N'Generar planillas', N'Generar nuevas planillas horarias de los recorridos', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (25, N'Completar planillas', N'Completar datos de planillas horarias ya existentes', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (26, N'Administrar planillas horarias', N'Administración completa de las planillas horaias', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (27, N'Ver vehículos', N'Ver vehículos registrados en el sistema', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (28, N'Alta vehículos', N'Dar de alta nuevos vehículos en el sistema', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (29, N'Modificar vehículos', N'Modificar vehículos existentes en el sistema', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (30, N'Baja vehículos', N'Dar de baja vehículos del sistema', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (31, N'Administrar vehículos', N'Administración completa de los vehículos', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (32, N'Ver choferes', N'Ver choferes registrados en el sistema', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (33, N'Alta choferes', N'Dar de alta nuevos choferes en el sistema', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (34, N'Modificar choferes', N'Modificar choferes existentes en el sistema', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (35, N'Baja choferes', N'Dar de baja choferes del sistema', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (36, N'Administrar choferes', N'Administración completa de los choferes', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (37, N'Perfil de prueba 2', N'Perfil creado solamente para probar 2', 0)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (38, N'Otro perfil', N'perfil de prueba 2', 0)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (39, N'Perfil de prueba', N'Perfil creado solamente para probar', 0)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (40, N'Otro perfil 3', N'perfil de prueba 2', 0)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (41, N'Test', N'asdfdsafas', 0)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (42, N'Test 2', N'adsasd', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (43, N'Prueba 2', N'Probando desarrollo', 0)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (44, N'asfadsfas2', N'safadsfa2', 0)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (45, N'Ver control de cambios', N'Ver el historial de cambios de los usuarios del sistema', 1)
GO
INSERT [dbo].[permiso] ([id], [nombre], [descripcion], [habilitado]) VALUES (46, N'Pruebaaa', N'Para probar', 0)
GO
SET IDENTITY_INSERT [dbo].[permiso] OFF
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (2, 3)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (2, 8)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (2, 9)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (2, 14)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (2, 19)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (2, 20)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (2, 45)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (8, 4)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (8, 5)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (8, 6)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (8, 7)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (14, 10)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (14, 11)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (14, 12)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (14, 13)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (19, 15)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (19, 16)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (19, 17)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (19, 18)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (21, 3)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (21, 26)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (21, 31)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (21, 36)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (26, 22)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (26, 23)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (26, 24)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (26, 25)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (31, 27)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (31, 28)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (31, 29)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (31, 30)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (36, 32)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (36, 33)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (36, 34)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (36, 35)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (37, 3)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (37, 14)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (37, 22)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (37, 31)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (38, 3)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (38, 11)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (38, 20)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (38, 26)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (39, 14)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (39, 22)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (39, 31)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (40, 3)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (40, 11)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (40, 20)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (40, 26)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (41, 11)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (41, 12)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (41, 26)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (41, 28)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (41, 33)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (42, 23)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (42, 26)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (42, 29)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (43, 3)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (43, 8)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (43, 9)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (43, 14)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (43, 20)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (44, 12)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (44, 19)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (44, 27)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (44, 43)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (46, 2)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (46, 3)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (46, 27)
GO
INSERT [dbo].[permiso_permiso] ([permiso_padre_id], [permiso_hijo_id]) VALUES (46, 36)
GO
SET IDENTITY_INSERT [dbo].[planilla_horaria] ON 
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (979, 1, 4, 1, CAST(N'2019-11-24' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (980, 2, 4, 1, CAST(N'2019-11-24' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (981, 3, 5, 1, CAST(N'2019-11-24' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (982, 4, 5, 1, CAST(N'2019-11-24' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (983, 5, 6, 1, CAST(N'2019-11-24' AS Date), CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (984, 6, 6, 1, CAST(N'2019-11-24' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (985, 7, 7, 1, CAST(N'2019-11-24' AS Date), CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (986, 8, 7, 1, CAST(N'2019-11-24' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (987, 9, 8, 1, CAST(N'2019-11-24' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (988, 10, 8, 1, CAST(N'2019-11-24' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (989, 11, 9, 1, CAST(N'2019-11-24' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (990, 12, 9, 1, CAST(N'2019-11-24' AS Date), CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (991, 13, 10, 2, CAST(N'2019-11-24' AS Date), CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (992, 14, 10, 2, CAST(N'2019-11-24' AS Date), CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (993, 15, 11, 2, CAST(N'2019-11-24' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (994, 16, 11, 2, CAST(N'2019-11-24' AS Date), CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (995, 17, 12, 2, CAST(N'2019-11-24' AS Date), CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (996, 18, 12, 2, CAST(N'2019-11-24' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (997, 19, 13, 2, CAST(N'2019-11-24' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (998, 20, 13, 2, CAST(N'2019-11-24' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (999, 21, 14, 2, CAST(N'2019-11-24' AS Date), CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1000, 22, 14, 2, CAST(N'2019-11-24' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1001, 23, 15, 2, CAST(N'2019-11-24' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1002, 24, 15, 2, CAST(N'2019-11-24' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1003, 25, 1, 3, CAST(N'2019-11-24' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1004, 26, 1, 3, CAST(N'2019-11-24' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1005, 27, 16, 3, CAST(N'2019-11-24' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1006, 28, 16, 3, CAST(N'2019-11-24' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1007, 29, 2, 3, CAST(N'2019-11-24' AS Date), CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1008, 30, 2, 3, CAST(N'2019-11-24' AS Date), CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1009, 31, 17, 3, CAST(N'2019-11-24' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1010, 32, 17, 3, CAST(N'2019-11-24' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1011, 33, 3, 3, CAST(N'2019-11-24' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1012, 34, 3, 3, CAST(N'2019-11-24' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1013, 35, 18, 3, CAST(N'2019-11-24' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1014, 36, 18, 3, CAST(N'2019-11-24' AS Date), CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1015, 37, 19, 4, CAST(N'2019-11-24' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1016, 38, 19, 4, CAST(N'2019-11-24' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1017, 39, 20, 4, CAST(N'2019-11-24' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1018, 40, 20, 4, CAST(N'2019-11-24' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1019, 41, 21, 4, CAST(N'2019-11-24' AS Date), CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1020, 42, 21, 4, CAST(N'2019-11-24' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1021, 43, 22, 4, CAST(N'2019-11-24' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1022, 44, 22, 4, CAST(N'2019-11-24' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1023, 45, 23, 4, CAST(N'2019-11-24' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1024, 46, 23, 4, CAST(N'2019-11-24' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1025, 47, 24, 4, CAST(N'2019-11-24' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1026, 48, 24, 4, CAST(N'2019-11-24' AS Date), CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1027, 1, 5, 1, CAST(N'2019-11-25' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1028, 2, 5, 1, CAST(N'2019-11-25' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1029, 3, 4, 1, CAST(N'2019-11-25' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1030, 4, 4, 1, CAST(N'2019-11-25' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1031, 5, 7, 1, CAST(N'2019-11-25' AS Date), CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1032, 6, 7, 1, CAST(N'2019-11-25' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1033, 7, 6, 1, CAST(N'2019-11-25' AS Date), CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1034, 8, 6, 1, CAST(N'2019-11-25' AS Date), CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1035, 9, 9, 1, CAST(N'2019-11-25' AS Date), CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1036, 10, 9, 1, CAST(N'2019-11-25' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1037, 11, 8, 1, CAST(N'2019-11-25' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1038, 12, 8, 1, CAST(N'2019-11-25' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1039, 13, 11, 2, CAST(N'2019-11-25' AS Date), CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1040, 14, 11, 2, CAST(N'2019-11-25' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1041, 15, 10, 2, CAST(N'2019-11-25' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1042, 16, 10, 2, CAST(N'2019-11-25' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1043, 17, 13, 2, CAST(N'2019-11-25' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1044, 18, 13, 2, CAST(N'2019-11-25' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1045, 19, 12, 2, CAST(N'2019-11-25' AS Date), CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1046, 20, 12, 2, CAST(N'2019-11-25' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1047, 21, 15, 2, CAST(N'2019-11-25' AS Date), CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1048, 22, 15, 2, CAST(N'2019-11-25' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1049, 23, 14, 2, CAST(N'2019-11-25' AS Date), CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1050, 24, 14, 2, CAST(N'2019-11-25' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1051, 25, 16, 3, CAST(N'2019-11-25' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1052, 26, 16, 3, CAST(N'2019-11-25' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1053, 27, 1, 3, CAST(N'2019-11-25' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1054, 28, 1, 3, CAST(N'2019-11-25' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1055, 29, 17, 3, CAST(N'2019-11-25' AS Date), CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1056, 30, 17, 3, CAST(N'2019-11-25' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1057, 31, 2, 3, CAST(N'2019-11-25' AS Date), CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1058, 32, 2, 3, CAST(N'2019-11-25' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1059, 33, 18, 3, CAST(N'2019-11-25' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1060, 34, 18, 3, CAST(N'2019-11-25' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1061, 35, 3, 3, CAST(N'2019-11-25' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1062, 36, 3, 3, CAST(N'2019-11-25' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1063, 37, 20, 4, CAST(N'2019-11-25' AS Date), CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1064, 38, 20, 4, CAST(N'2019-11-25' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1065, 39, 19, 4, CAST(N'2019-11-25' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1066, 40, 19, 4, CAST(N'2019-11-25' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1067, 41, 22, 4, CAST(N'2019-11-25' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1068, 42, 22, 4, CAST(N'2019-11-25' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1069, 43, 21, 4, CAST(N'2019-11-25' AS Date), CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1070, 44, 21, 4, CAST(N'2019-11-25' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1071, 45, 24, 4, CAST(N'2019-11-25' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1072, 46, 24, 4, CAST(N'2019-11-25' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1073, 47, 23, 4, CAST(N'2019-11-25' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (1074, 48, 23, 4, CAST(N'2019-11-25' AS Date), CAST(6 AS Numeric(1, 0)))
GO
SET IDENTITY_INSERT [dbo].[planilla_horaria] OFF
GO
INSERT [dbo].[recorrido] ([id], [linea], [ramal], [terminal_inicio_id], [terminal_fin_id]) VALUES (1, 219, N'3 negro', 2, 4)
GO
INSERT [dbo].[recorrido] ([id], [linea], [ramal], [terminal_inicio_id], [terminal_fin_id]) VALUES (2, 219, N'3 rojo', 3, 4)
GO
INSERT [dbo].[recorrido] ([id], [linea], [ramal], [terminal_inicio_id], [terminal_fin_id]) VALUES (3, 324, NULL, 1, 5)
GO
INSERT [dbo].[recorrido] ([id], [linea], [ramal], [terminal_inicio_id], [terminal_fin_id]) VALUES (4, 159, N'L', 2, 5)
GO
INSERT [dbo].[terminal] ([id], [nombre], [direccion], [latitud], [longitud]) VALUES (1, N'Casa central', N'Av. 14 469, Berazategui, Buenos Aires', CAST(-34.784921 AS Decimal(9, 6)), CAST(-58.252873 AS Decimal(9, 6)))
GO
INSERT [dbo].[terminal] ([id], [nombre], [direccion], [latitud], [longitud]) VALUES (2, N'Gutiérrez', N'Calle 413 75, J. M. Gutiérrez, Berazategui, Buenos Aires', CAST(-34.839628 AS Decimal(9, 6)), CAST(-58.188574 AS Decimal(9, 6)))
GO
INSERT [dbo].[terminal] ([id], [nombre], [direccion], [latitud], [longitud]) VALUES (3, N'El Carmen', N'Calle 129 7450, J. M. Gutiérrez, Berazategui, Buenos Aires', CAST(-34.824654 AS Decimal(9, 6)), CAST(-58.168584 AS Decimal(9, 6)))
GO
INSERT [dbo].[terminal] ([id], [nombre], [direccion], [latitud], [longitud]) VALUES (4, N'Quilmes', N'Gaboto 620, Quilmes, Buenos Aires', CAST(-34.724016 AS Decimal(9, 6)), CAST(-58.260635 AS Decimal(9, 6)))
GO
INSERT [dbo].[terminal] ([id], [nombre], [direccion], [latitud], [longitud]) VALUES (5, N'Don Bosco', N'Ramos Mejía 102, Don Bosco, Buenos Aires', CAST(-34.699979 AS Decimal(9, 6)), CAST(-58.298530 AS Decimal(9, 6)))
GO
SET IDENTITY_INSERT [dbo].[usuario] ON 
GO
INSERT [dbo].[usuario] ([id], [nombre], [idioma_id], [nombre_usuario], [contrasenia], [habilitado]) VALUES (1, N'Administrador', 1, N'admin', N'hCVSu+oS1AOpATVrG+BVRWTCQAKpGx9uyA+Tl+Tg6gQ=', 1)
GO
INSERT [dbo].[usuario] ([id], [nombre], [idioma_id], [nombre_usuario], [contrasenia], [habilitado]) VALUES (2, N'Admin negocio', 1, N'adminneg', N'hCVSu+oS1AOpATVrG+BVRWTCQAKpGx9uyA+Tl+Tg6gQ=', 1)
GO
INSERT [dbo].[usuario] ([id], [nombre], [idioma_id], [nombre_usuario], [contrasenia], [habilitado]) VALUES (3, N'Prueba 2', 1, N'prueba2', N'D1TRMuu+4YnCSUq+G5tUX3jutKjovFLPqbFf6vYssbw=', 0)
GO
INSERT [dbo].[usuario] ([id], [nombre], [idioma_id], [nombre_usuario], [contrasenia], [habilitado]) VALUES (4, N'Prueba', 1, N'test', N'D1TRMuu+4YnCSUq+G5tUX3jutKjovFLPqbFf6vYssbw=', 0)
GO
INSERT [dbo].[usuario] ([id], [nombre], [idioma_id], [nombre_usuario], [contrasenia], [habilitado]) VALUES (5, N'test 2a', 1, N'test2', N'D1TRMuu+4YnCSUq+G5tUX3jutKjovFLPqbFf6vYssbw=', 0)
GO
INSERT [dbo].[usuario] ([id], [nombre], [idioma_id], [nombre_usuario], [contrasenia], [habilitado]) VALUES (6, N'test3a', 1, N'test3', N'0BTZbt0gILPq5JBFqTbc5TKB9K7L5gDIc/lVA1LELFs=', 0)
GO
INSERT [dbo].[usuario] ([id], [nombre], [idioma_id], [nombre_usuario], [contrasenia], [habilitado]) VALUES (7, N'test4a', 1, N'test4', N'fLVYGbX+3yBKndKXEaaQzYCjDMW7uTR5CprT58rynZk=', 0)
GO
INSERT [dbo].[usuario] ([id], [nombre], [idioma_id], [nombre_usuario], [contrasenia], [habilitado]) VALUES (8, N'test5', 1, N'test5', N'x+8vwLcMPnF+s36aLzSICWluQyhHCCFb3GyF0vXIMpw=', 0)
GO
INSERT [dbo].[usuario] ([id], [nombre], [idioma_id], [nombre_usuario], [contrasenia], [habilitado]) VALUES (9, N'Administrador 2', 1, N'admin2', N'hCVSu+oS1AOpATVrG+BVRWTCQAKpGx9uyA+Tl+Tg6gQ=', 1)
GO
SET IDENTITY_INSERT [dbo].[usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[usuario_historial] ON 
GO
INSERT [dbo].[usuario_historial] ([id], [fecha], [id_usuario], [nombre], [idioma], [nombre_usuario], [contrasenia], [permisos], [habilitado]) VALUES (1, CAST(N'2019-10-13T11:21:17.763' AS DateTime), 2, N'Admin negocio', N'Español', N'adminneg', N'', N'Permiso para que el usuario pueda loguearse,Perfil de administrador de las características funcionales,Permiso para que el usuario pueda loguearse', 0)
GO
INSERT [dbo].[usuario_historial] ([id], [fecha], [id_usuario], [nombre], [idioma], [nombre_usuario], [contrasenia], [permisos], [habilitado]) VALUES (2, CAST(N'2019-10-13T11:42:25.183' AS DateTime), 0, N'Prueba', N'Español', N'test', N'D1TRMuu+4YnCSUq+G5tUX3jutKjovFLPqbFf6vYssbw=', N'Administrar vehículos, Administrar choferes', 1)
GO
INSERT [dbo].[usuario_historial] ([id], [fecha], [id_usuario], [nombre], [idioma], [nombre_usuario], [contrasenia], [permisos], [habilitado]) VALUES (3, CAST(N'2019-10-13T11:44:51.837' AS DateTime), 5, N'test 2', N'Español', N'test2', N'D1TRMuu+4YnCSUq+G5tUX3jutKjovFLPqbFf6vYssbw=', N'Administrar planillas horarias', 1)
GO
INSERT [dbo].[usuario_historial] ([id], [fecha], [id_usuario], [nombre], [idioma], [nombre_usuario], [contrasenia], [permisos], [habilitado]) VALUES (4, CAST(N'2019-10-13T11:45:16.063' AS DateTime), 5, N'test 2a', N'Español', N'test2', N'', N'Administrar planillas horarias, Administrar planillas horarias, Administrar planillas horarias', 1)
GO
INSERT [dbo].[usuario_historial] ([id], [fecha], [id_usuario], [nombre], [idioma], [nombre_usuario], [contrasenia], [permisos], [habilitado]) VALUES (5, CAST(N'2019-10-13T11:50:39.060' AS DateTime), 6, N'test3', N'Español', N'test3', N'0BTZbt0gILPq5JBFqTbc5TKB9K7L5gDIc/lVA1LELFs=', N'Administrar choferes', 1)
GO
INSERT [dbo].[usuario_historial] ([id], [fecha], [id_usuario], [nombre], [idioma], [nombre_usuario], [contrasenia], [permisos], [habilitado]) VALUES (6, CAST(N'2019-10-13T11:51:19.310' AS DateTime), 6, N'test3a', N'Español', N'test3', N'', N'Administrar choferes, Administrar choferes', 1)
GO
INSERT [dbo].[usuario_historial] ([id], [fecha], [id_usuario], [nombre], [idioma], [nombre_usuario], [contrasenia], [permisos], [habilitado]) VALUES (7, CAST(N'2019-10-13T11:53:10.180' AS DateTime), 6, N'test3a', N'Español', N'test3', N'', N'Administrar choferes', 0)
GO
INSERT [dbo].[usuario_historial] ([id], [fecha], [id_usuario], [nombre], [idioma], [nombre_usuario], [contrasenia], [permisos], [habilitado]) VALUES (8, CAST(N'2019-10-13T11:54:25.527' AS DateTime), 7, N'test4', N'Español', N'test4', N'fLVYGbX+3yBKndKXEaaQzYCjDMW7uTR5CprT58rynZk=', N'Administrar perfiles', 1)
GO
INSERT [dbo].[usuario_historial] ([id], [fecha], [id_usuario], [nombre], [idioma], [nombre_usuario], [contrasenia], [permisos], [habilitado]) VALUES (9, CAST(N'2019-10-13T12:16:10.870' AS DateTime), 7, N'test4a', N'Español', N'test4', N'', N'Administrar perfiles', 1)
GO
INSERT [dbo].[usuario_historial] ([id], [fecha], [id_usuario], [nombre], [idioma], [nombre_usuario], [contrasenia], [permisos], [habilitado]) VALUES (10, CAST(N'2019-10-13T12:17:34.617' AS DateTime), 8, N'test5', N'Español', N'test5', N'x+8vwLcMPnF+s36aLzSICWluQyhHCCFb3GyF0vXIMpw=', N'', 1)
GO
INSERT [dbo].[usuario_historial] ([id], [fecha], [id_usuario], [nombre], [idioma], [nombre_usuario], [contrasenia], [permisos], [habilitado]) VALUES (11, CAST(N'2019-10-13T12:17:55.423' AS DateTime), 8, N'test5', N'Español', N'test5', N'', N'', 0)
GO
INSERT [dbo].[usuario_historial] ([id], [fecha], [id_usuario], [nombre], [idioma], [nombre_usuario], [contrasenia], [permisos], [habilitado]) VALUES (12, CAST(N'2019-10-13T12:18:07.137' AS DateTime), 7, N'test4a', N'Español', N'test4', N'', N'Administrar perfiles', 0)
GO
INSERT [dbo].[usuario_historial] ([id], [fecha], [id_usuario], [nombre], [idioma], [nombre_usuario], [contrasenia], [permisos], [habilitado]) VALUES (13, CAST(N'2019-10-29T21:38:36.793' AS DateTime), 9, N'Administrador 2', N'Español', N'admin2', N'hCVSu+oS1AOpATVrG+BVRWTCQAKpGx9uyA+Tl+Tg6gQ=', N'Admin del sistema', 1)
GO
INSERT [dbo].[usuario_historial] ([id], [fecha], [id_usuario], [nombre], [idioma], [nombre_usuario], [contrasenia], [permisos], [habilitado]) VALUES (14, CAST(N'2019-11-03T14:38:00.187' AS DateTime), 1, N'Administrador', N'English', N'admin', N'', N'Admin del sistema, Admin del negocio', 1)
GO
INSERT [dbo].[usuario_historial] ([id], [fecha], [id_usuario], [nombre], [idioma], [nombre_usuario], [contrasenia], [permisos], [habilitado]) VALUES (15, CAST(N'2019-11-03T14:38:07.907' AS DateTime), 1, N'Administrador', N'Español', N'admin', N'', N'Admin del sistema, Admin del negocio', 1)
GO
INSERT [dbo].[usuario_historial] ([id], [fecha], [id_usuario], [nombre], [idioma], [nombre_usuario], [contrasenia], [permisos], [habilitado]) VALUES (16, CAST(N'2019-11-03T16:09:14.037' AS DateTime), 9, N'Administrador 2', N'Español', N'admin2', N'', N'Admin del sistema', 1)
GO
INSERT [dbo].[usuario_historial] ([id], [fecha], [id_usuario], [nombre], [idioma], [nombre_usuario], [contrasenia], [permisos], [habilitado]) VALUES (17, CAST(N'2019-11-10T12:28:28.187' AS DateTime), 1, N'Administrador', N'English', N'admin', N'', N'Admin del sistema, Admin del negocio', 1)
GO
INSERT [dbo].[usuario_historial] ([id], [fecha], [id_usuario], [nombre], [idioma], [nombre_usuario], [contrasenia], [permisos], [habilitado]) VALUES (18, CAST(N'2019-11-10T12:28:36.190' AS DateTime), 1, N'Administrador', N'Español', N'admin', N'', N'Admin del sistema, Admin del negocio', 1)
GO
INSERT [dbo].[usuario_historial] ([id], [fecha], [id_usuario], [nombre], [idioma], [nombre_usuario], [contrasenia], [permisos], [habilitado]) VALUES (19, CAST(N'2019-11-10T12:29:25.483' AS DateTime), 1, N'Administrador', N'English', N'admin', N'', N'Admin del sistema, Admin del negocio', 1)
GO
INSERT [dbo].[usuario_historial] ([id], [fecha], [id_usuario], [nombre], [idioma], [nombre_usuario], [contrasenia], [permisos], [habilitado]) VALUES (20, CAST(N'2019-11-10T12:33:37.953' AS DateTime), 1, N'Administrador', N'Español', N'admin', N'', N'Admin del sistema, Admin del negocio', 1)
GO
INSERT [dbo].[usuario_historial] ([id], [fecha], [id_usuario], [nombre], [idioma], [nombre_usuario], [contrasenia], [permisos], [habilitado]) VALUES (21, CAST(N'2019-11-22T23:51:36.787' AS DateTime), 1, N'Administrador', N'English', N'admin', N'1Yti+jA6nZUOGXSjbT6lKFP20hgOX/2x3VpEJAAoUs0=', N'Admin del sistema, Admin del negocio', 1)
GO
INSERT [dbo].[usuario_historial] ([id], [fecha], [id_usuario], [nombre], [idioma], [nombre_usuario], [contrasenia], [permisos], [habilitado]) VALUES (22, CAST(N'2019-11-22T23:51:42.087' AS DateTime), 1, N'Administrador', N'Español', N'admin', N'g4aHAIyVWSNuS4HeenoRNMhsEPRDatZJZQyZEzP94qg=', N'Admin del sistema, Admin del negocio', 1)
GO
SET IDENTITY_INSERT [dbo].[usuario_historial] OFF
GO
INSERT [dbo].[usuario_permiso] ([usuario_id], [permiso_id]) VALUES (1, 2)
GO
INSERT [dbo].[usuario_permiso] ([usuario_id], [permiso_id]) VALUES (1, 21)
GO
INSERT [dbo].[usuario_permiso] ([usuario_id], [permiso_id]) VALUES (2, 3)
GO
INSERT [dbo].[usuario_permiso] ([usuario_id], [permiso_id]) VALUES (2, 21)
GO
INSERT [dbo].[usuario_permiso] ([usuario_id], [permiso_id]) VALUES (9, 2)
GO
SET IDENTITY_INSERT [dbo].[viaje] ON 
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5842, 979, 1, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5843, 979, 0, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5844, 979, 1, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5845, 979, 0, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5846, 979, 1, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5847, 979, 0, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5848, 979, 1, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5849, 979, 0, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5850, 980, 1, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5851, 980, 0, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5852, 980, 1, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5853, 980, 0, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5854, 980, 1, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5855, 980, 0, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5856, 980, 1, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5857, 981, 0, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5858, 981, 1, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5859, 981, 0, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5860, 981, 1, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5861, 981, 0, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5862, 981, 1, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5863, 981, 0, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5864, 981, 1, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5865, 982, 0, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5866, 982, 1, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5867, 982, 0, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5868, 982, 1, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5869, 982, 0, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5870, 982, 1, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5871, 982, 0, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5872, 983, 1, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5873, 983, 0, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5874, 983, 1, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5875, 983, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5876, 983, 1, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5877, 983, 0, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5878, 983, 1, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5879, 983, 0, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5880, 984, 1, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5881, 984, 0, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5882, 984, 1, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5883, 984, 0, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5884, 984, 1, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5885, 984, 0, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5886, 984, 1, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5887, 985, 0, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5888, 985, 1, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5889, 985, 0, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5890, 985, 1, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5891, 985, 0, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5892, 985, 1, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5893, 985, 0, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5894, 985, 1, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5895, 986, 0, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5896, 986, 1, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5897, 986, 0, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5898, 986, 1, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5899, 986, 0, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5900, 986, 1, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5901, 986, 0, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5902, 987, 1, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5903, 987, 0, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5904, 987, 1, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5905, 987, 0, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5906, 987, 1, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5907, 987, 0, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5908, 987, 1, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5909, 988, 0, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5910, 988, 1, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5911, 988, 0, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5912, 988, 1, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5913, 988, 0, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5914, 988, 1, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5915, 988, 0, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5916, 988, 1, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5917, 989, 0, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5918, 989, 1, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5919, 989, 0, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5920, 989, 1, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5921, 989, 0, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5922, 989, 1, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5923, 989, 0, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5924, 990, 1, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5925, 990, 0, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5926, 990, 1, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5927, 990, 0, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5928, 990, 1, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5929, 990, 0, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5930, 990, 1, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5931, 990, 0, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5932, 991, 1, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5933, 991, 0, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5934, 991, 1, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5935, 991, 0, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5936, 991, 1, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5937, 991, 0, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5938, 991, 1, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5939, 991, 0, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5940, 992, 1, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5941, 992, 0, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5942, 992, 1, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5943, 992, 0, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5944, 992, 1, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5945, 992, 0, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5946, 992, 1, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5947, 993, 0, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5948, 993, 1, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5949, 993, 0, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5950, 993, 1, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5951, 993, 0, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5952, 993, 1, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5953, 993, 0, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5954, 993, 1, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5955, 994, 0, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5956, 994, 1, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5957, 994, 0, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5958, 994, 1, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5959, 994, 0, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5960, 994, 1, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5961, 994, 0, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5962, 995, 1, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5963, 995, 0, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5964, 995, 1, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5965, 995, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5966, 995, 1, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5967, 995, 0, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5968, 995, 1, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5969, 995, 0, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5970, 996, 1, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5971, 996, 0, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5972, 996, 1, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5973, 996, 0, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5974, 996, 1, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5975, 996, 0, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5976, 996, 1, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5977, 997, 0, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5978, 997, 1, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5979, 997, 0, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5980, 997, 1, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5981, 997, 0, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5982, 997, 1, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5983, 997, 0, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5984, 997, 1, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5985, 998, 0, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5986, 998, 1, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5987, 998, 0, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5988, 998, 1, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5989, 998, 0, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5990, 998, 1, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5991, 998, 0, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5992, 999, 1, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5993, 999, 0, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5994, 999, 1, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5995, 999, 0, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5996, 999, 1, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5997, 999, 0, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5998, 999, 1, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5999, 1000, 0, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6000, 1000, 1, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6001, 1000, 0, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6002, 1000, 1, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6003, 1000, 0, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6004, 1000, 1, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6005, 1000, 0, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6006, 1000, 1, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6007, 1001, 0, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6008, 1001, 1, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6009, 1001, 0, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6010, 1001, 1, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6011, 1001, 0, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6012, 1001, 1, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6013, 1001, 0, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6014, 1002, 1, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6015, 1002, 0, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6016, 1002, 1, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6017, 1002, 0, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6018, 1002, 1, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6019, 1002, 0, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6020, 1002, 1, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6021, 1002, 0, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6022, 1003, 1, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6023, 1003, 0, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6024, 1003, 1, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6025, 1003, 0, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6026, 1003, 1, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6027, 1003, 0, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6028, 1003, 1, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6029, 1003, 0, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6030, 1004, 1, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6031, 1004, 0, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6032, 1004, 1, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6033, 1004, 0, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6034, 1004, 1, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6035, 1004, 0, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6036, 1004, 1, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6037, 1005, 0, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6038, 1005, 1, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6039, 1005, 0, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6040, 1005, 1, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6041, 1005, 0, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6042, 1005, 1, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6043, 1005, 0, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6044, 1005, 1, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6045, 1006, 0, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6046, 1006, 1, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6047, 1006, 0, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6048, 1006, 1, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6049, 1006, 0, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6050, 1006, 1, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6051, 1006, 0, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6052, 1007, 1, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6053, 1007, 0, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6054, 1007, 1, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6055, 1007, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6056, 1007, 1, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6057, 1007, 0, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6058, 1007, 1, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6059, 1007, 0, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6060, 1008, 1, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6061, 1008, 0, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6062, 1008, 1, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6063, 1008, 0, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6064, 1008, 1, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6065, 1008, 0, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6066, 1008, 1, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6067, 1009, 0, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6068, 1009, 1, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6069, 1009, 0, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6070, 1009, 1, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6071, 1009, 0, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6072, 1009, 1, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6073, 1009, 0, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6074, 1009, 1, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6075, 1010, 0, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6076, 1010, 1, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6077, 1010, 0, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6078, 1010, 1, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6079, 1010, 0, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6080, 1010, 1, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6081, 1010, 0, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6082, 1011, 1, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6083, 1011, 0, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6084, 1011, 1, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6085, 1011, 0, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6086, 1011, 1, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6087, 1011, 0, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6088, 1011, 1, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6089, 1012, 0, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6090, 1012, 1, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6091, 1012, 0, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6092, 1012, 1, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6093, 1012, 0, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6094, 1012, 1, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6095, 1012, 0, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6096, 1012, 1, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6097, 1013, 0, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6098, 1013, 1, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6099, 1013, 0, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6100, 1013, 1, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6101, 1013, 0, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6102, 1013, 1, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6103, 1013, 0, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6104, 1014, 1, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6105, 1014, 0, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6106, 1014, 1, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6107, 1014, 0, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6108, 1014, 1, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6109, 1014, 0, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6110, 1014, 1, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6111, 1014, 0, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6112, 1015, 1, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6113, 1015, 0, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6114, 1015, 1, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6115, 1015, 0, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6116, 1015, 1, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6117, 1015, 0, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6118, 1015, 1, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6119, 1015, 0, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6120, 1016, 1, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6121, 1016, 0, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6122, 1016, 1, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6123, 1016, 0, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6124, 1016, 1, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6125, 1016, 0, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6126, 1016, 1, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6127, 1017, 0, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6128, 1017, 1, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6129, 1017, 0, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6130, 1017, 1, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6131, 1017, 0, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6132, 1017, 1, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6133, 1017, 0, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6134, 1017, 1, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6135, 1018, 0, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6136, 1018, 1, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6137, 1018, 0, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6138, 1018, 1, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6139, 1018, 0, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6140, 1018, 1, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6141, 1018, 0, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6142, 1019, 1, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6143, 1019, 0, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6144, 1019, 1, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6145, 1019, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6146, 1019, 1, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6147, 1019, 0, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6148, 1019, 1, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6149, 1019, 0, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6150, 1020, 1, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6151, 1020, 0, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6152, 1020, 1, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6153, 1020, 0, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6154, 1020, 1, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6155, 1020, 0, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6156, 1020, 1, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6157, 1021, 0, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), CAST(N'05:28:00' AS Time), 1, 2, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6158, 1021, 1, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), CAST(N'07:00:00' AS Time), 1, 1, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6159, 1021, 0, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, 0, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6160, 1021, 1, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, 0, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6161, 1021, 0, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, 0, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6162, 1021, 1, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, 0, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6163, 1021, 0, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, 0, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6164, 1021, 1, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, 0, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6165, 1022, 0, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6166, 1022, 1, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6167, 1022, 0, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6168, 1022, 1, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6169, 1022, 0, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6170, 1022, 1, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6171, 1022, 0, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6172, 1023, 1, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6173, 1023, 0, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6174, 1023, 1, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6175, 1023, 0, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6176, 1023, 1, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6177, 1023, 0, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6178, 1023, 1, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6179, 1024, 0, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6180, 1024, 1, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6181, 1024, 0, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6182, 1024, 1, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6183, 1024, 0, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6184, 1024, 1, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6185, 1024, 0, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6186, 1024, 1, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6187, 1025, 0, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6188, 1025, 1, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6189, 1025, 0, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6190, 1025, 1, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6191, 1025, 0, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6192, 1025, 1, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6193, 1025, 0, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6194, 1026, 1, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6195, 1026, 0, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6196, 1026, 1, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6197, 1026, 0, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6198, 1026, 1, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6199, 1026, 0, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6200, 1026, 1, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6201, 1026, 0, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6202, 1027, 1, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6203, 1027, 0, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6204, 1027, 1, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6205, 1027, 0, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6206, 1027, 1, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6207, 1027, 0, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6208, 1027, 1, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6209, 1027, 0, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6210, 1028, 1, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6211, 1028, 0, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6212, 1028, 1, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6213, 1028, 0, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6214, 1028, 1, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6215, 1028, 0, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6216, 1028, 1, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6217, 1029, 0, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6218, 1029, 1, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6219, 1029, 0, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6220, 1029, 1, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6221, 1029, 0, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6222, 1029, 1, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6223, 1029, 0, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6224, 1029, 1, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6225, 1030, 0, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6226, 1030, 1, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6227, 1030, 0, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6228, 1030, 1, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6229, 1030, 0, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6230, 1030, 1, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6231, 1030, 0, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6232, 1031, 1, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6233, 1031, 0, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6234, 1031, 1, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6235, 1031, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6236, 1031, 1, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6237, 1031, 0, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6238, 1031, 1, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6239, 1031, 0, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6240, 1032, 1, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6241, 1032, 0, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6242, 1032, 1, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6243, 1032, 0, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6244, 1032, 1, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6245, 1032, 0, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6246, 1032, 1, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6247, 1033, 0, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6248, 1033, 1, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6249, 1033, 0, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6250, 1033, 1, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6251, 1033, 0, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6252, 1033, 1, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6253, 1033, 0, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6254, 1033, 1, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6255, 1034, 0, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6256, 1034, 1, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6257, 1034, 0, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6258, 1034, 1, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6259, 1034, 0, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6260, 1034, 1, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6261, 1034, 0, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6262, 1035, 1, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6263, 1035, 0, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6264, 1035, 1, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6265, 1035, 0, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6266, 1035, 1, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6267, 1035, 0, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6268, 1035, 1, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6269, 1036, 0, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6270, 1036, 1, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6271, 1036, 0, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6272, 1036, 1, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6273, 1036, 0, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6274, 1036, 1, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6275, 1036, 0, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6276, 1036, 1, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6277, 1037, 0, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6278, 1037, 1, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6279, 1037, 0, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6280, 1037, 1, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6281, 1037, 0, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6282, 1037, 1, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6283, 1037, 0, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6284, 1038, 1, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6285, 1038, 0, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6286, 1038, 1, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6287, 1038, 0, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6288, 1038, 1, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6289, 1038, 0, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6290, 1038, 1, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6291, 1038, 0, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6292, 1039, 1, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6293, 1039, 0, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6294, 1039, 1, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6295, 1039, 0, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6296, 1039, 1, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6297, 1039, 0, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6298, 1039, 1, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6299, 1039, 0, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6300, 1040, 1, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6301, 1040, 0, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6302, 1040, 1, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6303, 1040, 0, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6304, 1040, 1, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6305, 1040, 0, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6306, 1040, 1, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6307, 1041, 0, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6308, 1041, 1, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6309, 1041, 0, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6310, 1041, 1, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6311, 1041, 0, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6312, 1041, 1, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6313, 1041, 0, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6314, 1041, 1, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6315, 1042, 0, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6316, 1042, 1, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6317, 1042, 0, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6318, 1042, 1, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6319, 1042, 0, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6320, 1042, 1, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6321, 1042, 0, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6322, 1043, 1, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6323, 1043, 0, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6324, 1043, 1, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6325, 1043, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6326, 1043, 1, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6327, 1043, 0, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6328, 1043, 1, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6329, 1043, 0, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6330, 1044, 1, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6331, 1044, 0, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6332, 1044, 1, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6333, 1044, 0, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6334, 1044, 1, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6335, 1044, 0, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6336, 1044, 1, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6337, 1045, 0, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6338, 1045, 1, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6339, 1045, 0, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6340, 1045, 1, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6341, 1045, 0, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6342, 1045, 1, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6343, 1045, 0, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6344, 1045, 1, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6345, 1046, 0, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6346, 1046, 1, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6347, 1046, 0, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6348, 1046, 1, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6349, 1046, 0, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6350, 1046, 1, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6351, 1046, 0, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6352, 1047, 1, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6353, 1047, 0, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6354, 1047, 1, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6355, 1047, 0, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6356, 1047, 1, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6357, 1047, 0, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6358, 1047, 1, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6359, 1048, 0, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6360, 1048, 1, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6361, 1048, 0, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6362, 1048, 1, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6363, 1048, 0, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6364, 1048, 1, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6365, 1048, 0, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6366, 1048, 1, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6367, 1049, 0, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6368, 1049, 1, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6369, 1049, 0, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6370, 1049, 1, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6371, 1049, 0, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6372, 1049, 1, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6373, 1049, 0, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6374, 1050, 1, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6375, 1050, 0, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6376, 1050, 1, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6377, 1050, 0, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6378, 1050, 1, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6379, 1050, 0, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6380, 1050, 1, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6381, 1050, 0, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6382, 1051, 1, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6383, 1051, 0, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6384, 1051, 1, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6385, 1051, 0, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6386, 1051, 1, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6387, 1051, 0, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6388, 1051, 1, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6389, 1051, 0, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6390, 1052, 1, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6391, 1052, 0, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6392, 1052, 1, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6393, 1052, 0, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6394, 1052, 1, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6395, 1052, 0, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6396, 1052, 1, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6397, 1053, 0, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6398, 1053, 1, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6399, 1053, 0, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6400, 1053, 1, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6401, 1053, 0, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6402, 1053, 1, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6403, 1053, 0, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6404, 1053, 1, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6405, 1054, 0, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6406, 1054, 1, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6407, 1054, 0, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6408, 1054, 1, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6409, 1054, 0, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6410, 1054, 1, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6411, 1054, 0, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6412, 1055, 1, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6413, 1055, 0, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6414, 1055, 1, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6415, 1055, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6416, 1055, 1, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6417, 1055, 0, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6418, 1055, 1, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6419, 1055, 0, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6420, 1056, 1, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6421, 1056, 0, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6422, 1056, 1, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6423, 1056, 0, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6424, 1056, 1, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6425, 1056, 0, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6426, 1056, 1, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6427, 1057, 0, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6428, 1057, 1, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6429, 1057, 0, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6430, 1057, 1, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6431, 1057, 0, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6432, 1057, 1, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6433, 1057, 0, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6434, 1057, 1, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6435, 1058, 0, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6436, 1058, 1, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6437, 1058, 0, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6438, 1058, 1, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6439, 1058, 0, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6440, 1058, 1, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6441, 1058, 0, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6442, 1059, 1, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6443, 1059, 0, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6444, 1059, 1, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6445, 1059, 0, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6446, 1059, 1, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6447, 1059, 0, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6448, 1059, 1, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6449, 1060, 0, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6450, 1060, 1, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6451, 1060, 0, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6452, 1060, 1, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6453, 1060, 0, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6454, 1060, 1, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6455, 1060, 0, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6456, 1060, 1, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6457, 1061, 0, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6458, 1061, 1, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6459, 1061, 0, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6460, 1061, 1, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6461, 1061, 0, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6462, 1061, 1, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6463, 1061, 0, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6464, 1062, 1, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6465, 1062, 0, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6466, 1062, 1, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6467, 1062, 0, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6468, 1062, 1, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6469, 1062, 0, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6470, 1062, 1, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6471, 1062, 0, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6472, 1063, 1, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6473, 1063, 0, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6474, 1063, 1, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6475, 1063, 0, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6476, 1063, 1, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6477, 1063, 0, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6478, 1063, 1, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6479, 1063, 0, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6480, 1064, 1, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6481, 1064, 0, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6482, 1064, 1, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6483, 1064, 0, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6484, 1064, 1, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6485, 1064, 0, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6486, 1064, 1, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6487, 1065, 0, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6488, 1065, 1, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6489, 1065, 0, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6490, 1065, 1, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6491, 1065, 0, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6492, 1065, 1, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6493, 1065, 0, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6494, 1065, 1, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6495, 1066, 0, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6496, 1066, 1, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6497, 1066, 0, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6498, 1066, 1, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6499, 1066, 0, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6500, 1066, 1, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6501, 1066, 0, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6502, 1067, 1, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6503, 1067, 0, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6504, 1067, 1, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6505, 1067, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6506, 1067, 1, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6507, 1067, 0, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6508, 1067, 1, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6509, 1067, 0, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6510, 1068, 1, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6511, 1068, 0, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6512, 1068, 1, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6513, 1068, 0, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6514, 1068, 1, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6515, 1068, 0, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6516, 1068, 1, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6517, 1069, 0, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6518, 1069, 1, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6519, 1069, 0, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6520, 1069, 1, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6521, 1069, 0, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6522, 1069, 1, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6523, 1069, 0, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6524, 1069, 1, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6525, 1070, 0, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6526, 1070, 1, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6527, 1070, 0, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6528, 1070, 1, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6529, 1070, 0, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6530, 1070, 1, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6531, 1070, 0, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6532, 1071, 1, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6533, 1071, 0, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6534, 1071, 1, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6535, 1071, 0, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6536, 1071, 1, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6537, 1071, 0, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6538, 1071, 1, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6539, 1072, 0, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6540, 1072, 1, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6541, 1072, 0, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6542, 1072, 1, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6543, 1072, 0, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6544, 1072, 1, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6545, 1072, 0, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6546, 1072, 1, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6547, 1073, 0, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6548, 1073, 1, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6549, 1073, 0, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6550, 1073, 1, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6551, 1073, 0, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6552, 1073, 1, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6553, 1073, 0, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6554, 1074, 1, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6555, 1074, 0, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6556, 1074, 1, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6557, 1074, 0, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6558, 1074, 1, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6559, 1074, 0, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6560, 1074, 1, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (6561, 1074, 0, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
SET IDENTITY_INSERT [dbo].[viaje] OFF
GO
ALTER TABLE [dbo].[chofer] ADD  CONSTRAINT [DF_chofer_habilitado]  DEFAULT ((1)) FOR [habilitado]
GO
ALTER TABLE [dbo].[coche] ADD  CONSTRAINT [DF_coche_habilitado]  DEFAULT ((1)) FOR [habilitado]
GO
ALTER TABLE [dbo].[idioma] ADD  CONSTRAINT [DF_idioma_editable]  DEFAULT ((1)) FOR [editable]
GO
ALTER TABLE [dbo].[permiso] ADD  CONSTRAINT [DF_permiso_habilitado]  DEFAULT ((1)) FOR [habilitado]
GO
ALTER TABLE [dbo].[usuario] ADD  CONSTRAINT [DF_usuario_habilitado]  DEFAULT ((1)) FOR [habilitado]
GO
ALTER TABLE [dbo].[alerta_usuario]  WITH CHECK ADD  CONSTRAINT [FK_alerta_usuario_alerta_insuficiencia] FOREIGN KEY([alerta_id])
REFERENCES [dbo].[alerta_insuficiencia] ([id])
GO
ALTER TABLE [dbo].[alerta_usuario] CHECK CONSTRAINT [FK_alerta_usuario_alerta_insuficiencia]
GO
ALTER TABLE [dbo].[alerta_usuario]  WITH CHECK ADD  CONSTRAINT [FK_alerta_usuario_usuario] FOREIGN KEY([usuario_id])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[alerta_usuario] CHECK CONSTRAINT [FK_alerta_usuario_usuario]
GO
ALTER TABLE [dbo].[chofer]  WITH CHECK ADD  CONSTRAINT [FK_chofer_coche] FOREIGN KEY([coche_preferido_id])
REFERENCES [dbo].[coche] ([id])
GO
ALTER TABLE [dbo].[chofer] CHECK CONSTRAINT [FK_chofer_coche]
GO
ALTER TABLE [dbo].[leyenda]  WITH CHECK ADD  CONSTRAINT [FK_leyenda_idioma] FOREIGN KEY([idioma_id])
REFERENCES [dbo].[idioma] ([id])
GO
ALTER TABLE [dbo].[leyenda] CHECK CONSTRAINT [FK_leyenda_idioma]
GO
ALTER TABLE [dbo].[permiso_permiso]  WITH CHECK ADD  CONSTRAINT [FK_permiso_hijo_permiso] FOREIGN KEY([permiso_hijo_id])
REFERENCES [dbo].[permiso] ([id])
GO
ALTER TABLE [dbo].[permiso_permiso] CHECK CONSTRAINT [FK_permiso_hijo_permiso]
GO
ALTER TABLE [dbo].[permiso_permiso]  WITH CHECK ADD  CONSTRAINT [FK_permiso_padre_permiso] FOREIGN KEY([permiso_padre_id])
REFERENCES [dbo].[permiso] ([id])
GO
ALTER TABLE [dbo].[permiso_permiso] CHECK CONSTRAINT [FK_permiso_padre_permiso]
GO
ALTER TABLE [dbo].[planilla_horaria]  WITH CHECK ADD  CONSTRAINT [FK_planilla_horaria_chofer] FOREIGN KEY([chofer_id])
REFERENCES [dbo].[chofer] ([id])
GO
ALTER TABLE [dbo].[planilla_horaria] CHECK CONSTRAINT [FK_planilla_horaria_chofer]
GO
ALTER TABLE [dbo].[planilla_horaria]  WITH CHECK ADD  CONSTRAINT [FK_planilla_horaria_coche] FOREIGN KEY([coche_id])
REFERENCES [dbo].[coche] ([id])
GO
ALTER TABLE [dbo].[planilla_horaria] CHECK CONSTRAINT [FK_planilla_horaria_coche]
GO
ALTER TABLE [dbo].[planilla_horaria]  WITH CHECK ADD  CONSTRAINT [FK_planilla_horaria_recorrido] FOREIGN KEY([recorrido_id])
REFERENCES [dbo].[recorrido] ([id])
GO
ALTER TABLE [dbo].[planilla_horaria] CHECK CONSTRAINT [FK_planilla_horaria_recorrido]
GO
ALTER TABLE [dbo].[recorrido]  WITH CHECK ADD  CONSTRAINT [FK_recorrido_terminal_fin] FOREIGN KEY([terminal_fin_id])
REFERENCES [dbo].[terminal] ([id])
GO
ALTER TABLE [dbo].[recorrido] CHECK CONSTRAINT [FK_recorrido_terminal_fin]
GO
ALTER TABLE [dbo].[recorrido]  WITH CHECK ADD  CONSTRAINT [FK_recorrido_terminal_inicio] FOREIGN KEY([terminal_inicio_id])
REFERENCES [dbo].[terminal] ([id])
GO
ALTER TABLE [dbo].[recorrido] CHECK CONSTRAINT [FK_recorrido_terminal_inicio]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_idioma] FOREIGN KEY([idioma_id])
REFERENCES [dbo].[idioma] ([id])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_idioma]
GO
ALTER TABLE [dbo].[usuario_permiso]  WITH CHECK ADD  CONSTRAINT [FK_usuario_permiso_permiso] FOREIGN KEY([permiso_id])
REFERENCES [dbo].[permiso] ([id])
GO
ALTER TABLE [dbo].[usuario_permiso] CHECK CONSTRAINT [FK_usuario_permiso_permiso]
GO
ALTER TABLE [dbo].[usuario_permiso]  WITH CHECK ADD  CONSTRAINT [FK_usuario_permiso_usuario] FOREIGN KEY([usuario_id])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[usuario_permiso] CHECK CONSTRAINT [FK_usuario_permiso_usuario]
GO
ALTER TABLE [dbo].[viaje]  WITH CHECK ADD  CONSTRAINT [FK_viaje_completitud_viaje] FOREIGN KEY([completitud_id])
REFERENCES [dbo].[completitud_viaje] ([id])
GO
ALTER TABLE [dbo].[viaje] CHECK CONSTRAINT [FK_viaje_completitud_viaje]
GO
ALTER TABLE [dbo].[viaje]  WITH CHECK ADD  CONSTRAINT [FK_viaje_planilla_horaria] FOREIGN KEY([planilla_horaria_id])
REFERENCES [dbo].[planilla_horaria] ([id])
GO
ALTER TABLE [dbo].[viaje] CHECK CONSTRAINT [FK_viaje_planilla_horaria]
GO
USE [master]
GO
ALTER DATABASE [transportes_mj] SET  READ_WRITE 
GO