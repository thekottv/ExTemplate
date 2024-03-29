USE [master]
GO
/****** Object:  Database [extemplate]    Script Date: 14.02.2024 3:28:57 ******/
CREATE DATABASE [extemplate]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'extemplate', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\extemplate.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'extemplate_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\extemplate_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [extemplate] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [extemplate].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [extemplate] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [extemplate] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [extemplate] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [extemplate] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [extemplate] SET ARITHABORT OFF 
GO
ALTER DATABASE [extemplate] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [extemplate] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [extemplate] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [extemplate] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [extemplate] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [extemplate] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [extemplate] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [extemplate] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [extemplate] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [extemplate] SET  DISABLE_BROKER 
GO
ALTER DATABASE [extemplate] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [extemplate] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [extemplate] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [extemplate] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [extemplate] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [extemplate] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [extemplate] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [extemplate] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [extemplate] SET  MULTI_USER 
GO
ALTER DATABASE [extemplate] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [extemplate] SET DB_CHAINING OFF 
GO
ALTER DATABASE [extemplate] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [extemplate] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [extemplate] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [extemplate] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [extemplate] SET QUERY_STORE = OFF
GO
USE [extemplate]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 14.02.2024 3:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[telephone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 14.02.2024 3:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Somedata]    Script Date: 14.02.2024 3:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Somedata](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderName] [nvarchar](50) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[ClientID] [int] NOT NULL,
	[ExecutorID] [int] NOT NULL,
 CONSTRAINT [PK_Somedata] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 14.02.2024 3:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[role] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [name], [telephone]) VALUES (1, N'Иванов Иван Иванович', N'88005553535')
INSERT [dbo].[Client] ([ID], [name], [telephone]) VALUES (2, N'Петров Петр Петрович', N'88005553636')
INSERT [dbo].[Client] ([ID], [name], [telephone]) VALUES (3, N'Гагарин Владислав Анатольевич', N'88882227673')
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([ID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([ID], [RoleName]) VALUES (2, N'User')
INSERT [dbo].[Roles] ([ID], [RoleName]) VALUES (3, N'Spectator')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Somedata] ON 

INSERT [dbo].[Somedata] ([ID], [OrderName], [OrderDate], [ClientID], [ExecutorID]) VALUES (3, N'order1', CAST(N'2023-02-14' AS Date), 1, 2)
INSERT [dbo].[Somedata] ([ID], [OrderName], [OrderDate], [ClientID], [ExecutorID]) VALUES (4, N'order2', CAST(N'2023-02-13' AS Date), 2, 2)
INSERT [dbo].[Somedata] ([ID], [OrderName], [OrderDate], [ClientID], [ExecutorID]) VALUES (5, N'order3', CAST(N'2023-02-01' AS Date), 2, 1)
SET IDENTITY_INSERT [dbo].[Somedata] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [name], [login], [password], [role]) VALUES (1, N'admin', N'admin', N'admin', 1)
INSERT [dbo].[Users] ([ID], [name], [login], [password], [role]) VALUES (2, N'user', N'user', N'user', 2)
INSERT [dbo].[Users] ([ID], [name], [login], [password], [role]) VALUES (3, N'spec', N'spec', N'spec', 3)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Somedata]  WITH CHECK ADD  CONSTRAINT [FK_Somedata_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Somedata] CHECK CONSTRAINT [FK_Somedata_Client]
GO
ALTER TABLE [dbo].[Somedata]  WITH CHECK ADD  CONSTRAINT [FK_Somedata_Users] FOREIGN KEY([ExecutorID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Somedata] CHECK CONSTRAINT [FK_Somedata_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([role])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [extemplate] SET  READ_WRITE 
GO
