USE [master]
GO
/****** Object:  Database [transportes_mj_bitacora]    Script Date: 18/11/2019 14:55:55 ******/
IF EXISTS(select * from sys.databases where name='transportes_mj_bitacora')
DROP DATABASE [transportes_mj_bitacora]
GO
CREATE DATABASE [transportes_mj_bitacora]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [transportes_mj_bitacora].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [transportes_mj_bitacora] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [transportes_mj_bitacora] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [transportes_mj_bitacora] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [transportes_mj_bitacora] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [transportes_mj_bitacora] SET ARITHABORT OFF 
GO
ALTER DATABASE [transportes_mj_bitacora] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [transportes_mj_bitacora] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [transportes_mj_bitacora] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [transportes_mj_bitacora] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [transportes_mj_bitacora] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [transportes_mj_bitacora] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [transportes_mj_bitacora] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [transportes_mj_bitacora] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [transportes_mj_bitacora] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [transportes_mj_bitacora] SET  DISABLE_BROKER 
GO
ALTER DATABASE [transportes_mj_bitacora] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [transportes_mj_bitacora] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [transportes_mj_bitacora] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [transportes_mj_bitacora] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [transportes_mj_bitacora] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [transportes_mj_bitacora] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [transportes_mj_bitacora] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [transportes_mj_bitacora] SET RECOVERY FULL 
GO
ALTER DATABASE [transportes_mj_bitacora] SET  MULTI_USER 
GO
ALTER DATABASE [transportes_mj_bitacora] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [transportes_mj_bitacora] SET DB_CHAINING OFF 
GO
ALTER DATABASE [transportes_mj_bitacora] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [transportes_mj_bitacora] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [transportes_mj_bitacora] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'transportes_mj_bitacora', N'ON'
GO
USE [transportes_mj_bitacora]
GO
/****** Object:  Table [dbo].[bitacora]    Script Date: 18/11/2019 14:55:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bitacora](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[fecha_hora] [datetime] NOT NULL,
	[usuario_id] [int] NOT NULL,
	[detalle] [varchar](max) NOT NULL,
 CONSTRAINT [PK_bitacora] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bitacora] ON 
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (1, CAST(N'2018-09-08T19:47:46.147' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (2, CAST(N'2018-09-08T20:21:04.657' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (3, CAST(N'2018-09-08T20:21:07.487' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (4, CAST(N'2018-09-08T20:25:29.640' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (5, CAST(N'2018-09-08T20:25:32.063' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (6, CAST(N'2018-09-09T18:25:50.940' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (7, CAST(N'2018-09-09T18:26:35.517' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (8, CAST(N'2018-09-09T18:32:49.940' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (9, CAST(N'2018-09-09T18:37:04.143' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (10, CAST(N'2018-09-09T18:38:07.410' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (11, CAST(N'2018-09-09T18:41:07.517' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (12, CAST(N'2018-09-09T18:41:32.167' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (13, CAST(N'2018-09-09T19:07:50.247' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (14, CAST(N'2018-09-09T19:08:56.747' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (15, CAST(N'2018-09-09T19:09:35.797' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (16, CAST(N'2018-09-09T19:10:38.060' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (17, CAST(N'2018-09-09T19:35:46.607' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (18, CAST(N'2018-09-09T19:35:48.960' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (19, CAST(N'2018-09-09T19:42:05.297' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (20, CAST(N'2018-09-09T19:42:21.540' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (21, CAST(N'2018-09-09T19:42:27.600' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (22, CAST(N'2018-09-09T20:23:47.910' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (23, CAST(N'2018-09-09T20:23:55.713' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (24, CAST(N'2018-09-09T20:24:21.007' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (25, CAST(N'2018-09-09T20:24:26.680' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (26, CAST(N'2018-09-09T20:25:36.703' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (27, CAST(N'2018-09-09T20:25:41.733' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (28, CAST(N'2018-09-09T20:27:00.267' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (29, CAST(N'2018-09-09T20:27:24.503' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (30, CAST(N'2018-09-21T18:38:09.103' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (31, CAST(N'2018-09-21T18:40:02.660' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (32, CAST(N'2018-09-21T18:40:18.943' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (33, CAST(N'2018-09-21T18:41:34.887' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (34, CAST(N'2018-09-21T18:59:57.197' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (35, CAST(N'2018-09-23T12:03:56.567' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (36, CAST(N'2018-09-23T12:30:45.623' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (37, CAST(N'2018-09-23T12:30:59.703' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (38, CAST(N'2018-09-23T12:32:52.950' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (39, CAST(N'2018-09-23T12:32:58.237' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (40, CAST(N'2018-09-23T12:33:20.440' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (41, CAST(N'2018-09-23T17:13:39.543' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (42, CAST(N'2018-09-23T17:14:08.607' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (43, CAST(N'2018-09-23T17:29:00.140' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (44, CAST(N'2018-09-23T17:29:36.907' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (45, CAST(N'2018-09-23T17:37:00.903' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (46, CAST(N'2018-09-23T17:37:26.630' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (47, CAST(N'2018-09-23T17:53:47.833' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (48, CAST(N'2018-09-23T17:53:58.773' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (49, CAST(N'2018-09-23T17:54:20.027' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (50, CAST(N'2018-09-23T17:57:58.560' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (51, CAST(N'2018-09-23T18:09:47.947' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (52, CAST(N'2018-09-23T18:14:00.963' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (53, CAST(N'2018-09-23T18:14:52.587' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (54, CAST(N'2018-09-25T19:04:13.473' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (55, CAST(N'2018-09-25T19:05:00.040' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (56, CAST(N'2018-09-25T19:09:20.870' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (57, CAST(N'2018-09-25T19:09:59.180' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (58, CAST(N'2018-09-25T19:13:45.110' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (59, CAST(N'2018-09-25T20:25:55.740' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (60, CAST(N'2018-09-25T20:26:54.280' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (61, CAST(N'2018-09-25T20:28:12.983' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (62, CAST(N'2018-09-25T20:29:10.600' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (63, CAST(N'2018-09-25T20:29:37.817' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (64, CAST(N'2018-09-25T20:30:08.820' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (65, CAST(N'2018-09-25T20:30:34.343' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (66, CAST(N'2018-09-25T22:26:15.570' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (67, CAST(N'2018-09-25T22:26:17.180' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (68, CAST(N'2018-09-25T22:26:59.363' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (69, CAST(N'2018-09-25T22:28:21.753' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (70, CAST(N'2018-09-25T22:29:34.220' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (71, CAST(N'2018-09-25T22:29:50.520' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (72, CAST(N'2018-09-26T19:27:09.717' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (73, CAST(N'2018-09-26T19:33:48.973' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (74, CAST(N'2018-09-26T19:34:18.883' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (75, CAST(N'2018-09-26T19:41:00.230' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (76, CAST(N'2018-09-29T13:07:43.173' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (77, CAST(N'2018-09-29T13:08:19.637' AS DateTime), 1, N'Se creó un nuevo permiso. Nombre: Perfil de prueba')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (78, CAST(N'2018-09-29T13:09:41.910' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (79, CAST(N'2018-09-29T13:12:34.253' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (80, CAST(N'2018-09-29T13:13:03.690' AS DateTime), 1, N'Se creó un nuevo permiso. Nombre: Otro perfil 2')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (81, CAST(N'2018-09-29T13:22:08.483' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (82, CAST(N'2018-09-29T13:22:25.797' AS DateTime), 1, N'Se actualizó el permiso con Id 40')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (83, CAST(N'2018-09-29T13:22:52.823' AS DateTime), 1, N'Se actualizó el permiso con Id 37')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (84, CAST(N'2018-09-29T15:39:17.763' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (85, CAST(N'2018-09-29T15:39:36.057' AS DateTime), 1, N'Se eliminó el permiso con Id 40')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (86, CAST(N'2018-09-29T15:41:01.690' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (87, CAST(N'2018-09-29T15:41:10.833' AS DateTime), 1, N'Se eliminó el permiso con Id 37')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (88, CAST(N'2018-09-29T15:41:26.113' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (89, CAST(N'2018-09-29T15:42:54.697' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (90, CAST(N'2018-09-29T15:43:02.293' AS DateTime), 1, N'Se eliminó el permiso con Id 38')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (91, CAST(N'2018-09-29T15:43:08.957' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (92, CAST(N'2018-09-29T23:24:24.793' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (93, CAST(N'2018-09-29T23:24:34.637' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (94, CAST(N'2018-09-29T23:25:05.663' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (95, CAST(N'2018-09-29T23:26:11.653' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (96, CAST(N'2018-09-29T23:54:14.020' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (97, CAST(N'2018-09-29T23:54:20.780' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (98, CAST(N'2018-09-29T23:54:48.247' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (99, CAST(N'2018-09-29T23:54:57.477' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (100, CAST(N'2018-09-30T11:46:37.587' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (101, CAST(N'2018-09-30T11:47:15.600' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (102, CAST(N'2018-09-30T11:47:50.647' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (103, CAST(N'2018-09-30T11:47:57.523' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (104, CAST(N'2018-09-30T11:48:11.830' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (105, CAST(N'2018-09-30T12:01:14.570' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (106, CAST(N'2018-09-30T12:01:53.100' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (107, CAST(N'2018-09-30T14:39:47.180' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (108, CAST(N'2018-09-30T14:40:01.397' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (109, CAST(N'2018-09-30T15:11:02.027' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (110, CAST(N'2018-09-30T15:13:17.313' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (111, CAST(N'2018-09-30T15:47:19.350' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (112, CAST(N'2018-09-30T15:47:39.557' AS DateTime), 1, N'Se realizó un backup de la base de datos')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (113, CAST(N'2018-09-30T15:48:16.143' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (114, CAST(N'2018-09-30T18:32:47.580' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (115, CAST(N'2018-09-30T18:33:02.340' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (116, CAST(N'2018-09-30T18:54:06.520' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (117, CAST(N'2018-09-30T18:54:18.913' AS DateTime), 1, N'Se realizó un backup de la base de datos')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (118, CAST(N'2018-09-30T19:13:59.487' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (119, CAST(N'2018-09-30T19:14:48.857' AS DateTime), 1, N'Se restauró un backup de la base de datos')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (120, CAST(N'2018-09-30T19:14:55.227' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (121, CAST(N'2018-09-30T19:14:55.913' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (122, CAST(N'2018-09-30T19:42:54.253' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (123, CAST(N'2018-09-30T19:43:10.177' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (124, CAST(N'2018-09-30T19:43:34.713' AS DateTime), 1, N'Se restauró un backup de la base de datos')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (125, CAST(N'2018-09-30T19:43:38.347' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (126, CAST(N'2018-09-30T19:43:38.847' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (127, CAST(N'2018-09-30T19:43:54.127' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (128, CAST(N'2018-09-30T19:47:21.590' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (129, CAST(N'2018-09-30T19:47:35.097' AS DateTime), 1, N'Se restauró un backup de la base de datos')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (130, CAST(N'2018-09-30T19:47:40.557' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (131, CAST(N'2018-09-30T19:47:41.050' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (132, CAST(N'2018-09-30T19:49:12.620' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (133, CAST(N'2018-10-07T20:23:10.793' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (134, CAST(N'2018-10-07T20:23:38.720' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (135, CAST(N'2018-10-07T20:43:16.937' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (136, CAST(N'2018-10-07T20:44:13.780' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (137, CAST(N'2018-10-07T20:48:19.470' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (138, CAST(N'2018-10-07T20:48:37.813' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (139, CAST(N'2018-10-07T20:50:34.207' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (140, CAST(N'2018-10-07T20:50:52.983' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (141, CAST(N'2018-10-08T18:50:22.013' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (142, CAST(N'2018-10-08T18:50:36.313' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (143, CAST(N'2018-10-08T18:51:28.447' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (144, CAST(N'2018-10-08T18:51:37.827' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (145, CAST(N'2018-10-08T18:54:57.883' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (146, CAST(N'2018-10-08T18:55:06.273' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (147, CAST(N'2018-10-08T18:55:54.593' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (148, CAST(N'2018-10-08T18:56:26.193' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (149, CAST(N'2018-10-08T18:56:41.830' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (150, CAST(N'2018-10-08T18:57:04.847' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (151, CAST(N'2018-10-08T18:57:48.233' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (152, CAST(N'2018-10-08T18:58:14.823' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (153, CAST(N'2018-10-08T19:21:57.193' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (154, CAST(N'2018-10-08T19:22:42.063' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (155, CAST(N'2018-10-08T19:22:49.040' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (156, CAST(N'2018-10-08T19:23:06.987' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (157, CAST(N'2018-10-08T19:24:11.613' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (158, CAST(N'2018-10-08T19:25:10.510' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (159, CAST(N'2018-10-08T19:27:20.857' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (160, CAST(N'2018-10-08T19:28:06.500' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (161, CAST(N'2018-10-08T19:28:52.953' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (162, CAST(N'2018-10-08T19:29:36.940' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (163, CAST(N'2018-10-08T19:31:00.777' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (164, CAST(N'2018-10-08T19:40:22.423' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (165, CAST(N'2018-10-08T19:41:08.900' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (166, CAST(N'2018-10-08T19:42:43.540' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (167, CAST(N'2018-10-08T19:43:07.307' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (168, CAST(N'2018-10-08T20:10:39.300' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (169, CAST(N'2018-10-08T20:10:53.113' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (170, CAST(N'2018-10-08T20:11:32.620' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (171, CAST(N'2018-10-08T20:12:10.603' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (172, CAST(N'2018-10-08T20:12:28.927' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (173, CAST(N'2018-10-12T18:41:12.550' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (174, CAST(N'2018-10-12T18:41:38.360' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (175, CAST(N'2018-10-12T18:49:22.713' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (176, CAST(N'2018-10-12T18:50:47.403' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (177, CAST(N'2018-10-12T19:22:03.553' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (178, CAST(N'2018-10-12T19:23:09.727' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (179, CAST(N'2018-10-12T19:23:30.303' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (180, CAST(N'2018-10-12T19:23:53.183' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (181, CAST(N'2018-10-12T20:01:06.453' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (182, CAST(N'2018-10-12T20:01:19.220' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (183, CAST(N'2018-10-13T20:54:42.643' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (184, CAST(N'2018-10-13T21:03:42.740' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (185, CAST(N'2018-10-13T21:04:31.457' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (186, CAST(N'2018-10-13T21:04:58.813' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (187, CAST(N'2018-10-13T21:07:54.987' AS DateTime), 1, N'Se guardó el idioma con el id 3')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (188, CAST(N'2018-10-13T21:08:52.473' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (189, CAST(N'2018-10-13T21:14:38.423' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (190, CAST(N'2018-10-13T21:14:53.360' AS DateTime), 1, N'Se guardó el idioma con el id 4')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (191, CAST(N'2018-10-13T21:15:09.257' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (192, CAST(N'2018-10-14T12:06:12.467' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (193, CAST(N'2018-10-14T12:06:49.500' AS DateTime), 1, N'Se guardó el idioma con el id 4')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (194, CAST(N'2018-10-14T12:07:25.747' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (195, CAST(N'2018-10-14T15:55:41.480' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (196, CAST(N'2018-10-14T15:58:14.873' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (197, CAST(N'2018-10-20T17:50:38.130' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (198, CAST(N'2018-10-20T17:51:07.767' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (199, CAST(N'2018-10-20T18:01:59.647' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (200, CAST(N'2018-10-20T18:02:13.527' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (201, CAST(N'2018-10-20T18:03:01.540' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (202, CAST(N'2018-10-20T18:03:27.743' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (203, CAST(N'2018-10-20T18:04:07.303' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (204, CAST(N'2018-10-20T18:04:40.903' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (205, CAST(N'2018-10-20T18:17:40.107' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (206, CAST(N'2018-10-20T18:17:53.287' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (207, CAST(N'2018-10-20T18:19:12.323' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (208, CAST(N'2018-10-20T18:19:36.223' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (209, CAST(N'2018-10-20T18:22:10.710' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (210, CAST(N'2018-10-20T18:22:53.197' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (211, CAST(N'2018-10-22T19:37:58.710' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (212, CAST(N'2018-10-22T19:38:37.017' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (213, CAST(N'2018-10-23T19:04:36.353' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (214, CAST(N'2018-10-23T19:05:05.970' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (215, CAST(N'2018-10-23T19:37:41.073' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (216, CAST(N'2018-10-23T19:38:17.400' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (217, CAST(N'2018-10-23T20:18:50.973' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (218, CAST(N'2018-10-23T20:19:00.570' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (219, CAST(N'2018-10-23T20:30:04.857' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (220, CAST(N'2018-10-23T20:30:49.050' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (221, CAST(N'2018-10-23T20:33:57.823' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (222, CAST(N'2018-10-23T20:34:18.650' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (223, CAST(N'2018-10-23T22:46:52.043' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (224, CAST(N'2018-10-23T22:47:46.777' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (225, CAST(N'2018-10-23T22:55:55.187' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (226, CAST(N'2018-10-23T22:56:37.757' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (227, CAST(N'2018-10-24T21:27:39.733' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (228, CAST(N'2018-10-24T21:28:18.197' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (229, CAST(N'2018-10-24T21:53:07.497' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (230, CAST(N'2018-10-24T21:53:25.433' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (231, CAST(N'2018-10-27T20:30:41.900' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (232, CAST(N'2018-10-27T20:34:59.923' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (233, CAST(N'2018-10-27T20:38:14.080' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (234, CAST(N'2018-10-27T20:41:28.570' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (235, CAST(N'2018-10-27T20:47:19.433' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (236, CAST(N'2018-10-27T20:47:35.133' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (237, CAST(N'2018-10-27T20:48:12.600' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (238, CAST(N'2018-10-27T20:49:18.093' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (239, CAST(N'2018-10-27T20:49:18.747' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (240, CAST(N'2018-10-27T20:49:21.047' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (241, CAST(N'2018-10-27T20:49:52.940' AS DateTime), 2, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (242, CAST(N'2018-10-27T20:49:58.883' AS DateTime), 2, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (243, CAST(N'2018-10-27T20:49:59.390' AS DateTime), 2, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (244, CAST(N'2018-10-27T20:50:01.110' AS DateTime), 2, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (245, CAST(N'2018-10-27T20:50:16.880' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (246, CAST(N'2018-10-27T20:50:20.207' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (247, CAST(N'2018-10-28T18:59:06.370' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (248, CAST(N'2018-10-28T18:59:52.367' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (249, CAST(N'2018-10-28T19:00:59.477' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (250, CAST(N'2018-10-28T19:02:28.747' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (251, CAST(N'2018-10-28T19:02:36.120' AS DateTime), 2, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (252, CAST(N'2018-10-28T19:02:39.010' AS DateTime), 2, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (253, CAST(N'2018-10-28T19:02:41.993' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (254, CAST(N'2018-10-28T19:03:03.303' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (255, CAST(N'2018-10-28T19:03:07.947' AS DateTime), 2, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (256, CAST(N'2018-10-28T19:03:10.803' AS DateTime), 2, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (257, CAST(N'2018-10-28T19:04:16.047' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (258, CAST(N'2018-10-28T19:04:27.487' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (259, CAST(N'2018-10-28T19:05:19.127' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (260, CAST(N'2018-10-28T19:06:21.603' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (261, CAST(N'2018-10-28T19:06:43.450' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (262, CAST(N'2018-10-30T18:26:30.183' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (263, CAST(N'2018-10-30T18:26:42.153' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (264, CAST(N'2018-10-30T18:41:58.870' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (265, CAST(N'2018-10-30T18:42:06.880' AS DateTime), 1, N'Usuario prueba2 eliminado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (266, CAST(N'2018-10-30T19:23:09.750' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (267, CAST(N'2018-10-30T19:23:12.610' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (268, CAST(N'2018-10-30T19:28:56.733' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (269, CAST(N'2018-10-30T19:29:05.407' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (270, CAST(N'2018-10-30T19:32:29.903' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (271, CAST(N'2018-10-30T19:32:32.937' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (272, CAST(N'2018-10-30T19:33:05.073' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (273, CAST(N'2018-10-30T19:33:07.417' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (274, CAST(N'2018-10-30T19:36:02.197' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (275, CAST(N'2018-10-30T19:36:04.950' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (276, CAST(N'2018-10-30T19:41:48.153' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (277, CAST(N'2018-10-30T19:41:53.660' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (278, CAST(N'2018-10-30T19:43:14.570' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (279, CAST(N'2018-10-30T19:43:46.417' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (280, CAST(N'2018-10-30T20:03:48.403' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (281, CAST(N'2018-10-30T20:04:30.343' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (282, CAST(N'2018-10-30T20:26:33.917' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (283, CAST(N'2018-10-30T20:27:04.193' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (284, CAST(N'2018-10-31T18:46:40.020' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (285, CAST(N'2018-10-31T18:46:59.067' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (286, CAST(N'2018-10-31T19:57:14.413' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (287, CAST(N'2018-10-31T19:58:09.820' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (288, CAST(N'2018-10-31T19:58:49.023' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (289, CAST(N'2018-10-31T20:00:20.780' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (290, CAST(N'2018-10-31T20:00:51.143' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (291, CAST(N'2018-10-31T20:01:35.440' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (292, CAST(N'2018-10-31T20:02:20.123' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (293, CAST(N'2018-11-06T15:50:12.987' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (294, CAST(N'2018-11-06T15:50:31.357' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (295, CAST(N'2018-11-06T15:50:49.357' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (296, CAST(N'2018-11-06T15:50:54.850' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (297, CAST(N'2018-11-06T16:31:50.847' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (298, CAST(N'2018-11-06T16:32:06.617' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (299, CAST(N'2018-11-06T16:32:48.850' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (300, CAST(N'2018-11-06T16:40:24.307' AS DateTime), 1, N'Se guardó el idioma con el id 5')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (301, CAST(N'2018-11-06T16:40:39.890' AS DateTime), 1, N'Usuario admin guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (302, CAST(N'2018-11-06T16:41:16.143' AS DateTime), 1, N'Usuario admin guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (303, CAST(N'2018-11-06T16:41:24.683' AS DateTime), 1, N'Usuario admin guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (304, CAST(N'2018-11-06T16:41:38.523' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (305, CAST(N'2018-11-06T16:41:47.033' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (306, CAST(N'2018-11-06T16:41:58.697' AS DateTime), 1, N'Usuario admin guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (307, CAST(N'2018-11-06T16:42:32.823' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (308, CAST(N'2018-11-06T16:43:17.780' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (309, CAST(N'2018-11-06T16:43:23.437' AS DateTime), 1, N'Usuario admin guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (310, CAST(N'2018-11-06T16:43:29.300' AS DateTime), 1, N'Usuario admin guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (311, CAST(N'2018-11-06T16:43:50.800' AS DateTime), 1, N'Se guardó el idioma con el id 5')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (312, CAST(N'2018-11-06T16:43:59.050' AS DateTime), 1, N'Usuario admin guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (313, CAST(N'2018-11-06T16:44:03.133' AS DateTime), 1, N'Usuario admin guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (314, CAST(N'2018-11-06T16:44:05.407' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (315, CAST(N'2018-11-06T19:32:33.337' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (316, CAST(N'2018-11-06T19:32:38.243' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (317, CAST(N'2018-11-06T19:35:33.823' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (318, CAST(N'2018-11-06T19:35:39.667' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (319, CAST(N'2018-11-10T19:06:40.083' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (320, CAST(N'2018-11-10T19:06:44.193' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (321, CAST(N'2018-11-10T19:15:27.090' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (322, CAST(N'2018-11-10T19:15:50.133' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (323, CAST(N'2018-11-17T15:59:17.393' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (324, CAST(N'2018-11-17T15:59:27.763' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (325, CAST(N'2018-11-28T19:40:35.953' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (326, CAST(N'2018-11-28T19:41:17.297' AS DateTime), 1, N'Se guardó el idioma con el id 6')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (327, CAST(N'2018-11-28T19:41:36.823' AS DateTime), 1, N'Usuario admin guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (328, CAST(N'2018-11-28T19:42:04.103' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (329, CAST(N'2018-11-28T19:42:12.697' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (330, CAST(N'2018-11-28T19:42:32.477' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (331, CAST(N'2018-11-28T19:44:27.433' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (332, CAST(N'2018-11-28T19:44:58.167' AS DateTime), 1, N'Se guardó el idioma con el id 7')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (333, CAST(N'2018-11-28T19:45:18.740' AS DateTime), 1, N'Usuario admin guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (334, CAST(N'2018-11-28T19:45:45.757' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (335, CAST(N'2018-11-28T19:45:50.070' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (336, CAST(N'2018-11-28T19:46:01.413' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (337, CAST(N'2019-02-15T17:34:46.950' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (338, CAST(N'2019-02-15T17:35:06.100' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (339, CAST(N'2019-04-18T20:48:46.513' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (340, CAST(N'2019-04-18T20:48:52.023' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (341, CAST(N'2019-04-18T21:08:30.583' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (342, CAST(N'2019-04-18T21:08:34.647' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (343, CAST(N'2019-04-19T11:14:38.660' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (344, CAST(N'2019-04-19T11:15:20.407' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (345, CAST(N'2019-04-19T14:57:30.577' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (346, CAST(N'2019-04-19T15:08:52.707' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (347, CAST(N'2019-04-19T15:09:27.103' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (348, CAST(N'2019-04-19T15:10:01.417' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (349, CAST(N'2019-04-19T15:10:15.417' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (350, CAST(N'2019-04-19T16:08:17.307' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (351, CAST(N'2019-04-19T16:08:59.913' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (352, CAST(N'2019-04-19T19:06:36.820' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (353, CAST(N'2019-04-19T19:07:05.703' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (354, CAST(N'2019-04-19T19:07:38.050' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (355, CAST(N'2019-04-19T19:08:34.687' AS DateTime), 1, N'Se guardó el vehículo con Id 1')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (356, CAST(N'2019-04-19T19:09:32.250' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (357, CAST(N'2019-04-20T11:54:09.557' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (358, CAST(N'2019-04-20T11:54:47.180' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (359, CAST(N'2019-04-20T12:58:25.270' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (360, CAST(N'2019-04-20T13:01:46.747' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (361, CAST(N'2019-04-20T13:02:58.547' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (362, CAST(N'2019-04-20T13:04:12.117' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (363, CAST(N'2019-04-20T13:05:02.480' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (364, CAST(N'2019-04-20T13:05:15.223' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (365, CAST(N'2019-04-20T13:05:55.440' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (366, CAST(N'2019-04-20T13:06:30.567' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (367, CAST(N'2019-04-20T13:11:08.107' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (368, CAST(N'2019-04-20T13:15:08.480' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (369, CAST(N'2019-04-20T13:16:59.227' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (370, CAST(N'2019-08-17T17:51:18.400' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (371, CAST(N'2019-08-17T17:53:14.263' AS DateTime), 1, N'Se guardó el vehículo con Id 121')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (372, CAST(N'2019-08-17T17:53:57.273' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (373, CAST(N'2019-08-17T18:14:36.343' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (374, CAST(N'2019-08-17T18:15:22.463' AS DateTime), 1, N'Se guardó el vehículo con Id 122')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (375, CAST(N'2019-08-17T18:15:51.077' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (376, CAST(N'2019-08-17T18:23:13.627' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (377, CAST(N'2019-08-17T18:23:40.213' AS DateTime), 1, N'Se guardó el vehículo con Id 13')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (378, CAST(N'2019-08-17T18:23:52.073' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (379, CAST(N'2019-08-17T18:26:57.463' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (380, CAST(N'2019-08-17T18:27:10.867' AS DateTime), 1, N'Se guardó el vehículo con Id 6')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (381, CAST(N'2019-08-17T18:33:14.957' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (382, CAST(N'2019-08-17T18:47:34.963' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (383, CAST(N'2019-08-17T18:47:48.693' AS DateTime), 1, N'Se borró vehículo con Id 122')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (384, CAST(N'2019-08-17T18:48:00.743' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (385, CAST(N'2019-08-17T20:57:37.953' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (386, CAST(N'2019-08-17T20:57:51.570' AS DateTime), 1, N'Se borró vehículo con Id 122')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (387, CAST(N'2019-08-17T20:58:24.763' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (388, CAST(N'2019-08-17T21:01:15.130' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (389, CAST(N'2019-08-17T21:01:32.357' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (390, CAST(N'2019-08-17T21:02:05.510' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (391, CAST(N'2019-08-17T21:02:50.830' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (392, CAST(N'2019-08-17T21:04:32.130' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (393, CAST(N'2019-08-17T21:05:08.130' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (394, CAST(N'2019-08-17T23:26:17.327' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (395, CAST(N'2019-08-17T23:27:23.527' AS DateTime), 1, N'Usuario admin guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (396, CAST(N'2019-08-17T23:27:55.510' AS DateTime), 1, N'Usuario admin guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (397, CAST(N'2019-08-17T23:28:34.383' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (398, CAST(N'2019-08-18T17:53:38.893' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (399, CAST(N'2019-08-18T17:54:33.673' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (400, CAST(N'2019-08-18T18:10:12.967' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (401, CAST(N'2019-08-18T18:10:38.653' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (402, CAST(N'2019-08-18T18:13:19.847' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (403, CAST(N'2019-08-18T18:14:59.343' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (404, CAST(N'2019-08-18T18:33:23.787' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (405, CAST(N'2019-08-18T18:33:37.833' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (406, CAST(N'2019-08-18T18:35:09.210' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (407, CAST(N'2019-08-18T18:41:56.947' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (408, CAST(N'2019-08-18T19:24:44.227' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (409, CAST(N'2019-08-18T19:25:01.620' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (410, CAST(N'2019-08-19T15:35:48.617' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (411, CAST(N'2019-08-19T15:36:55.237' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (412, CAST(N'2019-08-19T15:38:16.983' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (413, CAST(N'2019-08-19T15:57:50.867' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (414, CAST(N'2019-08-19T16:00:45.143' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (415, CAST(N'2019-08-19T16:04:12.990' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (416, CAST(N'2019-08-19T16:04:37.727' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (417, CAST(N'2019-08-19T16:06:02.637' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (418, CAST(N'2019-08-19T16:06:53.987' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (419, CAST(N'2019-08-19T16:07:48.650' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (420, CAST(N'2019-08-19T16:08:24.013' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (421, CAST(N'2019-08-19T17:35:56.930' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (422, CAST(N'2019-08-19T17:37:43.653' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (423, CAST(N'2019-08-19T17:41:33.087' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (424, CAST(N'2019-08-19T17:42:15.553' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (425, CAST(N'2019-08-19T17:43:09.570' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (426, CAST(N'2019-08-19T17:43:18.650' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (427, CAST(N'2019-08-19T17:43:55.030' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (428, CAST(N'2019-08-19T17:44:22.373' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (429, CAST(N'2019-08-19T17:44:41.670' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (430, CAST(N'2019-08-19T17:45:55.960' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (431, CAST(N'2019-08-19T17:47:17.440' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (432, CAST(N'2019-08-19T17:48:09.607' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (433, CAST(N'2019-08-19T17:58:32.787' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (434, CAST(N'2019-08-19T17:58:59.487' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (435, CAST(N'2019-08-19T18:01:27.027' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (436, CAST(N'2019-08-19T18:01:40.207' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (437, CAST(N'2019-08-19T18:11:43.597' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (438, CAST(N'2019-08-19T18:12:06.707' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (439, CAST(N'2019-08-19T18:29:21.890' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (440, CAST(N'2019-08-19T18:29:56.717' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (441, CAST(N'2019-08-19T18:33:17.940' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (442, CAST(N'2019-08-19T18:43:38.583' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (443, CAST(N'2019-08-19T18:50:12.957' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (444, CAST(N'2019-08-19T18:53:40.030' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (445, CAST(N'2019-08-19T18:54:20.093' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (446, CAST(N'2019-08-19T18:55:30.120' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (447, CAST(N'2019-08-19T18:55:46.727' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (448, CAST(N'2019-08-19T19:13:52.650' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (449, CAST(N'2019-08-19T19:16:11.113' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (450, CAST(N'2019-08-19T19:16:54.363' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (451, CAST(N'2019-08-19T19:17:55.953' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (452, CAST(N'2019-08-19T19:18:54.140' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (453, CAST(N'2019-08-19T19:19:04.810' AS DateTime), 1, N'Se borró vehículo con Id 121')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (454, CAST(N'2019-08-19T19:19:16.420' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (455, CAST(N'2019-08-19T19:25:07.263' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (456, CAST(N'2019-08-19T19:25:42.733' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (457, CAST(N'2019-08-19T19:28:45.387' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (458, CAST(N'2019-08-19T19:29:53.993' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (459, CAST(N'2019-08-19T19:31:51.627' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (460, CAST(N'2019-08-19T19:32:57.953' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (461, CAST(N'2019-08-19T19:40:00.527' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (462, CAST(N'2019-08-19T19:41:43.580' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (463, CAST(N'2019-08-19T19:52:08.930' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (464, CAST(N'2019-08-19T19:52:19.850' AS DateTime), 1, N'Se borró el chofer con Id 51')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (465, CAST(N'2019-08-19T19:52:52.660' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (466, CAST(N'2019-08-25T20:56:54.810' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (467, CAST(N'2019-08-25T20:57:14.080' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (468, CAST(N'2019-08-25T20:57:48.233' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (469, CAST(N'2019-08-25T20:58:26.863' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (470, CAST(N'2019-08-25T21:03:23.353' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (471, CAST(N'2019-08-25T21:04:07.533' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (472, CAST(N'2019-08-25T21:07:15.867' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (473, CAST(N'2019-08-25T21:07:37.853' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (474, CAST(N'2019-08-25T21:15:52.317' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (475, CAST(N'2019-08-25T21:16:14.900' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (476, CAST(N'2019-08-27T21:36:16.787' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (477, CAST(N'2019-08-27T21:37:02.230' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (478, CAST(N'2019-09-03T22:02:57.820' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (479, CAST(N'2019-09-03T22:12:50.690' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (480, CAST(N'2019-09-07T22:41:17.693' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (481, CAST(N'2019-09-07T22:50:40.263' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (482, CAST(N'2019-09-08T09:43:24.827' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (483, CAST(N'2019-09-08T09:46:39.873' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (484, CAST(N'2019-09-08T09:54:53.567' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (485, CAST(N'2019-09-08T10:02:16.350' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (486, CAST(N'2019-09-08T10:05:29.223' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (487, CAST(N'2019-09-08T10:07:44.020' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (488, CAST(N'2019-09-08T10:13:40.483' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (489, CAST(N'2019-09-08T10:14:29.183' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (490, CAST(N'2019-09-08T10:15:48.850' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (491, CAST(N'2019-09-08T14:57:43.590' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (492, CAST(N'2019-09-08T15:28:22.873' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (493, CAST(N'2019-09-08T15:33:43.540' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (494, CAST(N'2019-09-08T15:42:12.173' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (495, CAST(N'2019-09-08T16:18:37.150' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (496, CAST(N'2019-09-08T16:22:37.160' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (497, CAST(N'2019-09-08T16:29:07.503' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (498, CAST(N'2019-09-08T16:31:57.710' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (499, CAST(N'2019-09-10T19:13:40.903' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (500, CAST(N'2019-09-10T19:13:59.320' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (501, CAST(N'2019-09-15T20:50:03.653' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (502, CAST(N'2019-09-15T20:50:14.357' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (503, CAST(N'2019-09-15T20:55:21.523' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (504, CAST(N'2019-09-15T20:55:47.663' AS DateTime), 1, N'Se realizó un backup de la base de datos')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (505, CAST(N'2019-09-15T20:57:13.617' AS DateTime), 1, N'Se realizó un backup de la base de datos')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (506, CAST(N'2019-09-15T20:57:31.330' AS DateTime), 1, N'Se realizó un backup de la base de datos')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (507, CAST(N'2019-09-15T20:58:25.130' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (508, CAST(N'2019-09-24T19:08:09.877' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (509, CAST(N'2019-09-24T19:23:31.153' AS DateTime), 1, N'Usuario admin guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (510, CAST(N'2019-09-24T19:24:22.257' AS DateTime), 1, N'Usuario admin guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (511, CAST(N'2019-09-24T19:24:44.820' AS DateTime), 1, N'Se guardó el idioma con el id 5')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (512, CAST(N'2019-09-24T19:29:37.423' AS DateTime), 1, N'Se eliminó el permiso con Id 39')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (513, CAST(N'2019-09-24T19:32:45.143' AS DateTime), 1, N'Se creó un nuevo permiso. Nombre: Test')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (514, CAST(N'2019-09-24T20:22:39.513' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (515, CAST(N'2019-09-24T21:32:43.493' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (516, CAST(N'2019-09-24T21:34:09.943' AS DateTime), 1, N'Se creó un nuevo permiso. Nombre: Test 2')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (517, CAST(N'2019-09-24T21:39:34.293' AS DateTime), 1, N'Se eliminó el permiso con Id 41')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (518, CAST(N'2019-09-24T21:49:03.503' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (519, CAST(N'2019-09-24T22:11:57.587' AS DateTime), 1, N'Se actualizó el permiso con Id 42')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (520, CAST(N'2019-09-24T22:22:23.987' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (521, CAST(N'2019-09-29T17:13:04.320' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (522, CAST(N'2019-09-29T17:25:13.680' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (523, CAST(N'2019-09-29T17:28:43.680' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (524, CAST(N'2019-09-29T17:31:40.910' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (525, CAST(N'2019-09-29T17:35:26.303' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (526, CAST(N'2019-09-29T17:35:59.317' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (527, CAST(N'2019-09-29T17:45:00.320' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (528, CAST(N'2019-09-29T17:45:50.847' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (529, CAST(N'2019-09-29T17:47:32.180' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (530, CAST(N'2019-09-29T17:48:08.880' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (531, CAST(N'2019-09-29T17:52:07.880' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (532, CAST(N'2019-09-29T17:54:29.630' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (533, CAST(N'2019-09-29T17:55:17.253' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (534, CAST(N'2019-09-29T18:05:08.997' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (535, CAST(N'2019-09-29T18:05:37.950' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (536, CAST(N'2019-09-29T18:06:52.320' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (537, CAST(N'2019-09-29T18:19:43.653' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (538, CAST(N'2019-09-29T18:21:25.143' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (539, CAST(N'2019-09-29T18:22:12.923' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (540, CAST(N'2019-09-29T18:26:34.637' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (541, CAST(N'2019-09-29T18:27:19.153' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (542, CAST(N'2019-09-29T18:29:15.917' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (543, CAST(N'2019-09-29T18:32:01.457' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (544, CAST(N'2019-09-29T18:32:34.910' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (545, CAST(N'2019-09-29T18:42:52.767' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (546, CAST(N'2019-09-29T18:43:36.013' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (547, CAST(N'2019-09-29T18:50:20.907' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (548, CAST(N'2019-09-29T18:50:39.687' AS DateTime), 1, N'Se creó un nuevo permiso. Nombre: Prueba 2')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (549, CAST(N'2019-09-29T18:55:53.977' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (550, CAST(N'2019-09-29T18:57:28.567' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (551, CAST(N'2019-09-29T19:37:16.580' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (552, CAST(N'2019-09-29T19:40:56.903' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (553, CAST(N'2019-09-29T19:42:51.110' AS DateTime), 1, N'Se creó un nuevo permiso. Nombre: asfadsfas')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (554, CAST(N'2019-09-29T19:43:36.593' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (555, CAST(N'2019-09-29T19:47:53.870' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (556, CAST(N'2019-09-29T19:48:40.337' AS DateTime), 1, N'Se actualizó el permiso con Id 44')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (557, CAST(N'2019-09-29T19:49:17.367' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (558, CAST(N'2019-09-29T19:52:54.287' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (559, CAST(N'2019-09-29T19:53:05.453' AS DateTime), 1, N'Se eliminó el permiso con Id 44')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (560, CAST(N'2019-09-29T19:53:12.720' AS DateTime), 1, N'Se actualizó el permiso con Id 43')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (561, CAST(N'2019-09-29T19:53:24.517' AS DateTime), 1, N'Se actualizó el permiso con Id 43')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (562, CAST(N'2019-09-29T19:53:36.610' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (563, CAST(N'2019-09-29T19:55:54.157' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (564, CAST(N'2019-09-29T20:10:18.877' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (565, CAST(N'2019-09-29T20:10:27.970' AS DateTime), 1, N'Se actualizó el permiso con Id 43')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (566, CAST(N'2019-09-29T20:10:41.173' AS DateTime), 1, N'Se actualizó el permiso con Id 43')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (567, CAST(N'2019-09-29T20:10:55.217' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (568, CAST(N'2019-10-01T19:09:28.620' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (569, CAST(N'2019-10-01T19:11:47.430' AS DateTime), 1, N'Usuario admin guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (570, CAST(N'2019-10-01T19:11:52.333' AS DateTime), 1, N'Usuario admin guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (571, CAST(N'2019-10-01T19:13:03.537' AS DateTime), 1, N'Se realizó un backup de la base de datos')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (572, CAST(N'2019-10-01T19:13:27.370' AS DateTime), 1, N'Se realizó un backup de la base de datos')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (573, CAST(N'2019-10-01T19:14:00.007' AS DateTime), 1, N'Se realizó un backup de la base de datos')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (574, CAST(N'2019-10-01T19:14:32.810' AS DateTime), 1, N'Se restauró un backup de la base de datos')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (575, CAST(N'2019-10-01T19:14:35.310' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (576, CAST(N'2019-10-01T19:14:59.177' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (577, CAST(N'2019-10-01T19:18:15.283' AS DateTime), 1, N'Se generaron las planillas para el día 2/10/2019 00:00:00')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (578, CAST(N'2019-10-01T19:18:53.067' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (579, CAST(N'2019-10-01T19:19:09.837' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (580, CAST(N'2019-10-01T19:23:53.107' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (581, CAST(N'2019-10-01T19:24:17.873' AS DateTime), 1, N'Se generaron las planillas para el día 2/10/2019 00:00:00')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (582, CAST(N'2019-10-01T19:31:55.010' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (583, CAST(N'2019-10-01T19:35:03.027' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (584, CAST(N'2019-10-01T19:35:53.903' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (585, CAST(N'2019-10-01T19:37:28.660' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (586, CAST(N'2019-10-01T19:40:27.620' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (587, CAST(N'2019-10-01T19:41:49.933' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (588, CAST(N'2019-10-01T19:42:11.823' AS DateTime), 1, N'Se generaron las planillas para el día 2/10/2019 00:00:00')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (589, CAST(N'2019-10-01T19:47:03.497' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (590, CAST(N'2019-10-01T19:47:19.307' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (591, CAST(N'2019-10-01T19:48:40.743' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (592, CAST(N'2019-10-01T19:49:42.647' AS DateTime), 1, N'Se realizó un backup de la base de datos')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (593, CAST(N'2019-10-01T19:50:13.097' AS DateTime), 1, N'Usuario pepe guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (594, CAST(N'2019-10-01T19:50:22.650' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (595, CAST(N'2019-10-01T19:50:30.807' AS DateTime), 4, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (596, CAST(N'2019-10-01T19:50:55.150' AS DateTime), 4, N'Se restauró un backup de la base de datos')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (597, CAST(N'2019-10-01T19:51:05.003' AS DateTime), 4, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (598, CAST(N'2019-10-01T19:52:19.967' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (599, CAST(N'2019-10-01T19:53:07.403' AS DateTime), 1, N'Se guardó el idioma con el id 8')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (600, CAST(N'2019-10-01T20:10:58.103' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (601, CAST(N'2019-10-01T20:40:18.250' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (602, CAST(N'2019-10-01T20:43:40.953' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (603, CAST(N'2019-10-01T20:44:04.063' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (604, CAST(N'2019-10-12T15:59:17.400' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (605, CAST(N'2019-10-12T15:59:44.597' AS DateTime), 1, N'Se actualizó el permiso con Id 2')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (606, CAST(N'2019-10-12T15:59:58.357' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (607, CAST(N'2019-10-12T19:27:09.610' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (608, CAST(N'2019-10-12T19:30:17.237' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (609, CAST(N'2019-10-12T19:30:29.653' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (610, CAST(N'2019-10-12T19:35:08.680' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (611, CAST(N'2019-10-12T19:35:16.573' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (612, CAST(N'2019-10-13T11:11:52.103' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (613, CAST(N'2019-10-13T11:14:17.260' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (614, CAST(N'2019-10-13T11:14:47.443' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (615, CAST(N'2019-10-13T11:21:08.927' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (616, CAST(N'2019-10-13T11:21:17.770' AS DateTime), 1, N'Usuario adminneg guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (617, CAST(N'2019-10-13T11:29:52.937' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (618, CAST(N'2019-10-13T11:40:50.980' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (619, CAST(N'2019-10-13T11:42:25.190' AS DateTime), 1, N'Usuario test guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (620, CAST(N'2019-10-13T11:43:42.033' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (621, CAST(N'2019-10-13T11:43:50.217' AS DateTime), 1, N'Usuario test eliminado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (622, CAST(N'2019-10-13T11:44:51.840' AS DateTime), 1, N'Usuario test2 guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (623, CAST(N'2019-10-13T11:45:16.073' AS DateTime), 1, N'Usuario test2 guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (624, CAST(N'2019-10-13T11:48:09.863' AS DateTime), 1, N'Usuario test2 eliminado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (625, CAST(N'2019-10-13T11:50:06.337' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (626, CAST(N'2019-10-13T11:50:53.643' AS DateTime), 1, N'Usuario test3 guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (627, CAST(N'2019-10-13T11:52:21.470' AS DateTime), 1, N'Usuario test3 guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (628, CAST(N'2019-10-13T11:53:16.783' AS DateTime), 1, N'Usuario test3 eliminado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (629, CAST(N'2019-10-13T11:54:34.637' AS DateTime), 1, N'Usuario test4 guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (630, CAST(N'2019-10-13T12:09:12.520' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (631, CAST(N'2019-10-13T12:09:59.293' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (632, CAST(N'2019-10-13T12:15:36.380' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (633, CAST(N'2019-10-13T12:16:21.767' AS DateTime), 1, N'Usuario test4 guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (634, CAST(N'2019-10-13T12:17:35.987' AS DateTime), 1, N'Usuario test5 guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (635, CAST(N'2019-10-13T12:17:57.870' AS DateTime), 1, N'Usuario test5 eliminado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (636, CAST(N'2019-10-13T12:18:07.137' AS DateTime), 1, N'Usuario test4 eliminado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (637, CAST(N'2019-10-13T12:18:20.090' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (638, CAST(N'2019-10-13T15:40:53.803' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (639, CAST(N'2019-10-13T15:41:45.233' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (640, CAST(N'2019-10-13T15:43:27.243' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (641, CAST(N'2019-10-13T15:44:32.070' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (642, CAST(N'2019-10-13T16:14:35.287' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (643, CAST(N'2019-10-13T16:14:47.330' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (644, CAST(N'2019-10-13T16:19:48.670' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (645, CAST(N'2019-10-13T16:20:51.957' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (646, CAST(N'2019-10-13T16:21:16.307' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (647, CAST(N'2019-10-13T16:23:40.173' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (648, CAST(N'2019-10-13T16:23:59.643' AS DateTime), 1, N'Se generaron las planillas para el día 14/10/2019 00:00:00')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (649, CAST(N'2019-10-13T16:25:28.320' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (650, CAST(N'2019-10-13T16:38:54.367' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (651, CAST(N'2019-10-13T16:44:07.340' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (652, CAST(N'2019-10-13T16:44:14.043' AS DateTime), 1, N'Se generaron las planillas para el día 14/10/2019 00:00:00')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (653, CAST(N'2019-10-13T16:47:29.787' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (654, CAST(N'2019-10-13T16:51:25.027' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (655, CAST(N'2019-10-13T16:55:49.633' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (656, CAST(N'2019-10-13T16:56:01.130' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (657, CAST(N'2019-10-13T16:57:17.690' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (658, CAST(N'2019-10-13T16:57:29.707' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (659, CAST(N'2019-10-13T17:05:30.717' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (660, CAST(N'2019-10-13T17:07:52.197' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (661, CAST(N'2019-10-13T17:17:48.553' AS DateTime), 1, N'Se realizó un backup de la base de datos')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (662, CAST(N'2019-10-13T17:17:52.813' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (663, CAST(N'2019-10-13T17:18:56.310' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (664, CAST(N'2019-10-13T17:19:31.047' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (665, CAST(N'2019-10-13T17:19:52.720' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (666, CAST(N'2019-10-13T17:20:01.370' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (667, CAST(N'2019-10-13T17:20:37.380' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (668, CAST(N'2019-10-13T17:20:45.377' AS DateTime), 1, N'Se generaron las planillas para el día 15/10/2019 00:00:00')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (669, CAST(N'2019-10-13T17:22:31.653' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (670, CAST(N'2019-10-13T17:50:47.513' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (671, CAST(N'2019-10-13T17:53:45.090' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (672, CAST(N'2019-10-13T17:54:22.650' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (673, CAST(N'2019-10-13T17:56:49.197' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (674, CAST(N'2019-10-13T18:00:24.773' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (675, CAST(N'2019-10-13T18:00:34.070' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (676, CAST(N'2019-10-13T18:00:59.470' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (677, CAST(N'2019-10-13T18:01:43.917' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (678, CAST(N'2019-10-13T18:01:59.963' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (679, CAST(N'2019-10-13T18:03:53.777' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (680, CAST(N'2019-10-13T18:04:40.917' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (681, CAST(N'2019-10-13T18:05:11.743' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (682, CAST(N'2019-10-13T18:05:27.520' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (683, CAST(N'2019-10-13T18:13:46.467' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (684, CAST(N'2019-10-13T18:14:13.030' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (685, CAST(N'2019-10-13T18:15:00.033' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (686, CAST(N'2019-10-13T18:15:27.580' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (687, CAST(N'2019-10-13T19:11:39.867' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (688, CAST(N'2019-10-13T19:13:33.410' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (689, CAST(N'2019-10-13T19:14:56.983' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (690, CAST(N'2019-10-13T19:15:52.373' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (691, CAST(N'2019-10-13T19:16:40.727' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (692, CAST(N'2019-10-13T19:19:51.167' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (693, CAST(N'2019-10-13T19:24:53.633' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (694, CAST(N'2019-10-13T19:28:17.763' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (695, CAST(N'2019-10-13T19:30:21.163' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (696, CAST(N'2019-10-13T19:32:37.800' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (697, CAST(N'2019-10-13T19:34:09.147' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (698, CAST(N'2019-10-13T19:35:14.723' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (699, CAST(N'2019-10-13T19:37:48.657' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (700, CAST(N'2019-10-13T19:38:08.577' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (701, CAST(N'2019-10-13T19:39:40.077' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (702, CAST(N'2019-10-13T19:46:25.610' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (703, CAST(N'2019-10-13T19:50:01.003' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (704, CAST(N'2019-10-13T19:51:55.453' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (705, CAST(N'2019-10-13T19:52:09.643' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (706, CAST(N'2019-10-13T19:53:36.483' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (707, CAST(N'2019-10-13T23:15:54.757' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (708, CAST(N'2019-10-13T23:16:05.210' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (709, CAST(N'2019-10-13T23:16:57.157' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (710, CAST(N'2019-10-13T23:17:27.387' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (711, CAST(N'2019-10-13T23:22:35.370' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (712, CAST(N'2019-10-13T23:25:31.147' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (713, CAST(N'2019-10-14T15:06:22.707' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (714, CAST(N'2019-10-14T15:07:30.783' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (715, CAST(N'2019-10-14T15:16:08.073' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (716, CAST(N'2019-10-14T15:16:34.910' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (717, CAST(N'2019-10-14T15:18:10.530' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (718, CAST(N'2019-10-14T15:19:22.850' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (719, CAST(N'2019-10-14T15:19:32.710' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (720, CAST(N'2019-10-14T15:24:24.337' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (721, CAST(N'2019-10-14T15:25:27.683' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (722, CAST(N'2019-10-14T15:34:22.963' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (723, CAST(N'2019-10-14T15:47:12.217' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (724, CAST(N'2019-10-14T16:00:35.967' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (725, CAST(N'2019-10-14T16:02:25.983' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (726, CAST(N'2019-10-14T16:13:26.333' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (727, CAST(N'2019-10-14T16:14:52.817' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (728, CAST(N'2019-10-14T16:16:23.113' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (729, CAST(N'2019-10-14T16:17:38.287' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (730, CAST(N'2019-10-14T16:18:12.043' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (731, CAST(N'2019-10-14T16:28:32.773' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (732, CAST(N'2019-10-14T16:29:13.383' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (733, CAST(N'2019-10-14T16:29:43.047' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (734, CAST(N'2019-10-14T16:30:11.833' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (735, CAST(N'2019-10-14T16:33:18.740' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (736, CAST(N'2019-10-14T16:34:27.110' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (737, CAST(N'2019-10-14T16:35:45.503' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (738, CAST(N'2019-10-14T16:53:09.887' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (739, CAST(N'2019-10-14T16:54:16.230' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (740, CAST(N'2019-10-14T16:57:56.513' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (741, CAST(N'2019-10-14T16:59:28.733' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (742, CAST(N'2019-10-14T17:04:31.117' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (743, CAST(N'2019-10-14T17:18:16.220' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (744, CAST(N'2019-10-14T17:19:05.497' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (745, CAST(N'2019-10-14T17:21:16.807' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (746, CAST(N'2019-10-14T17:24:55.340' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (747, CAST(N'2019-10-14T17:32:18.763' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (748, CAST(N'2019-10-14T17:32:40.870' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (749, CAST(N'2019-10-14T17:33:57.417' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (750, CAST(N'2019-10-14T17:34:17.377' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (751, CAST(N'2019-10-14T17:35:57.053' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (752, CAST(N'2019-10-14T17:45:08.710' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (753, CAST(N'2019-10-14T17:47:30.630' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (754, CAST(N'2019-10-14T17:48:29.290' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (755, CAST(N'2019-10-14T17:50:59.107' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (756, CAST(N'2019-10-14T17:52:25.903' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (757, CAST(N'2019-10-14T17:52:53.240' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (758, CAST(N'2019-10-14T17:54:04.593' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (759, CAST(N'2019-10-14T17:54:29.317' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (760, CAST(N'2019-10-14T17:55:38.113' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (761, CAST(N'2019-10-14T17:58:17.147' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (762, CAST(N'2019-10-14T17:58:57.037' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (763, CAST(N'2019-10-14T18:06:23.933' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (764, CAST(N'2019-10-14T18:07:02.867' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (765, CAST(N'2019-10-14T18:07:50.070' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (766, CAST(N'2019-10-14T18:11:50.563' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (767, CAST(N'2019-10-14T18:13:47.777' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (768, CAST(N'2019-10-14T18:15:09.327' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (769, CAST(N'2019-10-14T18:19:18.180' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (770, CAST(N'2019-10-14T18:20:05.533' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (771, CAST(N'2019-10-14T18:21:50.347' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (772, CAST(N'2019-10-14T18:22:48.893' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (773, CAST(N'2019-10-14T18:25:38.220' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (774, CAST(N'2019-10-14T18:26:25.663' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (775, CAST(N'2019-10-14T18:31:12.207' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (776, CAST(N'2019-10-14T18:33:41.323' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (777, CAST(N'2019-10-14T18:35:05.583' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (778, CAST(N'2019-10-14T18:46:46.070' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (779, CAST(N'2019-10-14T18:48:13.943' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (780, CAST(N'2019-10-14T18:55:43.957' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (781, CAST(N'2019-10-14T18:59:56.863' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (782, CAST(N'2019-10-14T19:00:31.167' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (783, CAST(N'2019-10-14T19:01:14.960' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (784, CAST(N'2019-10-14T19:05:00.247' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (785, CAST(N'2019-10-14T19:05:26.853' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (786, CAST(N'2019-10-14T19:20:57.223' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (787, CAST(N'2019-10-14T19:21:42.450' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (788, CAST(N'2019-10-14T19:28:14.077' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (789, CAST(N'2019-10-14T19:28:41.447' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (790, CAST(N'2019-10-14T19:29:53.303' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (791, CAST(N'2019-10-14T19:31:11.923' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (792, CAST(N'2019-10-14T19:35:45.600' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (793, CAST(N'2019-10-14T19:35:56.247' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (794, CAST(N'2019-10-14T19:36:25.040' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (795, CAST(N'2019-10-14T19:36:50.930' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (796, CAST(N'2019-10-14T19:48:58.370' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (797, CAST(N'2019-10-14T19:50:02.100' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (798, CAST(N'2019-10-14T19:50:12.373' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (799, CAST(N'2019-10-14T19:53:21.360' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (800, CAST(N'2019-10-14T20:07:08.133' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (801, CAST(N'2019-10-14T20:12:46.370' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (802, CAST(N'2019-10-14T20:16:35.577' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (803, CAST(N'2019-10-14T20:21:19.740' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (804, CAST(N'2019-10-14T20:26:26.267' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (805, CAST(N'2019-10-14T20:28:30.633' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (806, CAST(N'2019-10-15T10:19:41.373' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (807, CAST(N'2019-10-15T10:21:52.217' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (808, CAST(N'2019-10-20T17:14:21.350' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (809, CAST(N'2019-10-20T18:07:08.670' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (810, CAST(N'2019-10-20T18:11:40.317' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (811, CAST(N'2019-10-20T18:11:46.267' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (812, CAST(N'2019-10-20T18:11:49.600' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (813, CAST(N'2019-10-20T18:24:48.097' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (814, CAST(N'2019-10-20T18:25:27.630' AS DateTime), 1, N'Se actualizaron los viajes de la planilla N° 243')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (815, CAST(N'2019-10-20T18:25:32.173' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (816, CAST(N'2019-10-20T18:25:35.797' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (817, CAST(N'2019-10-20T18:25:51.200' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (818, CAST(N'2019-10-20T18:27:11.163' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (819, CAST(N'2019-10-20T18:27:23.667' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (820, CAST(N'2019-10-20T18:28:03.157' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (821, CAST(N'2019-10-20T18:28:16.260' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (822, CAST(N'2019-10-20T18:34:29.440' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (823, CAST(N'2019-10-20T18:35:30.200' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (824, CAST(N'2019-10-20T18:37:24.670' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (825, CAST(N'2019-10-20T18:43:50.157' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (826, CAST(N'2019-10-20T18:44:22.447' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (827, CAST(N'2019-10-20T18:44:58.310' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (828, CAST(N'2019-10-20T18:53:28.267' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (829, CAST(N'2019-10-20T18:54:32.333' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (830, CAST(N'2019-10-20T18:58:08.423' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (831, CAST(N'2019-10-20T18:59:31.793' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (832, CAST(N'2019-10-20T19:13:41.447' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (833, CAST(N'2019-10-20T19:16:41.670' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (834, CAST(N'2019-10-20T19:26:31.280' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (835, CAST(N'2019-10-20T19:29:21.637' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (836, CAST(N'2019-10-20T19:34:33.433' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (837, CAST(N'2019-10-20T19:39:19.350' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (838, CAST(N'2019-10-20T19:39:26.270' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (839, CAST(N'2019-10-20T19:42:48.390' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (840, CAST(N'2019-10-20T19:46:43.763' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (841, CAST(N'2019-10-20T19:48:13.527' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (842, CAST(N'2019-10-20T19:52:56.433' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (843, CAST(N'2019-10-20T20:00:45.207' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (844, CAST(N'2019-10-21T10:51:56.593' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (845, CAST(N'2019-10-21T10:55:01.123' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (846, CAST(N'2019-10-21T11:01:10.523' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (847, CAST(N'2019-10-21T11:07:27.540' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (848, CAST(N'2019-10-21T14:40:47.897' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (849, CAST(N'2019-10-21T14:42:03.560' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (850, CAST(N'2019-10-21T14:44:45.190' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (851, CAST(N'2019-10-21T14:51:09.083' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (852, CAST(N'2019-10-21T14:53:31.273' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (853, CAST(N'2019-10-21T15:03:25.730' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (854, CAST(N'2019-10-21T15:06:19.997' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (855, CAST(N'2019-10-21T15:08:38.440' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (856, CAST(N'2019-10-21T15:10:24.833' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (857, CAST(N'2019-10-21T15:28:05.393' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (858, CAST(N'2019-10-21T15:37:41.740' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (859, CAST(N'2019-10-21T15:46:15.733' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (860, CAST(N'2019-10-21T15:48:05.637' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (861, CAST(N'2019-10-21T15:53:59.223' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (862, CAST(N'2019-10-21T15:57:10.743' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (863, CAST(N'2019-10-21T15:57:44.767' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (864, CAST(N'2019-10-21T16:07:35.273' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (865, CAST(N'2019-10-21T16:16:41.450' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (866, CAST(N'2019-10-21T16:17:57.343' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (867, CAST(N'2019-10-27T12:12:32.037' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (868, CAST(N'2019-10-27T12:15:44.367' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (869, CAST(N'2019-10-27T12:16:22.367' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (870, CAST(N'2019-10-27T12:19:59.783' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (871, CAST(N'2019-10-27T12:21:00.633' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (872, CAST(N'2019-10-27T12:28:31.673' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (873, CAST(N'2019-10-27T12:33:33.507' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (874, CAST(N'2019-10-27T14:07:20.380' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (875, CAST(N'2019-10-27T14:07:35.360' AS DateTime), 1, N'Se generaron las planillas para el día 28/10/2019 00:00:00')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (876, CAST(N'2019-10-27T14:09:30.370' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (877, CAST(N'2019-10-27T14:09:58.733' AS DateTime), 1, N'Se generaron las planillas para el día 29/10/2019 00:00:00')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (878, CAST(N'2019-10-27T14:12:49.887' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (879, CAST(N'2019-10-27T14:18:09.037' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (880, CAST(N'2019-10-27T14:22:05.730' AS DateTime), 1, N'Se generaron las planillas para el día 28/10/2019 00:00:00')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (881, CAST(N'2019-10-27T14:35:22.140' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (882, CAST(N'2019-10-27T14:35:31.650' AS DateTime), 1, N'Se generaron las planillas para el día 28/10/2019 00:00:00')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (883, CAST(N'2019-10-27T14:35:36.847' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (884, CAST(N'2019-10-27T14:35:44.557' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (885, CAST(N'2019-10-27T14:35:54.940' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (886, CAST(N'2019-10-27T14:37:32.063' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (887, CAST(N'2019-10-27T15:02:19.607' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (888, CAST(N'2019-10-27T15:02:34.123' AS DateTime), 1, N'Se generaron las planillas para el día 28/10/2019 00:00:00')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (889, CAST(N'2019-10-27T15:02:39.427' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (890, CAST(N'2019-10-27T15:02:40.157' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (891, CAST(N'2019-10-27T15:03:42.667' AS DateTime), 1, N'Se generaron las planillas para el día 29/10/2019 00:00:00')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (892, CAST(N'2019-10-27T15:04:03.427' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (893, CAST(N'2019-10-27T15:04:26.967' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (894, CAST(N'2019-10-27T15:07:15.247' AS DateTime), 1, N'Se actualizaron los viajes de la planilla N° 531')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (895, CAST(N'2019-10-27T15:12:03.490' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (896, CAST(N'2019-10-27T15:21:54.203' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (897, CAST(N'2019-10-27T15:22:33.943' AS DateTime), 1, N'Se generaron las planillas para el día 28/10/2019 00:00:00')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (898, CAST(N'2019-10-27T15:22:48.617' AS DateTime), 1, N'Se generaron las planillas para el día 29/10/2019 00:00:00')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (899, CAST(N'2019-10-27T15:30:51.323' AS DateTime), 1, N'Se actualizaron los viajes de la planilla N° 579')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (900, CAST(N'2019-10-27T16:20:10.333' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (901, CAST(N'2019-10-27T17:25:24.637' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (902, CAST(N'2019-10-27T18:27:01.497' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (903, CAST(N'2019-10-27T18:38:28.597' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (904, CAST(N'2019-10-27T20:17:52.000' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (905, CAST(N'2019-10-27T20:29:47.870' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (906, CAST(N'2019-10-27T20:31:32.517' AS DateTime), 1, N'Se generaron las planillas para el día 30/10/2019 00:00:00')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (907, CAST(N'2019-10-27T20:38:21.437' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (908, CAST(N'2019-10-29T20:14:33.180' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (909, CAST(N'2019-10-29T20:14:49.767' AS DateTime), 1, N'Se generó una alerta de insuficiencia. Choferes faltantes: 62. Vehículos faltantes. 0')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (910, CAST(N'2019-10-29T20:14:50.453' AS DateTime), 1, N'Se generaron las planillas para el día 30/10/2019 00:00:00')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (911, CAST(N'2019-10-29T20:19:50.057' AS DateTime), 1, N'Se generó una alerta de insuficiencia. Choferes faltantes: 62. Vehículos faltantes. 0')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (912, CAST(N'2019-10-29T20:19:50.727' AS DateTime), 1, N'Se generaron las planillas para el día 31/10/2019 00:00:00')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (913, CAST(N'2019-10-29T20:19:54.870' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (914, CAST(N'2019-10-29T20:21:03.570' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (915, CAST(N'2019-10-29T20:31:59.010' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (916, CAST(N'2019-10-29T20:32:13.770' AS DateTime), 1, N'Se generó una alerta de insuficiencia. Choferes faltantes: 62. Vehículos faltantes. 0')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (917, CAST(N'2019-10-29T20:32:14.407' AS DateTime), 1, N'Se generaron las planillas para el día 1/11/2019 00:00:00')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (918, CAST(N'2019-10-29T21:37:02.830' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (919, CAST(N'2019-10-29T21:38:36.800' AS DateTime), 1, N'Usuario admin2 guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (920, CAST(N'2019-10-29T21:38:43.063' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (921, CAST(N'2019-10-29T21:39:21.013' AS DateTime), 9, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (922, CAST(N'2019-10-29T21:42:31.450' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (923, CAST(N'2019-10-29T21:42:47.527' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (924, CAST(N'2019-11-03T14:11:39.230' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (925, CAST(N'2019-11-03T14:11:42.543' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (926, CAST(N'2019-11-03T14:28:05.237' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (927, CAST(N'2019-11-03T14:28:12.707' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (928, CAST(N'2019-11-03T14:28:50.247' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (929, CAST(N'2019-11-03T14:33:50.437' AS DateTime), 1, N'Se eliminó el permiso con Id 43')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (930, CAST(N'2019-11-03T14:38:00.187' AS DateTime), 1, N'Usuario admin guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (931, CAST(N'2019-11-03T14:38:07.907' AS DateTime), 1, N'Usuario admin guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (932, CAST(N'2019-11-03T14:40:27.447' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (933, CAST(N'2019-11-03T14:40:36.650' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (934, CAST(N'2019-11-03T14:43:32.113' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (935, CAST(N'2019-11-03T14:59:28.167' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (936, CAST(N'2019-11-03T15:12:47.740' AS DateTime), 1, N'Se generaron las planillas para el día 4/11/2019 00:00:00')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (937, CAST(N'2019-11-03T15:25:05.483' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (938, CAST(N'2019-11-03T15:27:23.077' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (939, CAST(N'2019-11-03T15:45:18.330' AS DateTime), 1, N'Se guardó el vehículo con Id 123')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (940, CAST(N'2019-11-03T15:45:46.830' AS DateTime), 1, N'Se guardó el vehículo con Id 123')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (941, CAST(N'2019-11-03T15:48:50.703' AS DateTime), 1, N'Se guardó el chofer con Id 12')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (942, CAST(N'2019-11-03T16:09:14.037' AS DateTime), 1, N'Usuario admin2 guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (943, CAST(N'2019-11-03T21:31:25.477' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (944, CAST(N'2019-11-05T18:52:32.353' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (945, CAST(N'2019-11-05T18:55:29.980' AS DateTime), 1, N'Se actualizaron los viajes de la planilla N° 869')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (946, CAST(N'2019-11-05T18:57:07.963' AS DateTime), 1, N'Se generaron las planillas para el día 6/11/2019 00:00:00')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (947, CAST(N'2019-11-05T18:59:07.100' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (948, CAST(N'2019-11-10T12:22:28.710' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (949, CAST(N'2019-11-10T12:24:53.220' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (950, CAST(N'2019-11-10T12:27:35.827' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (951, CAST(N'2019-11-10T12:27:44.230' AS DateTime), 1, N'Se actualizaron los viajes de la planilla N° 902')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (952, CAST(N'2019-11-10T12:28:10.530' AS DateTime), 1, N'Se actualizaron los viajes de la planilla N° 902')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (953, CAST(N'2019-11-10T12:28:28.193' AS DateTime), 1, N'Usuario admin guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (954, CAST(N'2019-11-10T12:28:36.190' AS DateTime), 1, N'Usuario admin guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (955, CAST(N'2019-11-10T12:28:38.490' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (956, CAST(N'2019-11-10T12:29:19.677' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (957, CAST(N'2019-11-10T12:29:25.490' AS DateTime), 1, N'Usuario admin guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (958, CAST(N'2019-11-10T12:29:33.280' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (959, CAST(N'2019-11-10T12:31:28.763' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (960, CAST(N'2019-11-10T12:31:40.233' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (961, CAST(N'2019-11-10T12:33:32.337' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (962, CAST(N'2019-11-10T12:33:37.957' AS DateTime), 1, N'Usuario admin guardado')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (963, CAST(N'2019-11-10T12:33:46.503' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (964, CAST(N'2019-11-13T23:28:31.927' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (965, CAST(N'2019-11-13T23:30:23.577' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (966, CAST(N'2019-11-13T23:33:43.890' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (967, CAST(N'2019-11-13T23:37:40.087' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (968, CAST(N'2019-11-13T23:38:08.460' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (969, CAST(N'2019-11-13T23:39:13.833' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (970, CAST(N'2019-11-13T23:42:22.553' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (971, CAST(N'2019-11-13T23:47:12.627' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (972, CAST(N'2019-11-13T23:47:44.897' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (973, CAST(N'2019-11-13T23:54:32.863' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (974, CAST(N'2019-11-13T23:55:12.487' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (975, CAST(N'2019-11-14T00:06:35.800' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (976, CAST(N'2019-11-14T00:07:34.193' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (977, CAST(N'2019-11-14T00:11:22.167' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (978, CAST(N'2019-11-14T00:12:07.647' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (979, CAST(N'2019-11-14T00:14:26.663' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (980, CAST(N'2019-11-14T00:14:59.467' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (981, CAST(N'2019-11-14T22:54:34.620' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (982, CAST(N'2019-11-14T22:54:37.997' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (983, CAST(N'2019-11-14T23:43:31.010' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (984, CAST(N'2019-11-14T23:44:29.290' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (985, CAST(N'2019-11-14T23:44:42.367' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (986, CAST(N'2019-11-14T23:46:07.390' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (987, CAST(N'2019-11-14T23:47:11.090' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (988, CAST(N'2019-11-14T23:47:19.640' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (989, CAST(N'2019-11-14T23:47:29.923' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (990, CAST(N'2019-11-14T23:49:29.630' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (991, CAST(N'2019-11-14T23:50:47.687' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (992, CAST(N'2019-11-14T23:53:00.327' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (993, CAST(N'2019-11-14T23:55:23.407' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (994, CAST(N'2019-11-14T23:55:37.453' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (995, CAST(N'2019-11-15T00:36:23.207' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (996, CAST(N'2019-11-15T00:36:37.653' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (997, CAST(N'2019-11-15T13:39:20.990' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (998, CAST(N'2019-11-15T13:39:24.230' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (999, CAST(N'2019-11-15T13:39:35.650' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (1000, CAST(N'2019-11-15T13:39:38.607' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (1001, CAST(N'2019-11-15T13:40:04.003' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (1002, CAST(N'2019-11-15T13:40:06.630' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (1003, CAST(N'2019-11-16T14:32:58.453' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (1004, CAST(N'2019-11-16T14:33:37.937' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (1005, CAST(N'2019-11-16T14:47:43.713' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (1006, CAST(N'2019-11-16T14:48:50.477' AS DateTime), 1, N'El usuario cerró sesión')
GO
INSERT [dbo].[bitacora] ([id], [fecha_hora], [usuario_id], [detalle]) VALUES (1007, CAST(N'2019-11-17T14:45:02.237' AS DateTime), 1, N'El usuario se logueó al sistema')
GO
SET IDENTITY_INSERT [dbo].[bitacora] OFF
GO
ALTER TABLE [dbo].[bitacora] ADD  CONSTRAINT [DF_bitacora_fecha_hora]  DEFAULT (getdate()) FOR [fecha_hora]
GO
USE [master]
GO
ALTER DATABASE [transportes_mj_bitacora] SET  READ_WRITE 
GO
