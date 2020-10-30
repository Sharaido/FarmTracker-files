USE [master]
GO
/****** Object:  Database [farmTracker]    Script Date: 10/30/2020 12:15:51 PM ******/
CREATE DATABASE [farmTracker]
 CONTAINMENT = NONE
GO
ALTER DATABASE [farmTracker] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [farmTracker].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [farmTracker] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [farmTracker] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [farmTracker] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [farmTracker] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [farmTracker] SET ARITHABORT OFF 
GO
ALTER DATABASE [farmTracker] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [farmTracker] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [farmTracker] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [farmTracker] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [farmTracker] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [farmTracker] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [farmTracker] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [farmTracker] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [farmTracker] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [farmTracker] SET  DISABLE_BROKER 
GO
ALTER DATABASE [farmTracker] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [farmTracker] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [farmTracker] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [farmTracker] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [farmTracker] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [farmTracker] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [farmTracker] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [farmTracker] SET RECOVERY FULL 
GO
ALTER DATABASE [farmTracker] SET  MULTI_USER 
GO
ALTER DATABASE [farmTracker] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [farmTracker] SET DB_CHAINING OFF 
GO
ALTER DATABASE [farmTracker] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [farmTracker] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [farmTracker] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'farmTracker', N'ON'
GO
ALTER DATABASE [farmTracker] SET QUERY_STORE = OFF
GO
USE [farmTracker]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [farmTracker]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 10/30/2020 12:15:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[CUID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[subCategoryFlag] [bit] NULL,
	[subCategoryOfCUID] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoryOfProperties]    Script Date: 10/30/2020 12:15:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoryOfProperties](
	[PUID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[TUID] [int] NOT NULL,
	[CUID] [int] NOT NULL,
 CONSTRAINT [PK_CategoryOfProperties] PRIMARY KEY CLUSTERED 
(
	[PUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[codeType]    Script Date: 10/30/2020 12:15:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[codeType](
	[CTUID] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](16) NOT NULL,
 CONSTRAINT [PK_codeType] PRIMARY KEY CLUSTERED 
(
	[CTUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[collaborators]    Script Date: 10/30/2020 12:15:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[collaborators](
	[FUID] [uniqueidentifier] NOT NULL,
	[UUID] [uniqueidentifier] NOT NULL,
	[RUID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_collaborators] PRIMARY KEY CLUSTERED 
(
	[FUID] ASC,
	[UUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COPTypes]    Script Date: 10/30/2020 12:15:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COPTypes](
	[TUID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_COPTypes] PRIMARY KEY CLUSTERED 
(
	[TUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COPValues]    Script Date: 10/30/2020 12:15:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COPValues](
	[value] [nvarchar](50) NOT NULL,
	[PUID] [int] NOT NULL,
 CONSTRAINT [PK_COPValues] PRIMARY KEY CLUSTERED 
(
	[value] ASC,
	[PUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cRoles]    Script Date: 10/30/2020 12:15:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cRoles](
	[RUID] [uniqueidentifier] NOT NULL,
	[createdByUUID] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[basicRoleFlag] [bit] NULL,
	[createdDate] [datetime] NULL,
	[deletedFlag] [nchar](10) NULL,
	[deletedDate] [datetime] NULL,
	[deletedByUUID] [uniqueidentifier] NULL,
	[can_create_property] [bit] NULL,
 CONSTRAINT [PK_cRoles] PRIMARY KEY CLUSTERED 
(
	[RUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[entityCOPValues]    Script Date: 10/30/2020 12:15:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entityCOPValues](
	[EUID] [uniqueidentifier] NOT NULL,
	[PUID] [int] NOT NULL,
	[value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_EntityCOPValues] PRIMARY KEY CLUSTERED 
(
	[EUID] ASC,
	[PUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[entityDetail]    Script Date: 10/30/2020 12:15:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entityDetail](
	[DUID] [uniqueidentifier] NOT NULL,
	[EUID] [uniqueidentifier] NOT NULL,
	[head] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[cost] [money] NULL,
	[deletedFlag] [bit] NULL,
	[deletedDate] [datetime] NULL,
	[deletedByUUID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_entityDetail] PRIMARY KEY CLUSTERED 
(
	[DUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[entityOfFP]    Script Date: 10/30/2020 12:15:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entityOfFP](
	[EUID] [uniqueidentifier] NOT NULL,
	[CUID] [int] NOT NULL,
	[PUID] [uniqueidentifier] NOT NULL,
	[ID] [nvarchar](50) NULL,
	[head] [nvarchar](50) NOT NULL,
	[description] [nvarchar](255) NULL,
	[count] [int] NULL,
	[purchasedDate] [datetime] NULL,
	[cost] [money] NULL,
	[soldFlag] [bit] NULL,
	[soldDate] [datetime] NULL,
	[soldPrice] [money] NULL,
	[soldDetail] [nvarchar](max) NULL,
	[soldByUUID] [uniqueidentifier] NULL,
	[createdDate] [datetime] NULL,
	[createdByUUID] [uniqueidentifier] NOT NULL,
	[deletedFlag] [bit] NULL,
	[deletedDate] [datetime] NULL,
	[deletedByUUID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_EntityOfFP] PRIMARY KEY CLUSTERED 
(
	[EUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[farmProperties]    Script Date: 10/30/2020 12:15:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[farmProperties](
	[PUID] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[TUID] [int] NOT NULL,
	[FUID] [uniqueidentifier] NOT NULL,
	[createdByUUID] [uniqueidentifier] NOT NULL,
	[createdDate] [datetime] NULL,
	[deletedFlag] [bit] NULL,
	[deletedDate] [datetime] NULL,
	[deletedByUUID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_farmProperties] PRIMARY KEY CLUSTERED 
(
	[PUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[farmPropertyType]    Script Date: 10/30/2020 12:15:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[farmPropertyType](
	[TUID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_farmPropertyType] PRIMARY KEY CLUSTERED 
(
	[TUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[farms]    Script Date: 10/30/2020 12:15:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[farms](
	[FUID] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[createdByUUID] [uniqueidentifier] NOT NULL,
	[createdDate] [datetime] NULL,
	[deletedFlag] [bit] NULL,
	[deletedDate] [datetime] NULL,
	[deletedByUUID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_farms] PRIMARY KEY CLUSTERED 
(
	[FUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[generatedUCodes]    Script Date: 10/30/2020 12:15:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[generatedUCodes](
	[GUC] [uniqueidentifier] NOT NULL,
	[forUUID] [uniqueidentifier] NULL,
	[forIP] [varchar](15) NULL,
	[createdDate] [datetime] NOT NULL,
	[expirationDate] [datetime] NOT NULL,
	[isValid] [bit] NOT NULL,
	[CTUID] [int] NOT NULL,
 CONSTRAINT [PK_generatedUCodes] PRIMARY KEY CLUSTERED 
(
	[GUC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[incomeAndExpeneses]    Script Date: 10/30/2020 12:15:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[incomeAndExpeneses](
	[IEUID] [uniqueidentifier] NOT NULL,
	[FUID] [uniqueidentifier] NOT NULL,
	[incomeFlag] [bit] NOT NULL,
	[date] [datetime] NULL,
	[head] [nvarchar](50) NOT NULL,
	[decription] [nvarchar](max) NULL,
	[cost] [money] NOT NULL,
	[createdByUUID] [uniqueidentifier] NULL,
	[deletedFlag] [bit] NULL,
	[deletedDate] [datetime] NULL,
	[deletedByUUID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_incomeAndExpeneses] PRIMARY KEY CLUSTERED 
(
	[IEUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[memberType]    Script Date: 10/30/2020 12:15:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[memberType](
	[MTUID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](16) NULL,
	[farmLimit] [int] NULL,
	[propertyLimit] [int] NULL,
	[collaboratorLimit] [int] NULL,
	[AdLimit] [int] NULL,
	[supportFlag] [bit] NULL,
	[price] [money] NULL,
 CONSTRAINT [PK_memberType] PRIMARY KEY CLUSTERED 
(
	[MTUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 10/30/2020 12:15:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[RUID] [int] IDENTITY(1,1) NOT NULL,
	[createdByUUID] [uniqueidentifier] NULL,
	[name] [varchar](50) NOT NULL,
	[sysRoleFlag] [bit] NOT NULL,
	[can_enter_admin_dashboard] [bit] NOT NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[RUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sessions]    Script Date: 10/30/2020 12:15:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sessions](
	[SUID] [uniqueidentifier] NOT NULL,
	[UUID] [uniqueidentifier] NOT NULL,
	[isValid] [bit] NULL,
	[createdDate] [datetime] NULL,
	[lastUsedDate] [datetime] NULL,
 CONSTRAINT [PK_sessions] PRIMARY KEY CLUSTERED 
(
	[SUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[signIn_logs]    Script Date: 10/30/2020 12:15:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[signIn_logs](
	[LUID] [uniqueidentifier] NOT NULL,
	[ipAdd] [varchar](15) NULL,
	[country] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[location] [varchar](50) NULL,
	[hostname] [nvarchar](255) NULL,
	[date] [datetime] NULL,
	[attemptedPassword] [varchar](24) NOT NULL,
	[attemptedResult] [bit] NOT NULL,
	[UUID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_signIn_logs] PRIMARY KEY CLUSTERED 
(
	[LUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 10/30/2020 12:15:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[UUID] [uniqueidentifier] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [char](24) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[emailActivated] [bit] NULL,
	[phoneNumber] [varchar](16) NULL,
	[phoneNumberActivated] [bit] NULL,
	[name] [nvarchar](50) NOT NULL,
	[surname] [nvarchar](50) NOT NULL,
	[profilPic] [nvarchar](50) NULL,
	[createdDate] [datetime] NULL,
	[deletedFlag] [bit] NULL,
	[deletedDate] [datetime] NULL,
	[deletedByUUID] [uniqueidentifier] NULL,
	[RUID] [int] NOT NULL,
	[MTUID] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[UUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([CUID], [name], [subCategoryFlag], [subCategoryOfCUID]) VALUES (1, N'All', 0, NULL)
INSERT [dbo].[categories] ([CUID], [name], [subCategoryFlag], [subCategoryOfCUID]) VALUES (2, N'Anilmal', 1, 1)
INSERT [dbo].[categories] ([CUID], [name], [subCategoryFlag], [subCategoryOfCUID]) VALUES (3, N'Plant', 1, 1)
INSERT [dbo].[categories] ([CUID], [name], [subCategoryFlag], [subCategoryOfCUID]) VALUES (4, N'Aquarium Fishes', 1, 2)
INSERT [dbo].[categories] ([CUID], [name], [subCategoryFlag], [subCategoryOfCUID]) VALUES (5, N'Freshwater', 1, 4)
INSERT [dbo].[categories] ([CUID], [name], [subCategoryFlag], [subCategoryOfCUID]) VALUES (6, N'Saltwater', 1, 4)
INSERT [dbo].[categories] ([CUID], [name], [subCategoryFlag], [subCategoryOfCUID]) VALUES (7, N'Cichlids', 1, 5)
INSERT [dbo].[categories] ([CUID], [name], [subCategoryFlag], [subCategoryOfCUID]) VALUES (8, N'Blue Dolphin', 1, 7)
SET IDENTITY_INSERT [dbo].[categories] OFF
SET IDENTITY_INSERT [dbo].[categoryOfProperties] ON 

INSERT [dbo].[categoryOfProperties] ([PUID], [name], [TUID], [CUID]) VALUES (1, N'weight', 2, 2)
INSERT [dbo].[categoryOfProperties] ([PUID], [name], [TUID], [CUID]) VALUES (2, N'height', 2, 1)
INSERT [dbo].[categoryOfProperties] ([PUID], [name], [TUID], [CUID]) VALUES (3, N'health', 1, 1)
INSERT [dbo].[categoryOfProperties] ([PUID], [name], [TUID], [CUID]) VALUES (4, N'birthDate', 1, 1)
SET IDENTITY_INSERT [dbo].[categoryOfProperties] OFF
SET IDENTITY_INSERT [dbo].[codeType] ON 

INSERT [dbo].[codeType] ([CTUID], [type]) VALUES (3, N'eMail')
INSERT [dbo].[codeType] ([CTUID], [type]) VALUES (1, N'forgotten')
INSERT [dbo].[codeType] ([CTUID], [type]) VALUES (5, N'other')
INSERT [dbo].[codeType] ([CTUID], [type]) VALUES (2, N'phoneNumber')
INSERT [dbo].[codeType] ([CTUID], [type]) VALUES (4, N'signUp')
SET IDENTITY_INSERT [dbo].[codeType] OFF
SET IDENTITY_INSERT [dbo].[COPTypes] ON 

INSERT [dbo].[COPTypes] ([TUID], [name]) VALUES (3, N'bool')
INSERT [dbo].[COPTypes] ([TUID], [name]) VALUES (2, N'int')
INSERT [dbo].[COPTypes] ([TUID], [name]) VALUES (4, N'select')
INSERT [dbo].[COPTypes] ([TUID], [name]) VALUES (1, N'string')
SET IDENTITY_INSERT [dbo].[COPTypes] OFF
INSERT [dbo].[COPValues] ([value], [PUID]) VALUES (N'Dead', 3)
INSERT [dbo].[COPValues] ([value], [PUID]) VALUES (N'Diseased', 3)
INSERT [dbo].[COPValues] ([value], [PUID]) VALUES (N'Healty', 3)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'10c7adb2-a4a6-4447-9ae5-0b5f7923ebfb', NULL, N'::1', CAST(N'2020-10-27T09:58:53.663' AS DateTime), CAST(N'2020-10-27T10:03:53.663' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'd96c8e58-77c7-49ab-802c-0f2fa5915aa9', NULL, N'198.162.1.1', CAST(N'2020-10-26T20:24:04.120' AS DateTime), CAST(N'2020-10-26T20:29:04.120' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'b00d8c58-0e85-406d-a22a-1148461fa439', NULL, N'198.162.1.1', CAST(N'2020-10-26T20:23:43.553' AS DateTime), CAST(N'2020-10-26T20:28:43.553' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'dbca077e-90c2-48ad-bfdb-1290337b0c2d', NULL, N'::1', CAST(N'2020-10-27T09:58:52.333' AS DateTime), CAST(N'2020-10-27T10:03:52.333' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'8a3b959e-9063-40df-9e25-1de405f72bfc', NULL, N'::1', CAST(N'2020-10-27T10:05:59.947' AS DateTime), CAST(N'2020-10-27T10:10:59.947' AS DateTime), 0, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'f7770024-2ccd-48e4-9c49-3e3f3183a1a5', NULL, N'198.162.1.1', CAST(N'2020-10-26T20:24:04.580' AS DateTime), CAST(N'2020-10-26T20:29:04.580' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'50562fdc-c260-4f18-8541-465a2f40a32f', NULL, N'198.162.1.1', CAST(N'2020-10-26T20:24:05.063' AS DateTime), CAST(N'2020-10-26T20:29:05.063' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'7a544f19-7603-4b81-a09b-491dc11b64a5', NULL, N'::1', CAST(N'2020-10-26T20:52:20.030' AS DateTime), CAST(N'2020-10-26T20:57:20.030' AS DateTime), 0, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'01ebd01f-8838-42b6-80ed-818f49fe7495', NULL, N'198.162.1.1', CAST(N'2020-10-26T20:24:03.587' AS DateTime), CAST(N'2020-10-26T20:29:03.587' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'1c4ba74b-08ab-4fee-9ef2-84eca092e5b6', NULL, N'::1', CAST(N'2020-10-27T09:58:53.040' AS DateTime), CAST(N'2020-10-27T10:03:53.040' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'c4c2dea5-4051-434f-8422-9b83a7388582', NULL, N'::1', CAST(N'2020-10-26T20:47:06.413' AS DateTime), CAST(N'2020-10-26T20:52:06.413' AS DateTime), 0, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'8f4c38cb-9646-47ac-a155-b5e18c86728a', NULL, N'::1', CAST(N'2020-10-27T09:58:51.610' AS DateTime), CAST(N'2020-10-27T10:03:51.610' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'6d542355-df98-4ac9-9fd1-c8d73b39ec4a', NULL, N'::1', CAST(N'2020-10-27T09:58:39.367' AS DateTime), CAST(N'2020-10-27T10:03:39.367' AS DateTime), 1, 4)
SET IDENTITY_INSERT [dbo].[memberType] ON 

INSERT [dbo].[memberType] ([MTUID], [name], [farmLimit], [propertyLimit], [collaboratorLimit], [AdLimit], [supportFlag], [price]) VALUES (1, N'user', 0, 0, 0, 0, 0, 0.0000)
INSERT [dbo].[memberType] ([MTUID], [name], [farmLimit], [propertyLimit], [collaboratorLimit], [AdLimit], [supportFlag], [price]) VALUES (2, N'farmer', 1, 5, 3, 1, 0, 0.0000)
SET IDENTITY_INSERT [dbo].[memberType] OFF
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([RUID], [createdByUUID], [name], [sysRoleFlag], [can_enter_admin_dashboard]) VALUES (1, NULL, N'admin', 1, 1)
INSERT [dbo].[roles] ([RUID], [createdByUUID], [name], [sysRoleFlag], [can_enter_admin_dashboard]) VALUES (2, NULL, N'user', 1, 0)
SET IDENTITY_INSERT [dbo].[roles] OFF
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'9ce2f2a3-9618-eb11-a498-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-10-27T20:54:44.967' AS DateTime), NULL)
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'32f0e9c3-061a-eb11-a49a-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-10-29T16:49:53.393' AS DateTime), NULL)
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'97415d2a-091a-eb11-a49a-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-10-29T17:07:04.270' AS DateTime), NULL)
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'c091d736-0d1a-eb11-a49a-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-10-29T17:36:03.190' AS DateTime), NULL)
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'd77be9e4-0e1a-eb11-a49a-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-10-29T17:48:04.730' AS DateTime), NULL)
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'44debb8d-0f1a-eb11-a49a-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-10-29T17:52:47.963' AS DateTime), NULL)
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'71bc6f0c-d517-eb11-a497-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-26T21:48:57.663' AS DateTime), N'cVeCxZwFYem2zg89Uiwy8Q==', 0, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'999de7d7-d617-eb11-a497-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-26T22:01:48.547' AS DateTime), N'cVeCxZwFYem2zg89Uiwy8Q==', 0, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'6415abeb-d617-eb11-a497-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-26T22:02:21.910' AS DateTime), N'cVeCxZwFYem2zg89Uiwy8Q==', 0, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'6515abeb-d617-eb11-a497-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-26T22:02:22.763' AS DateTime), N'cVeCxZwFYem2zg89Uiwy8Q==', 0, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'6615abeb-d617-eb11-a497-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-26T22:02:23.483' AS DateTime), N'cVeCxZwFYem2zg89Uiwy8Q==', 0, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'6715abeb-d617-eb11-a497-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-26T22:02:24.103' AS DateTime), N'cVeCxZwFYem2zg89Uiwy8Q==', 0, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'9029551e-e517-eb11-a497-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-26T23:43:59.613' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'9129551e-e517-eb11-a497-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-26T23:44:06.130' AS DateTime), N'cVeCxZwFYem2zg89Uiwy8Q==', 0, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'9229551e-e517-eb11-a497-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-26T23:44:07.000' AS DateTime), N'cVeCxZwFYem2zg89Uiwy8Q==', 0, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'9329551e-e517-eb11-a497-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-26T23:44:07.727' AS DateTime), N'cVeCxZwFYem2zg89Uiwy8Q==', 0, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'9429551e-e517-eb11-a497-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-26T23:44:08.430' AS DateTime), N'cVeCxZwFYem2zg89Uiwy8Q==', 0, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'9529551e-e517-eb11-a497-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-26T23:44:09.113' AS DateTime), N'cVeCxZwFYem2zg89Uiwy8Q==', 0, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'8378179b-051a-eb11-a49a-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-29T16:41:35.160' AS DateTime), N'cVeCxZwFYem2zg89Uiwy8Q==', 0, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'e98a3da4-061a-eb11-a49a-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-29T16:49:00.057' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'26da3113-071a-eb11-a49a-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-29T16:52:06.213' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'a4f8cf3e-071a-eb11-a49a-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-29T16:53:19.570' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'2d509ca5-071a-eb11-a49a-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-29T16:56:11.850' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'b4101824-091a-eb11-a49a-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-29T17:06:53.557' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'b0e5dd1f-0d1a-eb11-a49a-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-29T17:35:24.443' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'0ed5bec7-0e1a-eb11-a49a-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-29T17:47:15.607' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'10c91b7f-0f1a-eb11-a49a-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-29T17:52:23.230' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[users] ([UUID], [username], [password], [email], [emailActivated], [phoneNumber], [phoneNumberActivated], [name], [surname], [profilPic], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [RUID], [MTUID]) VALUES (N'e07e65e7-1815-eb11-a494-201a06a548bb', N'doguskar', N'Qpf0SxOVUjUkWySXOZ16kw==', N'dogus.kar@hotmail.com', 0, NULL, 0, N'Doğuş', N'Kar', NULL, CAST(N'2020-10-24T10:41:28.387' AS DateTime), 0, NULL, NULL, 1, 1)
INSERT [dbo].[users] ([UUID], [username], [password], [email], [emailActivated], [phoneNumber], [phoneNumberActivated], [name], [surname], [profilPic], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [RUID], [MTUID]) VALUES (N'70f13c78-e515-eb11-a495-201a06a548bb', N'dogus.kar', N'Qpf0SxOVUjUkWySXOZ16kw==', N'doguskar98@gmail.com', 0, NULL, 0, N'Dogus', N'Kar', NULL, CAST(N'2020-10-24T10:41:28.387' AS DateTime), 0, NULL, NULL, 2, 1)
INSERT [dbo].[users] ([UUID], [username], [password], [email], [emailActivated], [phoneNumber], [phoneNumberActivated], [name], [surname], [profilPic], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [RUID], [MTUID]) VALUES (N'46783cc6-e515-eb11-a495-201a06a548bb', N'doguskar1', N'Qpf0SxOVUjUkWySXOZ16kw==', N'doguskar981@gmail.com', 0, NULL, 0, N'Doğuş', N'Kar', NULL, CAST(N'2020-10-24T10:43:39.247' AS DateTime), 0, NULL, NULL, 2, 1)
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_codeType]    Script Date: 10/30/2020 12:15:53 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_codeType] ON [dbo].[codeType]
(
	[type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_COPTypes]    Script Date: 10/30/2020 12:15:53 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_COPTypes] ON [dbo].[COPTypes]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_farmPropertyType]    Script Date: 10/30/2020 12:15:53 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_farmPropertyType] ON [dbo].[farmPropertyType]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_users]    Script Date: 10/30/2020 12:15:53 PM ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [IX_users] UNIQUE NONCLUSTERED 
(
	[UUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[categories] ADD  CONSTRAINT [DF_Categories_subCategoryFlag]  DEFAULT ((0)) FOR [subCategoryFlag]
GO
ALTER TABLE [dbo].[cRoles] ADD  CONSTRAINT [DF_cRoles_RUID]  DEFAULT (newsequentialid()) FOR [RUID]
GO
ALTER TABLE [dbo].[cRoles] ADD  CONSTRAINT [DF_cRoles_basicRoleFlag]  DEFAULT ((0)) FOR [basicRoleFlag]
GO
ALTER TABLE [dbo].[cRoles] ADD  CONSTRAINT [DF_cRoles_createdDate]  DEFAULT (getutcdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[cRoles] ADD  CONSTRAINT [DF_cRoles_can_create_property]  DEFAULT ((0)) FOR [can_create_property]
GO
ALTER TABLE [dbo].[entityCOPValues] ADD  CONSTRAINT [DF_EntityCOPValues_EUID]  DEFAULT (newsequentialid()) FOR [EUID]
GO
ALTER TABLE [dbo].[entityDetail] ADD  CONSTRAINT [DF_entityDetail_DUID]  DEFAULT (newsequentialid()) FOR [DUID]
GO
ALTER TABLE [dbo].[entityOfFP] ADD  CONSTRAINT [DF_EntityOfFP_EUID]  DEFAULT (newsequentialid()) FOR [EUID]
GO
ALTER TABLE [dbo].[entityOfFP] ADD  CONSTRAINT [DF_EntityOfFP_createdDate]  DEFAULT (getutcdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[farmProperties] ADD  CONSTRAINT [DF_farmProperties_PUID]  DEFAULT (newsequentialid()) FOR [PUID]
GO
ALTER TABLE [dbo].[farms] ADD  CONSTRAINT [DF_farms_FUID]  DEFAULT (newsequentialid()) FOR [FUID]
GO
ALTER TABLE [dbo].[farms] ADD  CONSTRAINT [DF_farms_createdDate]  DEFAULT (getutcdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[generatedUCodes] ADD  CONSTRAINT [DF_generatedUCodes_GUC]  DEFAULT (newid()) FOR [GUC]
GO
ALTER TABLE [dbo].[generatedUCodes] ADD  CONSTRAINT [DF_generatedUCodes_createdDate]  DEFAULT (getutcdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[generatedUCodes] ADD  CONSTRAINT [DF_generatedUCodes_valid]  DEFAULT ((1)) FOR [isValid]
GO
ALTER TABLE [dbo].[incomeAndExpeneses] ADD  CONSTRAINT [DF_incomeAndExpeneses_IEUID]  DEFAULT (newsequentialid()) FOR [IEUID]
GO
ALTER TABLE [dbo].[roles] ADD  CONSTRAINT [DF_roles_sysRoleFlag]  DEFAULT ((0)) FOR [sysRoleFlag]
GO
ALTER TABLE [dbo].[roles] ADD  CONSTRAINT [DF_roles_can_enter_admin_dashboard]  DEFAULT ((0)) FOR [can_enter_admin_dashboard]
GO
ALTER TABLE [dbo].[sessions] ADD  CONSTRAINT [DF_sessions_suid]  DEFAULT (newsequentialid()) FOR [SUID]
GO
ALTER TABLE [dbo].[sessions] ADD  CONSTRAINT [DF_sessions_valid]  DEFAULT ((1)) FOR [isValid]
GO
ALTER TABLE [dbo].[sessions] ADD  CONSTRAINT [DF_sessions_createdDate]  DEFAULT (getutcdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[signIn_logs] ADD  CONSTRAINT [DF_signIn_logs_LUID]  DEFAULT (newsequentialid()) FOR [LUID]
GO
ALTER TABLE [dbo].[signIn_logs] ADD  CONSTRAINT [DF_signIn_logs_date]  DEFAULT (getutcdate()) FOR [date]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_uuid]  DEFAULT (newsequentialid()) FOR [UUID]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_emailActivated]  DEFAULT ((0)) FOR [emailActivated]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_phoneNumberActivated]  DEFAULT ((0)) FOR [phoneNumberActivated]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_createdDate]  DEFAULT (getutcdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_deletedFlag]  DEFAULT ((0)) FOR [deletedFlag]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_RUID]  DEFAULT ((2)) FOR [RUID]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_MTUID]  DEFAULT ((1)) FOR [MTUID]
GO
ALTER TABLE [dbo].[categoryOfProperties]  WITH CHECK ADD  CONSTRAINT [FK_CategoryOfProperties_Categories] FOREIGN KEY([CUID])
REFERENCES [dbo].[categories] ([CUID])
GO
ALTER TABLE [dbo].[categoryOfProperties] CHECK CONSTRAINT [FK_CategoryOfProperties_Categories]
GO
ALTER TABLE [dbo].[categoryOfProperties]  WITH CHECK ADD  CONSTRAINT [FK_CategoryOfProperties_COPTypes] FOREIGN KEY([TUID])
REFERENCES [dbo].[COPTypes] ([TUID])
GO
ALTER TABLE [dbo].[categoryOfProperties] CHECK CONSTRAINT [FK_CategoryOfProperties_COPTypes]
GO
ALTER TABLE [dbo].[collaborators]  WITH CHECK ADD  CONSTRAINT [FK_collaborators_cRoles] FOREIGN KEY([RUID])
REFERENCES [dbo].[cRoles] ([RUID])
GO
ALTER TABLE [dbo].[collaborators] CHECK CONSTRAINT [FK_collaborators_cRoles]
GO
ALTER TABLE [dbo].[collaborators]  WITH CHECK ADD  CONSTRAINT [FK_collaborators_farms] FOREIGN KEY([FUID])
REFERENCES [dbo].[farms] ([FUID])
GO
ALTER TABLE [dbo].[collaborators] CHECK CONSTRAINT [FK_collaborators_farms]
GO
ALTER TABLE [dbo].[collaborators]  WITH CHECK ADD  CONSTRAINT [FK_collaborators_users] FOREIGN KEY([UUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[collaborators] CHECK CONSTRAINT [FK_collaborators_users]
GO
ALTER TABLE [dbo].[COPValues]  WITH CHECK ADD  CONSTRAINT [FK_COPValues_COPValues] FOREIGN KEY([PUID])
REFERENCES [dbo].[categoryOfProperties] ([PUID])
GO
ALTER TABLE [dbo].[COPValues] CHECK CONSTRAINT [FK_COPValues_COPValues]
GO
ALTER TABLE [dbo].[cRoles]  WITH CHECK ADD  CONSTRAINT [FK_cRoles_users] FOREIGN KEY([createdByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[cRoles] CHECK CONSTRAINT [FK_cRoles_users]
GO
ALTER TABLE [dbo].[cRoles]  WITH CHECK ADD  CONSTRAINT [FK_cRoles_users1] FOREIGN KEY([deletedByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[cRoles] CHECK CONSTRAINT [FK_cRoles_users1]
GO
ALTER TABLE [dbo].[entityCOPValues]  WITH CHECK ADD  CONSTRAINT [FK_EntityCOPValues_CategoryOfProperties1] FOREIGN KEY([PUID])
REFERENCES [dbo].[categoryOfProperties] ([PUID])
GO
ALTER TABLE [dbo].[entityCOPValues] CHECK CONSTRAINT [FK_EntityCOPValues_CategoryOfProperties1]
GO
ALTER TABLE [dbo].[entityCOPValues]  WITH CHECK ADD  CONSTRAINT [FK_EntityCOPValues_EntityOfFP] FOREIGN KEY([EUID])
REFERENCES [dbo].[entityOfFP] ([EUID])
GO
ALTER TABLE [dbo].[entityCOPValues] CHECK CONSTRAINT [FK_EntityCOPValues_EntityOfFP]
GO
ALTER TABLE [dbo].[entityDetail]  WITH CHECK ADD  CONSTRAINT [FK_entityDetail_EntityOfFP] FOREIGN KEY([EUID])
REFERENCES [dbo].[entityOfFP] ([EUID])
GO
ALTER TABLE [dbo].[entityDetail] CHECK CONSTRAINT [FK_entityDetail_EntityOfFP]
GO
ALTER TABLE [dbo].[entityDetail]  WITH CHECK ADD  CONSTRAINT [FK_entityDetail_users] FOREIGN KEY([deletedByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[entityDetail] CHECK CONSTRAINT [FK_entityDetail_users]
GO
ALTER TABLE [dbo].[entityOfFP]  WITH CHECK ADD  CONSTRAINT [FK_EntityOfFP_Categories] FOREIGN KEY([CUID])
REFERENCES [dbo].[categories] ([CUID])
GO
ALTER TABLE [dbo].[entityOfFP] CHECK CONSTRAINT [FK_EntityOfFP_Categories]
GO
ALTER TABLE [dbo].[entityOfFP]  WITH CHECK ADD  CONSTRAINT [FK_EntityOfFP_farmProperties] FOREIGN KEY([PUID])
REFERENCES [dbo].[farmProperties] ([PUID])
GO
ALTER TABLE [dbo].[entityOfFP] CHECK CONSTRAINT [FK_EntityOfFP_farmProperties]
GO
ALTER TABLE [dbo].[entityOfFP]  WITH CHECK ADD  CONSTRAINT [FK_EntityOfFP_users] FOREIGN KEY([deletedByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[entityOfFP] CHECK CONSTRAINT [FK_EntityOfFP_users]
GO
ALTER TABLE [dbo].[entityOfFP]  WITH CHECK ADD  CONSTRAINT [FK_EntityOfFP_users1] FOREIGN KEY([createdByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[entityOfFP] CHECK CONSTRAINT [FK_EntityOfFP_users1]
GO
ALTER TABLE [dbo].[entityOfFP]  WITH CHECK ADD  CONSTRAINT [FK_EntityOfFP_users2] FOREIGN KEY([soldByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[entityOfFP] CHECK CONSTRAINT [FK_EntityOfFP_users2]
GO
ALTER TABLE [dbo].[farmProperties]  WITH CHECK ADD  CONSTRAINT [FK_farmProperties_farmPropertyType] FOREIGN KEY([TUID])
REFERENCES [dbo].[farmPropertyType] ([TUID])
GO
ALTER TABLE [dbo].[farmProperties] CHECK CONSTRAINT [FK_farmProperties_farmPropertyType]
GO
ALTER TABLE [dbo].[farmProperties]  WITH CHECK ADD  CONSTRAINT [FK_farmProperties_farms] FOREIGN KEY([FUID])
REFERENCES [dbo].[farms] ([FUID])
GO
ALTER TABLE [dbo].[farmProperties] CHECK CONSTRAINT [FK_farmProperties_farms]
GO
ALTER TABLE [dbo].[farmProperties]  WITH CHECK ADD  CONSTRAINT [FK_farmProperties_users] FOREIGN KEY([deletedByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[farmProperties] CHECK CONSTRAINT [FK_farmProperties_users]
GO
ALTER TABLE [dbo].[farmProperties]  WITH CHECK ADD  CONSTRAINT [FK_farmProperties_users1] FOREIGN KEY([createdByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[farmProperties] CHECK CONSTRAINT [FK_farmProperties_users1]
GO
ALTER TABLE [dbo].[farms]  WITH CHECK ADD  CONSTRAINT [FK_farms_users] FOREIGN KEY([createdByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[farms] CHECK CONSTRAINT [FK_farms_users]
GO
ALTER TABLE [dbo].[farms]  WITH CHECK ADD  CONSTRAINT [FK_farms_users1] FOREIGN KEY([deletedByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[farms] CHECK CONSTRAINT [FK_farms_users1]
GO
ALTER TABLE [dbo].[generatedUCodes]  WITH CHECK ADD  CONSTRAINT [FK_generatedUCodes_codeType] FOREIGN KEY([CTUID])
REFERENCES [dbo].[codeType] ([CTUID])
GO
ALTER TABLE [dbo].[generatedUCodes] CHECK CONSTRAINT [FK_generatedUCodes_codeType]
GO
ALTER TABLE [dbo].[generatedUCodes]  WITH CHECK ADD  CONSTRAINT [FK_generatedUCodes_users] FOREIGN KEY([forUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[generatedUCodes] CHECK CONSTRAINT [FK_generatedUCodes_users]
GO
ALTER TABLE [dbo].[incomeAndExpeneses]  WITH CHECK ADD  CONSTRAINT [FK_incomeAndExpeneses_farms] FOREIGN KEY([FUID])
REFERENCES [dbo].[farms] ([FUID])
GO
ALTER TABLE [dbo].[incomeAndExpeneses] CHECK CONSTRAINT [FK_incomeAndExpeneses_farms]
GO
ALTER TABLE [dbo].[incomeAndExpeneses]  WITH CHECK ADD  CONSTRAINT [FK_incomeAndExpeneses_users] FOREIGN KEY([deletedByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[incomeAndExpeneses] CHECK CONSTRAINT [FK_incomeAndExpeneses_users]
GO
ALTER TABLE [dbo].[roles]  WITH CHECK ADD  CONSTRAINT [FK_roles_users] FOREIGN KEY([createdByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[roles] CHECK CONSTRAINT [FK_roles_users]
GO
ALTER TABLE [dbo].[sessions]  WITH CHECK ADD  CONSTRAINT [FK_sessions_users] FOREIGN KEY([UUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[sessions] CHECK CONSTRAINT [FK_sessions_users]
GO
ALTER TABLE [dbo].[signIn_logs]  WITH CHECK ADD  CONSTRAINT [FK_signIn_logs_users] FOREIGN KEY([UUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[signIn_logs] CHECK CONSTRAINT [FK_signIn_logs_users]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_memberType] FOREIGN KEY([MTUID])
REFERENCES [dbo].[memberType] ([MTUID])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_memberType]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_roles] FOREIGN KEY([RUID])
REFERENCES [dbo].[roles] ([RUID])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_roles]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_UUID_deletedByUUID] FOREIGN KEY([deletedByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_UUID_deletedByUUID]
GO
/****** Object:  StoredProcedure [dbo].[denem]    Script Date: 10/30/2020 12:15:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[denem]
as
begin
set nocount on
declare @GUC uniqueidentifier = (select top(1) GUC from generatedUCodes)
select @GUC as GUC
end
GO
/****** Object:  StoredProcedure [dbo].[InsertSession]    Script Date: 10/30/2020 12:15:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertSession]
@UUID uniqueidentifier
AS
BEGIN
	INSERT INTO sessions(UUID)
	OUTPUT inserted.*
	VALUES(@UUID)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertUCodeForSignUp]    Script Date: 10/30/2020 12:15:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertUCodeForSignUp]
@IP varchar(15)
AS
BEGIN
	DECLARE @CTUID int = 4
	DECLARE @CountUCodesCreatedForSignUpLast5MinWithIP int
	SELECT @CountUCodesCreatedForSignUpLast5MinWithIP = COUNT(*) FROM generatedUCodes WHERE forIP = @IP AND CTUID = @CTUID AND DATEDIFF(SECOND, createdDate, GETUTCDATE()) < 300
	IF( @CountUCodesCreatedForSignUpLast5MinWithIP < 5)
	BEGIN
		INSERT INTO generatedUCodes(forIP, CTUID, expirationDate)
		OUTPUT inserted.*
		VALUES(@IP, @CTUID, DATEADD(MINUTE, 5, GETUTCDATE()))
	END
	ELSE
	BEGIN
		SELECT TOP(0) * FROM generatedUCodes
	END
END 
GO
/****** Object:  StoredProcedure [dbo].[InsertUser]    Script Date: 10/30/2020 12:15:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertUser]
@USERNAME varchar(50),
@PASSWORD char(24),
@EMAIL nvarchar(50),
@NAME nvarchar(50),
@SURNAME nvarchar(50),
@GUC uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON
	IF(
		NOT EXISTS(SELECT username FROM users WHERE username = @USERNAME) AND
		NOT EXISTS(SELECT email FROM users WHERE email = @EMAIL) AND
		EXISTS(SELECT TOP(1) GUC FROM generatedUCodes WHERE GUC = @GUC AND isValid = 1 AND DATEDIFF(SECOND, GETUTCDATE(), expirationDate) > 0)
	)
	BEGIN
		BEGIN TRY
			BEGIN TRAN InsertUser
				--temp table for getting uniqueidentifiers 
				DECLARE @temp TABLE(UID uniqueidentifier)
				--Insert user
				INSERT 
				INTO users(username, password, email, name, surname)
				OUTPUT inserted.UUID
				INTO @temp
				VALUES(@USERNAME, @PASSWORD, @EMAIL, @NAME, @SURNAME)
				--Get user's UUID
				DECLARE @UUID uniqueidentifier = (SELECT UID FROM @temp)
				DELETE @temp --clear temp table 
				--Create email activation code
				DECLARE @CTUID int = 3 --EMAIL TYPE ID
				DECLARE @EXPIRATION_DATE datetime = DATEADD(DAY, 7, GETUTCDATE())
				INSERT INTO generatedUCodes(forUUID, expirationDate, CTUID)
				OUTPUT inserted.*
				VALUES (@UUID, @EXPIRATION_DATE, @CTUID)
				UPDATE generatedUCodes SET isValid = 0 WHERE GUC = @GUC
			COMMIT TRAN InsertUser
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN InsertUser
		END CATCH
	END
	ELSE
	BEGIN
		SELECT TOP 0 * FROM generatedUCodes
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SelectFailedSignInRequestsInTheLast5MinFromUUID]    Script Date: 10/30/2020 12:15:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectFailedSignInRequestsInTheLast5MinFromUUID]
@UUID uniqueidentifier
AS
BEGIN
	SELECT * FROM signIn_logs WHERE UUID = @UUID AND attemptedResult = 0 AND DATEDIFF(SECOND, date, GETUTCDATE()) < 300
END 
GO
/****** Object:  StoredProcedure [dbo].[SelectPropertiesOfTheCategory]    Script Date: 10/30/2020 12:15:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectPropertiesOfTheCategory]
@CUID int
AS
BEGIN

	DECLARE @TOP_CATEGORY_IDS table(id int, iter bit)
	DECLARE @CURRENT_ID int = @CUID;
	INSERT INTO  @TOP_CATEGORY_IDS VALUES (@CURRENT_ID, 0)
	WHILE @CURRENT_ID != 0
	BEGIN
		SELECT @CURRENT_ID = subCategoryOfCUID FROM Categories WHERE CUID = @CURRENT_ID
		INSERT INTO  @TOP_CATEGORY_IDS VALUES (@CURRENT_ID, 0)
	END

	DECLARE @PROPERTIES table (PUID int, name nvarchar(50), TUID int, CUID int)
	SELECT TOP(1) @CURRENT_ID = id FROM @TOP_CATEGORY_IDS WHERE iter = 0
	WHILE @CURRENT_ID != 0
	BEGIN
		INSERT INTO @PROPERTIES
		SELECT P.* FROM Categories AS C 
		INNER JOIN CategoryOfProperties AS P ON C.CUID = P.CUID
		WHERE C.CUID = @CURRENT_ID 

		UPDATE @TOP_CATEGORY_IDS SET iter = 1 WHERE id = @CURRENT_ID
		SELECT TOP(1) @CURRENT_ID = id FROM @TOP_CATEGORY_IDS WHERE iter = 0
	END

	SELECT * FROM @PROPERTIES

END
GO
/****** Object:  StoredProcedure [dbo].[SelectUserFromSignInKey]    Script Date: 10/30/2020 12:15:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectUserFromSignInKey]
@SignInKey nvarchar(255)
AS
BEGIN
		SELECT TOP(1) * FROM users 
		WHERE (username = @SignInKey OR email = @SignInKey ) AND deletedFlag = 0 
END
GO
USE [master]
GO
ALTER DATABASE [farmTracker] SET  READ_WRITE 
GO
