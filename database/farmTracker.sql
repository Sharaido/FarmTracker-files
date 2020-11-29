USE [master]
GO
/****** Object:  Database [farmTracker]    Script Date: 11/29/2020 1:04:49 PM ******/
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
/****** Object:  Table [dbo].[categories]    Script Date: 11/29/2020 1:04:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[CUID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[endPointFlag] [bit] NULL,
	[subCategoryOfCUID] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoryOfProperties]    Script Date: 11/29/2020 1:04:49 PM ******/
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
/****** Object:  Table [dbo].[codeType]    Script Date: 11/29/2020 1:04:50 PM ******/
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
/****** Object:  Table [dbo].[collaborators]    Script Date: 11/29/2020 1:04:50 PM ******/
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
/****** Object:  Table [dbo].[COPTypes]    Script Date: 11/29/2020 1:04:50 PM ******/
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
/****** Object:  Table [dbo].[COPValues]    Script Date: 11/29/2020 1:04:50 PM ******/
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
/****** Object:  Table [dbo].[cRoles]    Script Date: 11/29/2020 1:04:50 PM ******/
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
/****** Object:  Table [dbo].[entityCOPValues]    Script Date: 11/29/2020 1:04:50 PM ******/
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
/****** Object:  Table [dbo].[entityDetails]    Script Date: 11/29/2020 1:04:50 PM ******/
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
/****** Object:  Table [dbo].[entityOfFP]    Script Date: 11/29/2020 1:04:50 PM ******/
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
 CONSTRAINT [PK_EntityOfFP] PRIMARY KEY CLUSTERED 
