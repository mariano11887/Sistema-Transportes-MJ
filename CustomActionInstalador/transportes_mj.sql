USE [master]
GO
/****** Object:  Database [transportes_mj]    Script Date: 18/11/2019 14:52:25 ******/
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
/****** Object:  Table [dbo].[alerta_insuficiencia]    Script Date: 18/11/2019 14:52:26 ******/
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
/****** Object:  Table [dbo].[alerta_usuario]    Script Date: 18/11/2019 14:52:26 ******/
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
/****** Object:  Table [dbo].[chofer]    Script Date: 18/11/2019 14:52:26 ******/
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
/****** Object:  Table [dbo].[coche]    Script Date: 18/11/2019 14:52:26 ******/
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
/****** Object:  Table [dbo].[completitud_viaje]    Script Date: 18/11/2019 14:52:26 ******/
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
/****** Object:  Table [dbo].[digito_verificador]    Script Date: 18/11/2019 14:52:26 ******/
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
/****** Object:  Table [dbo].[idioma]    Script Date: 18/11/2019 14:52:26 ******/
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
/****** Object:  Table [dbo].[leyenda]    Script Date: 18/11/2019 14:52:26 ******/
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
/****** Object:  Table [dbo].[permiso]    Script Date: 18/11/2019 14:52:26 ******/
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
/****** Object:  Table [dbo].[permiso_permiso]    Script Date: 18/11/2019 14:52:26 ******/
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
/****** Object:  Table [dbo].[planilla_horaria]    Script Date: 18/11/2019 14:52:26 ******/
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
/****** Object:  Table [dbo].[recorrido]    Script Date: 18/11/2019 14:52:26 ******/
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
/****** Object:  Table [dbo].[terminal]    Script Date: 18/11/2019 14:52:26 ******/
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
/****** Object:  Table [dbo].[usuario]    Script Date: 18/11/2019 14:52:26 ******/
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
/****** Object:  Table [dbo].[usuario_historial]    Script Date: 18/11/2019 14:52:26 ******/
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
/****** Object:  Table [dbo].[usuario_permiso]    Script Date: 18/11/2019 14:52:26 ******/
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
/****** Object:  Table [dbo].[viaje]    Script Date: 18/11/2019 14:52:26 ******/
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
SET IDENTITY_INSERT [dbo].[alerta_insuficiencia] OFF
GO
INSERT [dbo].[alerta_usuario] ([alerta_id], [usuario_id]) VALUES (2, 1)
GO
INSERT [dbo].[alerta_usuario] ([alerta_id], [usuario_id]) VALUES (3, 1)
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
INSERT [dbo].[chofer] ([id], [nombre], [dni], [coche_preferido_id], [fecha_fin_licencia], [habilitado]) VALUES (5, N'Alfredo Manuel Bautista Mejía', 21849089, NULL, NULL, 1)
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
INSERT [dbo].[coche] ([id], [patente], [marca], [modelo], [fecha_adquisicion], [anio_fabricacion], [numero_interno], [capacidad], [en_circulacion], [habilitado]) VALUES (6, N'ABC128', N'Mercedes Benz', N'Mewtwo', CAST(N'2018-05-16' AS Date), 2017, 8, 40, 1, 1)
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
INSERT [dbo].[digito_verificador] ([tabla], [dvv]) VALUES (N'planilla_horaria', CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[digito_verificador] ([tabla], [dvv]) VALUES (N'viaje', CAST(5 AS Numeric(1, 0)))
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
SET IDENTITY_INSERT [dbo].[planilla_horaria] ON 
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (723, 1, 4, 1, CAST(N'2019-10-30' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (724, 2, 4, 1, CAST(N'2019-10-30' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (725, 3, 5, 1, CAST(N'2019-10-30' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (726, 4, 5, 1, CAST(N'2019-10-30' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (727, 5, 6, 1, CAST(N'2019-10-30' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (728, 6, 6, 1, CAST(N'2019-10-30' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (729, 7, 7, 1, CAST(N'2019-10-30' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (730, 8, 7, 1, CAST(N'2019-10-30' AS Date), CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (731, 9, 8, 1, CAST(N'2019-10-30' AS Date), CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (732, 10, 8, 1, CAST(N'2019-10-30' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (733, 11, 9, 1, CAST(N'2019-10-30' AS Date), CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (734, 12, 9, 1, CAST(N'2019-10-30' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (735, 13, 10, 2, CAST(N'2019-10-30' AS Date), CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (736, 14, 10, 2, CAST(N'2019-10-30' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (737, 15, 11, 2, CAST(N'2019-10-30' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (738, 16, 11, 2, CAST(N'2019-10-30' AS Date), CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (739, 17, 12, 2, CAST(N'2019-10-30' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (740, 18, 12, 2, CAST(N'2019-10-30' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (741, 19, 13, 2, CAST(N'2019-10-30' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (742, 20, 13, 2, CAST(N'2019-10-30' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (743, 21, 14, 2, CAST(N'2019-10-30' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (744, 22, 14, 2, CAST(N'2019-10-30' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (745, 23, 15, 2, CAST(N'2019-10-30' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (746, 24, 15, 2, CAST(N'2019-10-30' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (747, 25, 1, 3, CAST(N'2019-10-30' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (748, 26, 1, 3, CAST(N'2019-10-30' AS Date), CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (749, 27, 16, 3, CAST(N'2019-10-30' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (750, 28, 16, 3, CAST(N'2019-10-30' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (751, 29, 2, 3, CAST(N'2019-10-30' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (752, 30, 2, 3, CAST(N'2019-10-30' AS Date), CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (753, 31, 17, 3, CAST(N'2019-10-30' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (754, 32, 17, 3, CAST(N'2019-10-30' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (755, 33, 3, 3, CAST(N'2019-10-30' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (756, 34, 3, 3, CAST(N'2019-10-30' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (757, 35, 18, 3, CAST(N'2019-10-30' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (758, 36, 18, 3, CAST(N'2019-10-30' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (759, 37, 19, 4, CAST(N'2019-10-30' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (760, 38, 19, 4, CAST(N'2019-10-30' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (761, 39, 20, 4, CAST(N'2019-10-30' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (762, 40, 20, 4, CAST(N'2019-10-30' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (763, 41, 21, 4, CAST(N'2019-10-30' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (764, 42, 21, 4, CAST(N'2019-10-30' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (765, 43, 22, 4, CAST(N'2019-10-30' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (766, 44, 22, 4, CAST(N'2019-10-30' AS Date), CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (767, 45, 23, 4, CAST(N'2019-10-30' AS Date), CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (768, 46, 23, 4, CAST(N'2019-10-30' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (769, 47, 24, 4, CAST(N'2019-10-30' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (770, 48, 24, 4, CAST(N'2019-10-30' AS Date), CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (771, 1, 5, 1, CAST(N'2019-10-31' AS Date), CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (772, 2, 5, 1, CAST(N'2019-10-31' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (773, 3, 4, 1, CAST(N'2019-10-31' AS Date), CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (774, 4, 4, 1, CAST(N'2019-10-31' AS Date), CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (775, 5, 7, 1, CAST(N'2019-10-31' AS Date), CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (776, 6, 7, 1, CAST(N'2019-10-31' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (777, 7, 6, 1, CAST(N'2019-10-31' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (778, 8, 6, 1, CAST(N'2019-10-31' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (779, 9, 9, 1, CAST(N'2019-10-31' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (780, 10, 9, 1, CAST(N'2019-10-31' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (781, 11, 8, 1, CAST(N'2019-10-31' AS Date), CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (782, 12, 8, 1, CAST(N'2019-10-31' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (783, 13, 11, 2, CAST(N'2019-10-31' AS Date), CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (784, 14, 11, 2, CAST(N'2019-10-31' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (785, 15, 10, 2, CAST(N'2019-10-31' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (786, 16, 10, 2, CAST(N'2019-10-31' AS Date), CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (787, 17, 13, 2, CAST(N'2019-10-31' AS Date), CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (788, 18, 13, 2, CAST(N'2019-10-31' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (789, 19, 12, 2, CAST(N'2019-10-31' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (790, 20, 12, 2, CAST(N'2019-10-31' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (791, 21, 15, 2, CAST(N'2019-10-31' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (792, 22, 15, 2, CAST(N'2019-10-31' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (793, 23, 14, 2, CAST(N'2019-10-31' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (794, 24, 14, 2, CAST(N'2019-10-31' AS Date), CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (795, 25, 16, 3, CAST(N'2019-10-31' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (796, 26, 16, 3, CAST(N'2019-10-31' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (797, 27, 1, 3, CAST(N'2019-10-31' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (798, 28, 1, 3, CAST(N'2019-10-31' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (799, 29, 17, 3, CAST(N'2019-10-31' AS Date), CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (800, 30, 17, 3, CAST(N'2019-10-31' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (801, 31, 2, 3, CAST(N'2019-10-31' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (802, 32, 2, 3, CAST(N'2019-10-31' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (803, 33, 18, 3, CAST(N'2019-10-31' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (804, 34, 18, 3, CAST(N'2019-10-31' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (805, 35, 3, 3, CAST(N'2019-10-31' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (806, 36, 3, 3, CAST(N'2019-10-31' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (807, 37, 20, 4, CAST(N'2019-10-31' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (808, 38, 20, 4, CAST(N'2019-10-31' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (809, 39, 19, 4, CAST(N'2019-10-31' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (810, 40, 19, 4, CAST(N'2019-10-31' AS Date), CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (811, 41, 22, 4, CAST(N'2019-10-31' AS Date), CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (812, 42, 22, 4, CAST(N'2019-10-31' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (813, 43, 21, 4, CAST(N'2019-10-31' AS Date), CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (814, 44, 21, 4, CAST(N'2019-10-31' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (815, 45, 24, 4, CAST(N'2019-10-31' AS Date), CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (816, 46, 24, 4, CAST(N'2019-10-31' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (817, 47, 23, 4, CAST(N'2019-10-31' AS Date), CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (818, 48, 23, 4, CAST(N'2019-10-31' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (819, 1, 5, 1, CAST(N'2019-11-01' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (820, 2, 5, 1, CAST(N'2019-11-01' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (821, 3, 4, 1, CAST(N'2019-11-01' AS Date), CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (822, 4, 4, 1, CAST(N'2019-11-01' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (823, 5, 7, 1, CAST(N'2019-11-01' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (824, 6, 7, 1, CAST(N'2019-11-01' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (825, 7, 6, 1, CAST(N'2019-11-01' AS Date), CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (826, 8, 6, 1, CAST(N'2019-11-01' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (827, 9, 9, 1, CAST(N'2019-11-01' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (828, 10, 9, 1, CAST(N'2019-11-01' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (829, 11, 8, 1, CAST(N'2019-11-01' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (830, 12, 8, 1, CAST(N'2019-11-01' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (831, 13, 11, 2, CAST(N'2019-11-01' AS Date), CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (832, 14, 11, 2, CAST(N'2019-11-01' AS Date), CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (833, 15, 10, 2, CAST(N'2019-11-01' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (834, 16, 10, 2, CAST(N'2019-11-01' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (835, 17, 13, 2, CAST(N'2019-11-01' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (836, 18, 13, 2, CAST(N'2019-11-01' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (837, 19, 12, 2, CAST(N'2019-11-01' AS Date), CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (838, 20, 12, 2, CAST(N'2019-11-01' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (839, 21, 15, 2, CAST(N'2019-11-01' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (840, 22, 15, 2, CAST(N'2019-11-01' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (841, 23, 14, 2, CAST(N'2019-11-01' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (842, 24, 14, 2, CAST(N'2019-11-01' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (843, 25, 16, 3, CAST(N'2019-11-01' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (844, 26, 16, 3, CAST(N'2019-11-01' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (845, 27, 1, 3, CAST(N'2019-11-01' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (846, 28, 1, 3, CAST(N'2019-11-01' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (847, 29, 17, 3, CAST(N'2019-11-01' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (848, 30, 17, 3, CAST(N'2019-11-01' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (849, 31, 2, 3, CAST(N'2019-11-01' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (850, 32, 2, 3, CAST(N'2019-11-01' AS Date), CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (851, 33, 18, 3, CAST(N'2019-11-01' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (852, 34, 18, 3, CAST(N'2019-11-01' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (853, 35, 3, 3, CAST(N'2019-11-01' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (854, 36, 3, 3, CAST(N'2019-11-01' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (855, 37, 20, 4, CAST(N'2019-11-01' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (856, 38, 20, 4, CAST(N'2019-11-01' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (857, 39, 19, 4, CAST(N'2019-11-01' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (858, 40, 19, 4, CAST(N'2019-11-01' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (859, 41, 22, 4, CAST(N'2019-11-01' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (860, 42, 22, 4, CAST(N'2019-11-01' AS Date), CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (861, 43, 21, 4, CAST(N'2019-11-01' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (862, 44, 21, 4, CAST(N'2019-11-01' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (863, 45, 24, 4, CAST(N'2019-11-01' AS Date), CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (864, 46, 24, 4, CAST(N'2019-11-01' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (865, 47, 23, 4, CAST(N'2019-11-01' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (866, 48, 23, 4, CAST(N'2019-11-01' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (867, 1, 5, 1, CAST(N'2019-11-04' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (868, 2, 5, 1, CAST(N'2019-11-04' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (869, 3, 4, 1, CAST(N'2019-11-04' AS Date), CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (870, 4, 4, 1, CAST(N'2019-11-04' AS Date), CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (871, 5, 7, 1, CAST(N'2019-11-04' AS Date), CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (872, 6, 7, 1, CAST(N'2019-11-04' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (873, 7, 6, 1, CAST(N'2019-11-04' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (874, 8, 6, 1, CAST(N'2019-11-04' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (875, 9, 11, 2, CAST(N'2019-11-04' AS Date), CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (876, 10, 11, 2, CAST(N'2019-11-04' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (877, 11, 8, 2, CAST(N'2019-11-04' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (878, 12, 8, 2, CAST(N'2019-11-04' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (879, 13, 13, 2, CAST(N'2019-11-04' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (880, 14, 13, 2, CAST(N'2019-11-04' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (881, 15, 10, 2, CAST(N'2019-11-04' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (882, 16, 10, 2, CAST(N'2019-11-04' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (883, 17, 16, 3, CAST(N'2019-11-04' AS Date), CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (884, 18, 16, 3, CAST(N'2019-11-04' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (885, 19, 1, 3, CAST(N'2019-11-04' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (886, 20, 1, 3, CAST(N'2019-11-04' AS Date), CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (887, 21, 17, 3, CAST(N'2019-11-04' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (888, 22, 17, 3, CAST(N'2019-11-04' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (889, 23, 2, 3, CAST(N'2019-11-04' AS Date), CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (890, 24, 2, 3, CAST(N'2019-11-04' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (891, 25, 9, 4, CAST(N'2019-11-04' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (892, 26, 9, 4, CAST(N'2019-11-04' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (893, 27, 3, 4, CAST(N'2019-11-04' AS Date), CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (894, 28, 3, 4, CAST(N'2019-11-04' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (895, 29, 20, 4, CAST(N'2019-11-04' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (896, 30, 20, 4, CAST(N'2019-11-04' AS Date), CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (897, 31, 19, 4, CAST(N'2019-11-04' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (898, 32, 19, 4, CAST(N'2019-11-04' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (899, 1, 5, 1, CAST(N'2019-11-06' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (900, 2, 5, 1, CAST(N'2019-11-06' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (901, 3, 4, 1, CAST(N'2019-11-06' AS Date), CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (902, 4, 4, 1, CAST(N'2019-11-06' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (903, 5, 7, 1, CAST(N'2019-11-06' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (904, 6, 7, 1, CAST(N'2019-11-06' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (905, 7, 6, 1, CAST(N'2019-11-06' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (906, 8, 6, 1, CAST(N'2019-11-06' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (907, 9, 11, 2, CAST(N'2019-11-06' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (908, 10, 11, 2, CAST(N'2019-11-06' AS Date), CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (909, 11, 8, 2, CAST(N'2019-11-06' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (910, 12, 8, 2, CAST(N'2019-11-06' AS Date), CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (911, 13, 13, 2, CAST(N'2019-11-06' AS Date), CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (912, 14, 13, 2, CAST(N'2019-11-06' AS Date), CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (913, 15, 10, 2, CAST(N'2019-11-06' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (914, 16, 10, 2, CAST(N'2019-11-06' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (915, 17, 16, 3, CAST(N'2019-11-06' AS Date), CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (916, 18, 16, 3, CAST(N'2019-11-06' AS Date), CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (917, 19, 1, 3, CAST(N'2019-11-06' AS Date), CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (918, 20, 1, 3, CAST(N'2019-11-06' AS Date), CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (919, 21, 17, 3, CAST(N'2019-11-06' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (920, 22, 17, 3, CAST(N'2019-11-06' AS Date), CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (921, 23, 2, 3, CAST(N'2019-11-06' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (922, 24, 2, 3, CAST(N'2019-11-06' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (923, 25, 9, 4, CAST(N'2019-11-06' AS Date), CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (924, 26, 9, 4, CAST(N'2019-11-06' AS Date), CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (925, 27, 3, 4, CAST(N'2019-11-06' AS Date), CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (926, 28, 3, 4, CAST(N'2019-11-06' AS Date), CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (927, 29, 20, 4, CAST(N'2019-11-06' AS Date), CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (928, 30, 20, 4, CAST(N'2019-11-06' AS Date), CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (929, 31, 19, 4, CAST(N'2019-11-06' AS Date), CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[planilla_horaria] ([id], [chofer_id], [coche_id], [recorrido_id], [fecha], [dvh]) VALUES (930, 32, 19, 4, CAST(N'2019-11-06' AS Date), CAST(6 AS Numeric(1, 0)))
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
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3938, 723, 1, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3939, 723, 0, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3940, 723, 1, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3941, 723, 0, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3942, 723, 1, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3943, 723, 0, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3944, 723, 1, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3945, 723, 0, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3946, 724, 1, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3947, 724, 0, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3948, 724, 1, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3949, 724, 0, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3950, 724, 1, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3951, 724, 0, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3952, 724, 1, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3953, 725, 0, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3954, 725, 1, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3955, 725, 0, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3956, 725, 1, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3957, 725, 0, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3958, 725, 1, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3959, 725, 0, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3960, 725, 1, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3961, 726, 0, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3962, 726, 1, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3963, 726, 0, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3964, 726, 1, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3965, 726, 0, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3966, 726, 1, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3967, 726, 0, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3968, 727, 1, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3969, 727, 0, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3970, 727, 1, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3971, 727, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3972, 727, 1, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3973, 727, 0, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3974, 727, 1, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3975, 727, 0, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3976, 728, 1, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3977, 728, 0, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3978, 728, 1, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3979, 728, 0, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3980, 728, 1, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3981, 728, 0, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3982, 728, 1, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3983, 729, 0, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3984, 729, 1, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3985, 729, 0, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3986, 729, 1, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3987, 729, 0, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3988, 729, 1, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3989, 729, 0, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3990, 729, 1, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3991, 730, 0, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3992, 730, 1, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3993, 730, 0, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3994, 730, 1, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3995, 730, 0, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3996, 730, 1, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3997, 730, 0, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3998, 731, 1, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (3999, 731, 0, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4000, 731, 1, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4001, 731, 0, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4002, 731, 1, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4003, 731, 0, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4004, 731, 1, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4005, 732, 0, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4006, 732, 1, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4007, 732, 0, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4008, 732, 1, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4009, 732, 0, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4010, 732, 1, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4011, 732, 0, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4012, 732, 1, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4013, 733, 0, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4014, 733, 1, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4015, 733, 0, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4016, 733, 1, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4017, 733, 0, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4018, 733, 1, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4019, 733, 0, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4020, 734, 1, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4021, 734, 0, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4022, 734, 1, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4023, 734, 0, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4024, 734, 1, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4025, 734, 0, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4026, 734, 1, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4027, 734, 0, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4028, 735, 1, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4029, 735, 0, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4030, 735, 1, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4031, 735, 0, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4032, 735, 1, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4033, 735, 0, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4034, 735, 1, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4035, 735, 0, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4036, 736, 1, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4037, 736, 0, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4038, 736, 1, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4039, 736, 0, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4040, 736, 1, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4041, 736, 0, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4042, 736, 1, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4043, 737, 0, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4044, 737, 1, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4045, 737, 0, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4046, 737, 1, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4047, 737, 0, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4048, 737, 1, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4049, 737, 0, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4050, 737, 1, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4051, 738, 0, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4052, 738, 1, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4053, 738, 0, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4054, 738, 1, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4055, 738, 0, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4056, 738, 1, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4057, 738, 0, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4058, 739, 1, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4059, 739, 0, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4060, 739, 1, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4061, 739, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4062, 739, 1, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4063, 739, 0, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4064, 739, 1, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4065, 739, 0, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4066, 740, 1, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4067, 740, 0, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4068, 740, 1, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4069, 740, 0, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4070, 740, 1, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4071, 740, 0, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4072, 740, 1, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4073, 741, 0, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4074, 741, 1, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4075, 741, 0, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4076, 741, 1, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4077, 741, 0, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4078, 741, 1, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4079, 741, 0, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4080, 741, 1, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4081, 742, 0, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4082, 742, 1, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4083, 742, 0, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4084, 742, 1, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4085, 742, 0, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4086, 742, 1, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4087, 742, 0, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4088, 743, 1, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4089, 743, 0, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4090, 743, 1, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4091, 743, 0, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4092, 743, 1, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4093, 743, 0, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4094, 743, 1, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4095, 744, 0, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4096, 744, 1, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4097, 744, 0, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4098, 744, 1, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4099, 744, 0, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4100, 744, 1, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4101, 744, 0, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4102, 744, 1, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4103, 745, 0, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4104, 745, 1, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4105, 745, 0, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4106, 745, 1, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4107, 745, 0, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4108, 745, 1, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4109, 745, 0, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4110, 746, 1, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4111, 746, 0, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4112, 746, 1, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4113, 746, 0, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4114, 746, 1, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4115, 746, 0, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4116, 746, 1, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4117, 746, 0, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4118, 747, 1, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4119, 747, 0, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4120, 747, 1, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4121, 747, 0, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4122, 747, 1, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4123, 747, 0, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4124, 747, 1, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4125, 747, 0, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4126, 748, 1, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4127, 748, 0, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4128, 748, 1, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4129, 748, 0, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4130, 748, 1, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4131, 748, 0, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4132, 748, 1, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4133, 749, 0, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4134, 749, 1, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4135, 749, 0, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4136, 749, 1, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4137, 749, 0, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4138, 749, 1, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4139, 749, 0, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4140, 749, 1, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4141, 750, 0, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4142, 750, 1, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4143, 750, 0, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4144, 750, 1, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4145, 750, 0, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4146, 750, 1, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4147, 750, 0, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4148, 751, 1, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4149, 751, 0, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4150, 751, 1, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4151, 751, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4152, 751, 1, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4153, 751, 0, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4154, 751, 1, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4155, 751, 0, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4156, 752, 1, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4157, 752, 0, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4158, 752, 1, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4159, 752, 0, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4160, 752, 1, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4161, 752, 0, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4162, 752, 1, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4163, 753, 0, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4164, 753, 1, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4165, 753, 0, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4166, 753, 1, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4167, 753, 0, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4168, 753, 1, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4169, 753, 0, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4170, 753, 1, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4171, 754, 0, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4172, 754, 1, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4173, 754, 0, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4174, 754, 1, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4175, 754, 0, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4176, 754, 1, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4177, 754, 0, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4178, 755, 1, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4179, 755, 0, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4180, 755, 1, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4181, 755, 0, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4182, 755, 1, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4183, 755, 0, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4184, 755, 1, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4185, 756, 0, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4186, 756, 1, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4187, 756, 0, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4188, 756, 1, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4189, 756, 0, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4190, 756, 1, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4191, 756, 0, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4192, 756, 1, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4193, 757, 0, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4194, 757, 1, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4195, 757, 0, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4196, 757, 1, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4197, 757, 0, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4198, 757, 1, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4199, 757, 0, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4200, 758, 1, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4201, 758, 0, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4202, 758, 1, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4203, 758, 0, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4204, 758, 1, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4205, 758, 0, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4206, 758, 1, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4207, 758, 0, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4208, 759, 1, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4209, 759, 0, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4210, 759, 1, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4211, 759, 0, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4212, 759, 1, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4213, 759, 0, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4214, 759, 1, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4215, 759, 0, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4216, 760, 1, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4217, 760, 0, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4218, 760, 1, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4219, 760, 0, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4220, 760, 1, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4221, 760, 0, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4222, 760, 1, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4223, 761, 0, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4224, 761, 1, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4225, 761, 0, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4226, 761, 1, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4227, 761, 0, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4228, 761, 1, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4229, 761, 0, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4230, 761, 1, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4231, 762, 0, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4232, 762, 1, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4233, 762, 0, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4234, 762, 1, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4235, 762, 0, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4236, 762, 1, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4237, 762, 0, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4238, 763, 1, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4239, 763, 0, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4240, 763, 1, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4241, 763, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4242, 763, 1, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4243, 763, 0, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4244, 763, 1, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4245, 763, 0, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4246, 764, 1, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4247, 764, 0, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4248, 764, 1, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4249, 764, 0, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4250, 764, 1, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4251, 764, 0, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4252, 764, 1, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4253, 765, 0, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4254, 765, 1, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4255, 765, 0, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4256, 765, 1, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4257, 765, 0, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4258, 765, 1, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4259, 765, 0, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4260, 765, 1, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4261, 766, 0, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4262, 766, 1, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4263, 766, 0, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4264, 766, 1, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4265, 766, 0, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4266, 766, 1, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4267, 766, 0, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4268, 767, 1, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4269, 767, 0, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4270, 767, 1, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4271, 767, 0, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4272, 767, 1, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4273, 767, 0, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4274, 767, 1, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4275, 768, 0, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4276, 768, 1, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4277, 768, 0, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4278, 768, 1, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4279, 768, 0, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4280, 768, 1, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4281, 768, 0, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4282, 768, 1, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4283, 769, 0, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4284, 769, 1, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4285, 769, 0, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4286, 769, 1, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4287, 769, 0, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4288, 769, 1, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4289, 769, 0, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4290, 770, 1, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4291, 770, 0, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4292, 770, 1, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4293, 770, 0, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4294, 770, 1, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4295, 770, 0, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4296, 770, 1, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4297, 770, 0, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4298, 771, 1, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4299, 771, 0, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4300, 771, 1, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4301, 771, 0, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4302, 771, 1, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4303, 771, 0, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4304, 771, 1, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4305, 771, 0, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4306, 772, 1, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4307, 772, 0, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4308, 772, 1, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4309, 772, 0, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4310, 772, 1, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4311, 772, 0, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4312, 772, 1, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4313, 773, 0, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4314, 773, 1, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4315, 773, 0, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4316, 773, 1, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4317, 773, 0, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4318, 773, 1, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4319, 773, 0, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4320, 773, 1, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4321, 774, 0, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4322, 774, 1, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4323, 774, 0, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4324, 774, 1, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4325, 774, 0, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4326, 774, 1, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4327, 774, 0, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4328, 775, 1, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4329, 775, 0, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4330, 775, 1, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4331, 775, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4332, 775, 1, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4333, 775, 0, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4334, 775, 1, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4335, 775, 0, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4336, 776, 1, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4337, 776, 0, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4338, 776, 1, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4339, 776, 0, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4340, 776, 1, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4341, 776, 0, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4342, 776, 1, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4343, 777, 0, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4344, 777, 1, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4345, 777, 0, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4346, 777, 1, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4347, 777, 0, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4348, 777, 1, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4349, 777, 0, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4350, 777, 1, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4351, 778, 0, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4352, 778, 1, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4353, 778, 0, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4354, 778, 1, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4355, 778, 0, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4356, 778, 1, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4357, 778, 0, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4358, 779, 1, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4359, 779, 0, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4360, 779, 1, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4361, 779, 0, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4362, 779, 1, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4363, 779, 0, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4364, 779, 1, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4365, 780, 0, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4366, 780, 1, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4367, 780, 0, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4368, 780, 1, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4369, 780, 0, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4370, 780, 1, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4371, 780, 0, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4372, 780, 1, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4373, 781, 0, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4374, 781, 1, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4375, 781, 0, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4376, 781, 1, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4377, 781, 0, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4378, 781, 1, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4379, 781, 0, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4380, 782, 1, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4381, 782, 0, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4382, 782, 1, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4383, 782, 0, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4384, 782, 1, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4385, 782, 0, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4386, 782, 1, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4387, 782, 0, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4388, 783, 1, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4389, 783, 0, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4390, 783, 1, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4391, 783, 0, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4392, 783, 1, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4393, 783, 0, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4394, 783, 1, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4395, 783, 0, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4396, 784, 1, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4397, 784, 0, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4398, 784, 1, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4399, 784, 0, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4400, 784, 1, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4401, 784, 0, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4402, 784, 1, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4403, 785, 0, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4404, 785, 1, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4405, 785, 0, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4406, 785, 1, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4407, 785, 0, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4408, 785, 1, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4409, 785, 0, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4410, 785, 1, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4411, 786, 0, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4412, 786, 1, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4413, 786, 0, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4414, 786, 1, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4415, 786, 0, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4416, 786, 1, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4417, 786, 0, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4418, 787, 1, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4419, 787, 0, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4420, 787, 1, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4421, 787, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4422, 787, 1, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4423, 787, 0, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4424, 787, 1, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4425, 787, 0, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4426, 788, 1, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4427, 788, 0, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4428, 788, 1, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4429, 788, 0, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4430, 788, 1, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4431, 788, 0, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4432, 788, 1, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4433, 789, 0, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4434, 789, 1, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4435, 789, 0, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4436, 789, 1, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4437, 789, 0, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4438, 789, 1, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4439, 789, 0, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4440, 789, 1, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4441, 790, 0, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4442, 790, 1, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4443, 790, 0, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4444, 790, 1, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4445, 790, 0, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4446, 790, 1, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4447, 790, 0, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4448, 791, 1, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4449, 791, 0, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4450, 791, 1, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4451, 791, 0, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4452, 791, 1, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4453, 791, 0, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4454, 791, 1, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4455, 792, 0, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4456, 792, 1, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4457, 792, 0, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4458, 792, 1, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4459, 792, 0, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4460, 792, 1, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4461, 792, 0, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4462, 792, 1, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4463, 793, 0, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4464, 793, 1, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4465, 793, 0, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4466, 793, 1, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4467, 793, 0, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4468, 793, 1, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4469, 793, 0, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4470, 794, 1, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4471, 794, 0, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4472, 794, 1, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4473, 794, 0, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4474, 794, 1, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4475, 794, 0, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4476, 794, 1, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4477, 794, 0, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4478, 795, 1, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4479, 795, 0, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4480, 795, 1, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4481, 795, 0, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4482, 795, 1, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4483, 795, 0, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4484, 795, 1, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4485, 795, 0, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4486, 796, 1, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4487, 796, 0, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4488, 796, 1, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4489, 796, 0, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4490, 796, 1, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4491, 796, 0, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4492, 796, 1, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4493, 797, 0, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4494, 797, 1, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4495, 797, 0, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4496, 797, 1, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4497, 797, 0, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4498, 797, 1, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4499, 797, 0, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4500, 797, 1, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4501, 798, 0, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4502, 798, 1, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4503, 798, 0, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4504, 798, 1, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4505, 798, 0, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4506, 798, 1, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4507, 798, 0, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4508, 799, 1, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4509, 799, 0, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4510, 799, 1, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4511, 799, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4512, 799, 1, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4513, 799, 0, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4514, 799, 1, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4515, 799, 0, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4516, 800, 1, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4517, 800, 0, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4518, 800, 1, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4519, 800, 0, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4520, 800, 1, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4521, 800, 0, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4522, 800, 1, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4523, 801, 0, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4524, 801, 1, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4525, 801, 0, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4526, 801, 1, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4527, 801, 0, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4528, 801, 1, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4529, 801, 0, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4530, 801, 1, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4531, 802, 0, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4532, 802, 1, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4533, 802, 0, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4534, 802, 1, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4535, 802, 0, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4536, 802, 1, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4537, 802, 0, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4538, 803, 1, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4539, 803, 0, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4540, 803, 1, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4541, 803, 0, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4542, 803, 1, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4543, 803, 0, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4544, 803, 1, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4545, 804, 0, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4546, 804, 1, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4547, 804, 0, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4548, 804, 1, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4549, 804, 0, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4550, 804, 1, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4551, 804, 0, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4552, 804, 1, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4553, 805, 0, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4554, 805, 1, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4555, 805, 0, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4556, 805, 1, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4557, 805, 0, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4558, 805, 1, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4559, 805, 0, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4560, 806, 1, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4561, 806, 0, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4562, 806, 1, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4563, 806, 0, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4564, 806, 1, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4565, 806, 0, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4566, 806, 1, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4567, 806, 0, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4568, 807, 1, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4569, 807, 0, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4570, 807, 1, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4571, 807, 0, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4572, 807, 1, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4573, 807, 0, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4574, 807, 1, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4575, 807, 0, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4576, 808, 1, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4577, 808, 0, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4578, 808, 1, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4579, 808, 0, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4580, 808, 1, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4581, 808, 0, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4582, 808, 1, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4583, 809, 0, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4584, 809, 1, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4585, 809, 0, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4586, 809, 1, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4587, 809, 0, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4588, 809, 1, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4589, 809, 0, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4590, 809, 1, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4591, 810, 0, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4592, 810, 1, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4593, 810, 0, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4594, 810, 1, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4595, 810, 0, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4596, 810, 1, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4597, 810, 0, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4598, 811, 1, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4599, 811, 0, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4600, 811, 1, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4601, 811, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4602, 811, 1, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4603, 811, 0, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4604, 811, 1, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4605, 811, 0, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4606, 812, 1, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4607, 812, 0, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4608, 812, 1, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4609, 812, 0, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4610, 812, 1, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4611, 812, 0, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4612, 812, 1, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4613, 813, 0, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4614, 813, 1, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4615, 813, 0, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4616, 813, 1, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4617, 813, 0, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4618, 813, 1, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4619, 813, 0, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4620, 813, 1, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4621, 814, 0, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4622, 814, 1, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4623, 814, 0, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4624, 814, 1, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4625, 814, 0, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4626, 814, 1, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4627, 814, 0, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4628, 815, 1, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4629, 815, 0, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4630, 815, 1, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4631, 815, 0, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4632, 815, 1, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4633, 815, 0, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4634, 815, 1, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4635, 816, 0, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4636, 816, 1, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4637, 816, 0, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4638, 816, 1, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4639, 816, 0, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4640, 816, 1, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4641, 816, 0, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4642, 816, 1, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4643, 817, 0, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4644, 817, 1, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4645, 817, 0, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4646, 817, 1, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4647, 817, 0, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4648, 817, 1, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4649, 817, 0, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4650, 818, 1, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4651, 818, 0, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4652, 818, 1, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4653, 818, 0, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4654, 818, 1, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4655, 818, 0, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4656, 818, 1, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4657, 818, 0, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4658, 819, 1, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4659, 819, 0, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4660, 819, 1, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4661, 819, 0, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4662, 819, 1, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4663, 819, 0, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4664, 819, 1, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4665, 819, 0, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4666, 820, 1, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4667, 820, 0, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4668, 820, 1, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4669, 820, 0, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4670, 820, 1, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4671, 820, 0, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4672, 820, 1, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4673, 821, 0, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4674, 821, 1, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4675, 821, 0, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4676, 821, 1, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4677, 821, 0, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4678, 821, 1, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4679, 821, 0, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4680, 821, 1, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4681, 822, 0, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4682, 822, 1, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4683, 822, 0, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4684, 822, 1, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4685, 822, 0, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4686, 822, 1, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4687, 822, 0, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4688, 823, 1, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4689, 823, 0, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4690, 823, 1, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4691, 823, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4692, 823, 1, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4693, 823, 0, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4694, 823, 1, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4695, 823, 0, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4696, 824, 1, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4697, 824, 0, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4698, 824, 1, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4699, 824, 0, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4700, 824, 1, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4701, 824, 0, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4702, 824, 1, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4703, 825, 0, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4704, 825, 1, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4705, 825, 0, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4706, 825, 1, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4707, 825, 0, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4708, 825, 1, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4709, 825, 0, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4710, 825, 1, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4711, 826, 0, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4712, 826, 1, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4713, 826, 0, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4714, 826, 1, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4715, 826, 0, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4716, 826, 1, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4717, 826, 0, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4718, 827, 1, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4719, 827, 0, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4720, 827, 1, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4721, 827, 0, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4722, 827, 1, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4723, 827, 0, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4724, 827, 1, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4725, 828, 0, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4726, 828, 1, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4727, 828, 0, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4728, 828, 1, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4729, 828, 0, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4730, 828, 1, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4731, 828, 0, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4732, 828, 1, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4733, 829, 0, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4734, 829, 1, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4735, 829, 0, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4736, 829, 1, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4737, 829, 0, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4738, 829, 1, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4739, 829, 0, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4740, 830, 1, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4741, 830, 0, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4742, 830, 1, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4743, 830, 0, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4744, 830, 1, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4745, 830, 0, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4746, 830, 1, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4747, 830, 0, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4748, 831, 1, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4749, 831, 0, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4750, 831, 1, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4751, 831, 0, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4752, 831, 1, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4753, 831, 0, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4754, 831, 1, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4755, 831, 0, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4756, 832, 1, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4757, 832, 0, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4758, 832, 1, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4759, 832, 0, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4760, 832, 1, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4761, 832, 0, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4762, 832, 1, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4763, 833, 0, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4764, 833, 1, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4765, 833, 0, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4766, 833, 1, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4767, 833, 0, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4768, 833, 1, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4769, 833, 0, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4770, 833, 1, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4771, 834, 0, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4772, 834, 1, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4773, 834, 0, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4774, 834, 1, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4775, 834, 0, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4776, 834, 1, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4777, 834, 0, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4778, 835, 1, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4779, 835, 0, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4780, 835, 1, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4781, 835, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4782, 835, 1, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4783, 835, 0, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4784, 835, 1, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4785, 835, 0, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4786, 836, 1, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4787, 836, 0, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4788, 836, 1, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4789, 836, 0, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4790, 836, 1, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4791, 836, 0, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4792, 836, 1, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4793, 837, 0, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4794, 837, 1, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4795, 837, 0, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4796, 837, 1, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4797, 837, 0, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4798, 837, 1, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4799, 837, 0, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4800, 837, 1, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4801, 838, 0, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4802, 838, 1, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4803, 838, 0, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4804, 838, 1, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4805, 838, 0, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4806, 838, 1, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4807, 838, 0, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4808, 839, 1, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4809, 839, 0, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4810, 839, 1, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4811, 839, 0, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4812, 839, 1, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4813, 839, 0, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4814, 839, 1, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4815, 840, 0, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4816, 840, 1, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4817, 840, 0, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4818, 840, 1, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4819, 840, 0, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4820, 840, 1, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4821, 840, 0, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4822, 840, 1, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4823, 841, 0, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4824, 841, 1, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4825, 841, 0, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4826, 841, 1, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4827, 841, 0, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4828, 841, 1, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4829, 841, 0, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4830, 842, 1, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4831, 842, 0, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4832, 842, 1, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4833, 842, 0, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4834, 842, 1, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4835, 842, 0, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4836, 842, 1, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4837, 842, 0, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4838, 843, 1, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4839, 843, 0, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4840, 843, 1, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4841, 843, 0, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4842, 843, 1, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4843, 843, 0, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4844, 843, 1, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4845, 843, 0, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4846, 844, 1, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4847, 844, 0, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4848, 844, 1, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4849, 844, 0, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4850, 844, 1, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4851, 844, 0, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4852, 844, 1, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4853, 845, 0, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4854, 845, 1, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4855, 845, 0, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4856, 845, 1, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4857, 845, 0, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4858, 845, 1, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4859, 845, 0, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4860, 845, 1, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4861, 846, 0, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4862, 846, 1, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4863, 846, 0, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4864, 846, 1, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4865, 846, 0, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4866, 846, 1, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4867, 846, 0, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4868, 847, 1, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4869, 847, 0, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4870, 847, 1, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4871, 847, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4872, 847, 1, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4873, 847, 0, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4874, 847, 1, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4875, 847, 0, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4876, 848, 1, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4877, 848, 0, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4878, 848, 1, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4879, 848, 0, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4880, 848, 1, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4881, 848, 0, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4882, 848, 1, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4883, 849, 0, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4884, 849, 1, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4885, 849, 0, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4886, 849, 1, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4887, 849, 0, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4888, 849, 1, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4889, 849, 0, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4890, 849, 1, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4891, 850, 0, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4892, 850, 1, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4893, 850, 0, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4894, 850, 1, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4895, 850, 0, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4896, 850, 1, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4897, 850, 0, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4898, 851, 1, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4899, 851, 0, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4900, 851, 1, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4901, 851, 0, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4902, 851, 1, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4903, 851, 0, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4904, 851, 1, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4905, 852, 0, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4906, 852, 1, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4907, 852, 0, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4908, 852, 1, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4909, 852, 0, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4910, 852, 1, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4911, 852, 0, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4912, 852, 1, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4913, 853, 0, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4914, 853, 1, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4915, 853, 0, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4916, 853, 1, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4917, 853, 0, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4918, 853, 1, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4919, 853, 0, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4920, 854, 1, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4921, 854, 0, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4922, 854, 1, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4923, 854, 0, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4924, 854, 1, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4925, 854, 0, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4926, 854, 1, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4927, 854, 0, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4928, 855, 1, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4929, 855, 0, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4930, 855, 1, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4931, 855, 0, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4932, 855, 1, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4933, 855, 0, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4934, 855, 1, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4935, 855, 0, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4936, 856, 1, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4937, 856, 0, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4938, 856, 1, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4939, 856, 0, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4940, 856, 1, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4941, 856, 0, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4942, 856, 1, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4943, 857, 0, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4944, 857, 1, CAST(N'05:21:00' AS Time), CAST(N'06:21:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4945, 857, 0, CAST(N'06:42:00' AS Time), CAST(N'07:42:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4946, 857, 1, CAST(N'08:03:00' AS Time), CAST(N'09:03:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4947, 857, 0, CAST(N'09:24:00' AS Time), CAST(N'10:24:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4948, 857, 1, CAST(N'10:45:00' AS Time), CAST(N'11:45:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4949, 857, 0, CAST(N'12:06:00' AS Time), CAST(N'13:06:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4950, 857, 1, CAST(N'13:27:00' AS Time), CAST(N'14:27:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4951, 858, 0, CAST(N'14:48:00' AS Time), CAST(N'15:48:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4952, 858, 1, CAST(N'16:09:00' AS Time), CAST(N'17:09:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4953, 858, 0, CAST(N'17:30:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4954, 858, 1, CAST(N'18:51:00' AS Time), CAST(N'19:51:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4955, 858, 0, CAST(N'20:12:00' AS Time), CAST(N'21:12:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4956, 858, 1, CAST(N'21:33:00' AS Time), CAST(N'22:33:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4957, 858, 0, CAST(N'22:54:00' AS Time), CAST(N'23:54:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4958, 859, 1, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4959, 859, 0, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4960, 859, 1, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4961, 859, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4962, 859, 1, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4963, 859, 0, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4964, 859, 1, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4965, 859, 0, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4966, 860, 1, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4967, 860, 0, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4968, 860, 1, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4969, 860, 0, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4970, 860, 1, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4971, 860, 0, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4972, 860, 1, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4973, 861, 0, CAST(N'04:27:00' AS Time), CAST(N'05:27:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4974, 861, 1, CAST(N'05:48:00' AS Time), CAST(N'06:48:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4975, 861, 0, CAST(N'07:09:00' AS Time), CAST(N'08:09:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4976, 861, 1, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4977, 861, 0, CAST(N'09:51:00' AS Time), CAST(N'10:51:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4978, 861, 1, CAST(N'11:12:00' AS Time), CAST(N'12:12:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4979, 861, 0, CAST(N'12:33:00' AS Time), CAST(N'13:33:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4980, 861, 1, CAST(N'13:54:00' AS Time), CAST(N'14:54:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4981, 862, 0, CAST(N'15:15:00' AS Time), CAST(N'16:15:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4982, 862, 1, CAST(N'16:36:00' AS Time), CAST(N'17:36:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4983, 862, 0, CAST(N'17:57:00' AS Time), CAST(N'18:57:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4984, 862, 1, CAST(N'19:18:00' AS Time), CAST(N'20:18:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4985, 862, 0, CAST(N'20:39:00' AS Time), CAST(N'21:39:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4986, 862, 1, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4987, 862, 0, CAST(N'23:21:00' AS Time), CAST(N'00:21:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4988, 863, 1, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4989, 863, 0, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4990, 863, 1, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4991, 863, 0, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4992, 863, 1, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4993, 863, 0, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4994, 863, 1, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4995, 864, 0, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4996, 864, 1, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4997, 864, 0, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4998, 864, 1, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (4999, 864, 0, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5000, 864, 1, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5001, 864, 0, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5002, 864, 1, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5003, 865, 0, CAST(N'04:54:00' AS Time), CAST(N'05:54:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5004, 865, 1, CAST(N'06:15:00' AS Time), CAST(N'07:15:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5005, 865, 0, CAST(N'07:36:00' AS Time), CAST(N'08:36:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5006, 865, 1, CAST(N'08:57:00' AS Time), CAST(N'09:57:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5007, 865, 0, CAST(N'10:18:00' AS Time), CAST(N'11:18:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5008, 865, 1, CAST(N'11:39:00' AS Time), CAST(N'12:39:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5009, 865, 0, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5010, 866, 1, CAST(N'14:21:00' AS Time), CAST(N'15:21:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5011, 866, 0, CAST(N'15:42:00' AS Time), CAST(N'16:42:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5012, 866, 1, CAST(N'17:03:00' AS Time), CAST(N'18:03:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5013, 866, 0, CAST(N'18:24:00' AS Time), CAST(N'19:24:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5014, 866, 1, CAST(N'19:45:00' AS Time), CAST(N'20:45:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5015, 866, 0, CAST(N'21:06:00' AS Time), CAST(N'22:06:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5016, 866, 1, CAST(N'22:27:00' AS Time), CAST(N'23:27:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5017, 866, 0, CAST(N'23:48:00' AS Time), CAST(N'00:48:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5018, 867, 1, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5019, 867, 0, CAST(N'05:20:00' AS Time), CAST(N'06:20:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5020, 867, 1, CAST(N'06:40:00' AS Time), CAST(N'07:40:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5021, 867, 0, CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5022, 867, 1, CAST(N'09:20:00' AS Time), CAST(N'10:20:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5023, 867, 0, CAST(N'10:40:00' AS Time), CAST(N'11:40:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5024, 867, 1, CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5025, 867, 0, CAST(N'13:20:00' AS Time), CAST(N'14:20:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5026, 868, 1, CAST(N'14:40:00' AS Time), CAST(N'15:40:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5027, 868, 0, CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5028, 868, 1, CAST(N'17:20:00' AS Time), CAST(N'18:20:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5029, 868, 0, CAST(N'18:40:00' AS Time), CAST(N'19:40:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5030, 868, 1, CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5031, 868, 0, CAST(N'21:20:00' AS Time), CAST(N'22:20:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5032, 868, 1, CAST(N'22:40:00' AS Time), CAST(N'14:04:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5033, 868, 0, CAST(N'22:40:00' AS Time), CAST(N'14:04:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5034, 868, 1, CAST(N'23:20:00' AS Time), CAST(N'14:44:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5035, 868, 0, CAST(N'23:20:00' AS Time), CAST(N'14:44:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5036, 869, 0, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), CAST(N'05:21:00' AS Time), 1, 2, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5037, 869, 1, CAST(N'05:20:00' AS Time), CAST(N'06:20:00' AS Time), CAST(N'06:20:00' AS Time), 1, 3, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5038, 869, 0, CAST(N'06:40:00' AS Time), CAST(N'07:40:00' AS Time), CAST(N'07:50:00' AS Time), 1, 2, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5039, 869, 1, CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), CAST(N'08:56:00' AS Time), 1, 3, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5040, 869, 0, CAST(N'09:20:00' AS Time), CAST(N'10:20:00' AS Time), CAST(N'10:22:00' AS Time), 1, 2, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5041, 869, 1, CAST(N'10:40:00' AS Time), CAST(N'11:40:00' AS Time), CAST(N'11:40:00' AS Time), 1, 1, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5042, 869, 0, CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), CAST(N'13:02:00' AS Time), 1, 1, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5043, 869, 1, CAST(N'13:20:00' AS Time), CAST(N'14:20:00' AS Time), CAST(N'14:22:00' AS Time), 1, 3, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5044, 870, 0, CAST(N'14:40:00' AS Time), CAST(N'15:40:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5045, 870, 1, CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5046, 870, 0, CAST(N'17:20:00' AS Time), CAST(N'18:20:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5047, 870, 1, CAST(N'18:40:00' AS Time), CAST(N'19:40:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5048, 870, 0, CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5049, 870, 1, CAST(N'21:20:00' AS Time), CAST(N'22:20:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5050, 871, 1, CAST(N'04:40:00' AS Time), CAST(N'05:40:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5051, 871, 0, CAST(N'06:00:00' AS Time), CAST(N'07:00:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5052, 871, 1, CAST(N'07:20:00' AS Time), CAST(N'08:20:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5053, 871, 0, CAST(N'08:40:00' AS Time), CAST(N'09:40:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5054, 871, 1, CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5055, 871, 0, CAST(N'11:20:00' AS Time), CAST(N'12:20:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5056, 871, 1, CAST(N'12:40:00' AS Time), CAST(N'13:40:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5057, 872, 0, CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5058, 872, 1, CAST(N'15:20:00' AS Time), CAST(N'16:20:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5059, 872, 0, CAST(N'16:40:00' AS Time), CAST(N'17:40:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5060, 872, 1, CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5061, 872, 0, CAST(N'19:20:00' AS Time), CAST(N'20:20:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5062, 872, 1, CAST(N'20:40:00' AS Time), CAST(N'21:40:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5063, 872, 0, CAST(N'22:00:00' AS Time), CAST(N'13:24:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5064, 873, 0, CAST(N'04:40:00' AS Time), CAST(N'05:40:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5065, 873, 1, CAST(N'06:00:00' AS Time), CAST(N'07:00:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5066, 873, 0, CAST(N'07:20:00' AS Time), CAST(N'08:20:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5067, 873, 1, CAST(N'08:40:00' AS Time), CAST(N'09:40:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5068, 873, 0, CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5069, 873, 1, CAST(N'11:20:00' AS Time), CAST(N'12:20:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5070, 873, 0, CAST(N'12:40:00' AS Time), CAST(N'13:40:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5071, 874, 1, CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5072, 874, 0, CAST(N'15:20:00' AS Time), CAST(N'16:20:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5073, 874, 1, CAST(N'16:40:00' AS Time), CAST(N'17:40:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5074, 874, 0, CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5075, 874, 1, CAST(N'19:20:00' AS Time), CAST(N'20:20:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5076, 874, 0, CAST(N'20:40:00' AS Time), CAST(N'21:40:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5077, 874, 1, CAST(N'22:00:00' AS Time), CAST(N'13:24:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5078, 875, 1, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5079, 875, 0, CAST(N'05:20:00' AS Time), CAST(N'06:20:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5080, 875, 1, CAST(N'06:40:00' AS Time), CAST(N'07:40:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5081, 875, 0, CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5082, 875, 1, CAST(N'09:20:00' AS Time), CAST(N'10:20:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5083, 875, 0, CAST(N'10:40:00' AS Time), CAST(N'11:40:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5084, 875, 1, CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5085, 875, 0, CAST(N'13:20:00' AS Time), CAST(N'14:20:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5086, 876, 1, CAST(N'14:40:00' AS Time), CAST(N'15:40:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5087, 876, 0, CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5088, 876, 1, CAST(N'17:20:00' AS Time), CAST(N'18:20:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5089, 876, 0, CAST(N'18:40:00' AS Time), CAST(N'19:40:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5090, 876, 1, CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5091, 876, 0, CAST(N'21:20:00' AS Time), CAST(N'22:20:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5092, 876, 1, CAST(N'22:40:00' AS Time), CAST(N'14:04:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5093, 876, 0, CAST(N'22:40:00' AS Time), CAST(N'14:04:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5094, 876, 1, CAST(N'23:20:00' AS Time), CAST(N'14:44:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5095, 876, 0, CAST(N'23:20:00' AS Time), CAST(N'14:44:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5096, 877, 0, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5097, 877, 1, CAST(N'05:20:00' AS Time), CAST(N'06:20:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5098, 877, 0, CAST(N'06:40:00' AS Time), CAST(N'07:40:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5099, 877, 1, CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5100, 877, 0, CAST(N'09:20:00' AS Time), CAST(N'10:20:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5101, 877, 1, CAST(N'10:40:00' AS Time), CAST(N'11:40:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5102, 877, 0, CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5103, 877, 1, CAST(N'13:20:00' AS Time), CAST(N'14:20:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5104, 878, 0, CAST(N'14:40:00' AS Time), CAST(N'15:40:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5105, 878, 1, CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5106, 878, 0, CAST(N'17:20:00' AS Time), CAST(N'18:20:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5107, 878, 1, CAST(N'18:40:00' AS Time), CAST(N'19:40:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5108, 878, 0, CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5109, 878, 1, CAST(N'21:20:00' AS Time), CAST(N'22:20:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5110, 879, 1, CAST(N'04:40:00' AS Time), CAST(N'05:40:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5111, 879, 0, CAST(N'06:00:00' AS Time), CAST(N'07:00:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5112, 879, 1, CAST(N'07:20:00' AS Time), CAST(N'08:20:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5113, 879, 0, CAST(N'08:40:00' AS Time), CAST(N'09:40:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5114, 879, 1, CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5115, 879, 0, CAST(N'11:20:00' AS Time), CAST(N'12:20:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5116, 879, 1, CAST(N'12:40:00' AS Time), CAST(N'13:40:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5117, 880, 0, CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5118, 880, 1, CAST(N'15:20:00' AS Time), CAST(N'16:20:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5119, 880, 0, CAST(N'16:40:00' AS Time), CAST(N'17:40:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5120, 880, 1, CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5121, 880, 0, CAST(N'19:20:00' AS Time), CAST(N'20:20:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5122, 880, 1, CAST(N'20:40:00' AS Time), CAST(N'21:40:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5123, 880, 0, CAST(N'22:00:00' AS Time), CAST(N'13:24:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5124, 881, 0, CAST(N'04:40:00' AS Time), CAST(N'05:40:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5125, 881, 1, CAST(N'06:00:00' AS Time), CAST(N'07:00:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5126, 881, 0, CAST(N'07:20:00' AS Time), CAST(N'08:20:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5127, 881, 1, CAST(N'08:40:00' AS Time), CAST(N'09:40:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5128, 881, 0, CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5129, 881, 1, CAST(N'11:20:00' AS Time), CAST(N'12:20:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5130, 881, 0, CAST(N'12:40:00' AS Time), CAST(N'13:40:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5131, 882, 1, CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5132, 882, 0, CAST(N'15:20:00' AS Time), CAST(N'16:20:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5133, 882, 1, CAST(N'16:40:00' AS Time), CAST(N'17:40:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5134, 882, 0, CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5135, 882, 1, CAST(N'19:20:00' AS Time), CAST(N'20:20:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5136, 882, 0, CAST(N'20:40:00' AS Time), CAST(N'21:40:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5137, 882, 1, CAST(N'22:00:00' AS Time), CAST(N'13:24:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5138, 883, 1, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5139, 883, 0, CAST(N'05:20:00' AS Time), CAST(N'06:20:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5140, 883, 1, CAST(N'06:40:00' AS Time), CAST(N'07:40:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5141, 883, 0, CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5142, 883, 1, CAST(N'09:20:00' AS Time), CAST(N'10:20:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5143, 883, 0, CAST(N'10:40:00' AS Time), CAST(N'11:40:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5144, 883, 1, CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5145, 883, 0, CAST(N'13:20:00' AS Time), CAST(N'14:20:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5146, 884, 1, CAST(N'14:40:00' AS Time), CAST(N'15:40:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5147, 884, 0, CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5148, 884, 1, CAST(N'17:20:00' AS Time), CAST(N'18:20:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5149, 884, 0, CAST(N'18:40:00' AS Time), CAST(N'19:40:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5150, 884, 1, CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5151, 884, 0, CAST(N'21:20:00' AS Time), CAST(N'22:20:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5152, 884, 1, CAST(N'22:40:00' AS Time), CAST(N'14:04:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5153, 884, 0, CAST(N'22:40:00' AS Time), CAST(N'14:04:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5154, 884, 1, CAST(N'23:20:00' AS Time), CAST(N'14:44:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5155, 884, 0, CAST(N'23:20:00' AS Time), CAST(N'14:44:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5156, 885, 0, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5157, 885, 1, CAST(N'05:20:00' AS Time), CAST(N'06:20:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5158, 885, 0, CAST(N'06:40:00' AS Time), CAST(N'07:40:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5159, 885, 1, CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5160, 885, 0, CAST(N'09:20:00' AS Time), CAST(N'10:20:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5161, 885, 1, CAST(N'10:40:00' AS Time), CAST(N'11:40:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5162, 885, 0, CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5163, 885, 1, CAST(N'13:20:00' AS Time), CAST(N'14:20:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5164, 886, 0, CAST(N'14:40:00' AS Time), CAST(N'15:40:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5165, 886, 1, CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5166, 886, 0, CAST(N'17:20:00' AS Time), CAST(N'18:20:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5167, 886, 1, CAST(N'18:40:00' AS Time), CAST(N'19:40:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5168, 886, 0, CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5169, 886, 1, CAST(N'21:20:00' AS Time), CAST(N'22:20:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5170, 887, 1, CAST(N'04:40:00' AS Time), CAST(N'05:40:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5171, 887, 0, CAST(N'06:00:00' AS Time), CAST(N'07:00:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5172, 887, 1, CAST(N'07:20:00' AS Time), CAST(N'08:20:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5173, 887, 0, CAST(N'08:40:00' AS Time), CAST(N'09:40:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5174, 887, 1, CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5175, 887, 0, CAST(N'11:20:00' AS Time), CAST(N'12:20:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5176, 887, 1, CAST(N'12:40:00' AS Time), CAST(N'13:40:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5177, 888, 0, CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5178, 888, 1, CAST(N'15:20:00' AS Time), CAST(N'16:20:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5179, 888, 0, CAST(N'16:40:00' AS Time), CAST(N'17:40:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5180, 888, 1, CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5181, 888, 0, CAST(N'19:20:00' AS Time), CAST(N'20:20:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5182, 888, 1, CAST(N'20:40:00' AS Time), CAST(N'21:40:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5183, 888, 0, CAST(N'22:00:00' AS Time), CAST(N'13:24:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5184, 889, 0, CAST(N'04:40:00' AS Time), CAST(N'05:40:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5185, 889, 1, CAST(N'06:00:00' AS Time), CAST(N'07:00:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5186, 889, 0, CAST(N'07:20:00' AS Time), CAST(N'08:20:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5187, 889, 1, CAST(N'08:40:00' AS Time), CAST(N'09:40:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5188, 889, 0, CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5189, 889, 1, CAST(N'11:20:00' AS Time), CAST(N'12:20:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5190, 889, 0, CAST(N'12:40:00' AS Time), CAST(N'13:40:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5191, 890, 1, CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5192, 890, 0, CAST(N'15:20:00' AS Time), CAST(N'16:20:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5193, 890, 1, CAST(N'16:40:00' AS Time), CAST(N'17:40:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5194, 890, 0, CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5195, 890, 1, CAST(N'19:20:00' AS Time), CAST(N'20:20:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5196, 890, 0, CAST(N'20:40:00' AS Time), CAST(N'21:40:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5197, 890, 1, CAST(N'22:00:00' AS Time), CAST(N'13:24:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5198, 891, 1, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5199, 891, 0, CAST(N'05:20:00' AS Time), CAST(N'06:20:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5200, 891, 1, CAST(N'06:40:00' AS Time), CAST(N'07:40:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5201, 891, 0, CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5202, 891, 1, CAST(N'09:20:00' AS Time), CAST(N'10:20:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5203, 891, 0, CAST(N'10:40:00' AS Time), CAST(N'11:40:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5204, 891, 1, CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5205, 891, 0, CAST(N'13:20:00' AS Time), CAST(N'14:20:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5206, 892, 1, CAST(N'14:40:00' AS Time), CAST(N'15:40:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5207, 892, 0, CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5208, 892, 1, CAST(N'17:20:00' AS Time), CAST(N'18:20:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5209, 892, 0, CAST(N'18:40:00' AS Time), CAST(N'19:40:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5210, 892, 1, CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5211, 892, 0, CAST(N'21:20:00' AS Time), CAST(N'22:20:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5212, 892, 1, CAST(N'22:40:00' AS Time), CAST(N'14:04:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5213, 892, 0, CAST(N'22:40:00' AS Time), CAST(N'14:04:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5214, 892, 1, CAST(N'23:20:00' AS Time), CAST(N'14:44:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5215, 892, 0, CAST(N'23:20:00' AS Time), CAST(N'14:44:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5216, 893, 0, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5217, 893, 1, CAST(N'05:20:00' AS Time), CAST(N'06:20:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5218, 893, 0, CAST(N'06:40:00' AS Time), CAST(N'07:40:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5219, 893, 1, CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5220, 893, 0, CAST(N'09:20:00' AS Time), CAST(N'10:20:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5221, 893, 1, CAST(N'10:40:00' AS Time), CAST(N'11:40:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5222, 893, 0, CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5223, 893, 1, CAST(N'13:20:00' AS Time), CAST(N'14:20:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5224, 894, 0, CAST(N'14:40:00' AS Time), CAST(N'15:40:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5225, 894, 1, CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5226, 894, 0, CAST(N'17:20:00' AS Time), CAST(N'18:20:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5227, 894, 1, CAST(N'18:40:00' AS Time), CAST(N'19:40:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5228, 894, 0, CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5229, 894, 1, CAST(N'21:20:00' AS Time), CAST(N'22:20:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5230, 895, 1, CAST(N'04:40:00' AS Time), CAST(N'05:40:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5231, 895, 0, CAST(N'06:00:00' AS Time), CAST(N'07:00:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5232, 895, 1, CAST(N'07:20:00' AS Time), CAST(N'08:20:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5233, 895, 0, CAST(N'08:40:00' AS Time), CAST(N'09:40:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5234, 895, 1, CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5235, 895, 0, CAST(N'11:20:00' AS Time), CAST(N'12:20:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5236, 895, 1, CAST(N'12:40:00' AS Time), CAST(N'13:40:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5237, 896, 0, CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5238, 896, 1, CAST(N'15:20:00' AS Time), CAST(N'16:20:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5239, 896, 0, CAST(N'16:40:00' AS Time), CAST(N'17:40:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5240, 896, 1, CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5241, 896, 0, CAST(N'19:20:00' AS Time), CAST(N'20:20:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5242, 896, 1, CAST(N'20:40:00' AS Time), CAST(N'21:40:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5243, 896, 0, CAST(N'22:00:00' AS Time), CAST(N'13:24:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5244, 897, 0, CAST(N'04:40:00' AS Time), CAST(N'05:40:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5245, 897, 1, CAST(N'06:00:00' AS Time), CAST(N'07:00:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5246, 897, 0, CAST(N'07:20:00' AS Time), CAST(N'08:20:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5247, 897, 1, CAST(N'08:40:00' AS Time), CAST(N'09:40:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5248, 897, 0, CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5249, 897, 1, CAST(N'11:20:00' AS Time), CAST(N'12:20:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5250, 897, 0, CAST(N'12:40:00' AS Time), CAST(N'13:40:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5251, 898, 1, CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5252, 898, 0, CAST(N'15:20:00' AS Time), CAST(N'16:20:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5253, 898, 1, CAST(N'16:40:00' AS Time), CAST(N'17:40:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5254, 898, 0, CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5255, 898, 1, CAST(N'19:20:00' AS Time), CAST(N'20:20:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5256, 898, 0, CAST(N'20:40:00' AS Time), CAST(N'21:40:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5257, 898, 1, CAST(N'22:00:00' AS Time), CAST(N'13:24:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5258, 899, 1, CAST(N'04:00:00' AS Time), CAST(N'05:01:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5259, 899, 0, CAST(N'05:28:00' AS Time), CAST(N'06:29:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5260, 899, 1, CAST(N'06:55:00' AS Time), CAST(N'07:55:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5261, 899, 0, CAST(N'08:21:00' AS Time), CAST(N'09:21:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5262, 899, 1, CAST(N'09:49:00' AS Time), CAST(N'10:49:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5263, 899, 0, CAST(N'11:16:00' AS Time), CAST(N'12:16:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5264, 899, 1, CAST(N'12:42:00' AS Time), CAST(N'13:42:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5265, 900, 0, CAST(N'14:08:00' AS Time), CAST(N'15:08:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5266, 900, 1, CAST(N'15:34:00' AS Time), CAST(N'16:34:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5267, 900, 0, CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5268, 900, 1, CAST(N'18:26:00' AS Time), CAST(N'19:26:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5269, 900, 0, CAST(N'19:52:00' AS Time), CAST(N'20:52:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5270, 900, 1, CAST(N'21:18:00' AS Time), CAST(N'22:18:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5271, 900, 0, CAST(N'22:44:00' AS Time), CAST(N'14:08:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5272, 900, 1, CAST(N'23:27:00' AS Time), CAST(N'14:51:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5273, 900, 0, CAST(N'23:27:00' AS Time), CAST(N'14:51:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5274, 901, 0, CAST(N'04:00:00' AS Time), CAST(N'05:01:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5275, 901, 1, CAST(N'05:28:00' AS Time), CAST(N'06:29:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5276, 901, 0, CAST(N'06:55:00' AS Time), CAST(N'07:55:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5277, 901, 1, CAST(N'08:21:00' AS Time), CAST(N'09:21:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5278, 901, 0, CAST(N'09:49:00' AS Time), CAST(N'10:49:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5279, 901, 1, CAST(N'11:16:00' AS Time), CAST(N'12:16:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5280, 901, 0, CAST(N'12:42:00' AS Time), CAST(N'13:42:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5281, 902, 1, CAST(N'14:08:00' AS Time), CAST(N'15:08:00' AS Time), NULL, 0, 2, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5282, 902, 0, CAST(N'15:34:00' AS Time), CAST(N'16:34:00' AS Time), NULL, 0, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5283, 902, 1, CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), NULL, 0, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5284, 902, 0, CAST(N'18:26:00' AS Time), CAST(N'19:26:00' AS Time), NULL, 0, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5285, 902, 1, CAST(N'19:52:00' AS Time), CAST(N'20:52:00' AS Time), NULL, 0, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5286, 902, 0, CAST(N'21:18:00' AS Time), CAST(N'22:18:00' AS Time), NULL, 0, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5287, 902, 1, CAST(N'22:44:00' AS Time), CAST(N'14:08:00' AS Time), NULL, 0, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5288, 903, 1, CAST(N'04:44:00' AS Time), CAST(N'05:45:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5289, 903, 0, CAST(N'06:12:00' AS Time), CAST(N'07:12:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5290, 903, 1, CAST(N'07:38:00' AS Time), CAST(N'08:38:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5291, 903, 0, CAST(N'09:05:00' AS Time), CAST(N'10:05:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5292, 903, 1, CAST(N'10:33:00' AS Time), CAST(N'11:33:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5293, 903, 0, CAST(N'11:59:00' AS Time), CAST(N'12:59:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5294, 903, 1, CAST(N'13:25:00' AS Time), CAST(N'14:25:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5295, 904, 0, CAST(N'14:51:00' AS Time), CAST(N'15:51:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5296, 904, 1, CAST(N'16:17:00' AS Time), CAST(N'17:17:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5297, 904, 0, CAST(N'17:43:00' AS Time), CAST(N'18:43:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5298, 904, 1, CAST(N'19:09:00' AS Time), CAST(N'20:09:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5299, 904, 0, CAST(N'20:35:00' AS Time), CAST(N'21:35:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5300, 904, 1, CAST(N'22:01:00' AS Time), CAST(N'13:25:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5301, 904, 0, CAST(N'22:01:00' AS Time), CAST(N'13:25:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5302, 905, 0, CAST(N'04:44:00' AS Time), CAST(N'05:45:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5303, 905, 1, CAST(N'06:12:00' AS Time), CAST(N'07:12:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5304, 905, 0, CAST(N'07:38:00' AS Time), CAST(N'08:38:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5305, 905, 1, CAST(N'09:05:00' AS Time), CAST(N'10:05:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5306, 905, 0, CAST(N'10:33:00' AS Time), CAST(N'11:33:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5307, 905, 1, CAST(N'11:59:00' AS Time), CAST(N'12:59:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5308, 905, 0, CAST(N'13:25:00' AS Time), CAST(N'14:25:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5309, 906, 1, CAST(N'14:51:00' AS Time), CAST(N'15:51:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5310, 906, 0, CAST(N'16:17:00' AS Time), CAST(N'17:17:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5311, 906, 1, CAST(N'17:43:00' AS Time), CAST(N'18:43:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5312, 906, 0, CAST(N'19:09:00' AS Time), CAST(N'20:09:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5313, 906, 1, CAST(N'20:35:00' AS Time), CAST(N'21:35:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5314, 907, 1, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5315, 907, 0, CAST(N'05:26:00' AS Time), CAST(N'06:26:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5316, 907, 1, CAST(N'06:52:00' AS Time), CAST(N'07:52:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5317, 907, 0, CAST(N'08:18:00' AS Time), CAST(N'09:18:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5318, 907, 1, CAST(N'09:44:00' AS Time), CAST(N'10:44:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5319, 907, 0, CAST(N'11:10:00' AS Time), CAST(N'12:10:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5320, 907, 1, CAST(N'12:36:00' AS Time), CAST(N'13:36:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5321, 908, 0, CAST(N'14:02:00' AS Time), CAST(N'15:02:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5322, 908, 1, CAST(N'15:28:00' AS Time), CAST(N'16:28:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5323, 908, 0, CAST(N'16:54:00' AS Time), CAST(N'17:54:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5324, 908, 1, CAST(N'18:20:00' AS Time), CAST(N'19:20:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5325, 908, 0, CAST(N'19:46:00' AS Time), CAST(N'20:46:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5326, 908, 1, CAST(N'21:12:00' AS Time), CAST(N'22:12:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5327, 908, 0, CAST(N'22:38:00' AS Time), CAST(N'14:02:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5328, 908, 1, CAST(N'23:21:00' AS Time), CAST(N'14:45:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5329, 908, 0, CAST(N'23:21:00' AS Time), CAST(N'14:45:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5330, 909, 0, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5331, 909, 1, CAST(N'05:26:00' AS Time), CAST(N'06:26:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5332, 909, 0, CAST(N'06:52:00' AS Time), CAST(N'07:52:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5333, 909, 1, CAST(N'08:18:00' AS Time), CAST(N'09:18:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5334, 909, 0, CAST(N'09:44:00' AS Time), CAST(N'10:44:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5335, 909, 1, CAST(N'11:10:00' AS Time), CAST(N'12:10:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5336, 909, 0, CAST(N'12:36:00' AS Time), CAST(N'13:36:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5337, 910, 1, CAST(N'14:02:00' AS Time), CAST(N'15:02:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5338, 910, 0, CAST(N'15:28:00' AS Time), CAST(N'16:28:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5339, 910, 1, CAST(N'16:54:00' AS Time), CAST(N'17:54:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5340, 910, 0, CAST(N'18:20:00' AS Time), CAST(N'19:20:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5341, 910, 1, CAST(N'19:46:00' AS Time), CAST(N'20:46:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5342, 910, 0, CAST(N'21:12:00' AS Time), CAST(N'22:12:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5343, 910, 1, CAST(N'22:38:00' AS Time), CAST(N'14:02:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5344, 911, 1, CAST(N'04:43:00' AS Time), CAST(N'05:43:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5345, 911, 0, CAST(N'06:09:00' AS Time), CAST(N'07:09:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5346, 911, 1, CAST(N'07:35:00' AS Time), CAST(N'08:35:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5347, 911, 0, CAST(N'09:01:00' AS Time), CAST(N'10:01:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5348, 911, 1, CAST(N'10:27:00' AS Time), CAST(N'11:27:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5349, 911, 0, CAST(N'11:53:00' AS Time), CAST(N'12:53:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5350, 911, 1, CAST(N'13:19:00' AS Time), CAST(N'14:19:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5351, 912, 0, CAST(N'14:45:00' AS Time), CAST(N'15:45:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5352, 912, 1, CAST(N'16:11:00' AS Time), CAST(N'17:11:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5353, 912, 0, CAST(N'17:37:00' AS Time), CAST(N'18:37:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5354, 912, 1, CAST(N'19:03:00' AS Time), CAST(N'20:03:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5355, 912, 0, CAST(N'20:29:00' AS Time), CAST(N'21:29:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5356, 912, 1, CAST(N'21:55:00' AS Time), CAST(N'22:55:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5357, 913, 0, CAST(N'04:43:00' AS Time), CAST(N'05:43:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5358, 913, 1, CAST(N'06:09:00' AS Time), CAST(N'07:09:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5359, 913, 0, CAST(N'07:35:00' AS Time), CAST(N'08:35:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5360, 913, 1, CAST(N'09:01:00' AS Time), CAST(N'10:01:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5361, 913, 0, CAST(N'10:27:00' AS Time), CAST(N'11:27:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5362, 913, 1, CAST(N'11:53:00' AS Time), CAST(N'12:53:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5363, 913, 0, CAST(N'13:19:00' AS Time), CAST(N'14:19:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5364, 914, 1, CAST(N'14:45:00' AS Time), CAST(N'15:45:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5365, 914, 0, CAST(N'16:11:00' AS Time), CAST(N'17:11:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5366, 914, 1, CAST(N'17:37:00' AS Time), CAST(N'18:37:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5367, 914, 0, CAST(N'19:03:00' AS Time), CAST(N'20:03:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5368, 914, 1, CAST(N'20:29:00' AS Time), CAST(N'21:29:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5369, 914, 0, CAST(N'21:55:00' AS Time), CAST(N'22:55:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5370, 915, 1, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5371, 915, 0, CAST(N'05:26:00' AS Time), CAST(N'06:26:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5372, 915, 1, CAST(N'06:52:00' AS Time), CAST(N'07:52:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5373, 915, 0, CAST(N'08:18:00' AS Time), CAST(N'09:18:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5374, 915, 1, CAST(N'09:44:00' AS Time), CAST(N'10:44:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5375, 915, 0, CAST(N'11:10:00' AS Time), CAST(N'12:10:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5376, 915, 1, CAST(N'12:36:00' AS Time), CAST(N'13:36:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5377, 916, 0, CAST(N'14:02:00' AS Time), CAST(N'15:02:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5378, 916, 1, CAST(N'15:28:00' AS Time), CAST(N'16:28:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5379, 916, 0, CAST(N'16:54:00' AS Time), CAST(N'17:54:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5380, 916, 1, CAST(N'18:20:00' AS Time), CAST(N'19:20:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5381, 916, 0, CAST(N'19:46:00' AS Time), CAST(N'20:46:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5382, 916, 1, CAST(N'21:12:00' AS Time), CAST(N'22:12:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5383, 916, 0, CAST(N'22:38:00' AS Time), CAST(N'14:02:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5384, 916, 1, CAST(N'23:21:00' AS Time), CAST(N'14:45:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5385, 916, 0, CAST(N'23:21:00' AS Time), CAST(N'14:45:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5386, 917, 0, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5387, 917, 1, CAST(N'05:26:00' AS Time), CAST(N'06:26:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5388, 917, 0, CAST(N'06:52:00' AS Time), CAST(N'07:52:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5389, 917, 1, CAST(N'08:18:00' AS Time), CAST(N'09:18:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5390, 917, 0, CAST(N'09:44:00' AS Time), CAST(N'10:44:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5391, 917, 1, CAST(N'11:10:00' AS Time), CAST(N'12:10:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5392, 917, 0, CAST(N'12:36:00' AS Time), CAST(N'13:36:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5393, 918, 1, CAST(N'14:02:00' AS Time), CAST(N'15:02:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5394, 918, 0, CAST(N'15:28:00' AS Time), CAST(N'16:28:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5395, 918, 1, CAST(N'16:54:00' AS Time), CAST(N'17:54:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5396, 918, 0, CAST(N'18:20:00' AS Time), CAST(N'19:20:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5397, 918, 1, CAST(N'19:46:00' AS Time), CAST(N'20:46:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5398, 918, 0, CAST(N'21:12:00' AS Time), CAST(N'22:12:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5399, 918, 1, CAST(N'22:38:00' AS Time), CAST(N'14:02:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5400, 919, 1, CAST(N'04:43:00' AS Time), CAST(N'05:43:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5401, 919, 0, CAST(N'06:09:00' AS Time), CAST(N'07:09:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5402, 919, 1, CAST(N'07:35:00' AS Time), CAST(N'08:35:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5403, 919, 0, CAST(N'09:01:00' AS Time), CAST(N'10:01:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5404, 919, 1, CAST(N'10:27:00' AS Time), CAST(N'11:27:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5405, 919, 0, CAST(N'11:53:00' AS Time), CAST(N'12:53:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5406, 919, 1, CAST(N'13:19:00' AS Time), CAST(N'14:19:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5407, 920, 0, CAST(N'14:45:00' AS Time), CAST(N'15:45:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5408, 920, 1, CAST(N'16:11:00' AS Time), CAST(N'17:11:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5409, 920, 0, CAST(N'17:37:00' AS Time), CAST(N'18:37:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5410, 920, 1, CAST(N'19:03:00' AS Time), CAST(N'20:03:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5411, 920, 0, CAST(N'20:29:00' AS Time), CAST(N'21:29:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5412, 920, 1, CAST(N'21:55:00' AS Time), CAST(N'22:55:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5413, 921, 0, CAST(N'04:43:00' AS Time), CAST(N'05:43:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5414, 921, 1, CAST(N'06:09:00' AS Time), CAST(N'07:09:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5415, 921, 0, CAST(N'07:35:00' AS Time), CAST(N'08:35:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5416, 921, 1, CAST(N'09:01:00' AS Time), CAST(N'10:01:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5417, 921, 0, CAST(N'10:27:00' AS Time), CAST(N'11:27:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5418, 921, 1, CAST(N'11:53:00' AS Time), CAST(N'12:53:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5419, 921, 0, CAST(N'13:19:00' AS Time), CAST(N'14:19:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5420, 922, 1, CAST(N'14:45:00' AS Time), CAST(N'15:45:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5421, 922, 0, CAST(N'16:11:00' AS Time), CAST(N'17:11:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5422, 922, 1, CAST(N'17:37:00' AS Time), CAST(N'18:37:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5423, 922, 0, CAST(N'19:03:00' AS Time), CAST(N'20:03:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5424, 922, 1, CAST(N'20:29:00' AS Time), CAST(N'21:29:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5425, 922, 0, CAST(N'21:55:00' AS Time), CAST(N'22:55:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5426, 923, 1, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5427, 923, 0, CAST(N'05:26:00' AS Time), CAST(N'06:26:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5428, 923, 1, CAST(N'06:52:00' AS Time), CAST(N'07:52:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5429, 923, 0, CAST(N'08:18:00' AS Time), CAST(N'09:18:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5430, 923, 1, CAST(N'09:44:00' AS Time), CAST(N'10:44:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5431, 923, 0, CAST(N'11:10:00' AS Time), CAST(N'12:10:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5432, 923, 1, CAST(N'12:36:00' AS Time), CAST(N'13:36:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5433, 924, 0, CAST(N'14:02:00' AS Time), CAST(N'15:02:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5434, 924, 1, CAST(N'15:28:00' AS Time), CAST(N'16:28:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5435, 924, 0, CAST(N'16:54:00' AS Time), CAST(N'17:54:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5436, 924, 1, CAST(N'18:20:00' AS Time), CAST(N'19:20:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5437, 924, 0, CAST(N'19:46:00' AS Time), CAST(N'20:46:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5438, 924, 1, CAST(N'21:12:00' AS Time), CAST(N'22:12:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5439, 924, 0, CAST(N'22:38:00' AS Time), CAST(N'14:02:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5440, 924, 1, CAST(N'23:21:00' AS Time), CAST(N'14:45:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5441, 924, 0, CAST(N'23:21:00' AS Time), CAST(N'14:45:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5442, 925, 0, CAST(N'04:00:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5443, 925, 1, CAST(N'05:26:00' AS Time), CAST(N'06:26:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5444, 925, 0, CAST(N'06:52:00' AS Time), CAST(N'07:52:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5445, 925, 1, CAST(N'08:18:00' AS Time), CAST(N'09:18:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5446, 925, 0, CAST(N'09:44:00' AS Time), CAST(N'10:44:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5447, 925, 1, CAST(N'11:10:00' AS Time), CAST(N'12:10:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5448, 925, 0, CAST(N'12:36:00' AS Time), CAST(N'13:36:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5449, 926, 1, CAST(N'14:02:00' AS Time), CAST(N'15:02:00' AS Time), NULL, NULL, NULL, CAST(2 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5450, 926, 0, CAST(N'15:28:00' AS Time), CAST(N'16:28:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5451, 926, 1, CAST(N'16:54:00' AS Time), CAST(N'17:54:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5452, 926, 0, CAST(N'18:20:00' AS Time), CAST(N'19:20:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5453, 926, 1, CAST(N'19:46:00' AS Time), CAST(N'20:46:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5454, 926, 0, CAST(N'21:12:00' AS Time), CAST(N'22:12:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5455, 926, 1, CAST(N'22:38:00' AS Time), CAST(N'14:02:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5456, 927, 1, CAST(N'04:43:00' AS Time), CAST(N'05:43:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5457, 927, 0, CAST(N'06:09:00' AS Time), CAST(N'07:09:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5458, 927, 1, CAST(N'07:35:00' AS Time), CAST(N'08:35:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5459, 927, 0, CAST(N'09:01:00' AS Time), CAST(N'10:01:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5460, 927, 1, CAST(N'10:27:00' AS Time), CAST(N'11:27:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5461, 927, 0, CAST(N'11:53:00' AS Time), CAST(N'12:53:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5462, 927, 1, CAST(N'13:19:00' AS Time), CAST(N'14:19:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5463, 928, 0, CAST(N'14:45:00' AS Time), CAST(N'15:45:00' AS Time), NULL, NULL, NULL, CAST(1 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5464, 928, 1, CAST(N'16:11:00' AS Time), CAST(N'17:11:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5465, 928, 0, CAST(N'17:37:00' AS Time), CAST(N'18:37:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5466, 928, 1, CAST(N'19:03:00' AS Time), CAST(N'20:03:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5467, 928, 0, CAST(N'20:29:00' AS Time), CAST(N'21:29:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5468, 928, 1, CAST(N'21:55:00' AS Time), CAST(N'22:55:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5469, 929, 0, CAST(N'04:43:00' AS Time), CAST(N'05:43:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5470, 929, 1, CAST(N'06:09:00' AS Time), CAST(N'07:09:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5471, 929, 0, CAST(N'07:35:00' AS Time), CAST(N'08:35:00' AS Time), NULL, NULL, NULL, CAST(6 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5472, 929, 1, CAST(N'09:01:00' AS Time), CAST(N'10:01:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5473, 929, 0, CAST(N'10:27:00' AS Time), CAST(N'11:27:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5474, 929, 1, CAST(N'11:53:00' AS Time), CAST(N'12:53:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5475, 929, 0, CAST(N'13:19:00' AS Time), CAST(N'14:19:00' AS Time), NULL, NULL, NULL, CAST(4 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5476, 930, 1, CAST(N'14:45:00' AS Time), CAST(N'15:45:00' AS Time), NULL, NULL, NULL, CAST(7 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5477, 930, 0, CAST(N'16:11:00' AS Time), CAST(N'17:11:00' AS Time), NULL, NULL, NULL, CAST(9 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5478, 930, 1, CAST(N'17:37:00' AS Time), CAST(N'18:37:00' AS Time), NULL, NULL, NULL, CAST(8 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5479, 930, 0, CAST(N'19:03:00' AS Time), CAST(N'20:03:00' AS Time), NULL, NULL, NULL, CAST(0 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5480, 930, 1, CAST(N'20:29:00' AS Time), CAST(N'21:29:00' AS Time), NULL, NULL, NULL, CAST(5 AS Numeric(1, 0)))
GO
INSERT [dbo].[viaje] ([id], [planilla_horaria_id], [es_ida], [hora_salida], [hora_estimada_llegada], [hora_real_llegada], [completado], [completitud_id], [dvh]) VALUES (5481, 930, 0, CAST(N'21:55:00' AS Time), CAST(N'22:55:00' AS Time), NULL, NULL, NULL, CAST(3 AS Numeric(1, 0)))
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
