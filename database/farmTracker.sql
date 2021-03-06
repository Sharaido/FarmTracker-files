USE [master]
GO
/****** Object:  Database [farmTracker]    Script Date: 1/17/2021 11:00:53 AM ******/
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
/****** Object:  Table [dbo].[addCOPValues]    Script Date: 1/17/2021 11:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[addCOPValues](
	[AUID] [uniqueidentifier] NOT NULL,
	[PUID] [int] NOT NULL,
	[value] [nvarchar](max) NULL,
 CONSTRAINT [PK_addCOPValues] PRIMARY KEY CLUSTERED 
(
	[AUID] ASC,
	[PUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Adds]    Script Date: 1/17/2021 11:00:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adds](
	[AUID] [uniqueidentifier] NOT NULL,
	[CUID] [int] NULL,
	[name] [nvarchar](255) NULL,
	[description] [nvarchar](max) NULL,
	[price] [money] NULL,
	[discount] [int] NULL,
	[createdByUUID] [uniqueidentifier] NULL,
	[createdDate] [datetime] NULL,
	[confirmedFlag] [bit] NOT NULL,
	[confirmedByUUID] [uniqueidentifier] NULL,
	[publishedFlag] [bit] NOT NULL,
	[publishedDate] [datetime] NULL,
	[deletedFlag] [bit] NOT NULL,
	[deletedDate] [datetime] NULL,
	[deletedByUUID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Adds] PRIMARY KEY CLUSTERED 
(
	[AUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 1/17/2021 11:00:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[CUID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[pic] [nvarchar](max) NULL,
	[endPointFlag] [bit] NULL,
	[subCategoryOfCUID] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoryOfProperties]    Script Date: 1/17/2021 11:00:55 AM ******/
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
/****** Object:  Table [dbo].[codeType]    Script Date: 1/17/2021 11:00:55 AM ******/
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
/****** Object:  Table [dbo].[collaborators]    Script Date: 1/17/2021 11:00:55 AM ******/
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
/****** Object:  Table [dbo].[COPTypes]    Script Date: 1/17/2021 11:00:55 AM ******/
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
/****** Object:  Table [dbo].[COPValues]    Script Date: 1/17/2021 11:00:55 AM ******/
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
/****** Object:  Table [dbo].[cRoles]    Script Date: 1/17/2021 11:00:55 AM ******/
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
	[deletedFlag] [bit] NOT NULL,
	[deletedDate] [datetime] NULL,
	[deletedByUUID] [uniqueidentifier] NULL,
	[can_create_property] [bit] NULL,
 CONSTRAINT [PK_cRoles] PRIMARY KEY CLUSTERED 
