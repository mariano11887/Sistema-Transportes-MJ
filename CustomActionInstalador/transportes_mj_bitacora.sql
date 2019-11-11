USE [master]
GO
/****** Object:  Database [transportes_mj_bitacora_test]    Script Date: 10/11/2019 22:48:51 ******/
IF EXISTS(select * from sys.databases where name='transportes_mj_bitacora_test')
DROP DATABASE [transportes_mj_bitacora_test]
GO
CREATE DATABASE [transportes_mj_bitacora_test]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [transportes_mj_bitacora_test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [transportes_mj_bitacora_test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [transportes_mj_bitacora_test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [transportes_mj_bitacora_test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [transportes_mj_bitacora_test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [transportes_mj_bitacora_test] SET ARITHABORT OFF 
GO
ALTER DATABASE [transportes_mj_bitacora_test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [transportes_mj_bitacora_test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [transportes_mj_bitacora_test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [transportes_mj_bitacora_test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [transportes_mj_bitacora_test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [transportes_mj_bitacora_test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [transportes_mj_bitacora_test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [transportes_mj_bitacora_test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [transportes_mj_bitacora_test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [transportes_mj_bitacora_test] SET  DISABLE_BROKER 
GO
ALTER DATABASE [transportes_mj_bitacora_test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [transportes_mj_bitacora_test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [transportes_mj_bitacora_test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [transportes_mj_bitacora_test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [transportes_mj_bitacora_test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [transportes_mj_bitacora_test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [transportes_mj_bitacora_test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [transportes_mj_bitacora_test] SET RECOVERY FULL 
GO
ALTER DATABASE [transportes_mj_bitacora_test] SET  MULTI_USER 
GO
ALTER DATABASE [transportes_mj_bitacora_test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [transportes_mj_bitacora_test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [transportes_mj_bitacora_test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [transportes_mj_bitacora_test] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [transportes_mj_bitacora_test] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'transportes_mj_bitacora_test', N'ON'
GO
USE [transportes_mj_bitacora_test]
GO
/****** Object:  Table [dbo].[bitacora]    Script Date: 10/11/2019 22:48:51 ******/
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
ALTER TABLE [dbo].[bitacora] ADD  CONSTRAINT [DF_bitacora_fecha_hora]  DEFAULT (getdate()) FOR [fecha_hora]
GO
USE [master]
GO
ALTER DATABASE [transportes_mj_bitacora_test] SET  READ_WRITE 
GO