(
	[EUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[farmProperties]    Script Date: 11/29/2020 1:04:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[farmProperties](
	[PUID] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[location] [nvarchar](50) NULL,
	[CUID] [int] NOT NULL,
	[FUID] [uniqueidentifier] NOT NULL,
	[createdByUUID] [uniqueidentifier] NOT NULL,
	[createdDate] [datetime] NULL,
	[deletedFlag] [bit] NOT NULL,
	[deletedDate] [datetime] NULL,
	[deletedByUUID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_farmProperties] PRIMARY KEY CLUSTERED 
(
	[PUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[farms]    Script Date: 11/29/2020 1:04:50 PM ******/
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
	[deletedFlag] [bit] NOT NULL,
	[deletedDate] [datetime] NULL,
	[deletedByUUID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_farms] PRIMARY KEY CLUSTERED 
(
	[FUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[generatedUCodes]    Script Date: 11/29/2020 1:04:50 PM ******/
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
/****** Object:  Table [dbo].[incomeAndExpeneses]    Script Date: 11/29/2020 1:04:50 PM ******/
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
/****** Object:  Table [dbo].[memberType]    Script Date: 11/29/2020 1:04:50 PM ******/
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
/****** Object:  Table [dbo].[roles]    Script Date: 11/29/2020 1:04:50 PM ******/
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
/****** Object:  Table [dbo].[sessions]    Script Date: 11/29/2020 1:04:50 PM ******/
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
/****** Object:  Table [dbo].[signIn_logs]    Script Date: 11/29/2020 1:04:50 PM ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 11/29/2020 1:04:50 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_users] UNIQUE NONCLUSTERED 
(
	[UUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_codeType]    Script Date: 11/29/2020 1:04:50 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_codeType] ON [dbo].[codeType]
(
	[type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_COPTypes]    Script Date: 11/29/2020 1:04:50 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_COPTypes] ON [dbo].[COPTypes]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
ALTER TABLE [dbo].[farmProperties] ADD  CONSTRAINT [DF_farmProperties_PUID]  DEFAULT (newsequentialid()) FOR [PUID]
GO
ALTER TABLE [dbo].[farmProperties] ADD  CONSTRAINT [DF_farmProperties_createdDate]  DEFAULT (getutcdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[farmProperties] ADD  CONSTRAINT [DF_farmProperties_deletedFlag]  DEFAULT ((0)) FOR [deletedFlag]
GO
ALTER TABLE [dbo].[farms] ADD  CONSTRAINT [DF_farms_FUID]  DEFAULT (newsequentialid()) FOR [FUID]
GO
ALTER TABLE [dbo].[farms] ADD  CONSTRAINT [DF_farms_createdDate]  DEFAULT (getutcdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[farms] ADD  CONSTRAINT [DF_farms_deletedFlag]  DEFAULT ((0)) FOR [deletedFlag]
GO
ALTER TABLE [dbo].[generatedUCodes] ADD  CONSTRAINT [DF_generatedUCodes_GUC]  DEFAULT (newid()) FOR [GUC]
GO
ALTER TABLE [dbo].[generatedUCodes] ADD  CONSTRAINT [DF_generatedUCodes_createdDate]  DEFAULT (getutcdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[generatedUCodes] ADD  CONSTRAINT [DF_generatedUCodes_valid]  DEFAULT ((1)) FOR [isValid]
GO
ALTER TABLE [dbo].[incomeAndExpeneses] ADD  CONSTRAINT [DF_incomeAndExpeneses_IEUID]  DEFAULT (newsequentialid()) FOR [IEUID]
GO
ALTER TABLE [dbo].[incomeAndExpeneses] ADD  CONSTRAINT [DF_incomeAndExpeneses_deletedFlag]  DEFAULT ((0)) FOR [deletedFlag]
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
/****** Object:  StoredProcedure [dbo].[DeleteFarm]    Script Date: 11/29/2020 1:04:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteFarm]
@FUID uniqueidentifier,
@UUID uniqueidentifier
AS
BEGIN

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
/****** Object:  StoredProcedure [dbo].[DeleteFarmProperty]    Script Date: 11/29/2020 1:04:50 PM ******/
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
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteFPEntity]    Script Date: 11/29/2020 1:04:50 PM ******/
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
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteIncomeAndExpenses]    Script Date: 11/29/2020 1:04:50 PM ******/
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

END
GO
/****** Object:  StoredProcedure [dbo].[InsertDetailForEntityOfFP]    Script Date: 11/29/2020 1:04:50 PM ******/
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
END
GO
/****** Object:  StoredProcedure [dbo].[InsertEntityCOPValue]    Script Date: 11/29/2020 1:04:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertEntityForFP]    Script Date: 11/29/2020 1:04:50 PM ******/
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
	END
	ELSE
	BEGIN
		SELECT TOP(0) * FROM entityOfFP
	END 

END
GO
/****** Object:  StoredProcedure [dbo].[InsertExpense]    Script Date: 11/29/2020 1:04:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertFarm]    Script Date: 11/29/2020 1:04:50 PM ******/
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
	WHERE createdByUUID = @CREATED_BY_UUID
	
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
/****** Object:  StoredProcedure [dbo].[InsertFarmProperty]    Script Date: 11/29/2020 1:04:50 PM ******/
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
	END
	ELSE
	BEGIN
		SELECT TOP(0) * FROM farmProperties
	END 

END
GO
/****** Object:  StoredProcedure [dbo].[InsertIncome]    Script Date: 11/29/2020 1:04:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertSession]    Script Date: 11/29/2020 1:04:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertUCodeForSignUp]    Script Date: 11/29/2020 1:04:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertUser]    Script Date: 11/29/2020 1:04:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectAllFarmsForUUID]    Script Date: 11/29/2020 1:04:50 PM ******/
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
	DROP TABLE #TEMP_FARMS
	DROP TABLE #TEMP_COLLABORATORS
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAllIncomeAndExpensesForUUID]    Script Date: 11/29/2020 1:04:50 PM ******/
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
END
GO
/****** Object:  StoredProcedure [dbo].[SelectFailedSignInRequestsInTheLast5MinFromUUID]    Script Date: 11/29/2020 1:04:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectPropertiesOfTheCategory]    Script Date: 11/29/2020 1:04:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectUserFromSignInKey]    Script Date: 11/29/2020 1:04:50 PM ******/
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