(
	[RUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[entityCOPValues]    Script Date: 1/17/2021 11:00:55 AM ******/
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
/****** Object:  Table [dbo].[entityDetails]    Script Date: 1/17/2021 11:00:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entityDetails](
	[DUID] [uniqueidentifier] NOT NULL,
	[EUID] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[cost] [money] NULL,
	[remainderDate] [datetime] NULL,
	[remainderCompletedFlag] [bit] NULL,
	[remainderCompletedDate] [datetime] NULL,
	[remainderCompletedByUUID] [uniqueidentifier] NULL,
	[createdDate] [datetime] NULL,
	[createdByUUID] [uniqueidentifier] NOT NULL,
	[deletedFlag] [bit] NOT NULL,
	[deletedDate] [datetime] NULL,
	[deletedByUUID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_entityDetail] PRIMARY KEY CLUSTERED 
(
	[DUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[entityOfFP]    Script Date: 1/17/2021 11:00:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entityOfFP](
	[EUID] [uniqueidentifier] NOT NULL,
	[CUID] [int] NOT NULL,
	[PUID] [uniqueidentifier] NOT NULL,
	[ID] [nvarchar](50) NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[count] [int] NULL,
	[purchasedDate] [datetime] NULL,
	[cost] [money] NULL,
	[soldFlag] [bit] NOT NULL,
	[soldDate] [datetime] NULL,
	[soldPrice] [money] NULL,
	[soldDetail] [nvarchar](max) NULL,
	[soldByUUID] [uniqueidentifier] NULL,
	[createdDate] [datetime] NULL,
	[createdByUUID] [uniqueidentifier] NOT NULL,
	[deletedFlag] [bit] NOT NULL,
	[deletedDate] [datetime] NULL,
	[deletedByUUID] [uniqueidentifier] NULL,
	[lastModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_EntityOfFP] PRIMARY KEY CLUSTERED 
(
	[EUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[farmEntities]    Script Date: 1/17/2021 11:00:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[farmEntities](
	[EUID] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](50) NULL,
	[CUID] [int] NULL,
	[FUID] [uniqueidentifier] NULL,
	[count] [int] NULL,
	[createdByUUID] [uniqueidentifier] NULL,
	[createdDate] [datetime] NULL,
	[deletedFlag] [bit] NOT NULL,
	[deletedDate] [datetime] NULL,
	[deletedByUUID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_farmEntities] PRIMARY KEY CLUSTERED 
(
	[EUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[farmProperties]    Script Date: 1/17/2021 11:00:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[farmProperties](
	[PUID] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[CUID] [int] NOT NULL,
	[FUID] [uniqueidentifier] NOT NULL,
	[createdByUUID] [uniqueidentifier] NOT NULL,
	[createdDate] [datetime] NULL,
	[deletedFlag] [bit] NOT NULL,
	[deletedDate] [datetime] NULL,
	[deletedByUUID] [uniqueidentifier] NULL,
	[lastModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_farmProperties] PRIMARY KEY CLUSTERED 
(
	[PUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[farms]    Script Date: 1/17/2021 11:00:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[farms](
	[FUID] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[location] [nchar](50) NULL,
	[createdByUUID] [uniqueidentifier] NOT NULL,
	[createdDate] [datetime] NULL,
	[deletedFlag] [bit] NOT NULL,
	[deletedDate] [datetime] NULL,
	[deletedByUUID] [uniqueidentifier] NULL,
	[lastModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_farms] PRIMARY KEY CLUSTERED 
(
	[FUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[generatedUCodes]    Script Date: 1/17/2021 11:00:55 AM ******/
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
/****** Object:  Table [dbo].[incomeAndExpeneses]    Script Date: 1/17/2021 11:00:55 AM ******/
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
	[description] [nvarchar](max) NULL,
	[cost] [money] NOT NULL,
	[createdDate] [datetime] NULL,
	[createdByUUID] [uniqueidentifier] NULL,
	[deletedFlag] [bit] NOT NULL,
	[deletedDate] [datetime] NULL,
	[deletedByUUID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_incomeAndExpeneses] PRIMARY KEY CLUSTERED 
(
	[IEUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[memberType]    Script Date: 1/17/2021 11:00:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[memberType](
	[MTUID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](16) NULL,
	[farmLimit] [int] NULL,
	[propertyLimit] [int] NULL,
	[entityLimit] [int] NULL,
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
/****** Object:  Table [dbo].[Pictures]    Script Date: 1/17/2021 11:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pictures](
	[PUID] [uniqueidentifier] NOT NULL,
	[address] [nvarchar](max) NULL,
	[AUID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Pictures] PRIMARY KEY CLUSTERED 
(
	[PUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[propertyDetail]    Script Date: 1/17/2021 11:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[propertyDetail](
	[DUID] [uniqueidentifier] NOT NULL,
	[PUID] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[cost] [money] NULL,
	[remainderDate] [datetime] NULL,
	[remainderCompletedFlag] [bit] NULL,
	[remainderCompletedDate] [datetime] NULL,
	[remainderCompletedByUUID] [uniqueidentifier] NULL,
	[createdDate] [datetime] NULL,
	[createdByUUID] [uniqueidentifier] NOT NULL,
	[deletedFlag] [bit] NOT NULL,
	[deletedDate] [datetime] NULL,
	[deletedByUUID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_propertyDetail] PRIMARY KEY CLUSTERED 
(
	[DUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 1/17/2021 11:00:56 AM ******/
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
/****** Object:  Table [dbo].[sessions]    Script Date: 1/17/2021 11:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sessions](
	[SUID] [uniqueidentifier] NOT NULL,
	[UUID] [uniqueidentifier] NOT NULL,
	[isValid] [bit] NOT NULL,
	[createdDate] [datetime] NULL,
	[lastUsedDate] [datetime] NULL,
 CONSTRAINT [PK_sessions] PRIMARY KEY CLUSTERED 
(
	[SUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[signIn_logs]    Script Date: 1/17/2021 11:00:56 AM ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 1/17/2021 11:00:56 AM ******/
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
	[deletedFlag] [bit] NOT NULL,
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
INSERT [dbo].[addCOPValues] ([AUID], [PUID], [value]) VALUES (N'429a329a-2f48-eb11-a4ea-201a06a548bb', 2, N'20')
INSERT [dbo].[addCOPValues] ([AUID], [PUID], [value]) VALUES (N'429a329a-2f48-eb11-a4ea-201a06a548bb', 3, N'Healty')
INSERT [dbo].[addCOPValues] ([AUID], [PUID], [value]) VALUES (N'429a329a-2f48-eb11-a4ea-201a06a548bb', 5, N'on')
INSERT [dbo].[addCOPValues] ([AUID], [PUID], [value]) VALUES (N'1f5a9b0c-3048-eb11-a4ea-201a06a548bb', 1, N'13')
INSERT [dbo].[addCOPValues] ([AUID], [PUID], [value]) VALUES (N'1f5a9b0c-3048-eb11-a4ea-201a06a548bb', 3, N'Healty')
INSERT [dbo].[addCOPValues] ([AUID], [PUID], [value]) VALUES (N'895d9f22-3148-eb11-a4ea-201a06a548bb', 2, N'16')
INSERT [dbo].[addCOPValues] ([AUID], [PUID], [value]) VALUES (N'895d9f22-3148-eb11-a4ea-201a06a548bb', 3, N'Healty')
INSERT [dbo].[addCOPValues] ([AUID], [PUID], [value]) VALUES (N'2f2b4ed6-3148-eb11-a4ea-201a06a548bb', 2, N'13')
INSERT [dbo].[addCOPValues] ([AUID], [PUID], [value]) VALUES (N'2f2b4ed6-3148-eb11-a4ea-201a06a548bb', 3, N'Healty')
INSERT [dbo].[addCOPValues] ([AUID], [PUID], [value]) VALUES (N'ca55c52c-3248-eb11-a4ea-201a06a548bb', 2, N'10')
INSERT [dbo].[addCOPValues] ([AUID], [PUID], [value]) VALUES (N'ca55c52c-3248-eb11-a4ea-201a06a548bb', 3, N'Healty')
INSERT [dbo].[Adds] ([AUID], [CUID], [name], [description], [price], [discount], [createdByUUID], [createdDate], [confirmedFlag], [confirmedByUUID], [publishedFlag], [publishedDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'429a329a-2f48-eb11-a4ea-201a06a548bb', 8, N'Blue Dophine', N'Blue Dophine', 200.0000, NULL, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-12-27T10:38:06.260' AS DateTime), 0, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[Adds] ([AUID], [CUID], [name], [description], [price], [discount], [createdByUUID], [createdDate], [confirmedFlag], [confirmedByUUID], [publishedFlag], [publishedDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'1f5a9b0c-3048-eb11-a4ea-201a06a548bb', 9, N'Electric Yellow', N'Electric Yellow', 100.0000, NULL, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-12-27T10:41:18.203' AS DateTime), 0, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[Adds] ([AUID], [CUID], [name], [description], [price], [discount], [createdByUUID], [createdDate], [confirmedFlag], [confirmedByUUID], [publishedFlag], [publishedDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'895d9f22-3148-eb11-a4ea-201a06a548bb', 33, N'Leopard Stingray', N'Leopard Stingray', 105.0000, NULL, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-12-27T10:49:04.637' AS DateTime), 0, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[Adds] ([AUID], [CUID], [name], [description], [price], [discount], [createdByUUID], [createdDate], [confirmedFlag], [confirmedByUUID], [publishedFlag], [publishedDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'2f2b4ed6-3148-eb11-a4ea-201a06a548bb', 31, N'Green Terror', N'Green Terror', 150.0000, NULL, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-12-27T10:54:06.097' AS DateTime), 0, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[Adds] ([AUID], [CUID], [name], [description], [price], [discount], [createdByUUID], [createdDate], [confirmedFlag], [confirmedByUUID], [publishedFlag], [publishedDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'ca55c52c-3248-eb11-a4ea-201a06a548bb', 34, N'Albino Stingray', N'Albino Stingray', 50.0000, NULL, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-12-27T10:56:31.160' AS DateTime), 0, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[Adds] ([AUID], [CUID], [name], [description], [price], [discount], [createdByUUID], [createdDate], [confirmedFlag], [confirmedByUUID], [publishedFlag], [publishedDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'0587c461-3248-eb11-a4ea-201a06a548bb', 24, N'Tetra Discus', N'Fish food', 170.0000, NULL, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-12-27T10:58:00.073' AS DateTime), 0, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[Adds] ([AUID], [CUID], [name], [description], [price], [discount], [createdByUUID], [createdDate], [confirmedFlag], [confirmedByUUID], [publishedFlag], [publishedDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'3c3913ea-3248-eb11-a4ea-201a06a548bb', 26, N'Aquarium Airpump', N'Aquarium Airpump', 100.0000, NULL, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-12-27T11:01:48.760' AS DateTime), 0, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[Adds] ([AUID], [CUID], [name], [description], [price], [discount], [createdByUUID], [createdDate], [confirmedFlag], [confirmedByUUID], [publishedFlag], [publishedDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'97a3fffc-5e48-eb11-a4ea-201a06a548bb', 29, N'Aquarium', N'120x60x45 Aquarium', 1000.5000, NULL, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-12-27T16:17:18.363' AS DateTime), 0, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[Adds] ([AUID], [CUID], [name], [description], [price], [discount], [createdByUUID], [createdDate], [confirmedFlag], [confirmedByUUID], [publishedFlag], [publishedDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'05956e16-7b4e-eb11-a4f1-201a06a548bb', 26, N'asdasd', NULL, 123.0000, NULL, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-04T10:53:33.920' AS DateTime), 0, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[Adds] ([AUID], [CUID], [name], [description], [price], [discount], [createdByUUID], [createdDate], [confirmedFlag], [confirmedByUUID], [publishedFlag], [publishedDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'5c0f6690-2357-eb11-a500-201a06a548bb', 27, N'Filter', NULL, 100.0000, NULL, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-15T11:19:43.300' AS DateTime), 0, NULL, 0, NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (1, N'Plant', N'plant1.jpg', 0, 3)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (2, N'Anilmal', N'animal1.jpg', 0, 3)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (3, N'Alive', NULL, 0, 30)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (4, N'Fish', N'fish.jpg', 0, 37)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (5, N'Freshwater', NULL, 0, 4)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (6, N'Saltwater', N'saltwater.jpg', 1, 4)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (7, N'Cichlids', NULL, 0, 5)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (8, N'Blue Dolphin', N'blue_dolphin.jpg', 1, 7)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (9, N'Electric Yellow', N'yellow.jpg', 1, 7)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (10, N'Livebearers', N'guppy.jpg', 0, 5)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (11, N'Guppy', N'guppy.jpg', 1, 10)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (12, N'Tree', NULL, 0, 40)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (13, N'Moss', NULL, 0, 39)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (14, N'Amblystegium serpens (Nano Moss)', NULL, 1, 13)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (15, N'Cladophora aegagrophilla (Moss Ball)', NULL, 1, 13)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (16, N'Drepanocladus aduncus (Stringy Moss)', NULL, 1, 13)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (17, N'Flowering', NULL, 0, 39)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (18, N'Blyxa aubertii', NULL, 1, 17)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (19, N'Cryptocoryne albida', NULL, 1, 17)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (20, N'Products', NULL, 0, 30)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (21, N'Food', NULL, 0, 20)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (22, N'Fish', NULL, 0, 21)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (23, N'Other', NULL, 1, 20)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (24, N'Tetra Discus', NULL, 1, 22)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (25, N'Tetra Pro Algea', NULL, 1, 22)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (26, N'Airpump', NULL, 1, 20)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (27, N'Internal Filter', NULL, 1, 20)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (28, N'External Filter', NULL, 1, 20)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (29, N'Aquarium', NULL, 1, 20)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (30, N'All', N'oops2.png', 0, NULL)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (31, N'Green Terror', NULL, 1, 7)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (32, N'Stingray', NULL, 0, 5)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (33, N'Leopard Stingray', NULL, 1, 32)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (34, N'Dwarf Stingray', NULL, 1, 32)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (35, N'Poultry', N'animal1.jpg', 0, 38)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (36, N'Ranch Animals', NULL, 0, 38)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (37, N'Aquatic', N'animal_property2.jpg', 0, 2)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (38, N'Terrestrial', N'animal_property1.jpg', 0, 2)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (39, N'Aquatic', N'plant_property2.jpg', 0, 1)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (40, N'Terrestrial', N'plant_property1.jpg', 0, 1)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (41, N'Sheep And Goats', N'animal4.jpg', 1, 36)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (42, N'Cattle', N'animal5.jpg', 1, 36)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (43, N'Chicken', NULL, 1, 35)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (44, N'Rooster', NULL, 1, 35)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (45, N'Turkey', N'turkey.jpg', 1, 35)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (46, N'Grape', N'grape.png', 1, 40)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (47, N'Apple', N'plant3.jpg', 1, 12)
INSERT [dbo].[categories] ([CUID], [name], [pic], [endPointFlag], [subCategoryOfCUID]) VALUES (48, N'Orange', N'plant2.jpg', 1, 12)
SET IDENTITY_INSERT [dbo].[categories] OFF
SET IDENTITY_INSERT [dbo].[categoryOfProperties] ON 

INSERT [dbo].[categoryOfProperties] ([PUID], [name], [TUID], [CUID]) VALUES (1, N'Weight', 2, 2)
INSERT [dbo].[categoryOfProperties] ([PUID], [name], [TUID], [CUID]) VALUES (2, N'Height', 2, 3)
INSERT [dbo].[categoryOfProperties] ([PUID], [name], [TUID], [CUID]) VALUES (3, N'Health', 4, 3)
INSERT [dbo].[categoryOfProperties] ([PUID], [name], [TUID], [CUID]) VALUES (4, N'Birth Date', 5, 3)
INSERT [dbo].[categoryOfProperties] ([PUID], [name], [TUID], [CUID]) VALUES (5, N'Stud', 3, 2)
SET IDENTITY_INSERT [dbo].[categoryOfProperties] OFF
SET IDENTITY_INSERT [dbo].[codeType] ON 

INSERT [dbo].[codeType] ([CTUID], [type]) VALUES (3, N'eMail')
INSERT [dbo].[codeType] ([CTUID], [type]) VALUES (1, N'forgotten')
INSERT [dbo].[codeType] ([CTUID], [type]) VALUES (5, N'other')
INSERT [dbo].[codeType] ([CTUID], [type]) VALUES (2, N'phoneNumber')
INSERT [dbo].[codeType] ([CTUID], [type]) VALUES (4, N'signUp')
SET IDENTITY_INSERT [dbo].[codeType] OFF
INSERT [dbo].[collaborators] ([FUID], [UUID], [RUID]) VALUES (N'1faf872b-672d-eb11-a4c5-201a06a548bb', N'70f13c78-e515-eb11-a495-201a06a548bb', N'2b572f9d-651b-eb11-a49c-201a06a548bb')
INSERT [dbo].[collaborators] ([FUID], [UUID], [RUID]) VALUES (N'1faf872b-672d-eb11-a4c5-201a06a548bb', N'b4a3b867-a81e-eb11-a4a2-201a06a548bb', N'2b572f9d-651b-eb11-a49c-201a06a548bb')
INSERT [dbo].[collaborators] ([FUID], [UUID], [RUID]) VALUES (N'230a850b-4258-eb11-a506-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', N'2b572f9d-651b-eb11-a49c-201a06a548bb')
SET IDENTITY_INSERT [dbo].[COPTypes] ON 

INSERT [dbo].[COPTypes] ([TUID], [name]) VALUES (3, N'bool')
INSERT [dbo].[COPTypes] ([TUID], [name]) VALUES (5, N'date')
INSERT [dbo].[COPTypes] ([TUID], [name]) VALUES (2, N'int')
INSERT [dbo].[COPTypes] ([TUID], [name]) VALUES (4, N'select')
INSERT [dbo].[COPTypes] ([TUID], [name]) VALUES (1, N'string')
SET IDENTITY_INSERT [dbo].[COPTypes] OFF
INSERT [dbo].[COPValues] ([value], [PUID]) VALUES (N'Dead', 3)
INSERT [dbo].[COPValues] ([value], [PUID]) VALUES (N'Diseased', 3)
INSERT [dbo].[COPValues] ([value], [PUID]) VALUES (N'Healty', 3)
INSERT [dbo].[cRoles] ([RUID], [createdByUUID], [name], [basicRoleFlag], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [can_create_property]) VALUES (N'2b572f9d-651b-eb11-a49c-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', N'Manager', 1, CAST(N'2020-10-31T10:41:21.770' AS DateTime), 0, NULL, NULL, 1)
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'b67478fa-672d-eb11-a4c5-201a06a548bb', 2, N'23')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'b67478fa-672d-eb11-a4c5-201a06a548bb', 3, N'Healty')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'b67478fa-672d-eb11-a4c5-201a06a548bb', 4, N'2015-01-01')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'09291a91-682d-eb11-a4c5-201a06a548bb', 3, N'Healty')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'09291a91-682d-eb11-a4c5-201a06a548bb', 4, N'2020-11-08')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'7718fccb-682d-eb11-a4c5-201a06a548bb', 2, N'22')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'7718fccb-682d-eb11-a4c5-201a06a548bb', 3, N'Diseased')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'7718fccb-682d-eb11-a4c5-201a06a548bb', 4, N'2015-01-01')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'ea32f5f5-682d-eb11-a4c5-201a06a548bb', 2, N'20')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'ea32f5f5-682d-eb11-a4c5-201a06a548bb', 3, N'Healty')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'ea32f5f5-682d-eb11-a4c5-201a06a548bb', 4, N'2015-01-01')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'730c1417-692d-eb11-a4c5-201a06a548bb', 1, N'10')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'730c1417-692d-eb11-a4c5-201a06a548bb', 2, N'17')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'730c1417-692d-eb11-a4c5-201a06a548bb', 3, N'Healty')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'730c1417-692d-eb11-a4c5-201a06a548bb', 4, N'2015-01-01')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'730c1417-692d-eb11-a4c5-201a06a548bb', 5, N'on')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'4b6ce837-692d-eb11-a4c5-201a06a548bb', 2, N'16')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'4b6ce837-692d-eb11-a4c5-201a06a548bb', 3, N'Healty')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'4b6ce837-692d-eb11-a4c5-201a06a548bb', 4, N'2014-02-01')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'4b6ce837-692d-eb11-a4c5-201a06a548bb', 5, N'off')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'0e5aef53-692d-eb11-a4c5-201a06a548bb', 2, N'17')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'0e5aef53-692d-eb11-a4c5-201a06a548bb', 3, N'Healty')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'0e5aef53-692d-eb11-a4c5-201a06a548bb', 4, N'2015-01-01')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'0e5aef53-692d-eb11-a4c5-201a06a548bb', 5, N'off')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'2819d084-692d-eb11-a4c5-201a06a548bb', 2, N'15')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'2819d084-692d-eb11-a4c5-201a06a548bb', 3, N'Healty')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'2819d084-692d-eb11-a4c5-201a06a548bb', 4, N'2017-06-14')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'2819d084-692d-eb11-a4c5-201a06a548bb', 5, N'off')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'a2b8d6b1-db4d-eb11-a4f0-201a06a548bb', 2, N'3')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'a2b8d6b1-db4d-eb11-a4f0-201a06a548bb', 5, N'on')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'3c7a3840-4258-eb11-a506-201a06a548bb', 3, N'Healty')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'3c7a3840-4258-eb11-a506-201a06a548bb', 5, N'on')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'31d810b0-4358-eb11-a506-201a06a548bb', 5, N'on')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'78a7c6e7-4458-eb11-a506-201a06a548bb', 4, N'2021-01-01')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'a5923561-4658-eb11-a506-201a06a548bb', 3, N'Healty')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'bb76875d-4858-eb11-a506-201a06a548bb', 2, N'12')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'bb76875d-4858-eb11-a506-201a06a548bb', 3, N'Healty')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'bb76875d-4858-eb11-a506-201a06a548bb', 5, N'on')
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'dcf57e70-d837-eb11-a4d4-201a06a548bb', N'730c1417-692d-eb11-a4c5-201a06a548bb', N'Pregnant', N'Give birth', NULL, CAST(N'2020-12-20T20:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-12-06T15:33:51.473' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'bbf32c7f-d837-eb11-a4d4-201a06a548bb', N'730c1417-692d-eb11-a4c5-201a06a548bb', N'Pregnant', N'Give birth', NULL, CAST(N'2020-11-15T20:00:00.000' AS DateTime), 1, CAST(N'2020-11-15T21:00:00.000' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-12-06T15:32:00.103' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'dcaa82ee-d837-eb11-a4d4-201a06a548bb', N'730c1417-692d-eb11-a4c5-201a06a548bb', N'Birth', N'100 Babies', NULL, NULL, NULL, NULL, NULL, CAST(N'2020-12-06T15:33:00.103' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'0375e6c1-ec37-eb11-a4d4-201a06a548bb', N'0e5aef53-692d-eb11-a4c5-201a06a548bb', N'Patient', N'Methylene blue is purchased', 30.0000, NULL, NULL, NULL, NULL, CAST(N'2020-12-06T17:59:17.983' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'49eb93e4-8238-eb11-a4d5-201a06a548bb', N'730c1417-692d-eb11-a4c5-201a06a548bb', N'test123', N'desc', 20.0000, NULL, NULL, NULL, NULL, CAST(N'2020-12-07T11:54:00.670' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-16T09:26:06.247' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'e9214303-8338-eb11-a4d5-201a06a548bb', N'730c1417-692d-eb11-a4c5-201a06a548bb', N'tets', N'desc', NULL, CAST(N'2020-12-16T14:56:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-12-07T11:54:52.150' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-16T09:26:03.680' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'3aeb3f80-8338-eb11-a4d5-201a06a548bb', N'730c1417-692d-eb11-a4c5-201a06a548bb', N'dsa', NULL, 20.0000, NULL, NULL, NULL, NULL, CAST(N'2020-12-07T11:58:21.847' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-16T09:26:01.143' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'8769d1b1-8338-eb11-a4d5-201a06a548bb', N'730c1417-692d-eb11-a4c5-201a06a548bb', N'test2', NULL, 123.0000, NULL, NULL, NULL, NULL, CAST(N'2020-12-07T11:59:45.007' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-16T09:25:58.733' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'fd3b19e2-8338-eb11-a4d5-201a06a548bb', N'730c1417-692d-eb11-a4c5-201a06a548bb', N'fasd', N'asd', 10.0000, NULL, NULL, NULL, NULL, CAST(N'2020-12-07T12:01:06.010' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-16T09:25:56.840' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'124cc100-8438-eb11-a4d5-201a06a548bb', N'730c1417-692d-eb11-a4c5-201a06a548bb', N'test2', N'32', 32.0000, NULL, NULL, NULL, NULL, CAST(N'2020-12-07T12:01:57.440' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-16T09:25:54.967' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'd99c48cb-af42-eb11-a4e3-201a06a548bb', N'd89c48cb-af42-eb11-a4e3-201a06a548bb', N'test', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-12-20T10:40:46.343' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-12-20T10:41:32.087' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'11f885d6-af42-eb11-a4e3-201a06a548bb', N'd89c48cb-af42-eb11-a4e3-201a06a548bb', N'test2', NULL, 12.0000, NULL, NULL, NULL, NULL, CAST(N'2020-12-20T10:40:56.073' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-12-20T10:41:32.087' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'f7ffae75-cb42-eb11-a4e3-201a06a548bb', N'730c1417-692d-eb11-a4c5-201a06a548bb', N'test', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-12-20T13:58:39.510' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-16T09:25:30.277' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'77457691-cc42-eb11-a4e3-201a06a548bb', N'7718fccb-682d-eb11-a4c5-201a06a548bb', N'test', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-12-20T14:06:35.613' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'a8a293ce-0943-eb11-a4e3-201a06a548bb', N'7718fccb-682d-eb11-a4c5-201a06a548bb', N'test3', NULL, 123.0000, NULL, NULL, NULL, NULL, CAST(N'2020-12-20T21:24:57.447' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'd0f88a80-6e43-eb11-a4e4-201a06a548bb', N'0e5aef53-692d-eb11-a4c5-201a06a548bb', N'masraf', NULL, 22.0000, NULL, NULL, NULL, NULL, CAST(N'2020-12-21T09:25:45.697' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-16T09:16:24.010' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'ea8c8d97-6e43-eb11-a4e4-201a06a548bb', N'2819d084-692d-eb11-a4c5-201a06a548bb', N'masraf 2', NULL, 12.0000, NULL, NULL, NULL, NULL, CAST(N'2020-12-21T09:26:24.300' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'3f73bdc4-bf4d-eb11-a4f0-201a06a548bb', N'2819d084-692d-eb11-a4c5-201a06a548bb', N'Test from doguskar1', NULL, 23.0000, NULL, NULL, NULL, NULL, CAST(N'2021-01-03T12:32:40.977' AS DateTime), N'b4a3b867-a81e-eb11-a4a2-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'f3a49e19-c357-eb11-a506-201a06a548bb', N'0e5aef53-692d-eb11-a4c5-201a06a548bb', N'test', NULL, 50.0000, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T06:21:43.497' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-16T09:16:22.287' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'464eb385-c357-eb11-a506-201a06a548bb', N'0e5aef53-692d-eb11-a4c5-201a06a548bb', N'test', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T06:24:44.827' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-16T09:16:20.790' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'b827c44b-c457-eb11-a506-201a06a548bb', N'0e5aef53-692d-eb11-a4c5-201a06a548bb', N'test2', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T06:30:17.127' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-16T09:16:19.313' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'4d06d1c4-c457-eb11-a506-201a06a548bb', N'0e5aef53-692d-eb11-a4c5-201a06a548bb', N'test3', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T06:33:40.217' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-16T09:16:17.523' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'49273fff-c457-eb11-a506-201a06a548bb', N'0e5aef53-692d-eb11-a4c5-201a06a548bb', N'test4', NULL, 123.0000, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T06:35:18.243' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-16T09:16:15.940' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'be421d08-c557-eb11-a506-201a06a548bb', N'0e5aef53-692d-eb11-a4c5-201a06a548bb', N'test6', NULL, NULL, CAST(N'2021-01-22T09:38:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2021-01-16T06:35:33.123' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-16T09:14:06.773' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'61aef029-df57-eb11-a506-201a06a548bb', N'730c1417-692d-eb11-a4c5-201a06a548bb', N'test', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T09:42:36.787' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-16T09:42:52.463' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'7ffcc74b-df57-eb11-a506-201a06a548bb', N'730c1417-692d-eb11-a4c5-201a06a548bb', N'test', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T09:43:33.563' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-16T09:43:36.983' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'fb068b5d-0358-eb11-a506-201a06a548bb', N'730c1417-692d-eb11-a4c5-201a06a548bb', N'remainder', N'remainder', NULL, CAST(N'2021-01-22T17:05:00.000' AS DateTime), 1, CAST(N'2021-01-16T14:33:10.610' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-16T14:01:45.247' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-16T22:17:16.743' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'5c0440a8-0858-eb11-a506-201a06a548bb', N'730c1417-692d-eb11-a4c5-201a06a548bb', N'fasd', NULL, NULL, CAST(N'2021-01-19T17:44:00.000' AS DateTime), 1, CAST(N'2021-01-16T14:39:44.250' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-16T14:39:38.067' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-16T14:40:31.210' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'a70164cf-0858-eb11-a506-201a06a548bb', N'730c1417-692d-eb11-a4c5-201a06a548bb', N'fasd', NULL, NULL, CAST(N'2021-01-27T17:43:00.000' AS DateTime), 1, CAST(N'2021-01-16T14:40:47.497' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-16T14:40:43.733' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-16T14:42:02.970' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'd884ee03-0958-eb11-a506-201a06a548bb', N'730c1417-692d-eb11-a4c5-201a06a548bb', N'test', NULL, NULL, CAST(N'2021-01-28T17:46:00.000' AS DateTime), 1, CAST(N'2021-01-16T14:42:14.323' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-16T14:42:11.883' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-16T14:45:28.093' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'82fbeb7e-0958-eb11-a506-201a06a548bb', N'730c1417-692d-eb11-a4c5-201a06a548bb', N'test', NULL, NULL, CAST(N'2021-01-22T17:48:00.000' AS DateTime), 1, CAST(N'2021-01-16T14:45:41.617' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-16T14:45:38.227' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-16T14:47:59.163' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'ec5c61d8-0958-eb11-a506-201a06a548bb', N'730c1417-692d-eb11-a4c5-201a06a548bb', N'test', NULL, NULL, CAST(N'2021-01-30T17:52:00.000' AS DateTime), 1, CAST(N'2021-01-16T14:48:10.233' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-16T14:48:08.313' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-16T14:49:31.767' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'cfda2310-0a58-eb11-a506-201a06a548bb', N'730c1417-692d-eb11-a4c5-201a06a548bb', N'test', NULL, NULL, CAST(N'2021-01-20T17:52:00.000' AS DateTime), 1, CAST(N'2021-01-16T14:49:43.570' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-16T14:49:41.860' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-16T14:49:51.223' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'78437c7d-4258-eb11-a506-201a06a548bb', N'3c7a3840-4258-eb11-a506-201a06a548bb', N'fed', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T21:33:37.130' AS DateTime), N'a82de4e0-4158-eb11-a506-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'f9c3e1aa-4658-eb11-a506-201a06a548bb', N'a5923561-4658-eb11-a506-201a06a548bb', N'Harvesting', N'Harvesting', NULL, CAST(N'2021-01-22T10:05:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2021-01-16T22:03:31.280' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'd46d18be-4658-eb11-a506-201a06a548bb', N'651e43ed-4558-eb11-a506-201a06a548bb', N'Harvesting', N'Harvesting', NULL, CAST(N'2021-01-15T01:07:00.000' AS DateTime), 1, CAST(N'2021-01-16T22:04:05.687' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-16T22:04:03.513' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'e74b90f5-4658-eb11-a506-201a06a548bb', N'6f4bbc6b-4358-eb11-a506-201a06a548bb', N'Pregnant', N'1/17/2021', NULL, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T22:05:36.573' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'10e9b30e-4758-eb11-a506-201a06a548bb', N'f6f1fa61-4358-eb11-a506-201a06a548bb', N'Milk', N'Milk', NULL, CAST(N'2021-01-19T07:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2021-01-16T22:06:18.750' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'978e677f-4858-eb11-a506-201a06a548bb', N'a2b8d6b1-db4d-eb11-a4f0-201a06a548bb', N'Pregnant', N'17-01-2021', NULL, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T22:16:37.330' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'901a53c0-4858-eb11-a506-201a06a548bb', N'ea32f5f5-682d-eb11-a4c5-201a06a548bb', N'Give medicine', NULL, NULL, CAST(N'2021-01-18T04:18:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2021-01-16T22:18:26.247' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'b67478fa-672d-eb11-a4c5-201a06a548bb', 8, N'325c418c-672d-eb11-a4c5-201a06a548bb', N'1', N'Dolphine Male', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-11-23T08:43:38.200' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, NULL)
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'09291a91-682d-eb11-a4c5-201a06a548bb', 8, N'cc1e05b7-672d-eb11-a4c5-201a06a548bb', N'100', N'Dolphin Babies', NULL, 100, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-11-23T08:47:50.917' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, NULL)
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'7718fccb-682d-eb11-a4c5-201a06a548bb', 8, N'd81a0ca7-672d-eb11-a4c5-201a06a548bb', N'6', N'Dolphine Male', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-11-23T08:49:29.707' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, CAST(N'2020-12-20T21:24:57.447' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'ea32f5f5-682d-eb11-a4c5-201a06a548bb', 8, N'325c418c-672d-eb11-a4c5-201a06a548bb', N'2', N'Dolphine Male', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-11-23T08:50:40.123' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, CAST(N'2021-01-16T22:18:26.247' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'730c1417-692d-eb11-a4c5-201a06a548bb', 8, N'325c418c-672d-eb11-a4c5-201a06a548bb', N'3', N'Dolphin Female', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-11-23T08:51:35.690' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, CAST(N'2021-01-17T07:45:32.867' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'4b6ce837-692d-eb11-a4c5-201a06a548bb', 8, N'325c418c-672d-eb11-a4c5-201a06a548bb', N'4', N'Dolphin Female', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-11-23T08:52:30.770' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, NULL)
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'0e5aef53-692d-eb11-a4c5-201a06a548bb', 8, N'325c418c-672d-eb11-a4c5-201a06a548bb', N'5', N'Dolphin Female', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-11-23T08:53:17.793' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, CAST(N'2021-01-16T06:35:33.123' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'2819d084-692d-eb11-a4c5-201a06a548bb', 9, N'325c418c-672d-eb11-a4c5-201a06a548bb', N'51', N'Yellow Male', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-11-23T08:54:39.797' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, CAST(N'2021-01-03T12:32:40.977' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'9a0ffd16-6b2d-eb11-a4c5-201a06a548bb', 14, N'511f6905-6b2d-eb11-a4c5-201a06a548bb', NULL, N'Moss #1', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-11-23T09:05:54.533' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, NULL)
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'3b725d1f-6b2d-eb11-a4c5-201a06a548bb', 15, N'511f6905-6b2d-eb11-a4c5-201a06a548bb', NULL, N'Moss #2', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-11-23T09:06:08.590' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, CAST(N'2020-12-06T17:12:14.350' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'c9040828-6b2d-eb11-a4c5-201a06a548bb', 18, N'511f6905-6b2d-eb11-a4c5-201a06a548bb', NULL, N'Blyxa', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-11-23T09:06:23.127' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, NULL)
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'36892c9a-7f2d-eb11-a4c5-201a06a548bb', 14, N'511f6905-6b2d-eb11-a4c5-201a06a548bb', NULL, N'moss', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-11-23T11:32:44.560' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, NULL)
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'719f01ed-f137-eb11-a4d4-201a06a548bb', 18, N'511f6905-6b2d-eb11-a4c5-201a06a548bb', N'23', N'flower', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-12-06T18:36:17.787' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, CAST(N'2020-12-06T18:36:17.787' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'd89c48cb-af42-eb11-a4e3-201a06a548bb', 12, N'cf00fbc4-af42-eb11-a4e3-201a06a548bb', NULL, N'test', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-12-20T10:40:37.217' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-12-20T10:41:32.087' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-12-20T10:40:56.073' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'e22df8d8-d84d-eb11-a4f0-201a06a548bb', 6, N'325c418c-672d-eb11-a4c5-201a06a548bb', NULL, N'test', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-03T15:32:12.333' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-03T15:32:32.773' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-03T15:32:12.333' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'9f2820f2-d84d-eb11-a4f0-201a06a548bb', 6, N'325c418c-672d-eb11-a4c5-201a06a548bb', NULL, N'test', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-03T15:32:54.540' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-03T15:38:27.250' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-03T15:32:54.540' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'5d2e1a34-d94d-eb11-a4f0-201a06a548bb', 6, N'325c418c-672d-eb11-a4c5-201a06a548bb', NULL, N'test', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-03T15:34:45.230' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-03T15:38:23.787' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-03T15:34:45.230' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'defa5970-d94d-eb11-a4f0-201a06a548bb', 6, N'325c418c-672d-eb11-a4c5-201a06a548bb', N'test', N'test', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-03T15:36:26.310' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-03T15:38:20.240' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-03T15:36:26.310' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'c16eb5ac-d94d-eb11-a4f0-201a06a548bb', 6, N'325c418c-672d-eb11-a4c5-201a06a548bb', N'test', N'test', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-03T15:38:07.573' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-03T15:38:17.360' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-03T15:38:07.573' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'0b9523bf-d94d-eb11-a4f0-201a06a548bb', 6, N'325c418c-672d-eb11-a4c5-201a06a548bb', N'test', N'test', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-03T15:38:38.493' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-03T15:38:44.310' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-03T15:38:38.493' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'a2b8d6b1-db4d-eb11-a4f0-201a06a548bb', 11, N'325c418c-672d-eb11-a4c5-201a06a548bb', NULL, N'Guppy 1', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-03T15:52:35.173' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, CAST(N'2021-01-16T22:17:00.797' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'1c4c919b-764e-eb11-a4f1-201a06a548bb', 41, N'87254404-c54d-eb11-a4f0-201a06a548bb', N'Sheep', N'Sheep', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-04T10:21:29.800' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-16T22:08:57.410' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-04T10:21:29.800' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'8aab10a6-764e-eb11-a4f1-201a06a548bb', 42, N'87254404-c54d-eb11-a4f0-201a06a548bb', NULL, N'Cow', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-04T10:21:47.413' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-16T22:08:57.410' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-04T10:21:47.413' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'bef724d1-764e-eb11-a4f1-201a06a548bb', 43, N'87254404-c54d-eb11-a4f0-201a06a548bb', NULL, N'Chicken', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-04T10:22:59.690' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-16T22:08:57.410' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-04T10:22:59.690' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'1a53a02d-4258-eb11-a506-201a06a548bb', 42, N'e5657619-4258-eb11-a506-201a06a548bb', NULL, N'cow', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T21:31:23.147' AS DateTime), N'a82de4e0-4158-eb11-a506-201a06a548bb', 1, CAST(N'2021-01-16T21:32:35.240' AS DateTime), N'a82de4e0-4158-eb11-a506-201a06a548bb', CAST(N'2021-01-16T21:31:23.147' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'3c7a3840-4258-eb11-a506-201a06a548bb', 42, N'e5657619-4258-eb11-a506-201a06a548bb', N'1', N'steer', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T21:31:54.343' AS DateTime), N'a82de4e0-4158-eb11-a506-201a06a548bb', 0, NULL, NULL, CAST(N'2021-01-16T21:33:37.130' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'5939604b-4258-eb11-a506-201a06a548bb', 42, N'e5657619-4258-eb11-a506-201a06a548bb', N'2', N'cow', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T21:32:13.060' AS DateTime), N'a82de4e0-4158-eb11-a506-201a06a548bb', 0, NULL, NULL, CAST(N'2021-01-16T21:32:13.060' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'89425054-4258-eb11-a506-201a06a548bb', 42, N'e5657619-4258-eb11-a506-201a06a548bb', N'3', N'cow', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T21:32:28.053' AS DateTime), N'a82de4e0-4158-eb11-a506-201a06a548bb', 0, NULL, NULL, CAST(N'2021-01-16T21:32:28.053' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'bcfd834d-4358-eb11-a506-201a06a548bb', 42, N'82d1df22-4358-eb11-a506-201a06a548bb', N'1', N'Cow', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T21:39:26.147' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, CAST(N'2021-01-16T21:39:26.147' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'f6f1fa61-4358-eb11-a506-201a06a548bb', 42, N'82d1df22-4358-eb11-a506-201a06a548bb', N'2', N'Cow', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T21:40:00.480' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, CAST(N'2021-01-16T22:06:18.750' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'6f4bbc6b-4358-eb11-a506-201a06a548bb', 42, N'82d1df22-4358-eb11-a506-201a06a548bb', N'3', N'Cow', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T21:40:16.847' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, CAST(N'2021-01-16T22:05:36.573' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'31d810b0-4358-eb11-a506-201a06a548bb', 42, N'82d1df22-4358-eb11-a506-201a06a548bb', N'4', N'Steer', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T21:42:11.487' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, CAST(N'2021-01-16T21:42:11.527' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'b5f342dc-4358-eb11-a506-201a06a548bb', 43, N'439b543c-4358-eb11-a506-201a06a548bb', N'1', N'Chicken', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T21:43:25.633' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, CAST(N'2021-01-16T21:43:25.633' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'd63eebe9-4358-eb11-a506-201a06a548bb', 43, N'439b543c-4358-eb11-a506-201a06a548bb', N'2', N'Chicken', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T21:43:48.547' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, CAST(N'2021-01-16T21:43:48.547' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'5bd63f8c-4458-eb11-a506-201a06a548bb', 44, N'439b543c-4358-eb11-a506-201a06a548bb', N'3', N'Rooster', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T21:48:20.893' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, CAST(N'2021-01-16T21:48:20.893' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'92513497-4458-eb11-a506-201a06a548bb', 45, N'439b543c-4358-eb11-a506-201a06a548bb', N'4', N'Turkey', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T21:48:39.273' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, CAST(N'2021-01-16T21:48:39.273' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'3c4953a9-4458-eb11-a506-201a06a548bb', 41, N'691ce02f-4358-eb11-a506-201a06a548bb', N'1', N'Sheep', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T21:49:09.673' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, CAST(N'2021-01-16T21:49:09.673' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'a9a0e2af-4458-eb11-a506-201a06a548bb', 41, N'691ce02f-4358-eb11-a506-201a06a548bb', N'2', N'Sheep', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T21:49:20.680' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, CAST(N'2021-01-16T21:49:20.680' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'f8b225b6-4458-eb11-a506-201a06a548bb', 41, N'691ce02f-4358-eb11-a506-201a06a548bb', N'3', N'Sheep', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T21:49:31.187' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, CAST(N'2021-01-16T21:49:31.187' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'78a7c6e7-4458-eb11-a506-201a06a548bb', 41, N'691ce02f-4358-eb11-a506-201a06a548bb', N'4', N'New Sheeps', NULL, 100, CAST(N'2021-01-17T00:00:00.000' AS DateTime), 75000.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T21:50:54.450' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, CAST(N'2021-01-16T21:50:54.497' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'1ccd3bbb-4558-eb11-a506-201a06a548bb', 46, N'eb2d942e-4558-eb11-a506-201a06a548bb', N'1', N'Grapes', NULL, 100, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T21:56:49.217' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-16T22:04:34.987' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-16T21:56:49.217' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'651e43ed-4558-eb11-a506-201a06a548bb', 46, N'54a1fde3-4558-eb11-a506-201a06a548bb', N'1', N'Grapes', NULL, 5, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T21:58:13.150' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, CAST(N'2021-01-16T22:04:05.710' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'a5923561-4658-eb11-a506-201a06a548bb', 47, N'54a1fde3-4558-eb11-a506-201a06a548bb', N'2', N'Apple Tree', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T22:01:27.677' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, CAST(N'2021-01-16T22:04:19.637' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'1028a969-4658-eb11-a506-201a06a548bb', 47, N'54a1fde3-4558-eb11-a506-201a06a548bb', N'3', N'Apple Tree', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T22:01:41.857' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, CAST(N'2021-01-16T22:01:41.857' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'53796c78-4658-eb11-a506-201a06a548bb', 47, N'54a1fde3-4558-eb11-a506-201a06a548bb', N'4', N'Sapling', NULL, 10, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T22:02:06.623' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, CAST(N'2021-01-16T22:02:06.623' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'4d502985-4658-eb11-a506-201a06a548bb', 48, N'54a1fde3-4558-eb11-a506-201a06a548bb', N'5', N'Orange Tree', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T22:02:27.993' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, CAST(N'2021-01-16T22:02:27.993' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'35abb48f-4658-eb11-a506-201a06a548bb', 48, N'54a1fde3-4558-eb11-a506-201a06a548bb', N'6', N'Sapling', NULL, 10, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T22:02:45.683' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, CAST(N'2021-01-16T22:02:45.683' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'06301a50-4858-eb11-a506-201a06a548bb', 6, N'd81a0ca7-672d-eb11-a4c5-201a06a548bb', NULL, N'Saltwater Fish', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T22:15:17.970' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, CAST(N'2021-01-16T22:15:17.970' AS DateTime))
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'bb76875d-4858-eb11-a506-201a06a548bb', 6, N'd81a0ca7-672d-eb11-a4c5-201a06a548bb', NULL, N'Saltwater Fish', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2021-01-16T22:15:40.497' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL, CAST(N'2021-01-16T22:15:40.553' AS DateTime))
INSERT [dbo].[farmEntities] ([EUID], [name], [CUID], [FUID], [count], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'd5f2d94a-9f42-eb11-a4e3-201a06a548bb', N'Other', 20, N'1faf872b-672d-eb11-a4c5-201a06a548bb', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-12-20T08:42:29.793' AS DateTime), 1, CAST(N'2020-12-20T21:14:45.650' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[farmEntities] ([EUID], [name], [CUID], [FUID], [count], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'cd686e4f-a642-eb11-a4e3-201a06a548bb', N'Fish food', 22, N'1faf872b-672d-eb11-a4c5-201a06a548bb', 5, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-12-20T09:32:43.957' AS DateTime), 1, CAST(N'2020-12-20T21:15:27.947' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[farmEntities] ([EUID], [name], [CUID], [FUID], [count], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'b619e2b3-a642-eb11-a4e3-201a06a548bb', N'Fish food2', 22, N'1faf872b-672d-eb11-a4c5-201a06a548bb', 5, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-12-20T09:35:32.487' AS DateTime), 1, CAST(N'2020-12-20T09:36:01.350' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[farmEntities] ([EUID], [name], [CUID], [FUID], [count], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'9f163ec3-ab42-eb11-a4e3-201a06a548bb', N'Fish food', 22, N'1faf872b-672d-eb11-a4c5-201a06a548bb', 5, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-12-20T10:11:45.737' AS DateTime), 1, CAST(N'2020-12-21T09:23:34.687' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[farmEntities] ([EUID], [name], [CUID], [FUID], [count], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'8ecd4d34-0643-eb11-a4e3-201a06a548bb', N'Tetra Discus', 24, N'1faf872b-672d-eb11-a4c5-201a06a548bb', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-12-20T20:59:10.130' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[farmEntities] ([EUID], [name], [CUID], [FUID], [count], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'ab668567-0643-eb11-a4e3-201a06a548bb', N'Tetra Pro Algea', 25, N'1faf872b-672d-eb11-a4c5-201a06a548bb', 3, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-12-20T21:00:36.057' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[farmEntities] ([EUID], [name], [CUID], [FUID], [count], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'5207a1be-0943-eb11-a4e3-201a06a548bb', N'Test', 24, N'1faf872b-672d-eb11-a4c5-201a06a548bb', 13, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-12-20T21:24:30.690' AS DateTime), 1, CAST(N'2020-12-20T21:24:36.283' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[farmEntities] ([EUID], [name], [CUID], [FUID], [count], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'd6315399-2143-eb11-a4e3-201a06a548bb', N'Test', 23, N'1faf872b-672d-eb11-a4c5-201a06a548bb', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-12-21T00:15:16.027' AS DateTime), 1, CAST(N'2020-12-21T09:18:07.690' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[farmEntities] ([EUID], [name], [CUID], [FUID], [count], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'ab8d431b-6e43-eb11-a4e4-201a06a548bb', N'Internal Filter', 27, N'1faf872b-672d-eb11-a4c5-201a06a548bb', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-12-21T09:22:55.780' AS DateTime), 1, CAST(N'2020-12-21T09:23:00.437' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[farmEntities] ([EUID], [name], [CUID], [FUID], [count], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'8330e121-6e43-eb11-a4e4-201a06a548bb', N'External Filter', 28, N'1faf872b-672d-eb11-a4c5-201a06a548bb', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-12-21T09:23:06.880' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[farmEntities] ([EUID], [name], [CUID], [FUID], [count], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'7dc9112e-6e43-eb11-a4e4-201a06a548bb', N'450 Lt Aquarium', 29, N'1faf872b-672d-eb11-a4c5-201a06a548bb', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-12-21T09:23:27.330' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[farmEntities] ([EUID], [name], [CUID], [FUID], [count], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'49a194b3-ba4d-eb11-a4f0-201a06a548bb', N'Aquarium', 29, N'1faf872b-672d-eb11-a4c5-201a06a548bb', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-03T11:56:24.703' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[farmEntities] ([EUID], [name], [CUID], [FUID], [count], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'b30cfaea-bf4d-eb11-a4f0-201a06a548bb', N'Aquarium', 29, N'1faf872b-672d-eb11-a4c5-201a06a548bb', 2, N'b4a3b867-a81e-eb11-a4a2-201a06a548bb', CAST(N'2021-01-03T12:33:45.127' AS DateTime), 1, CAST(N'2021-01-03T13:03:50.630' AS DateTime), N'b4a3b867-a81e-eb11-a4a2-201a06a548bb')
INSERT [dbo].[farmEntities] ([EUID], [name], [CUID], [FUID], [count], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'972d9985-c04d-eb11-a4f0-201a06a548bb', N'Airpump', 26, N'1faf872b-672d-eb11-a4c5-201a06a548bb', 1, N'b4a3b867-a81e-eb11-a4a2-201a06a548bb', CAST(N'2021-01-03T12:38:04.540' AS DateTime), 1, CAST(N'2021-01-03T13:03:45.917' AS DateTime), N'b4a3b867-a81e-eb11-a4a2-201a06a548bb')
INSERT [dbo].[farmEntities] ([EUID], [name], [CUID], [FUID], [count], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'f6bd20e0-c04d-eb11-a4f0-201a06a548bb', N'Airpump', 26, N'1faf872b-672d-eb11-a4c5-201a06a548bb', 1, N'b4a3b867-a81e-eb11-a4a2-201a06a548bb', CAST(N'2021-01-03T12:40:36.420' AS DateTime), 1, CAST(N'2021-01-03T13:03:38.547' AS DateTime), N'b4a3b867-a81e-eb11-a4a2-201a06a548bb')
INSERT [dbo].[farmEntities] ([EUID], [name], [CUID], [FUID], [count], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'087f93af-e24d-eb11-a4f0-201a06a548bb', N'Airpump', 26, N'580d6550-a94d-eb11-a4f0-201a06a548bb', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-03T16:42:37.853' AS DateTime), 1, CAST(N'2021-01-03T16:42:41.757' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[farmEntities] ([EUID], [name], [CUID], [FUID], [count], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'563661b3-4258-eb11-a506-201a06a548bb', N'Other', 23, N'230a850b-4258-eb11-a506-201a06a548bb', 1, N'a82de4e0-4158-eb11-a506-201a06a548bb', CAST(N'2021-01-16T21:35:07.550' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[farmEntities] ([EUID], [name], [CUID], [FUID], [count], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'78c3b058-4758-eb11-a506-201a06a548bb', N'450 Lt Aquarium', 29, N'1faf872b-672d-eb11-a4c5-201a06a548bb', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-16T22:08:22.880' AS DateTime), 1, CAST(N'2021-01-16T22:08:27.610' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[farmEntities] ([EUID], [name], [CUID], [FUID], [count], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'4a99f5c5-4958-eb11-a506-201a06a548bb', N'Tractor', 23, N'230a850b-4258-eb11-a506-201a06a548bb', 2, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-16T22:25:45.197' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[farmProperties] ([PUID], [name], [description], [CUID], [FUID], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'325c418c-672d-eb11-a4c5-201a06a548bb', N'Main Aquarium', N'125x65x45 tank', 37, N'1faf872b-672d-eb11-a4c5-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-11-23T08:40:33.290' AS DateTime), 0, NULL, NULL, CAST(N'2021-01-17T07:48:54.917' AS DateTime))
INSERT [dbo].[farmProperties] ([PUID], [name], [description], [CUID], [FUID], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'd81a0ca7-672d-eb11-a4c5-201a06a548bb', N'Medium Aquarium', N'50Lt tank', 37, N'1faf872b-672d-eb11-a4c5-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-11-23T08:41:18.240' AS DateTime), 0, NULL, NULL, CAST(N'2021-01-16T22:15:40.553' AS DateTime))
INSERT [dbo].[farmProperties] ([PUID], [name], [description], [CUID], [FUID], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'cc1e05b7-672d-eb11-a4c5-201a06a548bb', N'Small Aquarium', N'20 Lt tank', 37, N'1faf872b-672d-eb11-a4c5-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-11-23T08:41:45.037' AS DateTime), 0, NULL, NULL, NULL)
INSERT [dbo].[farmProperties] ([PUID], [name], [description], [CUID], [FUID], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'511f6905-6b2d-eb11-a4c5-201a06a548bb', N'Plant Aquarium', NULL, 39, N'1faf872b-672d-eb11-a4c5-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-11-23T09:05:25.043' AS DateTime), 0, NULL, NULL, CAST(N'2020-12-06T18:36:17.787' AS DateTime))
INSERT [dbo].[farmProperties] ([PUID], [name], [description], [CUID], [FUID], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'cf00fbc4-af42-eb11-a4e3-201a06a548bb', N'test', NULL, 1, N'9519c1bd-af42-eb11-a4e3-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-12-20T10:40:26.640' AS DateTime), 1, CAST(N'2020-12-20T10:41:32.087' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-12-20T10:41:22.127' AS DateTime))
INSERT [dbo].[farmProperties] ([PUID], [name], [description], [CUID], [FUID], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'87254404-c54d-eb11-a4f0-201a06a548bb', N'Ranch', N'Ranch', 38, N'1faf872b-672d-eb11-a4c5-201a06a548bb', N'b4a3b867-a81e-eb11-a4a2-201a06a548bb', CAST(N'2021-01-03T13:10:15.040' AS DateTime), 1, CAST(N'2021-01-16T22:08:57.407' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-04T10:22:59.690' AS DateTime))
INSERT [dbo].[farmProperties] ([PUID], [name], [description], [CUID], [FUID], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'b27a5614-c64d-eb11-a4f0-201a06a548bb', N'Field', N'My field', 40, N'1faf872b-672d-eb11-a4c5-201a06a548bb', N'b4a3b867-a81e-eb11-a4a2-201a06a548bb', CAST(N'2021-01-03T13:17:51.500' AS DateTime), 1, CAST(N'2021-01-16T22:09:02.060' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-03T13:17:51.500' AS DateTime))
INSERT [dbo].[farmProperties] ([PUID], [name], [description], [CUID], [FUID], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'786f2143-c94d-eb11-a4f0-201a06a548bb', N'test', NULL, 39, N'1faf872b-672d-eb11-a4c5-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-03T13:40:38.493' AS DateTime), 1, CAST(N'2021-01-03T13:40:58.217' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-03T13:40:38.493' AS DateTime))
INSERT [dbo].[farmProperties] ([PUID], [name], [description], [CUID], [FUID], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'62738754-c94d-eb11-a4f0-201a06a548bb', N'test', NULL, 39, N'1faf872b-672d-eb11-a4c5-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-03T13:41:07.683' AS DateTime), 1, CAST(N'2021-01-03T13:41:18.477' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-03T13:41:07.683' AS DateTime))
INSERT [dbo].[farmProperties] ([PUID], [name], [description], [CUID], [FUID], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'cb48bdf3-db4d-eb11-a4f0-201a06a548bb', N'test', NULL, 38, N'580d6550-a94d-eb11-a4f0-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-03T15:54:25.737' AS DateTime), 1, CAST(N'2021-01-16T21:35:40.263' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-03T15:54:25.737' AS DateTime))
INSERT [dbo].[farmProperties] ([PUID], [name], [description], [CUID], [FUID], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'e5657619-4258-eb11-a506-201a06a548bb', N'Ranch', NULL, 38, N'230a850b-4258-eb11-a506-201a06a548bb', N'a82de4e0-4158-eb11-a506-201a06a548bb', CAST(N'2021-01-16T21:30:49.320' AS DateTime), 0, NULL, NULL, CAST(N'2021-01-16T21:33:37.130' AS DateTime))
INSERT [dbo].[farmProperties] ([PUID], [name], [description], [CUID], [FUID], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'82d1df22-4358-eb11-a506-201a06a548bb', N'Cattles', NULL, 38, N'781ac6ff-4258-eb11-a506-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-16T21:38:14.607' AS DateTime), 0, NULL, NULL, CAST(N'2021-01-16T22:06:18.750' AS DateTime))
INSERT [dbo].[farmProperties] ([PUID], [name], [description], [CUID], [FUID], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'691ce02f-4358-eb11-a506-201a06a548bb', N'Sheeps', NULL, 38, N'781ac6ff-4258-eb11-a506-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-16T21:38:36.420' AS DateTime), 0, NULL, NULL, CAST(N'2021-01-16T21:50:54.500' AS DateTime))
INSERT [dbo].[farmProperties] ([PUID], [name], [description], [CUID], [FUID], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'439b543c-4358-eb11-a506-201a06a548bb', N'Coop', NULL, 38, N'781ac6ff-4258-eb11-a506-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-16T21:38:57.313' AS DateTime), 0, NULL, NULL, CAST(N'2021-01-16T21:48:39.273' AS DateTime))
INSERT [dbo].[farmProperties] ([PUID], [name], [description], [CUID], [FUID], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'eb2d942e-4558-eb11-a506-201a06a548bb', N'Vineyard', NULL, 40, N'781ac6ff-4258-eb11-a506-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-16T21:52:53.237' AS DateTime), 1, CAST(N'2021-01-16T22:04:34.987' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-16T21:56:49.217' AS DateTime))
INSERT [dbo].[farmProperties] ([PUID], [name], [description], [CUID], [FUID], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'54a1fde3-4558-eb11-a506-201a06a548bb', N'Orchard', NULL, 40, N'781ac6ff-4258-eb11-a506-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-16T21:57:57.593' AS DateTime), 0, NULL, NULL, CAST(N'2021-01-16T22:04:19.640' AS DateTime))
INSERT [dbo].[farmProperties] ([PUID], [name], [description], [CUID], [FUID], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'c3ec3a19-9958-eb11-a506-201a06a548bb', N'new', NULL, 40, N'06f8b10f-9958-eb11-a506-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-17T07:53:35.143' AS DateTime), 1, CAST(N'2021-01-17T07:53:48.013' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-17T07:53:35.143' AS DateTime))
INSERT [dbo].[farmProperties] ([PUID], [name], [description], [CUID], [FUID], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'47e3b93f-9958-eb11-a506-201a06a548bb', N'test', NULL, 40, N'74c4a338-9958-eb11-a506-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-17T07:54:39.730' AS DateTime), 1, CAST(N'2021-01-17T07:54:46.760' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-17T07:54:39.730' AS DateTime))
INSERT [dbo].[farms] ([FUID], [name], [description], [location], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'1faf872b-672d-eb11-a4c5-201a06a548bb', N'My Aquariums', NULL, NULL, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-11-23T08:37:51.010' AS DateTime), 0, NULL, NULL, CAST(N'2021-01-17T07:48:54.917' AS DateTime))
INSERT [dbo].[farms] ([FUID], [name], [description], [location], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'9519c1bd-af42-eb11-a4e3-201a06a548bb', N'Test', NULL, NULL, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-12-20T10:40:14.517' AS DateTime), 1, CAST(N'2020-12-20T10:41:32.090' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-12-20T10:41:29.650' AS DateTime))
INSERT [dbo].[farms] ([FUID], [name], [description], [location], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'f48937e1-f842-eb11-a4e3-201a06a548bb', N'MyFarm', NULL, NULL, N'70f13c78-e515-eb11-a495-201a06a548bb', CAST(N'2020-12-20T19:23:47.273' AS DateTime), 0, NULL, NULL, CAST(N'2020-12-20T19:23:47.273' AS DateTime))
INSERT [dbo].[farms] ([FUID], [name], [description], [location], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'580d6550-a94d-eb11-a4f0-201a06a548bb', N'New Farm', NULL, NULL, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-03T09:51:56.850' AS DateTime), 1, CAST(N'2021-01-16T21:35:40.263' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-03T16:42:41.757' AS DateTime))
INSERT [dbo].[farms] ([FUID], [name], [description], [location], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'230a850b-4258-eb11-a506-201a06a548bb', N'doguskar21 Farm', NULL, NULL, N'a82de4e0-4158-eb11-a506-201a06a548bb', CAST(N'2021-01-16T21:30:25.927' AS DateTime), 0, NULL, NULL, CAST(N'2021-01-16T22:25:45.200' AS DateTime))
INSERT [dbo].[farms] ([FUID], [name], [description], [location], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'781ac6ff-4258-eb11-a506-201a06a548bb', N'Terrestrial Farm', NULL, NULL, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-16T21:37:15.717' AS DateTime), 0, NULL, NULL, CAST(N'2021-01-16T22:06:18.750' AS DateTime))
INSERT [dbo].[farms] ([FUID], [name], [description], [location], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'06f8b10f-9958-eb11-a506-201a06a548bb', N'new', NULL, NULL, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-17T07:53:19.147' AS DateTime), 1, CAST(N'2021-01-17T07:53:48.013' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-17T07:53:35.147' AS DateTime))
INSERT [dbo].[farms] ([FUID], [name], [description], [location], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [lastModifiedDate]) VALUES (N'74c4a338-9958-eb11-a506-201a06a548bb', N'new', NULL, NULL, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-17T07:54:27.840' AS DateTime), 1, CAST(N'2021-01-17T07:54:46.760' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-17T07:54:39.730' AS DateTime))
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'4adb8416-a43e-4e66-a077-012381223598', N'3ca79942-a91e-eb11-a4a2-201a06a548bb', NULL, CAST(N'2020-11-04T14:23:09.060' AS DateTime), CAST(N'2020-11-11T14:23:09.060' AS DateTime), 1, 3)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'90c552db-bc91-45c3-a2f8-054caddaaf8e', NULL, N'::1', CAST(N'2020-12-20T19:25:17.250' AS DateTime), CAST(N'2020-12-20T19:30:17.250' AS DateTime), 0, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'10c7adb2-a4a6-4447-9ae5-0b5f7923ebfb', NULL, N'::1', CAST(N'2020-10-27T09:58:53.663' AS DateTime), CAST(N'2020-10-27T10:03:53.663' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'd96c8e58-77c7-49ab-802c-0f2fa5915aa9', NULL, N'198.162.1.1', CAST(N'2020-10-26T20:24:04.120' AS DateTime), CAST(N'2020-10-26T20:29:04.120' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'b00d8c58-0e85-406d-a22a-1148461fa439', NULL, N'198.162.1.1', CAST(N'2020-10-26T20:23:43.553' AS DateTime), CAST(N'2020-10-26T20:28:43.553' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'dbca077e-90c2-48ad-bfdb-1290337b0c2d', NULL, N'::1', CAST(N'2020-10-27T09:58:52.333' AS DateTime), CAST(N'2020-10-27T10:03:52.333' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'2c9b6b78-22ff-42b9-baab-15b70cb2b7c5', N'3a30e616-f942-eb11-a4e3-201a06a548bb', NULL, CAST(N'2020-12-20T19:25:17.340' AS DateTime), CAST(N'2020-12-27T19:25:17.340' AS DateTime), 1, 3)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'8a3b959e-9063-40df-9e25-1de405f72bfc', NULL, N'::1', CAST(N'2020-10-27T10:05:59.947' AS DateTime), CAST(N'2020-10-27T10:10:59.947' AS DateTime), 0, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'c0993cc8-a52f-4e9a-a7d3-261f3c205fdd', N'34157dd6-a81e-eb11-a4a2-201a06a548bb', NULL, CAST(N'2020-11-04T14:20:07.680' AS DateTime), CAST(N'2020-11-11T14:20:07.680' AS DateTime), 1, 3)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'f7770024-2ccd-48e4-9c49-3e3f3183a1a5', NULL, N'198.162.1.1', CAST(N'2020-10-26T20:24:04.580' AS DateTime), CAST(N'2020-10-26T20:29:04.580' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'eba4a819-fa68-45f3-b70a-4063641ec0da', NULL, N'::1', CAST(N'2020-11-04T14:27:09.700' AS DateTime), CAST(N'2020-11-04T14:32:09.700' AS DateTime), 0, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'50562fdc-c260-4f18-8541-465a2f40a32f', NULL, N'198.162.1.1', CAST(N'2020-10-26T20:24:05.063' AS DateTime), CAST(N'2020-10-26T20:29:05.063' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'7a544f19-7603-4b81-a09b-491dc11b64a5', NULL, N'::1', CAST(N'2020-10-26T20:52:20.030' AS DateTime), CAST(N'2020-10-26T20:57:20.030' AS DateTime), 0, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'e1a66629-5fec-40a5-a522-560c3bbdd6c7', NULL, N'::1', CAST(N'2020-11-04T14:15:06.480' AS DateTime), CAST(N'2020-11-04T14:20:06.480' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'b1cfefab-10e8-463b-b3f0-73a601696c9f', NULL, N'::1', CAST(N'2020-11-04T14:15:16.843' AS DateTime), CAST(N'2020-11-04T14:20:16.843' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'01ebd01f-8838-42b6-80ed-818f49fe7495', NULL, N'198.162.1.1', CAST(N'2020-10-26T20:24:03.587' AS DateTime), CAST(N'2020-10-26T20:29:03.587' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'315e91c6-f22e-418c-85cd-8463ded7a573', N'a37310d2-a91e-eb11-a4a2-201a06a548bb', NULL, CAST(N'2020-11-04T14:27:09.753' AS DateTime), CAST(N'2020-11-11T14:27:09.753' AS DateTime), 1, 3)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'1c4ba74b-08ab-4fee-9ef2-84eca092e5b6', NULL, N'::1', CAST(N'2020-10-27T09:58:53.040' AS DateTime), CAST(N'2020-10-27T10:03:53.040' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'600879c5-0a92-4bbd-a492-8f445422f0be', NULL, N'::1', CAST(N'2020-11-04T14:20:02.763' AS DateTime), CAST(N'2020-11-04T14:25:02.763' AS DateTime), 0, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'9ff27de7-024a-47ea-a960-9415278d08ef', NULL, N'::1', CAST(N'2021-01-16T21:29:14.207' AS DateTime), CAST(N'2021-01-16T21:34:14.207' AS DateTime), 0, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'c4c2dea5-4051-434f-8422-9b83a7388582', NULL, N'::1', CAST(N'2020-10-26T20:47:06.413' AS DateTime), CAST(N'2020-10-26T20:52:06.413' AS DateTime), 0, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'ad5031a8-4749-42fc-90cb-b1f8a810017b', N'a82de4e0-4158-eb11-a506-201a06a548bb', NULL, CAST(N'2021-01-16T21:29:14.413' AS DateTime), CAST(N'2021-01-23T21:29:14.413' AS DateTime), 1, 3)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'8f4c38cb-9646-47ac-a155-b5e18c86728a', NULL, N'::1', CAST(N'2020-10-27T09:58:51.610' AS DateTime), CAST(N'2020-10-27T10:03:51.610' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'a5702df8-f995-451f-8648-bbb580e17241', N'b4a3b867-a81e-eb11-a4a2-201a06a548bb', NULL, CAST(N'2020-11-04T14:17:01.843' AS DateTime), CAST(N'2020-11-11T14:17:01.843' AS DateTime), 1, 3)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'100cb461-f1b4-4180-af56-c22044a035a0', N'ca89830c-341c-eb11-a49d-201a06a548bb', NULL, CAST(N'2020-11-01T11:19:04.953' AS DateTime), CAST(N'2020-11-08T11:19:04.953' AS DateTime), 1, 3)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'3234753f-7961-43c3-abe8-c38e8c4f6adc', NULL, N'::1', CAST(N'2020-11-04T14:23:08.970' AS DateTime), CAST(N'2020-11-04T14:28:08.970' AS DateTime), 0, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'6d542355-df98-4ac9-9fd1-c8d73b39ec4a', NULL, N'::1', CAST(N'2020-10-27T09:58:39.367' AS DateTime), CAST(N'2020-10-27T10:03:39.367' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'978f6aa0-1c4c-4060-886a-d43ccfcb9c9f', NULL, N'::1', CAST(N'2020-11-04T14:16:57.567' AS DateTime), CAST(N'2020-11-04T14:21:57.567' AS DateTime), 0, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'fc8ebda4-34d4-4593-8286-e00f5fe34d5d', NULL, N'::1', CAST(N'2020-11-01T11:18:28.623' AS DateTime), CAST(N'2020-11-01T11:23:28.623' AS DateTime), 0, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'd0c4145e-0a1b-4d6c-8aa5-e13c98565671', NULL, N'::1', CAST(N'2020-11-04T14:23:25.853' AS DateTime), CAST(N'2020-11-04T14:28:25.853' AS DateTime), 1, 4)
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'8fa92a57-6b2d-eb11-a4c5-201a06a548bb', N'1faf872b-672d-eb11-a4c5-201a06a548bb', 0, CAST(N'2020-11-23T00:00:00.000' AS DateTime), N'Tetra Discus Food', NULL, 250.0000, CAST(N'2020-12-06T16:32:51.173' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'0dd8706f-6b2d-eb11-a4c5-201a06a548bb', N'1faf872b-672d-eb11-a4c5-201a06a548bb', 0, CAST(N'2020-11-03T00:00:00.000' AS DateTime), N'Airpump', NULL, 75.0000, CAST(N'2020-12-06T16:33:51.173' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'5b355188-6b2d-eb11-a4c5-201a06a548bb', N'1faf872b-672d-eb11-a4c5-201a06a548bb', 1, CAST(N'2020-11-20T00:00:00.000' AS DateTime), N'Dolphin Baby x 25', NULL, 25.0000, CAST(N'2020-12-06T16:34:51.173' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'0475e6c1-ec37-eb11-a4d4-201a06a548bb', N'1faf872b-672d-eb11-a4c5-201a06a548bb', 0, CAST(N'2020-12-06T20:59:17.990' AS DateTime), N'Patient', N'Methylene blue is purchased', 30.0000, CAST(N'2020-12-06T17:59:18.010' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'27026d8a-8338-eb11-a4d5-201a06a548bb', N'1faf872b-672d-eb11-a4c5-201a06a548bb', 0, CAST(N'2020-12-07T14:58:38.807' AS DateTime), N'dsa', NULL, 20.0000, CAST(N'2020-12-07T11:58:38.920' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-12-20T21:22:48.463' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'8869d1b1-8338-eb11-a4d5-201a06a548bb', N'1faf872b-672d-eb11-a4c5-201a06a548bb', 0, CAST(N'2020-12-07T14:59:49.283' AS DateTime), N'test2', NULL, 123.0000, CAST(N'2020-12-07T11:59:49.297' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-12-20T21:24:08.440' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'fe3b19e2-8338-eb11-a4d5-201a06a548bb', N'1faf872b-672d-eb11-a4c5-201a06a548bb', 0, CAST(N'2020-12-07T15:01:06.017' AS DateTime), N'fasd', N'asd', 10.0000, CAST(N'2020-12-07T12:01:06.067' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-12-20T21:21:47.567' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'134cc100-8438-eb11-a4d5-201a06a548bb', N'1faf872b-672d-eb11-a4c5-201a06a548bb', 0, CAST(N'2020-12-07T15:01:57.450' AS DateTime), N'test2', N'32', 32.0000, CAST(N'2020-12-07T12:01:57.477' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-12-20T21:15:50.757' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'12f885d6-af42-eb11-a4e3-201a06a548bb', N'9519c1bd-af42-eb11-a4e3-201a06a548bb', 0, CAST(N'2020-12-20T13:40:56.083' AS DateTime), N'test2', NULL, 12.0000, CAST(N'2020-12-20T10:40:56.140' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'a9a293ce-0943-eb11-a4e3-201a06a548bb', N'1faf872b-672d-eb11-a4c5-201a06a548bb', 0, CAST(N'2020-12-21T00:24:57.463' AS DateTime), N'test3', NULL, 123.0000, CAST(N'2020-12-20T21:24:57.500' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-12-20T21:25:05.200' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'34eacba2-2143-eb11-a4e3-201a06a548bb', N'1faf872b-672d-eb11-a4c5-201a06a548bb', 1, NULL, N'deneme', NULL, 123.0000, CAST(N'2020-12-21T00:15:31.917' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-12-21T00:15:34.860' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'd1f88a80-6e43-eb11-a4e4-201a06a548bb', N'1faf872b-672d-eb11-a4c5-201a06a548bb', 0, CAST(N'2020-12-21T12:25:45.760' AS DateTime), N'masraf', NULL, 22.0000, CAST(N'2020-12-21T09:25:45.790' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-02T14:17:27.510' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'eb8c8d97-6e43-eb11-a4e4-201a06a548bb', N'1faf872b-672d-eb11-a4c5-201a06a548bb', 0, CAST(N'2020-12-21T12:26:24.310' AS DateTime), N'masraf 2', NULL, 12.0000, CAST(N'2020-12-21T09:26:24.313' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-02T14:17:25.197' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'130d4fb2-b04d-eb11-a4f0-201a06a548bb', N'1faf872b-672d-eb11-a4c5-201a06a548bb', 1, NULL, N'Test', NULL, 50.0000, CAST(N'2021-01-03T10:44:47.603' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-16T14:04:38.327' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'7cecce09-b14d-eb11-a4f0-201a06a548bb', N'1faf872b-672d-eb11-a4c5-201a06a548bb', 1, NULL, N'Test2', NULL, 75.0000, CAST(N'2021-01-03T10:47:14.400' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-03T11:01:17.883' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'2574988b-bc4d-eb11-a4f0-201a06a548bb', N'1faf872b-672d-eb11-a4c5-201a06a548bb', 0, NULL, N'test ex', NULL, 123.0000, CAST(N'2021-01-03T12:09:36.613' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-03T13:29:56.443' AS DateTime), N'b4a3b867-a81e-eb11-a4a2-201a06a548bb')
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'64bdbae3-bd4d-eb11-a4f0-201a06a548bb', N'1faf872b-672d-eb11-a4c5-201a06a548bb', 1, CAST(N'2021-01-12T00:00:00.000' AS DateTime), N'income from collaborator', N'test', 32.0000, CAST(N'2021-01-03T12:19:13.973' AS DateTime), N'b4a3b867-a81e-eb11-a4a2-201a06a548bb', 1, CAST(N'2021-01-03T12:31:36.590' AS DateTime), N'b4a3b867-a81e-eb11-a4a2-201a06a548bb')
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'07d477ff-bd4d-eb11-a4f0-201a06a548bb', N'1faf872b-672d-eb11-a4c5-201a06a548bb', 0, NULL, N'expense collaborator', NULL, 32.0000, CAST(N'2021-01-03T12:20:00.510' AS DateTime), N'b4a3b867-a81e-eb11-a4a2-201a06a548bb', 1, CAST(N'2021-01-03T12:31:38.763' AS DateTime), N'b4a3b867-a81e-eb11-a4a2-201a06a548bb')
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'7178518c-be4d-eb11-a4f0-201a06a548bb', N'1faf872b-672d-eb11-a4c5-201a06a548bb', 1, NULL, N'test doguskar1', NULL, 43.0000, CAST(N'2021-01-03T12:23:56.820' AS DateTime), N'b4a3b867-a81e-eb11-a4a2-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'2694abc2-be4d-eb11-a4f0-201a06a548bb', N'1faf872b-672d-eb11-a4c5-201a06a548bb', 1, NULL, N'alooo', NULL, 321.0000, CAST(N'2021-01-03T12:25:28.007' AS DateTime), N'b4a3b867-a81e-eb11-a4a2-201a06a548bb', 1, CAST(N'2021-01-03T12:31:42.130' AS DateTime), N'b4a3b867-a81e-eb11-a4a2-201a06a548bb')
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'42c0eb8b-bf4d-eb11-a4f0-201a06a548bb', N'1faf872b-672d-eb11-a4c5-201a06a548bb', 0, NULL, N'aloooo', NULL, 43.0000, CAST(N'2021-01-03T12:31:05.650' AS DateTime), N'b4a3b867-a81e-eb11-a4a2-201a06a548bb', 1, CAST(N'2021-01-03T12:31:44.183' AS DateTime), N'b4a3b867-a81e-eb11-a4a2-201a06a548bb')
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'1d072797-bf4d-eb11-a4f0-201a06a548bb', N'1faf872b-672d-eb11-a4c5-201a06a548bb', 1, NULL, N'okey', NULL, 123.0000, CAST(N'2021-01-03T12:31:24.493' AS DateTime), N'b4a3b867-a81e-eb11-a4a2-201a06a548bb', 1, CAST(N'2021-01-03T12:31:48.900' AS DateTime), N'b4a3b867-a81e-eb11-a4a2-201a06a548bb')
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'4073bdc4-bf4d-eb11-a4f0-201a06a548bb', N'1faf872b-672d-eb11-a4c5-201a06a548bb', 0, CAST(N'2021-01-03T15:32:41.060' AS DateTime), N'Test from doguskar1', NULL, 23.0000, CAST(N'2021-01-03T12:32:41.087' AS DateTime), N'b4a3b867-a81e-eb11-a4a2-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'f4a49e19-c357-eb11-a506-201a06a548bb', N'1faf872b-672d-eb11-a4c5-201a06a548bb', 0, CAST(N'2021-01-16T09:21:43.560' AS DateTime), N'test', NULL, 50.0000, CAST(N'2021-01-16T06:21:43.587' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-16T14:04:30.227' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'4a273fff-c457-eb11-a506-201a06a548bb', N'1faf872b-672d-eb11-a4c5-201a06a548bb', 0, CAST(N'2021-01-16T09:35:18.253' AS DateTime), N'test4', NULL, 123.0000, CAST(N'2021-01-16T06:35:18.307' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-16T14:04:26.573' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'fdcca4a0-4258-eb11-a506-201a06a548bb', N'230a850b-4258-eb11-a506-201a06a548bb', 0, NULL, N'expense', NULL, 123.0000, CAST(N'2021-01-16T21:34:36.117' AS DateTime), N'a82de4e0-4158-eb11-a506-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'fecca4a0-4258-eb11-a506-201a06a548bb', N'230a850b-4258-eb11-a506-201a06a548bb', 1, NULL, N'income', NULL, 321.0000, CAST(N'2021-01-16T21:34:46.007' AS DateTime), N'a82de4e0-4158-eb11-a506-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'cc76cfff-4458-eb11-a506-201a06a548bb', N'781ac6ff-4258-eb11-a506-201a06a548bb', 0, CAST(N'2021-01-26T00:00:00.000' AS DateTime), N'expense', NULL, 435.0000, CAST(N'2021-01-16T21:51:34.770' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'c62a130a-4558-eb11-a506-201a06a548bb', N'781ac6ff-4258-eb11-a506-201a06a548bb', 1, CAST(N'2021-01-06T00:00:00.000' AS DateTime), N'income', NULL, 745.0000, CAST(N'2021-01-16T21:51:51.993' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'091efe2b-4758-eb11-a506-201a06a548bb', N'1faf872b-672d-eb11-a4c5-201a06a548bb', 1, CAST(N'2021-01-17T00:00:00.000' AS DateTime), N'Guppy sold', NULL, 50.0000, CAST(N'2021-01-16T22:07:07.890' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'7b3e6147-4758-eb11-a506-201a06a548bb', N'1faf872b-672d-eb11-a4c5-201a06a548bb', 0, CAST(N'2021-01-17T00:00:00.000' AS DateTime), N'New Fishes', N'Guppies
Blue dolphines', 500.0000, CAST(N'2021-01-16T22:07:53.840' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'453fb6e7-4858-eb11-a506-201a06a548bb', N'230a850b-4258-eb11-a506-201a06a548bb', 1, CAST(N'2021-01-17T00:00:00.000' AS DateTime), N'income', NULL, 50.0000, CAST(N'2021-01-16T22:19:32.330' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'e1fb6aac-4958-eb11-a506-201a06a548bb', N'230a850b-4258-eb11-a506-201a06a548bb', 0, CAST(N'2021-01-20T00:00:00.000' AS DateTime), N'expense', NULL, 75.0000, CAST(N'2021-01-16T22:25:02.347' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'f7d4fe20-9858-eb11-a506-201a06a548bb', N'1faf872b-672d-eb11-a4c5-201a06a548bb', 0, CAST(N'2021-01-17T10:46:38.690' AS DateTime), N'New dolphine', NULL, 100.0000, CAST(N'2021-01-17T07:46:38.720' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-17T07:47:39.633' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'bde93b41-9858-eb11-a506-201a06a548bb', N'1faf872b-672d-eb11-a4c5-201a06a548bb', 0, CAST(N'2021-01-17T10:47:32.783' AS DateTime), N'New dolphine', N'New dolphine bought', 200.0000, CAST(N'2021-01-17T07:47:32.823' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[memberType] ON 

INSERT [dbo].[memberType] ([MTUID], [name], [farmLimit], [propertyLimit], [entityLimit], [collaboratorLimit], [AdLimit], [supportFlag], [price]) VALUES (1, N'user', 0, 0, 0, 0, 0, 0, 0.0000)
INSERT [dbo].[memberType] ([MTUID], [name], [farmLimit], [propertyLimit], [entityLimit], [collaboratorLimit], [AdLimit], [supportFlag], [price]) VALUES (2, N'farmer', 1, 5, 15, 3, 1, 0, 0.0000)
INSERT [dbo].[memberType] ([MTUID], [name], [farmLimit], [propertyLimit], [entityLimit], [collaboratorLimit], [AdLimit], [supportFlag], [price]) VALUES (3, N'advanced', 9999, 9999, 9999, 9999, 9999, 1, 150.0000)
INSERT [dbo].[memberType] ([MTUID], [name], [farmLimit], [propertyLimit], [entityLimit], [collaboratorLimit], [AdLimit], [supportFlag], [price]) VALUES (4, N'business', 3, 15, 50, 15, 15, 1, 50.0000)
INSERT [dbo].[memberType] ([MTUID], [name], [farmLimit], [propertyLimit], [entityLimit], [collaboratorLimit], [AdLimit], [supportFlag], [price]) VALUES (5, N'professional', 5, 25, 125, 25, 25, 1, 75.0000)
SET IDENTITY_INSERT [dbo].[memberType] OFF
INSERT [dbo].[Pictures] ([PUID], [address], [AUID]) VALUES (N'439a329a-2f48-eb11-a4ea-201a06a548bb', N'IMG_20201103_113357_b688.jpg', N'429a329a-2f48-eb11-a4ea-201a06a548bb')
INSERT [dbo].[Pictures] ([PUID], [address], [AUID]) VALUES (N'205a9b0c-3048-eb11-a4ea-201a06a548bb', N'IMG_20170705_205702_9784.jpg', N'1f5a9b0c-3048-eb11-a4ea-201a06a548bb')
INSERT [dbo].[Pictures] ([PUID], [address], [AUID]) VALUES (N'8a5d9f22-3148-eb11-a4ea-201a06a548bb', N'IMG_20140222_160108_0f0b.jpg', N'895d9f22-3148-eb11-a4ea-201a06a548bb')
INSERT [dbo].[Pictures] ([PUID], [address], [AUID]) VALUES (N'302b4ed6-3148-eb11-a4ea-201a06a548bb', N'SANY0102 (2)_e030.JPG', N'2f2b4ed6-3148-eb11-a4ea-201a06a548bb')
INSERT [dbo].[Pictures] ([PUID], [address], [AUID]) VALUES (N'cb55c52c-3248-eb11-a4ea-201a06a548bb', N'IMG_20140911_143817_8bd4.jpg', N'ca55c52c-3248-eb11-a4ea-201a06a548bb')
INSERT [dbo].[Pictures] ([PUID], [address], [AUID]) VALUES (N'0687c461-3248-eb11-a4ea-201a06a548bb', N'1_6668.jpg', N'0587c461-3248-eb11-a4ea-201a06a548bb')
INSERT [dbo].[Pictures] ([PUID], [address], [AUID]) VALUES (N'0787c461-3248-eb11-a4ea-201a06a548bb', N'4_ada1.jpg', N'0587c461-3248-eb11-a4ea-201a06a548bb')
INSERT [dbo].[Pictures] ([PUID], [address], [AUID]) VALUES (N'3d3913ea-3248-eb11-a4ea-201a06a548bb', N'Screenshot 2020-12-27 140038_bbaf.png', N'3c3913ea-3248-eb11-a4ea-201a06a548bb')
INSERT [dbo].[Pictures] ([PUID], [address], [AUID]) VALUES (N'06956e16-7b4e-eb11-a4f1-201a06a548bb', N'images_4dea.jpg', N'05956e16-7b4e-eb11-a4f1-201a06a548bb')
INSERT [dbo].[Pictures] ([PUID], [address], [AUID]) VALUES (N'5d0f6690-2357-eb11-a500-201a06a548bb', N'newa-wind-pack-1_a0fb.jpg', N'5c0f6690-2357-eb11-a500-201a06a548bb')
INSERT [dbo].[propertyDetail] ([DUID], [PUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'32a57bce-8c58-eb11-a506-201a06a548bb', N'325c418c-672d-eb11-a4c5-201a06a548bb', N'%30 water changed', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-01-17T06:25:35.780' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-17T07:42:11.680' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[propertyDetail] ([DUID], [PUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'066afaf3-8c58-eb11-a506-201a06a548bb', N'325c418c-672d-eb11-a4c5-201a06a548bb', N'%30 water changed', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-01-17T06:26:38.683' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-17T06:33:03.820' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[propertyDetail] ([DUID], [PUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'3a5d5691-8d58-eb11-a506-201a06a548bb', N'325c418c-672d-eb11-a4c5-201a06a548bb', N'%30 water changed', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-01-17T06:31:02.690' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-17T07:42:17.890' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[propertyDetail] ([DUID], [PUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'e5d82146-9658-eb11-a506-201a06a548bb', N'325c418c-672d-eb11-a4c5-201a06a548bb', N'Water changes', N'%30', NULL, NULL, NULL, NULL, NULL, CAST(N'2021-01-17T07:33:21.987' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[propertyDetail] ([DUID], [PUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'1c9ecb67-9658-eb11-a506-201a06a548bb', N'325c418c-672d-eb11-a4c5-201a06a548bb', N'Clean', NULL, NULL, CAST(N'2021-01-18T10:34:00.000' AS DateTime), 1, CAST(N'2021-01-17T07:44:19.777' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2021-01-17T07:34:18.463' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[propertyDetail] ([DUID], [PUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'f10679e2-9758-eb11-a506-201a06a548bb', N'325c418c-672d-eb11-a4c5-201a06a548bb', N'Change Water', NULL, NULL, CAST(N'2021-01-18T10:47:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2021-01-17T07:44:53.780' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[propertyDetail] ([DUID], [PUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'df300b0f-9858-eb11-a506-201a06a548bb', N'325c418c-672d-eb11-a4c5-201a06a548bb', N'Add new guppy', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-01-17T07:46:08.557' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[propertyDetail] ([DUID], [PUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'f6d4fe20-9858-eb11-a506-201a06a548bb', N'325c418c-672d-eb11-a4c5-201a06a548bb', N'New dolphine', NULL, 100.0000, NULL, NULL, NULL, NULL, CAST(N'2021-01-17T07:46:38.677' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2021-01-17T07:46:44.463' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[propertyDetail] ([DUID], [PUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'bce93b41-9858-eb11-a506-201a06a548bb', N'325c418c-672d-eb11-a4c5-201a06a548bb', N'New dolphine', N'New dolphine bought', 200.0000, NULL, NULL, NULL, NULL, CAST(N'2021-01-17T07:47:32.763' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[propertyDetail] ([DUID], [PUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'2f6d3272-9858-eb11-a506-201a06a548bb', N'325c418c-672d-eb11-a4c5-201a06a548bb', N'Give medicine ', N'Give medicine to guppy', NULL, CAST(N'2021-01-26T10:49:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2021-01-17T07:48:54.910' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
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
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'f1d64800-1c1e-eb11-a4a1-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-11-03T21:32:00.957' AS DateTime), NULL)
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'910139c3-1e1e-eb11-a4a1-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-11-03T21:51:44.850' AS DateTime), NULL)
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'c8162694-1f1e-eb11-a4a1-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-11-03T21:57:40.900' AS DateTime), NULL)
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'8d4894c4-261e-eb11-a4a1-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, CAST(N'2020-11-03T22:49:03.133' AS DateTime), CAST(N'2020-11-03T23:38:25.803' AS DateTime))
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'ff1df4e2-311e-eb11-a4a1-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-11-04T00:08:38.940' AS DateTime), CAST(N'2020-11-04T08:51:37.887' AS DateTime))
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'dd3104e8-7d1e-eb11-a4a2-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-11-04T09:12:49.040' AS DateTime), CAST(N'2020-11-04T09:13:04.160' AS DateTime))
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'4f515223-7e1e-eb11-a4a2-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, CAST(N'2020-11-04T09:14:28.477' AS DateTime), CAST(N'2020-11-04T09:14:41.877' AS DateTime))
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'817be78c-7e1e-eb11-a4a2-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, CAST(N'2020-11-04T09:17:25.407' AS DateTime), CAST(N'2020-11-04T09:18:00.057' AS DateTime))
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'473ef2bf-801e-eb11-a4a2-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, CAST(N'2020-11-04T09:33:10.287' AS DateTime), CAST(N'2020-11-04T09:47:17.823' AS DateTime))
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'a29b86f5-a91e-eb11-a4a2-201a06a548bb', N'a37310d2-a91e-eb11-a4a2-201a06a548bb', 0, CAST(N'2020-11-04T14:28:09.373' AS DateTime), CAST(N'2020-11-04T14:28:32.580' AS DateTime))
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'262b2bb2-bc2b-eb11-a4c1-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, CAST(N'2020-11-21T05:45:02.013' AS DateTime), CAST(N'2020-11-22T18:08:14.173' AS DateTime))
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'2c1da9bf-ed2c-eb11-a4c4-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, CAST(N'2020-11-22T18:08:40.990' AS DateTime), CAST(N'2020-11-23T11:26:48.647' AS DateTime))
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'6df38cca-7e2d-eb11-a4c5-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, CAST(N'2020-11-23T11:26:56.273' AS DateTime), CAST(N'2020-12-06T10:39:31.520' AS DateTime))
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'dab58e54-af37-eb11-a4d4-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, CAST(N'2020-12-06T10:39:43.083' AS DateTime), CAST(N'2020-12-06T13:35:54.730' AS DateTime))
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'13858b23-c837-eb11-a4d4-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-12-06T13:37:10.513' AS DateTime), CAST(N'2020-12-07T11:12:27.940' AS DateTime))
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'57443dcc-fb42-eb11-a4e3-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, CAST(N'2020-12-20T19:44:40.667' AS DateTime), CAST(N'2020-12-21T09:24:06.677' AS DateTime))
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
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'c02b8e6b-971b-eb11-a49c-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-31T16:37:53.093' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'd16beb53-b11b-eb11-a49c-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-31T19:43:20.340' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'3e6fe8a6-121c-eb11-a49d-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-01T07:20:00.837' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'a1aeb2c9-1d1c-eb11-a49d-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-01T08:39:43.657' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'a73762fc-341c-eb11-a49d-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-01T11:25:47.087' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'8539c55b-381c-eb11-a49d-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-01T11:49:55.820' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'e85c93a1-001e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T18:16:02.870' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'9090b81c-061e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T18:55:17.363' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'49d58f49-0d1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T19:46:39.083' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'444f7b7e-101e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T20:09:36.363' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'85849ea9-101e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T20:10:48.887' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'4013683a-111e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T20:14:51.647' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'272d715b-111e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T20:15:47.223' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'3a091042-1b1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:26:39.463' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'3b091042-1b1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:26:44.317' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'3c091042-1b1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:26:46.330' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'9e6b035c-1b1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:27:23.150' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'f2bb1581-1b1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:28:25.340' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'f3bb1581-1b1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:28:33.573' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'8eea31bb-1b1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:30:02.840' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'8fea31bb-1b1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:30:07.170' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'efd64800-1c1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:31:58.573' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'f0d64800-1c1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:32:00.910' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'83c22250-1c1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:34:12.717' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'87e12a5d-1c1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:34:34.587' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'e02a839d-1c1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:36:22.537' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'bcc00bbe-1c1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:37:17.120' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'309cc0dc-1c1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:38:08.633' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'3458d8e3-1c1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:38:20.543' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'7b298c0d-1d1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:39:30.500' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'7c298c0d-1d1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:39:36.247' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'7ad9ce02-1e1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:46:21.967' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'cdf0eea6-1e1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:50:57.330' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'74b9b7b9-1e1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:51:28.857' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'900139c3-1e1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:51:44.807' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'ff839c0a-1f1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:53:44.563' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'a5a94f46-1f1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:55:24.727' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'82b3cb60-1f1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:56:09.170' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'13d3d56c-1f1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:56:29.357' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'c6162694-1f1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:57:35.107' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'c7162694-1f1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:57:40.850' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'e5058f9d-1f1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:57:51.107' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'9083f7b8-1f1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:58:37.087' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'd37c28ce-1f1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:59:12.647' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'00fb66cb-221e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T22:20:36.303' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'7a792adb-221e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T22:21:02.947' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'5663e7b3-261e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T22:48:34.770' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'8c4894c4-261e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T22:49:03.043' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'fe1df4e2-311e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T00:08:38.173' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'eb567a90-321e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T00:13:29.437' AS DateTime), N'', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'5ab08862-641e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T06:10:07.177' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'78a36cd9-641e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T06:13:26.670' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'2478ea74-651e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T06:17:47.540' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'93c18bdb-651e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T06:20:39.723' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'a23773dd-661e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T06:27:52.393' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'0743924a-671e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T06:30:55.487' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'd4495c23-791e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T08:38:39.860' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'47ae282d-791e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T08:38:57.170' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'151ffe5b-791e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T08:40:15.720' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'81086aa1-791e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T08:42:12.100' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'14c2f704-7a1e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T08:44:59.303' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'15c2f704-7a1e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T08:45:03.780' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'09ad55e8-7a1e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T08:51:20.760' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'451b89f2-7a1e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T08:51:37.883' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'31a13ffe-7a1e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T08:51:57.533' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'dc3104e8-7d1e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T09:12:48.573' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'509c35f1-7d1e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T09:13:04.137' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'4e515223-7e1e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T09:14:28.050' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'807be78c-7e1e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T09:17:25.353' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'787694a1-7e1e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T09:18:00.047' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'463ef2bf-801e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T09:33:09.833' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'4f9f6cc7-801e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T09:33:22.530' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'af60e9b3-821e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T09:47:08.620' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'88985abb-821e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T09:47:21.277' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'77628fc4-821e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T09:47:36.720' AS DateTime), N'qPXxZ/RPSWTmyZje6CcRDA==', 0, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'78628fc4-821e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T09:47:43.843' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'28ab6491-a91e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T14:25:21.010' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'34157dd6-a81e-eb11-a4a2-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'a19b86f5-a91e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T14:28:09.230' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'a37310d2-a91e-eb11-a4a2-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'12e9fe00-aa1e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T14:28:28.483' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'a37310d2-a91e-eb11-a4a2-201a06a548bb')
GO
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'ac5663e4-321f-eb11-a4a3-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-05T06:48:21.310' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'8acc0638-341f-eb11-a4a3-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-05T06:57:51.357' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'd15d4c4f-3e1f-eb11-a4a3-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-05T08:10:05.217' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'b5ace5a9-3e1f-eb11-a4a3-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-05T08:12:37.367' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'03325d68-481f-eb11-a4a3-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-05T09:22:22.187' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'b4a3b867-a81e-eb11-a4a2-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'1221af76-481f-eb11-a4a3-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-05T09:22:46.407' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'4aa1d44a-152b-eb11-a4be-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-20T09:46:42.207' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'252b2bb2-bc2b-eb11-a4c1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-21T05:45:01.613' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'469da8ba-bc2b-eb11-a4c1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-21T05:45:16.033' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'c53cc603-c82b-eb11-a4c2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-21T07:06:02.460' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'205c56de-852c-eb11-a4c3-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-22T05:45:04.527' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'4c8c37c9-a02c-eb11-a4c3-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-22T08:57:45.453' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'2d8cf8b2-ed2c-eb11-a4c4-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-22T18:08:19.513' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'2b1da9bf-ed2c-eb11-a4c4-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-22T18:08:40.927' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'e3c251f2-5a2d-eb11-a4c5-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-23T07:10:20.583' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'7b2f66bc-7e2d-eb11-a4c5-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-23T11:26:32.223' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'6cf38cca-7e2d-eb11-a4c5-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-23T11:26:56.217' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'9aa17305-0633-eb11-a4ce-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-30T12:17:32.577' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'd9918fd8-9437-eb11-a4d4-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-06T07:30:00.023' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'7323ff47-9e37-eb11-a4d4-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-06T08:37:32.497' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'13c52080-a137-eb11-a4d4-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-06T09:00:35.160' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'4ec324ff-ae37-eb11-a4d4-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-06T10:37:11.720' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'd8b58e54-af37-eb11-a4d4-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-06T10:39:35.223' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'd9b58e54-af37-eb11-a4d4-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-06T10:39:43.010' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'ea031fe9-c237-eb11-a4d4-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-06T12:59:44.707' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'12858b23-c837-eb11-a4d4-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-06T13:37:10.413' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'5f9bb234-7438-eb11-a4d5-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-07T10:08:52.357' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'd49fc016-7d38-eb11-a4d5-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-07T11:12:27.623' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'd59fc016-7d38-eb11-a4d5-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-07T11:12:27.623' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'55e538b8-a442-eb11-a4e3-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-20T09:21:20.543' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'9c6180c3-ae42-eb11-a4e3-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-20T10:33:14.080' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'0df90b32-e642-eb11-a4e3-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-20T17:10:02.197' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'0ae6dd94-e642-eb11-a4e3-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-20T17:12:48.227' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'a297bae7-f142-eb11-a4e3-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-20T18:33:51.707' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'7c36084c-f442-eb11-a4e3-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-20T18:50:58.983' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'4007ff87-f442-eb11-a4e3-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-20T18:52:39.590' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'dbcc5fad-f542-eb11-a4e3-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-20T19:00:51.793' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'a2041eba-f542-eb11-a4e3-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-20T19:01:13.173' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'4dbefcc3-f542-eb11-a4e3-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-20T19:01:29.743' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'9ab4320d-f642-eb11-a4e3-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-20T19:03:32.563' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'e722aa42-f842-eb11-a4e3-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-20T19:19:21.257' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'70f13c78-e515-eb11-a495-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'5caa2454-f842-eb11-a4e3-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-20T19:19:50.580' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'c2c4be5a-f842-eb11-a4e3-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-20T19:20:01.660' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'70f13c78-e515-eb11-a495-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'3b30e616-f942-eb11-a4e3-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-20T19:25:26.253' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'3a30e616-f942-eb11-a4e3-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'b48e502e-f942-eb11-a4e3-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-20T19:25:56.607' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'b58e502e-f942-eb11-a4e3-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-20T19:26:04.833' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'3a30e616-f942-eb11-a4e3-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'56443dcc-fb42-eb11-a4e3-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-20T19:44:40.560' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'1802f5aa-1743-eb11-a4e3-201a06a548bb', N'127.0.0.1', NULL, NULL, NULL, NULL, CAST(N'2020-12-20T23:04:10.393' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'1902f5aa-1743-eb11-a4e3-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-20T23:04:10.393' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'06c30e43-6d43-eb11-a4e4-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-21T09:16:52.710' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'173f6147-6e43-eb11-a4e4-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-21T09:24:09.783' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'88615214-7443-eb11-a4e4-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-21T10:05:40.877' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'6a07d901-3e47-eb11-a4e9-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-26T05:48:41.747' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'ce8ca343-5747-eb11-a4e9-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-26T08:49:29.513' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'fd528cb9-1a48-eb11-a4ea-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-27T08:08:39.173' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'96b7cf68-2448-eb11-a4ea-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-27T09:17:58.697' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'3c093c05-ea48-eb11-a4eb-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-28T08:52:31.983' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'dd31f03c-ed48-eb11-a4eb-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-12-28T09:15:34.160' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'4da58522-054d-eb11-a4ef-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2021-01-02T14:16:42.170' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'33088742-094d-eb11-a4ef-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2021-01-02T14:46:13.840' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'e1332802-1e4d-eb11-a4ef-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2021-01-02T17:14:45.297' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'70f13c78-e515-eb11-a495-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'e4f9dd44-1e4d-eb11-a4ef-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2021-01-02T17:16:37.453' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'b4a3b867-a81e-eb11-a4a2-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'587c919c-1f4d-eb11-a4ef-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2021-01-02T17:26:14.087' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'a3574389-3c4d-eb11-a4ef-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2021-01-02T20:53:16.627' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'83e3acb5-3c4d-eb11-a4ef-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2021-01-02T20:54:31.617' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'b4a3b867-a81e-eb11-a4a2-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'8ab15ca0-4e4d-eb11-a4ef-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2021-01-02T23:02:46.513' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'58cd40d2-bd4d-eb11-a4f0-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2021-01-03T12:18:44.413' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'b4a3b867-a81e-eb11-a4a2-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'77c1411a-c94d-eb11-a4f0-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2021-01-03T13:39:29.693' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'e2ca159f-ca4d-eb11-a4f0-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2021-01-03T13:50:22.250' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'beec8d2f-764e-eb11-a4f1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2021-01-04T10:18:27.950' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'618e5cb4-0257-eb11-a500-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2021-01-15T07:24:29.987' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'169351fd-c257-eb11-a506-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2021-01-16T06:20:55.830' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'9824edb0-c457-eb11-a506-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2021-01-16T06:33:06.590' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'f99e788a-da57-eb11-a506-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2021-01-16T09:09:31.033' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'dd5ff616-df57-eb11-a506-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2021-01-16T09:42:04.717' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'8bd00a55-f657-eb11-a506-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2021-01-16T12:28:27.303' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'212d6103-f757-eb11-a506-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2021-01-16T12:33:19.780' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'073db9c2-fb57-eb11-a506-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2021-01-16T13:07:18.803' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'e02b84fb-fc57-eb11-a506-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2021-01-16T13:16:03.590' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'142ab837-fd57-eb11-a506-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2021-01-16T13:17:44.797' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'68d3bd3a-0358-eb11-a506-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2021-01-16T14:00:46.623' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'a92de4e0-4158-eb11-a506-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2021-01-16T21:29:22.363' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'a82de4e0-4158-eb11-a506-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'4156be00-4258-eb11-a506-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2021-01-16T21:30:07.837' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'a82de4e0-4158-eb11-a506-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'c71e13bd-4258-eb11-a506-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2021-01-16T21:35:23.803' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'9a27da82-8c58-eb11-a506-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2021-01-17T06:23:28.650' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'a9a50e2e-9458-eb11-a506-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2021-01-17T07:18:22.380' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[users] ([UUID], [username], [password], [email], [emailActivated], [phoneNumber], [phoneNumberActivated], [name], [surname], [profilPic], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [RUID], [MTUID]) VALUES (N'e07e65e7-1815-eb11-a494-201a06a548bb', N'doguskar', N'Qpf0SxOVUjUkWySXOZ16kw==', N'dogus.kar@hotmail.com', 0, N'5555555555', 0, N'Doğuş', N'Kar', NULL, CAST(N'2020-10-24T10:41:28.387' AS DateTime), 0, NULL, NULL, 1, 3)
INSERT [dbo].[users] ([UUID], [username], [password], [email], [emailActivated], [phoneNumber], [phoneNumberActivated], [name], [surname], [profilPic], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [RUID], [MTUID]) VALUES (N'70f13c78-e515-eb11-a495-201a06a548bb', N'dogus.kar', N'Qpf0SxOVUjUkWySXOZ16kw==', N'doguskar98@gmail.com', 0, N'5555555555', 0, N'Dogus', N'Kar', NULL, CAST(N'2020-10-24T10:41:28.387' AS DateTime), 0, NULL, NULL, 2, 2)
INSERT [dbo].[users] ([UUID], [username], [password], [email], [emailActivated], [phoneNumber], [phoneNumberActivated], [name], [surname], [profilPic], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [RUID], [MTUID]) VALUES (N'46783cc6-e515-eb11-a495-201a06a548bb', N'farmer1', N'Qpf0SxOVUjUkWySXOZ16kw==', N'farmer1@gmail.com', 0, N'5555555555', 0, N'Doğuş', N'Kar', NULL, CAST(N'2020-10-24T10:43:39.247' AS DateTime), 0, NULL, NULL, 2, 2)
INSERT [dbo].[users] ([UUID], [username], [password], [email], [emailActivated], [phoneNumber], [phoneNumberActivated], [name], [surname], [profilPic], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [RUID], [MTUID]) VALUES (N'ca89830c-341c-eb11-a49d-201a06a548bb', N'example', N'Qpf0SxOVUjUkWySXOZ16kw==', N'example@example.com', 0, N'5555555555', 0, N'Example', N'Example', NULL, CAST(N'2020-11-01T11:19:04.873' AS DateTime), 0, NULL, NULL, 2, 1)
INSERT [dbo].[users] ([UUID], [username], [password], [email], [emailActivated], [phoneNumber], [phoneNumberActivated], [name], [surname], [profilPic], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [RUID], [MTUID]) VALUES (N'b4a3b867-a81e-eb11-a4a2-201a06a548bb', N'doguskar1', N'Qpf0SxOVUjUkWySXOZ16kw==', N'doguskar1@hotmail.com', 0, N'5555555555', 0, N'Doğuş', N'Kar', NULL, CAST(N'2020-11-04T14:17:01.840' AS DateTime), 0, NULL, NULL, 2, 1)
INSERT [dbo].[users] ([UUID], [username], [password], [email], [emailActivated], [phoneNumber], [phoneNumberActivated], [name], [surname], [profilPic], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [RUID], [MTUID]) VALUES (N'34157dd6-a81e-eb11-a4a2-201a06a548bb', N'doguskar2', N'Qpf0SxOVUjUkWySXOZ16kw==', N'doguskar2@hotmail.com', 0, N'5555555555', 0, N'Doğuş', N'Kar', NULL, CAST(N'2020-11-04T14:20:07.677' AS DateTime), 0, NULL, NULL, 2, 1)
INSERT [dbo].[users] ([UUID], [username], [password], [email], [emailActivated], [phoneNumber], [phoneNumberActivated], [name], [surname], [profilPic], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [RUID], [MTUID]) VALUES (N'3ca79942-a91e-eb11-a4a2-201a06a548bb', N'doguskar3', N'Qpf0SxOVUjUkWySXOZ16kw==', N'doguskar3@hotmail.com', 0, N'5555555555', 0, N'Doğuş', N'Kar', NULL, CAST(N'2020-11-04T14:23:09.057' AS DateTime), 0, NULL, NULL, 2, 1)
INSERT [dbo].[users] ([UUID], [username], [password], [email], [emailActivated], [phoneNumber], [phoneNumberActivated], [name], [surname], [profilPic], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [RUID], [MTUID]) VALUES (N'a37310d2-a91e-eb11-a4a2-201a06a548bb', N'doguskar4', N'Qpf0SxOVUjUkWySXOZ16kw==', N'doguskar4@hotmail.com', 0, N'5555555555', 0, N'Doğuş', N'Kar', NULL, CAST(N'2020-11-04T14:27:09.750' AS DateTime), 0, NULL, NULL, 2, 1)
INSERT [dbo].[users] ([UUID], [username], [password], [email], [emailActivated], [phoneNumber], [phoneNumberActivated], [name], [surname], [profilPic], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [RUID], [MTUID]) VALUES (N'3a30e616-f942-eb11-a4e3-201a06a548bb', N'doguskar11', N'Qpf0SxOVUjUkWySXOZ16kw==', N'asd@hotmail.com', 0, NULL, 0, N'Dogus', N'Kar', NULL, CAST(N'2020-12-20T19:25:17.340' AS DateTime), 0, NULL, NULL, 2, 4)
INSERT [dbo].[users] ([UUID], [username], [password], [email], [emailActivated], [phoneNumber], [phoneNumberActivated], [name], [surname], [profilPic], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [RUID], [MTUID]) VALUES (N'a82de4e0-4158-eb11-a506-201a06a548bb', N'doguskar21', N'Qpf0SxOVUjUkWySXOZ16kw==', N'dogus.kar21@hotmail.com', 0, NULL, 0, N'Doğuş', N'Kar', NULL, CAST(N'2021-01-16T21:29:14.410' AS DateTime), 0, NULL, NULL, 2, 2)
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_codeType]    Script Date: 1/17/2021 11:00:56 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_codeType] ON [dbo].[codeType]
(
	[type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_COPTypes]    Script Date: 1/17/2021 11:00:56 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_COPTypes] ON [dbo].[COPTypes]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_users]    Script Date: 1/17/2021 11:00:56 AM ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [IX_users] UNIQUE NONCLUSTERED 
(
	[UUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Adds] ADD  CONSTRAINT [DF_Adds_AUID]  DEFAULT (newsequentialid()) FOR [AUID]
GO
ALTER TABLE [dbo].[Adds] ADD  CONSTRAINT [DF_Adds_createdDate]  DEFAULT (getutcdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Adds] ADD  CONSTRAINT [DF_Adds_confirmedFlag]  DEFAULT ((0)) FOR [confirmedFlag]
GO
ALTER TABLE [dbo].[Adds] ADD  CONSTRAINT [DF_Adds_publishedFlag]  DEFAULT ((0)) FOR [publishedFlag]
GO
ALTER TABLE [dbo].[Adds] ADD  CONSTRAINT [DF_Adds_deletedFlag]  DEFAULT ((0)) FOR [deletedFlag]
GO
ALTER TABLE [dbo].[categories] ADD  CONSTRAINT [DF_Categories_subCategoryFlag]  DEFAULT ((1)) FOR [endPointFlag]
GO
ALTER TABLE [dbo].[cRoles] ADD  CONSTRAINT [DF_cRoles_RUID]  DEFAULT (newsequentialid()) FOR [RUID]
GO
ALTER TABLE [dbo].[cRoles] ADD  CONSTRAINT [DF_cRoles_basicRoleFlag]  DEFAULT ((0)) FOR [basicRoleFlag]
GO
ALTER TABLE [dbo].[cRoles] ADD  CONSTRAINT [DF_cRoles_createdDate]  DEFAULT (getutcdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[cRoles] ADD  CONSTRAINT [DF_cRoles_deletedFlag]  DEFAULT ((0)) FOR [deletedFlag]
GO
ALTER TABLE [dbo].[cRoles] ADD  CONSTRAINT [DF_cRoles_can_create_property]  DEFAULT ((0)) FOR [can_create_property]
GO
ALTER TABLE [dbo].[entityCOPValues] ADD  CONSTRAINT [DF_EntityCOPValues_EUID]  DEFAULT (newsequentialid()) FOR [EUID]
GO
ALTER TABLE [dbo].[entityDetails] ADD  CONSTRAINT [DF_entityDetail_DUID]  DEFAULT (newsequentialid()) FOR [DUID]
GO
ALTER TABLE [dbo].[entityDetails] ADD  CONSTRAINT [DF_entityDetail_createdDate]  DEFAULT (getutcdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[entityDetails] ADD  CONSTRAINT [DF_entityDetails_deletedFlag]  DEFAULT ((0)) FOR [deletedFlag]
GO
ALTER TABLE [dbo].[entityOfFP] ADD  CONSTRAINT [DF_EntityOfFP_EUID]  DEFAULT (newsequentialid()) FOR [EUID]
GO
ALTER TABLE [dbo].[entityOfFP] ADD  CONSTRAINT [DF_entityOfFP_soldFlag]  DEFAULT ((0)) FOR [soldFlag]
GO
ALTER TABLE [dbo].[entityOfFP] ADD  CONSTRAINT [DF_EntityOfFP_createdDate]  DEFAULT (getutcdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[entityOfFP] ADD  CONSTRAINT [DF_entityOfFP_deletedFlag]  DEFAULT ((0)) FOR [deletedFlag]
GO
ALTER TABLE [dbo].[entityOfFP] ADD  CONSTRAINT [DF_entityOfFP_lastModifiedDate]  DEFAULT (getutcdate()) FOR [lastModifiedDate]
GO
ALTER TABLE [dbo].[farmEntities] ADD  CONSTRAINT [DF_farmEntities_EUID]  DEFAULT (newsequentialid()) FOR [EUID]
GO
ALTER TABLE [dbo].[farmEntities] ADD  CONSTRAINT [DF_farmEntities_createdDate]  DEFAULT (getutcdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[farmEntities] ADD  CONSTRAINT [DF_farmEntities_deletedFlag]  DEFAULT ((0)) FOR [deletedFlag]
GO
ALTER TABLE [dbo].[farmProperties] ADD  CONSTRAINT [DF_farmProperties_PUID]  DEFAULT (newsequentialid()) FOR [PUID]
GO
ALTER TABLE [dbo].[farmProperties] ADD  CONSTRAINT [DF_farmProperties_createdDate]  DEFAULT (getutcdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[farmProperties] ADD  CONSTRAINT [DF_farmProperties_deletedFlag]  DEFAULT ((0)) FOR [deletedFlag]
GO
ALTER TABLE [dbo].[farmProperties] ADD  CONSTRAINT [DF_farmProperties_lastModifiedDate]  DEFAULT (getutcdate()) FOR [lastModifiedDate]
GO
ALTER TABLE [dbo].[farms] ADD  CONSTRAINT [DF_farms_FUID]  DEFAULT (newsequentialid()) FOR [FUID]
GO
ALTER TABLE [dbo].[farms] ADD  CONSTRAINT [DF_farms_createdDate]  DEFAULT (getutcdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[farms] ADD  CONSTRAINT [DF_farms_deletedFlag]  DEFAULT ((0)) FOR [deletedFlag]
GO
ALTER TABLE [dbo].[farms] ADD  CONSTRAINT [DF_farms_lastModifiedDate]  DEFAULT (getutcdate()) FOR [lastModifiedDate]
GO
ALTER TABLE [dbo].[generatedUCodes] ADD  CONSTRAINT [DF_generatedUCodes_GUC]  DEFAULT (newid()) FOR [GUC]
GO
ALTER TABLE [dbo].[generatedUCodes] ADD  CONSTRAINT [DF_generatedUCodes_createdDate]  DEFAULT (getutcdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[generatedUCodes] ADD  CONSTRAINT [DF_generatedUCodes_valid]  DEFAULT ((1)) FOR [isValid]
GO
ALTER TABLE [dbo].[incomeAndExpeneses] ADD  CONSTRAINT [DF_incomeAndExpeneses_IEUID]  DEFAULT (newsequentialid()) FOR [IEUID]
GO
ALTER TABLE [dbo].[incomeAndExpeneses] ADD  CONSTRAINT [DF_incomeAndExpeneses_createdDate]  DEFAULT (getutcdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[incomeAndExpeneses] ADD  CONSTRAINT [DF_incomeAndExpeneses_deletedFlag]  DEFAULT ((0)) FOR [deletedFlag]
GO
ALTER TABLE [dbo].[Pictures] ADD  CONSTRAINT [DF_Pictures_PUID]  DEFAULT (newsequentialid()) FOR [PUID]
GO
ALTER TABLE [dbo].[propertyDetail] ADD  CONSTRAINT [DF_propertyDetail_DUID]  DEFAULT (newsequentialid()) FOR [DUID]
GO
ALTER TABLE [dbo].[propertyDetail] ADD  CONSTRAINT [DF_propertyDetail_createdDate]  DEFAULT (getutcdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[propertyDetail] ADD  CONSTRAINT [DF_propertyDetail_deletedFlag]  DEFAULT ((0)) FOR [deletedFlag]
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
ALTER TABLE [dbo].[addCOPValues]  WITH CHECK ADD  CONSTRAINT [FK_addCOPValues_Adds] FOREIGN KEY([AUID])
REFERENCES [dbo].[Adds] ([AUID])
GO
ALTER TABLE [dbo].[addCOPValues] CHECK CONSTRAINT [FK_addCOPValues_Adds]
GO
ALTER TABLE [dbo].[addCOPValues]  WITH CHECK ADD  CONSTRAINT [FK_addCOPValues_categoryOfProperties] FOREIGN KEY([PUID])
REFERENCES [dbo].[categoryOfProperties] ([PUID])
GO
ALTER TABLE [dbo].[addCOPValues] CHECK CONSTRAINT [FK_addCOPValues_categoryOfProperties]
GO
ALTER TABLE [dbo].[Adds]  WITH CHECK ADD  CONSTRAINT [FK_Adds_categories] FOREIGN KEY([CUID])
REFERENCES [dbo].[categories] ([CUID])
GO
ALTER TABLE [dbo].[Adds] CHECK CONSTRAINT [FK_Adds_categories]
GO
ALTER TABLE [dbo].[Adds]  WITH CHECK ADD  CONSTRAINT [FK_Adds_users] FOREIGN KEY([createdByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[Adds] CHECK CONSTRAINT [FK_Adds_users]
GO
ALTER TABLE [dbo].[Adds]  WITH CHECK ADD  CONSTRAINT [FK_Adds_users1] FOREIGN KEY([confirmedByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[Adds] CHECK CONSTRAINT [FK_Adds_users1]
GO
ALTER TABLE [dbo].[Adds]  WITH CHECK ADD  CONSTRAINT [FK_Adds_users2] FOREIGN KEY([deletedByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[Adds] CHECK CONSTRAINT [FK_Adds_users2]
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
ON DELETE CASCADE
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
ALTER TABLE [dbo].[entityCOPValues]  WITH CHECK ADD  CONSTRAINT [FK_entityCOPValues_entityOfFP1] FOREIGN KEY([EUID])
REFERENCES [dbo].[entityOfFP] ([EUID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[entityCOPValues] CHECK CONSTRAINT [FK_entityCOPValues_entityOfFP1]
GO
ALTER TABLE [dbo].[entityDetails]  WITH CHECK ADD  CONSTRAINT [FK_entityDetail_EntityOfFP] FOREIGN KEY([EUID])
REFERENCES [dbo].[entityOfFP] ([EUID])
GO
ALTER TABLE [dbo].[entityDetails] CHECK CONSTRAINT [FK_entityDetail_EntityOfFP]
GO
ALTER TABLE [dbo].[entityDetails]  WITH CHECK ADD  CONSTRAINT [FK_entityDetail_users] FOREIGN KEY([deletedByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[entityDetails] CHECK CONSTRAINT [FK_entityDetail_users]
GO
ALTER TABLE [dbo].[entityDetails]  WITH CHECK ADD  CONSTRAINT [FK_entityDetail_users1] FOREIGN KEY([createdByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[entityDetails] CHECK CONSTRAINT [FK_entityDetail_users1]
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
ALTER TABLE [dbo].[farmEntities]  WITH CHECK ADD  CONSTRAINT [FK_farmEntities_categories] FOREIGN KEY([CUID])
REFERENCES [dbo].[categories] ([CUID])
GO
ALTER TABLE [dbo].[farmEntities] CHECK CONSTRAINT [FK_farmEntities_categories]
GO
ALTER TABLE [dbo].[farmEntities]  WITH CHECK ADD  CONSTRAINT [FK_farmEntities_farms] FOREIGN KEY([FUID])
REFERENCES [dbo].[farms] ([FUID])
GO
ALTER TABLE [dbo].[farmEntities] CHECK CONSTRAINT [FK_farmEntities_farms]
GO
ALTER TABLE [dbo].[farmEntities]  WITH CHECK ADD  CONSTRAINT [FK_farmEntities_users] FOREIGN KEY([deletedByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[farmEntities] CHECK CONSTRAINT [FK_farmEntities_users]
GO
ALTER TABLE [dbo].[farmProperties]  WITH CHECK ADD  CONSTRAINT [FK_farmProperties_categories] FOREIGN KEY([CUID])
REFERENCES [dbo].[categories] ([CUID])
GO
ALTER TABLE [dbo].[farmProperties] CHECK CONSTRAINT [FK_farmProperties_categories]
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
ALTER TABLE [dbo].[incomeAndExpeneses]  WITH CHECK ADD  CONSTRAINT [FK_incomeAndExpeneses_users1] FOREIGN KEY([createdByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[incomeAndExpeneses] CHECK CONSTRAINT [FK_incomeAndExpeneses_users1]
GO
ALTER TABLE [dbo].[Pictures]  WITH CHECK ADD  CONSTRAINT [FK_Pictures_Adds] FOREIGN KEY([AUID])
REFERENCES [dbo].[Adds] ([AUID])
GO
ALTER TABLE [dbo].[Pictures] CHECK CONSTRAINT [FK_Pictures_Adds]
GO
ALTER TABLE [dbo].[propertyDetail]  WITH CHECK ADD  CONSTRAINT [FK_propertyDetail_farmProperties] FOREIGN KEY([PUID])
REFERENCES [dbo].[farmProperties] ([PUID])
GO
ALTER TABLE [dbo].[propertyDetail] CHECK CONSTRAINT [FK_propertyDetail_farmProperties]
GO
ALTER TABLE [dbo].[propertyDetail]  WITH CHECK ADD  CONSTRAINT [FK_propertyDetail_users] FOREIGN KEY([remainderCompletedByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[propertyDetail] CHECK CONSTRAINT [FK_propertyDetail_users]
GO
ALTER TABLE [dbo].[propertyDetail]  WITH CHECK ADD  CONSTRAINT [FK_propertyDetail_users1] FOREIGN KEY([deletedByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[propertyDetail] CHECK CONSTRAINT [FK_propertyDetail_users1]
GO
ALTER TABLE [dbo].[propertyDetail]  WITH CHECK ADD  CONSTRAINT [FK_propertyDetail_users2] FOREIGN KEY([createdByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[propertyDetail] CHECK CONSTRAINT [FK_propertyDetail_users2]
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
/****** Object:  StoredProcedure [dbo].[DeleteAdd]    Script Date: 1/17/2021 11:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteAdd]
@AUID uniqueidentifier,
@UUID uniqueidentifier
AS
BEGIN

	UPDATE Adds
	SET deletedFlag = 1, deletedByUUID = @UUID, deletedDate = GETUTCDATE()
	WHERE AUID = @AUID

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteFarm]    Script Date: 1/17/2021 11:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteFarm]
@FUID uniqueidentifier,
@UUID uniqueidentifier
AS
BEGIN

	UPDATE entityDetails
	SET deletedFlag = 1, deletedByUUID = @UUID, deletedDate = GETUTCDATE()
	WHERE EUID IN (SELECT EUID FROM entityOfFP WHERE PUID IN (SELECT PUID FROM farmProperties WHERE FUID = @FUID))

	UPDATE entityOfFP
	SET deletedFlag = 1, deletedByUUID = @UUID, deletedDate = GETUTCDATE()
	WHERE PUID IN (SELECT PUID FROM farmProperties WHERE FUID = @FUID)

	UPDATE farmProperties
	SET deletedFlag = 1, deletedByUUID = @UUID, deletedDate = GETUTCDATE()
	WHERE FUID = @FUID

	UPDATE farms
	SET deletedFlag = 1, deletedByUUID = @UUID, deletedDate = GETUTCDATE()
	WHERE FUID = @FUID

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteFarmEntity]    Script Date: 1/17/2021 11:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteFarmEntity]
@EUID uniqueidentifier,
@UUID uniqueidentifier
AS
BEGIN

	UPDATE farmEntities
	SET deletedFlag = 1, deletedByUUID = @UUID, deletedDate = GETUTCDATE()
	WHERE EUID = @EUID

	UPDATE farms SET lastModifiedDate = GETUTCDATE()
	WHERE FUID = (SELECT FUID FROM farmEntities WHERE EUID = @EUID)

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteFarmProperty]    Script Date: 1/17/2021 11:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteFarmProperty]
@PUID uniqueidentifier,
@UUID uniqueidentifier
AS
BEGIN
	UPDATE farmProperties
	SET deletedFlag = 1, deletedByUUID = @UUID, deletedDate = GETUTCDATE()
	WHERE PUID = @PUID

	UPDATE entityOfFP
	SET deletedFlag = 1, deletedByUUID = @UUID, deletedDate = GETUTCDATE()
	WHERE PUID = @PUID

	UPDATE entityDetails
	SET deletedFlag = 1, deletedByUUID = @UUID, deletedDate = GETUTCDATE()
	WHERE EUID IN (SELECT EUID FROM entityOfFP WHERE PUID = @PUID)
	
	DECLARE @FUID uniqueidentifier
	SELECT @FUID = FUID FROM farmProperties WHERE PUID = @PUID 
	UPDATE farms SET lastModifiedDate = GETUTCDATE()
	WHERE FUID = @FUID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteFPEntity]    Script Date: 1/17/2021 11:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteFPEntity]
@EUID uniqueidentifier,
@UUID uniqueidentifier
AS
BEGIN
	UPDATE entityOfFP
	SET deletedFlag = 1, deletedByUUID = @UUID, deletedDate = GETUTCDATE()
	WHERE EUID = @EUID
	
	UPDATE entityDetails
	SET deletedFlag = 1, deletedByUUID = @UUID, deletedDate = GETUTCDATE()
	WHERE EUID = @EUID
	
	DECLARE @PUID uniqueidentifier
	SELECT @PUID = PUID FROM entityOfFP WHERE EUID = @EUID 
	UPDATE farmProperties SET lastModifiedDate = GETUTCDATE()
	WHERE PUID = @PUID
	
	DECLARE @FUID uniqueidentifier
	SELECT @FUID = FUID FROM farmProperties WHERE PUID = @PUID 
	UPDATE farms SET lastModifiedDate = GETUTCDATE()
	WHERE FUID = @FUID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteIncomeAndExpenses]    Script Date: 1/17/2021 11:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteIncomeAndExpenses]
@IEUID uniqueidentifier,
@UUID uniqueidentifier
AS
BEGIN

	UPDATE incomeAndExpeneses
	SET deletedFlag = 1, deletedByUUID = @UUID, deletedDate = GETUTCDATE()
	WHERE IEUID = @IEUID
	
	DECLARE @FUID uniqueidentifier
	SELECT @FUID = FUID FROM incomeAndExpeneses WHERE IEUID = @IEUID 
	UPDATE farms SET lastModifiedDate = GETUTCDATE()
	WHERE FUID = @FUID
END
GO
/****** Object:  StoredProcedure [dbo].[InsertAdd]    Script Date: 1/17/2021 11:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertAdd]
@NAME nvarchar(50),
@DESCRIPTION nvarchar(max),
@PRICE money,
@CREATED_BY_UUID uniqueidentifier,
@CUID int
AS
BEGIN
	DECLARE @USER_ADD_LIMIT int 
	SELECT @USER_ADD_LIMIT = T.AdLimit FROM users AS U 
	INNER JOIN memberType T ON U.MTUID = T.MTUID
	WHERE UUID = @CREATED_BY_UUID

	DECLARE @USER_ADD_NUMBER int
	SELECT @USER_ADD_NUMBER = COUNT(A.AUID) FROM Adds AS A
	WHERE createdByUUID = @CREATED_BY_UUID AND deletedFlag != 1
	
	IF (@USER_ADD_NUMBER < @USER_ADD_LIMIT)
	BEGIN
		INSERT INTO Adds(name, description, createdByUUID, CUID, price)
		OUTPUT inserted.*
		VALUES(@NAME, @DESCRIPTION, @CREATED_BY_UUID, @CUID, @PRICE)
	END
	ELSE
	BEGIN
		SELECT TOP(0) * FROM Adds
	END 

END
GO
/****** Object:  StoredProcedure [dbo].[InsertDetailForEntityOfFP]    Script Date: 1/17/2021 11:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertDetailForEntityOfFP]
@EUID uniqueidentifier,
@NAME nvarchar(50),
@DESCRIPTION nvarchar(max),
@COST money,
@REMAINDER_DATE datetime,
@CREATED_BY_UUID uniqueidentifier
AS
BEGIN
	INSERT INTO entityDetails(EUID, name, description, cost, remainderDate, createdByUUID)
	OUTPUT inserted.*
	VALUES(@EUID, @NAME, @DESCRIPTION, @COST, @REMAINDER_DATE, @CREATED_BY_UUID)

	UPDATE entityOfFP SET lastModifiedDate = GETUTCDATE()
	WHERE EUID = @EUID

	DECLARE @PUID uniqueidentifier
	SELECT @PUID = PUID FROM entityOfFP WHERE EUID = @EUID 
	UPDATE farmProperties SET lastModifiedDate = GETUTCDATE()
	WHERE PUID = @PUID
	
	DECLARE @FUID uniqueidentifier
	SELECT @FUID = FUID FROM farmProperties WHERE PUID = @PUID 
	UPDATE farms SET lastModifiedDate = GETUTCDATE()
	WHERE FUID = @FUID

END
GO
/****** Object:  StoredProcedure [dbo].[InsertEntityCOPValue]    Script Date: 1/17/2021 11:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertEntityCOPValue]
@EUID uniqueidentifier,
@PUID int,
@VALUE nvarchar(max)
AS
BEGIN
	DECLARE @CUID_OF_ENTITY int
	SELECT @CUID_OF_ENTITY = E.CUID FROM entityOfFP AS E
	WHERE E.EUID = @EUID 

	DECLARE @PROPERTIES_OF_ENTITY table (PUID int, name nvarchar(50), TUID int, CUID int)
	INSERT INTO @PROPERTIES_OF_ENTITY 
	EXEC SelectPropertiesOfTheCategory @CUID_OF_ENTITY

	IF(EXISTS(SELECT * FROM @PROPERTIES_OF_ENTITY WHERE PUID = @PUID))
	BEGIN
		IF(NOT EXISTS(SELECT * FROM entityCOPValues WHERE EUID = @EUID AND PUID = @PUID))
		BEGIN
			INSERT INTO entityCOPValues(EUID, PUID, value)
			OUTPUT inserted.*
			VALUES(@EUID, @PUID, @VALUE)
		END
		ELSE
		BEGIN
			UPDATE entityCOPValues
			SET value = @VALUE
			OUTPUT inserted.*
			WHERE EUID = @EUID AND PUID = @PUID
		END
	END
	ELSE
	BEGIN
		SELECT TOP(0) * FROM entityCOPValues
	END
END
GO
/****** Object:  StoredProcedure [dbo].[InsertEntityForFP]    Script Date: 1/17/2021 11:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertEntityForFP]
@CUID int,
@PUID uniqueidentifier,
@ID nvarchar(50),
@NAME nvarchar(50),
@DESCRIPTION nvarchar(max),
@COUNT int,
@PURCHASED_DATE datetime,
@COST money,
@CREATED_BY_UUID uniqueidentifier
AS
BEGIN
	DECLARE @FARM_OWNER_UUID uniqueidentifier
	SELECT @FARM_OWNER_UUID = F.createdByUUID FROM farms AS F
	INNER JOIN farmProperties AS P ON F.FUID = P.FUID
	WHERE P.PUID = @PUID

	DECLARE @OWNER_ENTITY_LIMIT int 
	SELECT @OWNER_ENTITY_LIMIT = T.entityLimit FROM users AS U 
	INNER JOIN memberType T ON U.MTUID = T.MTUID
	WHERE U.UUID = @FARM_OWNER_UUID

	DECLARE @OWNER_ENTITY_NUMBER int
	SELECT @OWNER_ENTITY_NUMBER = COUNT(E.EUID) FROM entityOfFP AS E
	INNER JOIN farmProperties AS P ON P.PUID = E.PUID
	INNER JOIN farms AS F ON P.FUID = F.FUID
	WHERE F.createdByUUID = @FARM_OWNER_UUID
	
	IF (@OWNER_ENTITY_NUMBER < @OWNER_ENTITY_LIMIT)
	BEGIN
		INSERT INTO entityOfFP(CUID, PUID, ID, name, description, count, purchasedDate, cost, createdByUUID)
		OUTPUT inserted.*
		VALUES(@CUID, @PUID, @ID, @NAME, @DESCRIPTION, @COUNT, @PURCHASED_DATE, @COST, @CREATED_BY_UUID)

		UPDATE farmProperties SET lastModifiedDate = GETUTCDATE()
		WHERE PUID = @PUID
	
		DECLARE @FUID uniqueidentifier
		SELECT @FUID = FUID FROM farmProperties WHERE PUID = @PUID 
		UPDATE farms SET lastModifiedDate = GETUTCDATE()
		WHERE FUID = @FUID
	END
	ELSE
	BEGIN
		SELECT TOP(0) * FROM entityOfFP
	END 

END
GO
/****** Object:  StoredProcedure [dbo].[InsertExpense]    Script Date: 1/17/2021 11:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertExpense]
@FUID uniqueidentifier,
@DATE datetime,
@HEAD nvarchar(50),
@DESCRIPRION nvarchar(max),
@COST money,
@CREATED_BY_UUID uniqueidentifier
AS
BEGIN
	INSERT INTO incomeAndExpeneses(FUID, date, head, description, cost, createdByUUID, incomeFlag)
	OUTPUT inserted.*
	VALUES(@FUID, @DATE, @HEAD, @DESCRIPRION, @COST, @CREATED_BY_UUID, 0)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertFarm]    Script Date: 1/17/2021 11:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertFarm]
@NAME nvarchar(50),
@DESCRIPTION nvarchar(max),
@CREATED_BY_UUID uniqueidentifier
AS
BEGIN
	DECLARE @USER_FARM_LIMIT int 
	SELECT @USER_FARM_LIMIT = T.farmLimit FROM users AS U 
	INNER JOIN memberType T ON U.MTUID = T.MTUID
	WHERE UUID = @CREATED_BY_UUID

	DECLARE @USER_FARM_NUMBER int
	SELECT @USER_FARM_NUMBER = COUNT(F.FUID) FROM farms AS F
	WHERE createdByUUID = @CREATED_BY_UUID AND deletedFlag != 1
	
	IF (@USER_FARM_NUMBER < @USER_FARM_LIMIT)
	BEGIN
		INSERT INTO farms(name, description, createdByUUID)
		OUTPUT inserted.*
		VALUES(@NAME, @DESCRIPTION, @CREATED_BY_UUID)
	END
	ELSE
	BEGIN
		SELECT TOP(0) * FROM farms
	END 

END
GO
/****** Object:  StoredProcedure [dbo].[InsertFarmEntity]    Script Date: 1/17/2021 11:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertFarmEntity]
@NAME nvarchar(50),
@CUID int,
@FUID uniqueidentifier,
@COUNT int,
@CREATED_BY_UUID uniqueidentifier
AS
BEGIN
	INSERT INTO farmEntities(name, CUID, FUID, count, createdByUUID)
	OUTPUT inserted.*
	VALUES(@NAME, @CUID, @FUID, @COUNT, @CREATED_BY_UUID)

	UPDATE farms SET lastModifiedDate = GETUTCDATE()
	WHERE FUID = @FUID
END
GO
/****** Object:  StoredProcedure [dbo].[InsertFarmProperty]    Script Date: 1/17/2021 11:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertFarmProperty]
@NAME nvarchar(50),
@DESCRIPTION nvarchar(max),
@CUID int,
@FUID uniqueidentifier,
@CREATED_BY_UUID uniqueidentifier
AS
BEGIN
	DECLARE @FARM_OWNER_UUID uniqueidentifier
	SELECT @FARM_OWNER_UUID = createdByUUID FROM farms
	WHERE FUID = @FUID

	DECLARE @OWNER_PROPERTY_LIMIT int 
	SELECT @OWNER_PROPERTY_LIMIT = T.propertyLimit FROM users AS U 
	INNER JOIN memberType T ON U.MTUID = T.MTUID
	WHERE U.UUID = @FARM_OWNER_UUID

	DECLARE @OWNER_PROPERTY_NUMBER int
	SELECT @OWNER_PROPERTY_NUMBER = COUNT(P.PUID) FROM farmProperties AS P
	INNER JOIN farms AS F ON P.FUID = F.FUID
	WHERE F.createdByUUID = @FARM_OWNER_UUID
	
	IF (@OWNER_PROPERTY_NUMBER < @OWNER_PROPERTY_LIMIT)
	BEGIN
		INSERT INTO farmProperties(name, description, CUID, FUID, createdByUUID)
		OUTPUT inserted.*
		VALUES(@NAME, @DESCRIPTION, @CUID, @FUID, @CREATED_BY_UUID)

		UPDATE farms SET lastModifiedDate = GETUTCDATE()
		WHERE FUID = @FUID
	END
	ELSE
	BEGIN
		SELECT TOP(0) * FROM farmProperties
	END 

END
GO
/****** Object:  StoredProcedure [dbo].[InsertIncome]    Script Date: 1/17/2021 11:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertIncome]
@FUID uniqueidentifier,
@DATE datetime,
@HEAD nvarchar(50),
@DESCRIPRION nvarchar(max),
@COST money,
@CREATED_BY_UUID uniqueidentifier
AS
BEGIN
	INSERT INTO incomeAndExpeneses(FUID, date, head, description, cost, createdByUUID, incomeFlag)
	OUTPUT inserted.*
	VALUES(@FUID, @DATE, @HEAD, @DESCRIPRION, @COST, @CREATED_BY_UUID, 1)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertIncomeOrExpense]    Script Date: 1/17/2021 11:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertIncomeOrExpense]
@FUID uniqueidentifier,
@DATE datetime,
@HEAD nvarchar(50),
@DESCRIPRION nvarchar(max),
@COST money,
@CREATED_BY_UUID uniqueidentifier,
@INCOME_FLAG bit
AS
BEGIN
	INSERT INTO incomeAndExpeneses(FUID, date, head, description, cost, createdByUUID, incomeFlag)
	OUTPUT inserted.*
	VALUES(@FUID, @DATE, @HEAD, @DESCRIPRION, @COST, @CREATED_BY_UUID, @INCOME_FLAG)
	
	UPDATE farms SET lastModifiedDate = GETUTCDATE()
	WHERE FUID = @FUID
END
GO
/****** Object:  StoredProcedure [dbo].[InsertSession]    Script Date: 1/17/2021 11:00:56 AM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertUCodeForSignUp]    Script Date: 1/17/2021 11:00:56 AM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertUser]    Script Date: 1/17/2021 11:00:56 AM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectAllFarmsForUUID]    Script Date: 1/17/2021 11:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectAllFarmsForUUID]
@UUID uniqueidentifier
AS
BEGIN
	SELECT * 
	INTO #TEMP_FARMS
	FROM farms
	WHERE createdByUUID = @UUID

	SELECT *
	INTO #TEMP_COLLABORATORS
	FROM collaborators
	WHERE UUID = @UUID
	
	DECLARE @FUID uniqueidentifier
	SELECT TOP(1) @FUID = FUID FROM #TEMP_COLLABORATORS
	WHILE @FUID IS NOT NULL
	BEGIN
		INSERT INTO #TEMP_FARMS
		SELECT * FROM farms 
		WHERE FUID = @FUID

		DELETE #TEMP_COLLABORATORS WHERE FUID = @FUID
		SET @FUID = NULL
		SELECT TOP(1) @FUID = FUID FROM #TEMP_COLLABORATORS
	END

	SELECT * FROM #TEMP_FARMS WHERE deletedFlag = 0 OR deletedFlag = NULL
	ORDER BY lastModifiedDate DESC, createdDate DESC
	DROP TABLE #TEMP_FARMS
	DROP TABLE #TEMP_COLLABORATORS
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAllIncomeAndExpensesForUUID]    Script Date: 1/17/2021 11:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectAllIncomeAndExpensesForUUID]
@UUID uniqueidentifier
AS
BEGIN
	SELECT IE.* FROM incomeAndExpeneses as IE
	LEFT JOIN farms AS F ON IE.FUID = F.FUID
	WHERE F.createdByUUID = @UUID AND
	IE.deletedFlag = 0 AND
	F.deletedFlag = 0
	ORDER BY lastModifiedDate DESC, createdDate DESC
END
GO
/****** Object:  StoredProcedure [dbo].[SelectFailedSignInRequestsInTheLast5MinFromUUID]    Script Date: 1/17/2021 11:00:56 AM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectPropertiesOfTheCategory]    Script Date: 1/17/2021 11:00:56 AM ******/
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

	--SELECT P.*, T.name as typeName FROM @PROPERTIES as P
	--INNER JOIN COPTypes as T  ON P.TUID = T.TUID
	SELECT * FROM @PROPERTIES
END
GO
/****** Object:  StoredProcedure [dbo].[SelectRemaindersForUUID]    Script Date: 1/17/2021 11:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectRemaindersForUUID]
@UUID uniqueidentifier
AS
BEGIN
	SELECT * 
	INTO #TEMP_FARMS
	FROM farms
	WHERE createdByUUID = @UUID

	SELECT *
	INTO #TEMP_COLLABORATORS
	FROM collaborators
	WHERE UUID = @UUID
	
	DECLARE @FUID uniqueidentifier
	SELECT TOP(1) @FUID = FUID FROM #TEMP_COLLABORATORS
	WHILE @FUID IS NOT NULL
	BEGIN
		INSERT INTO #TEMP_FARMS
		SELECT * FROM farms 
		WHERE FUID = @FUID

		DELETE #TEMP_COLLABORATORS WHERE FUID = @FUID
		SET @FUID = NULL
		SELECT TOP(1) @FUID = FUID FROM #TEMP_COLLABORATORS
	END

	SELECT * FROM entityDetails 
	WHERE 
	EUID IN (SELECT EUID FROM entityOfFP
		WHERE PUID IN (SELECT PUID FROM farmProperties
				WHERE FUID IN (SELECT FUID FROM #TEMP_FARMS WHERE deletedFlag = 0 OR deletedFlag = NULL)
				AND deletedFlag = 0 OR deletedFlag = NULL
			)
		AND deletedFlag = 0 OR deletedFlag = NULL
		)
	AND remainderDate IS NOT NULL
	AND deletedFlag = 0 OR deletedFlag = NULL
	ORDER BY remainderCompletedDate DESC, createdDate DESC

	DROP TABLE #TEMP_FARMS
	DROP TABLE #TEMP_COLLABORATORS
END
GO
/****** Object:  StoredProcedure [dbo].[SelectUserFromSignInKey]    Script Date: 1/17/2021 11:00:56 AM ******/
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
