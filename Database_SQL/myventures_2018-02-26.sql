USE [master]
GO
/****** Object:  Database [myventures]    Script Date: 2/26/2018 8:33:03 AM ******/
CREATE DATABASE [myventures]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'myventures', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.HISHAM\MSSQL\DATA\myventures.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'myventures_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.HISHAM\MSSQL\DATA\myventures_log.ldf' , SIZE = 1344KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [myventures] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [myventures].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [myventures] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [myventures] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [myventures] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [myventures] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [myventures] SET ARITHABORT OFF 
GO
ALTER DATABASE [myventures] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [myventures] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [myventures] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [myventures] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [myventures] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [myventures] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [myventures] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [myventures] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [myventures] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [myventures] SET  ENABLE_BROKER 
GO
ALTER DATABASE [myventures] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [myventures] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [myventures] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [myventures] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [myventures] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [myventures] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [myventures] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [myventures] SET RECOVERY FULL 
GO
ALTER DATABASE [myventures] SET  MULTI_USER 
GO
ALTER DATABASE [myventures] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [myventures] SET DB_CHAINING OFF 
GO
ALTER DATABASE [myventures] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [myventures] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [myventures] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'myventures', N'ON'
GO
USE [myventures]
GO
/****** Object:  Table [dbo].[Amenities]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amenities](
	[AmenitiesId] [int] IDENTITY(1,1) NOT NULL,
	[PropertyId] [int] NOT NULL,
	[AmenitiesTypeId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Amenities] PRIMARY KEY CLUSTERED 
(
	[AmenitiesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AmenitiesType]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AmenitiesType](
	[AmenitiesTypeId] [int] IDENTITY(1,1) NOT NULL,
	[AmenitiesTypeName] [varchar](256) NOT NULL,
	[SVG] [varchar](1024) NULL,
	[ParentTypeId] [int] NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.AmenitiesType] PRIMARY KEY CLUSTERED 
(
	[AmenitiesTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BlogViewItem]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BlogViewItem](
	[BlogViewItemId] [int] IDENTITY(1,1) NOT NULL,
	[BlogViewTypeId] [int] NOT NULL,
	[TypeName] [varchar](128) NOT NULL,
	[Type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.BlogViewItem] PRIMARY KEY CLUSTERED 
(
	[BlogViewItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BlogViewType]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BlogViewType](
	[BlogViewTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](1024) NOT NULL,
 CONSTRAINT [PK_dbo.BlogViewType] PRIMARY KEY CLUSTERED 
(
	[BlogViewTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cities]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cities](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CountryID] [int] NOT NULL,
	[CityName] [varchar](256) NOT NULL,
	[Latitude] [float] NOT NULL,
	[Longitude] [float] NOT NULL,
 CONSTRAINT [PK_dbo.cities] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Message] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
	[TypeNameId] [int] NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.Comments] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContactMessage]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactMessage](
	[ContactMessageId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Message] [ntext] NOT NULL,
 CONSTRAINT [PK_ContactMessage] PRIMARY KEY CLUSTERED 
(
	[ContactMessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Countries]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.Countries] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dmas]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dmas](
	[DmaId] [int] IDENTITY(1,1) NOT NULL,
	[CountryId] [int] NOT NULL,
	[DMA] [int] NOT NULL,
	[Market] [varchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.Dmas] PRIMARY KEY CLUSTERED 
(
	[DmaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FAQ]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAQ](
	[FAQid] [int] IDENTITY(1,1) NOT NULL,
	[Question] [ntext] NOT NULL,
	[Answer] [ntext] NOT NULL,
 CONSTRAINT [PK_FAQ] PRIMARY KEY CLUSTERED 
(
	[FAQid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Files]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Files](
	[FileId] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [varchar](256) NOT NULL,
	[mimeType] [varchar](256) NOT NULL,
	[TypeId] [int] NULL,
	[onCreated] [datetime] NOT NULL,
	[onModified] [datetime] NOT NULL,
	[FileTypeId] [int] NULL,
	[Description] [varchar](1024) NULL,
	[FileTypeName] [varchar](256) NULL,
 CONSTRAINT [PK_dbo.Files] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[History]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[History](
	[HistoryId] [int] IDENTITY(1,1) NOT NULL,
	[sortId] [int] NOT NULL,
	[Title] [varchar](256) NULL,
	[Text] [ntext] NULL,
	[onModified] [datetime] NOT NULL CONSTRAINT [DF_History_onModified]  DEFAULT (getdate()),
	[onCreated] [datetime] NOT NULL CONSTRAINT [DF_History_onCreated]  DEFAULT (getdate()),
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[HistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inquiries]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inquiries](
	[InquiryId] [int] IDENTITY(1,1) NOT NULL,
	[PropertyId] [int] NOT NULL,
	[Message] [datetime] NOT NULL,
	[UserId] [int] NOT NULL,
	[onCreated] [datetime] NOT NULL,
	[onModified] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Inquiries] PRIMARY KEY CLUSTERED 
(
	[InquiryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Location]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Location](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[StreetName] [varchar](256) NULL,
	[StreetNo] [varchar](256) NULL,
	[ZipCode] [bigint] NOT NULL CONSTRAINT [DF_Location_ZipCode]  DEFAULT ((0)),
	[Logitude] [float] NOT NULL CONSTRAINT [DF_Location_Logitude]  DEFAULT ((0)),
	[Latitude] [float] NOT NULL CONSTRAINT [DF_Location_Latitude]  DEFAULT ((0)),
	[CityId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Location] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MagzineCategory]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MagzineCategory](
	[MagzineCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](1024) NOT NULL,
 CONSTRAINT [PK_dbo.MagzineCategory] PRIMARY KEY CLUSTERED 
(
	[MagzineCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MagzineItems]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MagzineItems](
	[MagzineItemId] [int] IDENTITY(1,1) NOT NULL,
	[MagzineId] [int] NOT NULL,
	[BlogId] [int] NOT NULL,
	[BlogItemId] [int] NOT NULL,
	[Text] [ntext] NULL,
 CONSTRAINT [PK_dbo.MagzineItems] PRIMARY KEY CLUSTERED 
(
	[MagzineItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Magzines]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Magzines](
	[MagzineId] [int] IDENTITY(1,1) NOT NULL,
	[BlogViewTypeId] [int] NOT NULL,
	[Title] [varchar](1024) NOT NULL,
	[GUID] [varchar](1024) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Magzines] PRIMARY KEY CLUSTERED 
(
	[MagzineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MailsListing]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MailsListing](
	[MailId] [int] IDENTITY(1,1) NOT NULL,
	[MailTo] [ntext] NOT NULL,
	[Subject] [varchar](1024) NOT NULL,
	[Body] [ntext] NOT NULL,
 CONSTRAINT [PK_dbo.MailsListing] PRIMARY KEY CLUSTERED 
(
	[MailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Map]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Map](
	[MapId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](256) NOT NULL,
	[Description] [ntext] NULL,
	[PlaceholderImage] [varchar](256) NOT NULL,
	[MapImage] [varchar](256) NOT NULL,
 CONSTRAINT [PK_Map] PRIMARY KEY CLUSTERED 
(
	[MapId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PriceUnit]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PriceUnit](
	[PriceUnitId] [int] IDENTITY(1,1) NOT NULL,
	[PriceUnitName] [varchar](50) NOT NULL,
	[Amount] [numeric](18, 0) NOT NULL CONSTRAINT [DF_PriceUnit_Amount]  DEFAULT ((0)),
 CONSTRAINT [PK_dbo.PriceUnit] PRIMARY KEY CLUSTERED 
(
	[PriceUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Property]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Property](
	[PropertyId] [int] IDENTITY(1,1) NOT NULL,
	[TypeId] [int] NOT NULL,
	[Title] [varchar](256) NOT NULL,
	[SubTitle] [varchar](1024) NULL,
	[Description] [ntext] NULL,
	[pdf] [varchar](256) NULL,
	[guid] [varchar](256) NOT NULL,
	[LocationId] [int] NOT NULL,
	[Area] [float] NOT NULL,
	[AreaUnit] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[PriceUnit] [int] NOT NULL,
	[OfferPrice] [float] NOT NULL CONSTRAINT [DF_Property_OfferPrice]  DEFAULT ((0.0)),
	[Baths] [int] NOT NULL CONSTRAINT [DF_Property_Baths]  DEFAULT ((0)),
	[Beds] [int] NOT NULL CONSTRAINT [DF_Property_Beds]  DEFAULT ((0)),
	[Banner] [varchar](256) NULL,
	[isActive] [bit] NOT NULL CONSTRAINT [DF_Property_isActive]  DEFAULT ((1)),
	[VideoURL] [varchar](1024) NULL,
	[FeaturedBanner] [varchar](256) NULL,
	[HeaderBanner] [varchar](256) NULL,
	[isSold] [bit] NOT NULL CONSTRAINT [DF_Property_isSold]  DEFAULT ((0)),
 CONSTRAINT [PK_dbo.Property] PRIMARY KEY CLUSTERED 
(
	[PropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PropertyReviews]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyReviews](
	[ReviewId] [int] IDENTITY(1,1) NOT NULL,
	[PropertyId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Description] [ntext] NOT NULL,
	[IsVerified] [bit] NOT NULL CONSTRAINT [DF_PropertyReviews_IsVerified]  DEFAULT ((0)),
	[onCreated] [datetime] NOT NULL CONSTRAINT [DF_PropertyReviews_onCreated]  DEFAULT (getdate()),
	[onModified] [datetime] NOT NULL CONSTRAINT [DF_PropertyReviews_onModified]  DEFAULT (getdate()),
 CONSTRAINT [PK_PropertyReviews] PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PropertyType]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PropertyType](
	[PropertyTypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](256) NOT NULL,
	[ParentTypeId] [int] NULL,
 CONSTRAINT [PK_dbo.PropertyType] PRIMARY KEY CLUSTERED 
(
	[PropertyTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Regions]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Regions](
	[RegionId] [int] IDENTITY(1,1) NOT NULL,
	[CountryId] [int] NOT NULL,
	[Region] [varchar](50) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[ADM1Code] [varchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.Regions] PRIMARY KEY CLUSTERED 
(
	[RegionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Service]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Service](
	[ServiceId] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [varchar](1024) NOT NULL,
	[ServiceText] [ntext] NOT NULL,
	[Image] [varchar](256) NOT NULL,
	[Guid] [varchar](256) NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SiteMeta]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SiteMeta](
	[MetaId] [int] IDENTITY(1,1) NOT NULL,
	[MetaName] [varchar](500) NOT NULL,
	[MetaText] [ntext] NOT NULL,
 CONSTRAINT [PK_dbo.SiteMeta] PRIMARY KEY CLUSTERED 
(
	[MetaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SiteMetaMatch]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiteMetaMatch](
	[MatchMetaId] [int] IDENTITY(1,1) NOT NULL,
	[MetaParentId] [int] NOT NULL,
	[MetaChildId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.SiteMetaMatch] PRIMARY KEY CLUSTERED 
(
	[MatchMetaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tags]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tags](
	[TagId] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_dbo.Tags] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Units]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Units](
	[UnitId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.Units] PRIMARY KEY CLUSTERED 
(
	[UnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserDetails](
	[UserId] [int] NOT NULL,
	[Password] [int] NOT NULL,
	[Role] [int] NOT NULL,
	[RoleName] [varchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](256) NOT NULL,
	[Name] [varchar](256) NULL,
	[Phone] [varchar](256) NULL,
	[Subscribed] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[AmenityView]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AmenityView]
AS
SELECT        dbo.AmenitiesType.AmenitiesTypeId, dbo.AmenitiesType.AmenitiesTypeName, dbo.AmenitiesType.SVG, AmenitiesType_1.AmenitiesTypeId AS ParentAmenitiesTypeId, 
                         AmenitiesType_1.AmenitiesTypeName AS ParentAmenitiesTypeName, AmenitiesType_1.SVG AS ParentSVG
FROM            dbo.AmenitiesType INNER JOIN
                         dbo.AmenitiesType AS AmenitiesType_1 ON dbo.AmenitiesType.ParentTypeId = AmenitiesType_1.AmenitiesTypeId

GO
/****** Object:  View [dbo].[ContactMessageViewModel]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ContactMessageViewModel]
AS
SELECT        dbo.ContactMessage.ContactMessageId, dbo.ContactMessage.Message, dbo.Users.Email, dbo.Users.Name, dbo.Users.Phone, dbo.Users.UserId, dbo.Users.Subscribed
FROM            dbo.ContactMessage INNER JOIN
                         dbo.Users ON dbo.ContactMessage.UserId = dbo.Users.UserId

GO
/****** Object:  View [dbo].[PropertySmallView]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PropertySmallView]
AS
SELECT        dbo.cities.CityName, dbo.cities.Latitude AS CityLatitude, dbo.cities.Longitude AS CityLongitude, dbo.Location.Latitude, dbo.Location.Logitude, dbo.Location.StreetNo, dbo.Location.StreetName, dbo.PriceUnit.PriceUnitName, 
                         dbo.PriceUnit.PriceUnitId, dbo.Property.Title, dbo.Property.SubTitle, dbo.Property.Price, dbo.Property.OfferPrice, dbo.Property.Baths, dbo.Property.Beds, dbo.Property.Banner, dbo.Property.isActive, 
                         dbo.PropertyType.PropertyTypeId, dbo.PropertyType.TypeName AS PropertyTypeName, dbo.PropertyType.ParentTypeId, dbo.Property.Area, dbo.Property.AreaUnit, dbo.Units.Name AS AreaUnitName, dbo.Property.guid, 
                         dbo.Property.pdf, dbo.Property.Description, dbo.Property.PropertyId
FROM            dbo.cities INNER JOIN
                         dbo.Location ON dbo.cities.CityId = dbo.Location.CityId INNER JOIN
                         dbo.Property ON dbo.Location.LocationId = dbo.Property.LocationId INNER JOIN
                         dbo.PriceUnit ON dbo.Property.PriceUnit = dbo.PriceUnit.PriceUnitId INNER JOIN
                         dbo.PropertyType ON dbo.Property.TypeId = dbo.PropertyType.PropertyTypeId INNER JOIN
                         dbo.Units ON dbo.Property.AreaUnit = dbo.Units.UnitId

GO
/****** Object:  View [dbo].[PropertyView]    Script Date: 2/26/2018 8:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PropertyView]
AS
SELECT        dbo.cities.CityName, dbo.cities.Latitude AS CityLatitude, dbo.cities.Longitude AS CityLongitude, dbo.Location.Latitude, dbo.Location.Logitude, dbo.Location.StreetNo, dbo.Location.StreetName, dbo.PriceUnit.PriceUnitName, 
                         dbo.PriceUnit.PriceUnitId, dbo.Property.Title, dbo.Property.SubTitle, dbo.Property.Price, dbo.Property.OfferPrice, dbo.Property.Baths, dbo.Property.Beds, dbo.Property.Banner, dbo.Property.isActive, 
                         dbo.PropertyType.PropertyTypeId, dbo.PropertyType.TypeName AS PropertyTypeName, dbo.PropertyType.ParentTypeId, dbo.Property.Area, dbo.Property.AreaUnit, dbo.Units.Name AS AreaUnitName, dbo.Property.guid, 
                         dbo.Property.pdf, dbo.Property.Description, dbo.Property.PropertyId, dbo.Property.Price * dbo.PriceUnit.Amount AS CalculatedPrice, dbo.Property.VideoURL
FROM            dbo.cities INNER JOIN
                         dbo.Location ON dbo.cities.CityId = dbo.Location.CityId INNER JOIN
                         dbo.Property ON dbo.Location.LocationId = dbo.Property.LocationId INNER JOIN
                         dbo.PriceUnit ON dbo.Property.PriceUnit = dbo.PriceUnit.PriceUnitId INNER JOIN
                         dbo.PropertyType ON dbo.Property.TypeId = dbo.PropertyType.PropertyTypeId INNER JOIN
                         dbo.Units ON dbo.Property.AreaUnit = dbo.Units.UnitId

GO
SET IDENTITY_INSERT [dbo].[Amenities] ON 

INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (19, 4, 3)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (20, 4, 6)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (21, 4, 11)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (22, 4, 15)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (23, 4, 16)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (24, 4, 20)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (25, 4, 21)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (26, 4, 24)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (27, 4, 30)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (28, 5, 3)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (29, 5, 4)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (30, 5, 11)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (1028, 6, 3)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (1029, 6, 6)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (1030, 6, 9)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (1031, 6, 11)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (1032, 6, 12)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (1033, 6, 20)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (1034, 6, 24)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (1035, 6, 26)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (1036, 6, 27)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (2028, 1006, 7)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (2029, 1006, 16)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (2030, 1006, 20)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (2031, 1006, 24)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (3028, 1008, 3)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (3029, 1008, 4)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (3030, 1008, 7)
SET IDENTITY_INSERT [dbo].[Amenities] OFF
SET IDENTITY_INSERT [dbo].[AmenitiesType] ON 

INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (2, N'Main Features', NULL, NULL, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (3, N'Balcony or Terrace', NULL, 2, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (4, N'Parking Spaces', NULL, 2, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (5, N'Public Parking', NULL, 2, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (6, N'Electricity  Backup', NULL, 2, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (7, N'Elevator or Lift', NULL, 2, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (8, N'Plot Features', NULL, NULL, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (9, N'Sewerage', NULL, 8, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (11, N'Water Supply', NULL, 8, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (12, N'Sui Gas', NULL, 8, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (13, N'Accessible by Road', NULL, 8, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (14, N'Bussiness and Communication', NULL, NULL, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (15, N'Broadband Internet Access', NULL, 14, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (16, N'Satellite or Cable TV Ready', NULL, 14, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (17, N'Community Features', NULL, NULL, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (18, N'Community Swimming Pool', NULL, 17, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (19, N'Community GYM', NULL, 17, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (20, N'Community Mosque', NULL, 17, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (21, N'Community Centre', NULL, 17, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (22, N'Nearby Locations and Other Facilities', NULL, NULL, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (23, N'Nearby Schools', NULL, 22, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (24, N'Nearby Hospitals', NULL, 22, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (25, N'Nearby Shopping Malls', NULL, 22, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (26, N'Nearby Restaurants', NULL, 22, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (27, N'Nearby Public Transport Service', NULL, 22, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (28, N'Other Facilities', NULL, NULL, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (29, N'Security Staff', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (30, N'CCTV Security Installed', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (32, N'Separate kitchen', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (33, N'Terrace', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (34, N'Heating', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (35, N'Smoking allowed', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (36, N'Linen & towels', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (37, N'Air conditioning', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (38, N'Wheelchair access', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (39, N'Swimming pool', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (40, N'Pets allowed', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (41, N'Elevator', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (42, N'Parking', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (43, N'Internet', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (44, N'Baby Cot', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (45, N'000 LBS Boat Left', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (46, N'3 Parking Spots', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (47, N'A/C Climate Control', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (48, N'Air Condition', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (49, N'Airport Shuttles Service', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (50, N'Balcony', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (51, N'Bar', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (52, N'Bar & Restaurants on premises', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (53, N'Bathroom', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (54, N'Bay View', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (55, N'BBQ Area', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (56, N'Beachfront', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (57, N'Beauty Salon', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (58, N'Boat Dock', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (59, N'Cable', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (60, N'Cable Satellite', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (61, N'Car Hire', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (62, N'Catering Services', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (63, N'Central Air', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (64, N'Cinema', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (65, N'Coffee', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (66, N'Complimentary Breakfast', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (67, N'Computer', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (68, N'Convention Floor', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (69, N'Courtyard', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (70, N'Cove View', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (71, N'Covered Parking', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (72, N'Daily Housekeeping', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (73, N'Deck', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (74, N'Dining and Living Room', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (75, N'Double Bed', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (76, N'Eat-in Kitchen', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (77, N'Exhibition/Convention Floor', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (78, N'Fireplace', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (79, N'Fitness', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (80, N'Free toiletries', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (81, N'Game Room', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (82, N'Garage', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (83, N'Grill', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (84, N'Guest Bathroom', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (85, N'Gulf View', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (86, N'Hairdresser', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (87, N'Home Theater', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (88, N'Hot Tub', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (89, N'Hotspot', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (90, N'Housekeeping', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (91, N'Huge Pool Area', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (92, N'Indoor Pool', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (93, N'Infinity Edge Pool', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (94, N'Internet Connection', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (95, N'Ironing Facility', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (96, N'Jacuzzi', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (97, N'King Size Bed', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (98, N'Kitchen', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (99, N'Laundry', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (100, N'Lines Provided', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (101, N'Living and Dining Room', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (102, N'Lounges', NULL, 28, 1)
GO
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (103, N'Marble Decks', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (104, N'Marble Floors', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (105, N'Microwave', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (106, N'Multiple TV', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (107, N'Nice Furniture', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (108, N'No Smoking', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (109, N'Oceanfront', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (110, N'Outdoor', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (111, N'Outdoor Bar', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (112, N'Outdoor Gym', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (113, N'Outdoor Pool', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (114, N'Patio', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (115, N'Pay-per-view Channels', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (116, N'Pool', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (117, N'Pool & Jacuzzi', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (118, N'Private Bathroom', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (119, N'Private Volley Ball Court', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (120, N'Restaurant', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (121, N'Room Service', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (122, N'Safety Deposit Box', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (123, N'Sauna', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (124, N'Seating Area', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (125, N'Shops', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (126, N'Shower', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (127, N'SPA', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (128, N'Spacious Front Yard', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (129, N'Stove', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (130, N'Suitable For Children', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (131, N'Telephone', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (132, N'Television', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (133, N'Three Floors', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (134, N'Tiki Hut', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (135, N'Toilet', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (136, N'Tropical Backyard', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (137, N'Valet Cleaning', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (138, N'Wakeup Service', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (139, N'Waterfront', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (140, N'WiFi', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (141, N'Cookware & Kitchen Utensils', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (142, N'Crockery & Cutlery', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (143, N'Iron & Ironing Board', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (144, N'Drying Rack', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (145, N'Hair Dryer', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (146, N'Bed Linen & Towels', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (147, N'Toiletries', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (148, N'Central Heating', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (149, N'Washing Machine', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (150, N'Dishwasher', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (151, N'kettle', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (152, N'Cable TV', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (153, N'Alarm Clock', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (154, N'Stereo', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (155, N'DVD', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (156, N'CD player', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (157, N'bidet', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (158, N'cupboard', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (159, N'vanity cupboard', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (160, N'built-in wardrobes', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (161, N'night table', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (162, N'night tables', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (163, N'reading lamps', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (164, N'desk', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (165, N'TV', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (166, N'chest of drawers', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (167, N'Small Balcony', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (168, N'Lounge', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (169, N'cooking hob', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (170, N'oven', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (171, N'cooker', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (172, N'electric kettle', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (173, N'toaster', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (174, N'plates', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (175, N'pans', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (176, N'fridge / freezer', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (177, N'fridge', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (178, N'washing machine with drier', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (179, N'coffee maker', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (180, N'dish rack', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (181, N'vacuum cleaner', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (182, N'gas/electric hob', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (183, N'breakfast bar and stools', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (184, N'freezer', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (185, N'kitchenette', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (186, N'armchairs', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (187, N'coffee table', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (188, N'TV (local channels only)', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (189, N'satellite TV', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (190, N'sofa', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (191, N'lamp', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (192, N'table and chairs', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (193, N'shelves', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (194, N'radio', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (195, N'double sofa bed', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (196, N'wardrobe', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (197, N'double sofa', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (198, N'Help Desk', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (199, N'High Chairs', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (200, N'Extra Bed', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (201, N'Mattress', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (202, N'Airport Pick-up Service', NULL, 28, 1)
GO
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (203, N'Maid Service', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (204, N'Dry Cleaning & Laundry', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (205, N'Dry Cleaning', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (206, N'Breakfast', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (207, N'sofabed', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (208, N'washbasin ', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (209, N'dining table', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (210, N'Fan', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (211, N'Wheelchair access possible', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (212, N'A Gym is in the building for guests to use', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (213, N'On street parking', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (214, N'Underground parking', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (215, N'Guarded parking', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (216, N'Fax Machine', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (217, N'bathtub', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (218, N'single bed', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (219, N'DVD player', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (220, N'city maps', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (221, N'FREE internet access', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (222, N'garden', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (223, N'Wood burning fireplace', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (224, N'Upon weekly stays: maidservice including personal laundry / ironing', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (225, N'armchair', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (226, N'Free Wireless Internet', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (227, N'Home Theatre', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (228, N'Cell Phone Rentals', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (229, N'Complimentary Tea & Coffee', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (230, N'Espresso-Machine', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (231, N'Towels', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (232, N'Health Club', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (233, N'BBQ grill', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (234, N'en suite bathroom', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (235, N'Ice Maker', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (236, N'Video game system', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (237, N'Computer rental', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (238, N'blender', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (239, N'High speed Internet access', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (240, N'dining room', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (241, N'Pair of twin beds', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (242, N'Bunk Bed', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (243, N'Heated towel bar', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (244, N'Free weekly cleaning', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (245, N'street', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (246, N'Annex Room', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (247, N'chairs', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (248, N'Business centre', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (249, N'Downtown', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (250, N'Queen size bed', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (251, N'Fan(s) on request', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (252, N'Iron/Ironing board on request', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (253, N'Luggage Storage Facilities', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (254, N'mirror', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (255, N'Private parking', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (256, N'cupboards', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (257, N'Table', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (258, N'Chair', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (259, N'Sea', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (260, N'En suite shower', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (261, N'Bed Linen', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (262, N'Iron', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (263, N'Ironing Board', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (264, N'Canal view', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (265, N'Pets are welcome', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (266, N'Free cot in the apartment', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (267, N'Free cot on request', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (268, N'Concierge', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (269, N'Washer dryer', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (270, N'Dryer', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (271, N'Safe', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (272, N'Ski Storage', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (273, N'Mountain View', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (274, N'Seaview', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (275, N'Fitness Room', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (276, N'Steam room', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (277, N'Slope View', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (278, N'Hot Tub (Private)', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (279, N'Hot Tub (Common)', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (280, N'Laundry (Private)', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (281, N'Laundry (Common)', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (282, N'Minibar', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (283, N'Doorman', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (284, N'Breakfast Room', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (285, N'Meeting Room', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (286, N'Children Area', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (287, N'Ski In and Out', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (288, N'Pull-Out Bed', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (289, N'Garden (Private)', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (290, N'Garden (Common)', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (291, N'Reception', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (292, N'Laundry Service', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (293, N'Adjoining Rooms', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (294, N'Outlet Adapters', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (295, N'Airline Desk', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (296, N'Meal Plan - American', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (297, N'ATM/Cash Machine', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (298, N'Audio Visual Equipment', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (299, N'Babysitting/Child Services', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (300, N'Barber Shop', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (301, N'On The Bay', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (302, N'Meal Plan - Bed and Breakfast', NULL, 28, 1)
GO
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (303, N'Baby Listening Device', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (304, N'Beach View', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (305, N'Beach', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (306, N'Barber/Beauty Shop', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (307, N'Porters', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (308, N'Bicycle Rentals', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (309, N'Blackboard', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (310, N'Billiards / Pool Tables', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (311, N'Boating', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (312, N'Boutiques', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (313, N'Bowling', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (314, N'Meal Plan - Bermuda', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (315, N'Braille Elevator', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (316, N'Breakfast Buffet', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (317, N'Bathroom Telephone', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (318, N'Canopy / Poster Bed', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (319, N'Car Rental Desk', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (320, N'Casino', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (321, N'Castle Room', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (322, N'Meal Plan - Caribbean', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (323, N'Ceiling Fan', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (324, N'City View', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (325, N'Conference Facilities', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (326, N'Conference Suite', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (327, N'Continental Breakfast', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (328, N'Coffee Shop', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (329, N'Coffee Maker in Room', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (330, N'Computer in Room', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (331, N'Concierge Desk', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (332, N'Connecting Rooms', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (333, N'Meal Plan - Continental', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (334, N'Copy Service', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (335, N'Cordless Phone', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (336, N'Cribs Available', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (337, N'Courtesy Car', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (338, N'City Center', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (339, N'Currency Exchange', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (340, N'Data port Available', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (341, N'24 Hour Front Desk', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (342, N'Dining Guide', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (343, N'Dinner', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (344, N'Handicapped Rooms/Facilities', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (345, N'Disco', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (346, N'Doctor on Call', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (347, N'Drugstore', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (348, N'Driving Range', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (349, N'Desk with lamp', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (350, N'Electronic Door Locks', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (351, N'Email Service', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (352, N'Live Entertainment', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (353, N'Meal Plan - European', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (354, N'Express Check In', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (355, N'Executive Desk', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (356, N'Express Checkout', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (357, N'Executive Level', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (358, N'Meal Plan - FAP/Full-board', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (359, N'Full English Breakfast', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (360, N'Female Executive Rooms', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (361, N'Fishing', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (362, N'Florist', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (363, N'Free Parking', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (364, N'Free Local Telephone Calls', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (365, N'Free Transportation', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (366, N'Garden View', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (367, N'Gift Shop', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (368, N'Game Rental', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (369, N'Golf', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (370, N'Golf Course View', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (371, N'Horseback Riding', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (372, N'Jogging Track', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (373, N'Kennels', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (374, N'Childrens Activities', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (375, N'Lake View', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (376, N'Guest Laundromat', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (377, N'Lunch', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (378, N'Meal Plan - MAP/Half-board', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (379, N'Massage', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (380, N'Miniature Golf', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (381, N'In Room Movies', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (382, N'Meeting Facilities', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (383, N'Meeting Suite', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (384, N'Multilingual', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (385, N'Nursery for Children', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (386, N'No Smoking Rooms/Facilities', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (387, N'Night Club', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (388, N'Free Newspaper', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (389, N'News Stand', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (390, N'Ocean View', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (391, N'Overhead Projector', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (392, N'Parasailing', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (393, N'Park View', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (394, N'No Pets Allowed', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (395, N'Phone Service', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (396, N'Picnic Area/Tables', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (397, N'Play Ground', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (398, N'Heated Pool', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (399, N'Childrens Pool', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (400, N'Poolside Snackbar', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (401, N'Projector', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (402, N'Squash', NULL, 28, 1)
GO
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (403, N'River View', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (404, N'Ramp Access to Buildings', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (405, N'24 Hour Room Service', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (406, N'Safe Deposit', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (407, N'Sailing', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (408, N'Scuba Diving', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (409, N'Secretarial Service', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (410, N'24 Hour Security', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (411, N'Shopping Mall', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (412, N'Free Airport Shuttle', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (413, N'Skeet Shooting', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (414, N'Skiing', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (415, N'Cross Country Skiing', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (416, N'Snorkeling', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (417, N'Snowboarding', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (418, N'Fitness Center or Spa', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (419, N'Steam Bath', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (420, N'Telex', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (421, N'Indoor Tennis', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (422, N'Tennis', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (423, N'Outdoor Tennis', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (424, N'Tour Desk', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (425, N'Translation Service', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (426, N'Laundry Services', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (427, N'Vending Machines', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (428, N'VIP Rooms/Services', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (429, N'Volleyball', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (430, N'Wake-up Service', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (431, N'Wedding Services', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (432, N'Wind Surfing', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (433, N'Water Skiing', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (434, N'Grab Bars in Bathroom', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (435, N'Heated Guest Rooms', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (436, N'Modem in Room', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (437, N'Murphy Bed', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (438, N'Rollaway Beds', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (439, N'Bathrobes', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (440, N'Smoke Detectors', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (441, N'Solarium', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (442, N'Sprinklers In Rooms', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (443, N'Theater Desk', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (444, N'Temperature Control', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (445, N'Trouser Press', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (446, N'Ipod Dock', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (447, N'Hi-Fi', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (448, N'Duty Free Shop', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (449, N'Wireless Internet', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (450, N'Outdoor Parking', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (451, N'Valet Parking', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (452, N'Prayer Mats', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (453, N'Racquetball Courts', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (454, N'Refrigerator', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (455, N'Smoking', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (456, N'Chef Provided', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (457, N'Marina View', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (458, N'Free parking on the street', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (459, N'Paid parking on the street', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (460, N'Free parking with garage', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (461, N'Paid parking with garage', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (462, N'Free cable internet', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (463, N'Paid cable internet', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (464, N'Paid wireless internet', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (465, N'Paid cot on request', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (466, N'Petanque', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (467, N'Ask for smoking', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (468, N'Ask for pets', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (469, N'Ask for accessibility', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (470, N'Communal pool', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (471, N'Private pool', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (472, N'Ping-pong table', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (473, N'Breakfast booking possible', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (474, N'House cleaning optional', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (475, N'Sports - swimming', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (476, N'Local hospital', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (477, N'Local groceries', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (478, N'Near ocean', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (479, N'Shared Kitchen', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (480, N'Shared Swimming Pool', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (481, N'Family/kids friendly', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (482, N'Laptop workspace', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (483, N'Juicer', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (484, N'Security camera at entrance', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (485, N'MP3', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (486, N'Gym', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (487, N'Paddle', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (488, N'Taxi access', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (489, N'Rooftop access', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (490, N'Baby high chair', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (491, N'Baby cot paid', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (492, N'Baby chair on request', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (493, N'High chair on request', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (494, N'Pets paid', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (495, N'Pets accepted under request', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (496, N'Stroller', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (497, N'Baby cutlery', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (498, N'Internet connection on request', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (499, N'Cable TV on request', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (500, N'Dry cleaning on request', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (501, N'Free international calls', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (502, N'Chimney', NULL, 28, 1)
GO
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (503, N'TV 3D', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (504, N'Smart TV', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (505, N'Free car', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (506, N'Free bike', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (507, N'Credit card payment accepted', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (508, N'No parties', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (509, N'No children under 4', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (510, N'No children under 12', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (511, N'Anyone under 25 years', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (512, N'Anyone under 30 years', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (513, N'Anyone under 35 years', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (514, N'Anyone under 18 years', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (515, N'No reservation more than 30 days', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (516, N'Groups under 18 years', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (517, N'Groups under 25 years', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (518, N'Groups under 30 years', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (519, N'Groups under 35 years', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (520, N'Only families', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (521, N'Anyone under 40 years', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (522, N'No children under 6', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (523, N'Groups under 50 years', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (524, N'Same sex groups under 30 years', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (525, N'Groups under 45 years', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (526, N'Same sex groups under 35 years', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (527, N'Arrivals on Sunday', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (528, N'Families or couples only', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (529, N'Baby high chair paid', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (530, N'Baby chair paid', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (531, N'Wifi USB Adapter', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (532, N'Bottled water', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (533, N'Centrally controlled ventilation', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (534, N'Electrical adapters available', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (535, N'Hypoallergenic rooms', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (536, N'Internet browser TV', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (537, N'Power converters', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (538, N'Sewing kit', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (539, N'Printer', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (540, N'Slippers', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (541, N'Sound system', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (542, N'Sound proofed windows', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (543, N'Weighting scale', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (544, N'Run of the house', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (545, N'Window	', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (546, N'Veranda', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (547, N'AC public areas', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (548, N'Aqua sports center', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (549, N'Courier service', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (550, N'Creche', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (551, N'Housekeeping service', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (552, N'Entertainment recreation', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (553, N'Diving', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (554, N'Hair salon', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (555, N'Hotel shops', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (556, N'Island hopping', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (557, N'Jet skiing', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (558, N'Kids eat for free', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (559, N'Late check-out available', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (560, N'Limo town car service available', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (561, N'Security guard', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (562, N'Shoe shine', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (563, N'Shoe polishing machine', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (564, N'Shuttle service', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (565, N'Ticket service', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (566, N'Turndown service', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (567, N'Umbrella', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (568, N'Welcome amenities', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (569, N'Pool view', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (570, N'Rare view', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (571, N'Heated outdoor pool', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (572, N'Infants not allowed', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (573, N'Family friendly', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (574, N'Car necessary', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (575, N'Car recommended', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (576, N'Car not necessary', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (577, N'Romantic', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (578, N'Luxury', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (579, N'Budget', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (580, N'Water View', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (581, N'Beach chair', NULL, 28, 1)
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName], [SVG], [ParentTypeId], [isActive]) VALUES (582, N'Extra', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[AmenitiesType] OFF
SET IDENTITY_INSERT [dbo].[cities] ON 

INSERT [dbo].[cities] ([CityId], [CountryID], [CityName], [Latitude], [Longitude]) VALUES (1, 2, N'Lahore', 31.582045, 74.329376)
SET IDENTITY_INSERT [dbo].[cities] OFF
SET IDENTITY_INSERT [dbo].[ContactMessage] ON 

INSERT [dbo].[ContactMessage] ([ContactMessageId], [UserId], [Message]) VALUES (1, 1, N'Testing')
INSERT [dbo].[ContactMessage] ([ContactMessageId], [UserId], [Message]) VALUES (2, 1, N'Testing')
INSERT [dbo].[ContactMessage] ([ContactMessageId], [UserId], [Message]) VALUES (3, 2, N'Testing')
INSERT [dbo].[ContactMessage] ([ContactMessageId], [UserId], [Message]) VALUES (4, 3, N'Testing')
INSERT [dbo].[ContactMessage] ([ContactMessageId], [UserId], [Message]) VALUES (1002, 1, N'Testing')
SET IDENTITY_INSERT [dbo].[ContactMessage] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (2, N'Pakistan')
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[FAQ] ON 

INSERT [dbo].[FAQ] ([FAQid], [Question], [Answer]) VALUES (1, N'EXAMPLE QUESTION', N'Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven''t heard of them accusamus labore sustainable VHS.')
INSERT [dbo].[FAQ] ([FAQid], [Question], [Answer]) VALUES (2, N'Example Question 2', N'Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven''t heard of them accusamus labore sustainable VHS.')
SET IDENTITY_INSERT [dbo].[FAQ] OFF
SET IDENTITY_INSERT [dbo].[Files] ON 

INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (3, N'f1e79b5d-d409-4467-bccb-fa59941e6716.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (4, N'ff86a857-ffa7-43f3-bcd6-2031b19c5776.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (5, N'e86fd1ac-c498-447c-9466-1f22321f0214.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (6, N'9779ab9a-205e-40c1-9acb-61e207fbe91e.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (7, N'567148ec-8f4e-468f-b84a-6dd8f3d40564.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (8, N'0eaffa95-e137-406b-8768-e538b1d70c71.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (9, N'313d27fe-98e5-4127-a7a0-c9f29b716739.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (10, N'7d438ba0-4490-450f-b404-9e872271ff85.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (11, N'6f738e14-3590-4f03-aaca-29c973b26926.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (12, N'529c2506-5c51-4315-b1a6-8298ebf1b4e3.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (13, N'b9be1b28-6cff-440e-8408-6e6f4fd26e92.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (14, N'65aabd35-ac8b-4baa-9e12-772fb216ef40.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (15, N'513a8fc8-2410-411f-9b95-eb5ee198bc6a.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (16, N'5c8cda38-1c0c-46f2-a689-6123e422a88d.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (17, N'4e1b45c4-a6a5-4113-bc01-f39b4c888aa4.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (18, N'dc755d86-8979-4fc9-8c0d-2d5d9eae1184.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (19, N'adfdf716-4e80-4d7a-8dfd-afdd6cee1ec5.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (20, N'1ef44038-1a72-4c3d-ab15-f52c8e6706f9.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (21, N'd261f171-f416-4612-96ca-796191f8a9a0.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (22, N'923a756c-d165-40a1-bf23-c75700272d64.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (23, N'48e34e3a-ab72-4c79-8357-8874563d4a94.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (24, N'41b22dfb-759e-4317-ad9e-b94509dcb360.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (25, N'5377b6d1-2c42-496e-b0c9-a88d20968bbe.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (26, N'4d612de6-8a7e-4047-ad46-3312088e8037.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (27, N'cf7e40bc-fd0d-441a-93d0-ca349d118573.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (28, N'581cbd84-ea08-4352-ac78-1de6a0236b42.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (29, N'75cf4ad5-dcbc-4dc4-a108-b6f4adee8dba.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (30, N'1080b9c6-fa0b-4479-90fe-139c0c353c3a.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (31, N'edece2e4-de2a-4772-b68b-a4339caf7757.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (32, N'e0f4ed83-2842-42d8-8e8c-93c96adea200.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (33, N'f5ba58c4-e6a8-458f-854a-8fd243ad7561.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (34, N'c12a4cdb-f925-4f5b-8493-265be728c9c0.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (35, N'aadb12e8-1c72-414b-ad4a-6c8e42847ebd.jpg', N'image', 4, CAST(N'2017-07-08 03:01:07.290' AS DateTime), CAST(N'2017-07-08 03:01:07.290' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (36, N'd18080b8-d0a2-4d82-b14d-e66fe2acd4df.jpg', N'image', 5, CAST(N'2017-07-16 11:30:51.270' AS DateTime), CAST(N'2017-07-16 11:30:51.270' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (37, N'5b7f318a-8e9f-4e61-8177-6d08753a514b.jpg', N'image', 5, CAST(N'2017-07-16 11:30:51.270' AS DateTime), CAST(N'2017-07-16 11:30:51.270' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (38, N'ff7aa159-09f5-42ac-9030-75d8583c4d34.jpg', N'image', 5, CAST(N'2017-07-16 11:30:51.270' AS DateTime), CAST(N'2017-07-16 11:30:51.270' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (39, N'7f9ac02d-1564-4a91-bbcd-eab4b902f550.jpg', N'image', 5, CAST(N'2017-07-16 11:30:51.270' AS DateTime), CAST(N'2017-07-16 11:30:51.270' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (40, N'24ec81be-ffdc-4c31-9c2c-20c9829531ab.jpg', N'image', 5, CAST(N'2017-07-16 11:30:51.270' AS DateTime), CAST(N'2017-07-16 11:30:51.270' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (1036, N'00eb5aee-b7cd-4123-8bae-43fc4e3f975e.jpg', N'DHA Commercial Phase 1 to 11', NULL, CAST(N'2017-08-05 13:48:39.943' AS DateTime), CAST(N'2017-08-05 13:48:39.943' AS DateTime), 2, N'                            
                        ', N'Maps')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (1037, N'76d114fc-3aa7-4f79-acba-9de9160e6492.jpg', N'DHA Phase 1 & DHA Phase 5', NULL, CAST(N'2017-08-05 13:51:02.330' AS DateTime), CAST(N'2017-08-05 13:51:02.330' AS DateTime), 2, N'                            
                        ', N'Maps')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (1038, N'e0593397-5c6b-4ed0-b459-2dcb0a40f112.jpg', N'REG FORM', NULL, CAST(N'2017-08-05 14:42:20.873' AS DateTime), CAST(N'2017-08-05 14:42:20.873' AS DateTime), 3, N'                            
                        ', N'Downloads')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (1039, N'46344633-489b-4e32-a74c-f35fbfeaa583.pdf', N'REG FORMsss', NULL, CAST(N'2017-08-05 15:05:52.537' AS DateTime), CAST(N'2017-08-05 15:05:52.537' AS DateTime), 3, N'                            
                        ', N'Downloads')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (2036, N'454d015d-ef30-4743-b797-0abb3ed20c60.jpg', N'image', 1006, CAST(N'2017-08-21 21:37:09.257' AS DateTime), CAST(N'2017-08-21 21:37:09.257' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (2037, N'9cdd300a-1a69-4a15-9d56-2e211147a5dd.jpg', N'image', 1006, CAST(N'2017-08-21 21:37:09.257' AS DateTime), CAST(N'2017-08-21 21:37:09.257' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (2038, N'2f51d301-01e0-40f7-9f8f-d6e46948646f.jpg', N'image', 1006, CAST(N'2017-08-21 21:37:09.257' AS DateTime), CAST(N'2017-08-21 21:37:09.257' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (2039, N'c220066e-f3e2-402b-9335-e218c5c918ee.jpg', N'image', 1006, CAST(N'2017-08-21 21:37:09.257' AS DateTime), CAST(N'2017-08-21 21:37:09.257' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (2040, N'e5e4f553-72e2-4f40-a892-e89dad284527.jpg', N'image', 1006, CAST(N'2017-08-21 21:37:09.257' AS DateTime), CAST(N'2017-08-21 21:37:09.257' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (2041, N'9abc6b14-43ce-42c4-bd68-4199ffb6770c.jpg', N'image', 1006, CAST(N'2017-08-21 21:37:09.257' AS DateTime), CAST(N'2017-08-21 21:37:09.257' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (2042, N'31591b00-dded-4e3f-96ea-5690dde66c75.jpg', N'image', 1006, CAST(N'2017-08-21 21:37:09.257' AS DateTime), CAST(N'2017-08-21 21:37:09.257' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (2043, N'bb5539af-e22f-4f4d-b483-db17d7a58f2c.jpg', N'image', 1006, CAST(N'2017-08-21 21:37:09.257' AS DateTime), CAST(N'2017-08-21 21:37:09.257' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (2044, N'b793f7b0-a5ef-4e72-a3ad-863a074a9c3b.jpg', N'image', 1006, CAST(N'2017-08-21 21:37:09.257' AS DateTime), CAST(N'2017-08-21 21:37:09.257' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (2045, N'e6b11c8e-1743-4431-b459-8deed48b2b79.jpg', N'image', 1006, CAST(N'2017-08-21 21:37:09.257' AS DateTime), CAST(N'2017-08-21 21:37:09.257' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (2046, N'3a286d51-84ff-4ea4-a3f6-718cab7f080c.jpg', N'image', 1006, CAST(N'2017-08-21 21:37:09.257' AS DateTime), CAST(N'2017-08-21 21:37:09.257' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (2047, N'80ba8acf-dd16-4744-927e-349e46356900.jpg', N'image', 1006, CAST(N'2017-08-21 21:37:09.257' AS DateTime), CAST(N'2017-08-21 21:37:09.257' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (2048, N'7b172463-09d6-40b0-a5ff-6a6debebcb34.jpg', N'image', 1006, CAST(N'2017-08-21 21:37:09.257' AS DateTime), CAST(N'2017-08-21 21:37:09.257' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (2049, N'390e68af-6df8-4fd2-a0cd-d3f572d88594.jpg', N'image', 1006, CAST(N'2017-08-21 21:37:09.257' AS DateTime), CAST(N'2017-08-21 21:37:09.257' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (2050, N'62865e1d-30eb-4e72-87d1-1f5b8ea1ef45.jpg', N'image', 1006, CAST(N'2017-08-21 21:37:09.257' AS DateTime), CAST(N'2017-08-21 21:37:09.257' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (2051, N'7e9e4bda-4c46-434f-ba29-f6fbe4f844a7.jpg', N'image', 1006, CAST(N'2017-08-21 21:37:09.257' AS DateTime), CAST(N'2017-08-21 21:37:09.257' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (2052, N'175008ca-d768-48dc-874e-58b4af4bd506.jpg', N'image', 1006, CAST(N'2017-08-21 21:37:09.257' AS DateTime), CAST(N'2017-08-21 21:37:09.257' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (3036, N'fd1c4b43-5b4b-4d03-9cf7-622d5004ef99.jpg', N'image', 1008, CAST(N'2017-12-23 14:25:34.237' AS DateTime), CAST(N'2017-12-23 14:25:34.237' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (3037, N'edced394-3a43-4333-b85c-875f517eed2d.jpg', N'image', 1008, CAST(N'2017-12-23 14:25:34.237' AS DateTime), CAST(N'2017-12-23 14:25:34.237' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (3038, N'cf93cdec-4bee-46e6-8d7f-6b416b758f59.jpg', N'image', 1008, CAST(N'2017-12-23 14:25:34.237' AS DateTime), CAST(N'2017-12-23 14:25:34.237' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (3039, N'2d3337f4-808b-4690-b430-0c06a07ccbd9.jpg', N'image', 1008, CAST(N'2017-12-23 14:25:34.237' AS DateTime), CAST(N'2017-12-23 14:25:34.237' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (3040, N'bd45cc91-0466-4c7f-81c8-3bcf8dd613ca.jpg', N'image', 1008, CAST(N'2017-12-23 14:25:34.237' AS DateTime), CAST(N'2017-12-23 14:25:34.237' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (3041, N'0ebc855c-323f-4a4b-988a-29a1f9dd098f.jpg', N'image', 1008, CAST(N'2017-12-23 14:25:34.237' AS DateTime), CAST(N'2017-12-23 14:25:34.237' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (3042, N'd952400e-2b03-4907-b9f3-28ec30a8a906.jpg', N'image', 1008, CAST(N'2017-12-23 14:25:34.237' AS DateTime), CAST(N'2017-12-23 14:25:34.237' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (3043, N'fbadbfe8-4801-4efe-a204-6c47473c8e33.jpg', N'image', 1008, CAST(N'2017-12-23 14:25:34.237' AS DateTime), CAST(N'2017-12-23 14:25:34.237' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (3044, N'af6f3102-5a16-4ccc-820b-ef89f6901913.jpg', N'image', 1008, CAST(N'2017-12-23 14:25:34.237' AS DateTime), CAST(N'2017-12-23 14:25:34.237' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (3045, N'33017c42-9eb2-485c-a70f-e3d579425bcd.jpg', N'image', 1008, CAST(N'2017-12-23 14:25:34.237' AS DateTime), CAST(N'2017-12-23 14:25:34.237' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (3046, N'197e05a7-264d-4899-b496-6e71d3a63d29.jpg', N'image', 1008, CAST(N'2017-12-23 14:25:34.237' AS DateTime), CAST(N'2017-12-23 14:25:34.237' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (3047, N'b671d7f9-b1c1-4a94-be40-a9aa07ce09c0.jpg', N'image', 1008, CAST(N'2017-12-23 14:25:34.237' AS DateTime), CAST(N'2017-12-23 14:25:34.237' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (4046, N'7d7be05f-de95-489c-bade-91b56b2e3b45.jpg', N'image', 2010, CAST(N'2018-01-23 09:27:01.867' AS DateTime), CAST(N'2018-01-23 09:27:01.867' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (4047, N'9b8e6cbd-a461-4440-8583-4a38d657e1ad.jpg', N'image', 2010, CAST(N'2018-01-23 09:27:01.867' AS DateTime), CAST(N'2018-01-23 09:27:01.867' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (4048, N'0622393b-cc52-47d8-b893-bae3d5088610.jpg', N'image', 2010, CAST(N'2018-01-23 09:27:01.867' AS DateTime), CAST(N'2018-01-23 09:27:01.867' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (4049, N'2803290e-7736-42fc-a969-93f1787e1ec1.jpg', N'image', 2010, CAST(N'2018-01-23 09:27:01.867' AS DateTime), CAST(N'2018-01-23 09:27:01.867' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (4050, N'7212bf26-3932-45de-b9fb-7440e4a6908b.jpg', N'image', 2010, CAST(N'2018-01-23 09:27:01.867' AS DateTime), CAST(N'2018-01-23 09:27:01.867' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (4051, N'28106c10-b8f0-4952-90a2-5450211c9cd4.jpg', N'image', 2010, CAST(N'2018-01-23 09:27:01.867' AS DateTime), CAST(N'2018-01-23 09:27:01.867' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (4052, N'26be5bac-73be-4620-8c5b-cf0ed90736b5.jpg', N'image', 2010, CAST(N'2018-01-23 09:27:01.867' AS DateTime), CAST(N'2018-01-23 09:27:01.867' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (4053, N'e5bce46b-d0e1-4366-913a-aad59e17fa67.jpg', N'image', 2010, CAST(N'2018-01-23 09:27:01.867' AS DateTime), CAST(N'2018-01-23 09:27:01.867' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (4054, N'5344acc1-8bf5-4ed2-abe7-7472590c6a09.jpg', N'image', 2010, CAST(N'2018-01-23 09:27:01.867' AS DateTime), CAST(N'2018-01-23 09:27:01.867' AS DateTime), 1, N'--', N'property')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [TypeId], [onCreated], [onModified], [FileTypeId], [Description], [FileTypeName]) VALUES (4055, N'7b825737-841c-4b8b-901c-a94efef48de0.jpg', N'image', 2010, CAST(N'2018-01-23 09:27:01.867' AS DateTime), CAST(N'2018-01-23 09:27:01.867' AS DateTime), 1, N'--', N'property')
SET IDENTITY_INSERT [dbo].[Files] OFF
SET IDENTITY_INSERT [dbo].[History] ON 

INSERT [dbo].[History] ([HistoryId], [sortId], [Title], [Text], [onModified], [onCreated]) VALUES (1, 0, N'Created', N'My Ventures is created ....... dhsakad jhd sjh hj dsjhja 
dkshdasgdas
sahdagsj                            
                        ', CAST(N'2017-08-15 03:29:03.180' AS DateTime), CAST(N'2017-08-15 03:29:03.180' AS DateTime))
INSERT [dbo].[History] ([HistoryId], [sortId], [Title], [Text], [onModified], [onCreated]) VALUES (2, 1, N'Combined with Mazhar Munir', N'dhagdajdhdsad
sadjhgdasjdhsagdasd
dsahdgasjhdasd
sdhsdgjsahdasd
sdhka                            
                        ', CAST(N'2017-08-15 03:35:19.483' AS DateTime), CAST(N'2017-08-15 03:35:19.483' AS DateTime))
SET IDENTITY_INSERT [dbo].[History] OFF
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [ZipCode], [Logitude], [Latitude], [CityId]) VALUES (1, N'Phase 3 DHA', NULL, 54810, 74.438861299999985, 31.4700474, 1)
INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [ZipCode], [Logitude], [Latitude], [CityId]) VALUES (2, N'Phase 3 DHA', NULL, 54810, 74.438861299999985, 31.4700474, 1)
INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [ZipCode], [Logitude], [Latitude], [CityId]) VALUES (3, N'Phase 3 DHA', NULL, 54810, 74.438861299999985, 31.4700474, 1)
INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [ZipCode], [Logitude], [Latitude], [CityId]) VALUES (4, N'Phase 3 DHA', NULL, 54810, 74.438861299999985, 31.4700474, 1)
INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [ZipCode], [Logitude], [Latitude], [CityId]) VALUES (5, N'Phase 3 DHA', NULL, 54810, 74.438861299999985, 31.4700474, 1)
INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [ZipCode], [Logitude], [Latitude], [CityId]) VALUES (6, N'G Block Phase 6 DHA', NULL, 54810, 74.438861299999985, 31.4700474, 1)
INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [ZipCode], [Logitude], [Latitude], [CityId]) VALUES (7, N'Thokar', NULL, 0, 77.299732400000039, 28.5523789, 1)
INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [ZipCode], [Logitude], [Latitude], [CityId]) VALUES (1007, N'E9/D1 Main Street Mian Park walton Road Lahore Cantt', NULL, 54810, 0, 0, 1)
INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [ZipCode], [Logitude], [Latitude], [CityId]) VALUES (2007, N'142 BLOCK H DHA PHASE 5', NULL, 54810, 74.130502699999965, 32.2488501, 1)
INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [ZipCode], [Logitude], [Latitude], [CityId]) VALUES (2008, N'142 BLOCK H DHA PHASE 5', NULL, 54810, 74.130502699999965, 32.2488501, 1)
INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [ZipCode], [Logitude], [Latitude], [CityId]) VALUES (3007, N'142 Phase 5 Sector H, DHA', NULL, 54810, 31.460694, 74.404778, 1)
INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [ZipCode], [Logitude], [Latitude], [CityId]) VALUES (3008, N'142 Phase 5 Sector H DHA', NULL, 54810, 31.460694, 74.404778, 1)
INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [ZipCode], [Logitude], [Latitude], [CityId]) VALUES (3009, N'142 Phase 5 Sector H DHA', NULL, 54810, 31.460694, 74.404778, 1)
INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [ZipCode], [Logitude], [Latitude], [CityId]) VALUES (3010, N'142 Phase 5 Sector H DHA', NULL, 54810, 31.460694, 74.404778, 1)
INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [ZipCode], [Logitude], [Latitude], [CityId]) VALUES (3011, NULL, NULL, 0, 31.460694, 74.404778, 1)
INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [ZipCode], [Logitude], [Latitude], [CityId]) VALUES (4007, N'House 142, Sector H, DHA Lahore', NULL, 54810, 31.460694, 74.404778, 1)
SET IDENTITY_INSERT [dbo].[Location] OFF
SET IDENTITY_INSERT [dbo].[PriceUnit] ON 

INSERT [dbo].[PriceUnit] ([PriceUnitId], [PriceUnitName], [Amount]) VALUES (1, N'Crore', CAST(10000000 AS Numeric(18, 0)))
INSERT [dbo].[PriceUnit] ([PriceUnitId], [PriceUnitName], [Amount]) VALUES (2, N'Lakh', CAST(100000 AS Numeric(18, 0)))
SET IDENTITY_INSERT [dbo].[PriceUnit] OFF
SET IDENTITY_INSERT [dbo].[Property] ON 

INSERT [dbo].[Property] ([PropertyId], [TypeId], [Title], [SubTitle], [Description], [pdf], [guid], [LocationId], [Area], [AreaUnit], [Price], [PriceUnit], [OfferPrice], [Baths], [Beds], [Banner], [isActive], [VideoURL], [FeaturedBanner], [HeaderBanner], [isSold]) VALUES (4, 1, N'Indigo Heights', NULL, N'<p class="txtfont ltr">Indigo Heights at 3 C3 Noor Jehan Road, Gulberg III, is an excellent opportunity for investors seeking properties in Lahore. Indigo Heights is a mixed-use building that offers both high-end luxury apartments and commercial shops with world class amenities. Being in the proximity of MM Alam Road and Liberty Market, Indigo Heights is a great location for white collars and socialites to live a luxurious life. It is ideal for top local and international brands &amp; outlets.<br /><br /><strong>Top Features for Investors:</strong><br />Flexible Installment Plan<br />Pay Installments as Construction Progresses<br />6% Completion Guarantee on your Investment<br />7% Rental Guarantee<br /><br /><strong>State of the Art Facility Management System:</strong></p>
<p>&nbsp;</p>
<ul>
<li>24/7 Fool Proof Security</li>
<li>Quality Construction ISO 9001 Compliant</li>
<li>Valet Parking System with Mechanized Hydraulic Stacking&nbsp;</li>
<li>Public address System</li>
<li>Heavy Generator for Backup Power</li>
<li>Automatic Lighting control system</li>
<li>HVAC system,</li>
<li>Earthquake Resistant up to 9.5 on Richter Scale</li>
<li>High-Speed Lifts &amp; Escalators&nbsp;<br /><br /><strong>Fully Serviced Apartments:</strong></li>
<li>Dedicated Entrance/Reception &amp; Cargo Lifts for Luggage</li>
<li>Concierge services</li>
<li>Dedicated Parking for Apartment Owners with Valet Services</li>
<li>Housekeeping &amp; Laundry service</li>
<li>High Quality Imported Interior Fittings<br /><br /><strong>Modern Amenities:</strong></li>
<li>Mosque &amp; Library</li>
<li>Fitness Center, Gym &amp; SPA</li>
<li>Caf&eacute; &amp; Al Fresco Dining</li>
<li>Roof Top Endless Pool</li>
</ul>
<p>&nbsp;</p>', NULL, N'indigo-heights-gulberg-3,-lahore', 5, 3, 1, 34, 2, 0, 5, 8, N'7f9ac02d-1564-4a91-bbcd-eab4b902f550.jpg', 0, NULL, NULL, NULL, 0)
INSERT [dbo].[Property] ([PropertyId], [TypeId], [Title], [SubTitle], [Description], [pdf], [guid], [LocationId], [Area], [AreaUnit], [Price], [PriceUnit], [OfferPrice], [Baths], [Beds], [Banner], [isActive], [VideoURL], [FeaturedBanner], [HeaderBanner], [isSold]) VALUES (5, 1, N'Luxurious Villa', NULL, N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>
<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, N'luxurious-villa', 6, 2, 1, 1.5, 1, 4, 6, 6, N'eae6c875-89a1-4c35-af5d-9a88d3a2c9f9.jpg', 0, N'https://www.youtube.com/watch?v=47P-g2O5wTA', NULL, NULL, 0)
INSERT [dbo].[Property] ([PropertyId], [TypeId], [Title], [SubTitle], [Description], [pdf], [guid], [LocationId], [Area], [AreaUnit], [Price], [PriceUnit], [OfferPrice], [Baths], [Beds], [Banner], [isActive], [VideoURL], [FeaturedBanner], [HeaderBanner], [isSold]) VALUES (6, 4, N'Highly Growing Lands', NULL, N'<div>
<h2>What is Lorem Ipsum?</h2>
<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
</div>
<div>
<h2>Why do we use it?</h2>
<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>
</div>', NULL, N'0d7accab-33d0-4810-ad98-f455e08f01e4', 7, 4, 1, 80, 2, 0, 0, 0, N'6b265bf2-2f3c-4acd-a8fa-8c89c40b60ac.jpg', 0, NULL, NULL, NULL, 0)
INSERT [dbo].[Property] ([PropertyId], [TypeId], [Title], [SubTitle], [Description], [pdf], [guid], [LocationId], [Area], [AreaUnit], [Price], [PriceUnit], [OfferPrice], [Baths], [Beds], [Banner], [isActive], [VideoURL], [FeaturedBanner], [HeaderBanner], [isSold]) VALUES (1006, 1, N'Property 1', N'Luxy', N'<div>
<h2>What is Lorem Ipsum?</h2>
<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummying text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
</div>
<div>
<h2>Why do we use it?</h2>
<p>It is a long-established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many websites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humor and the like).</p>
</div>', NULL, N'82c5343c-27bd-4bbd-91a8-762f185223d9', 1007, 5, 1, 560, 2, 0, 2, 5, N'07d1b696-1052-41cf-8f73-316f64bb708e.jpg', 0, NULL, NULL, NULL, 0)
INSERT [dbo].[Property] ([PropertyId], [TypeId], [Title], [SubTitle], [Description], [pdf], [guid], [LocationId], [Area], [AreaUnit], [Price], [PriceUnit], [OfferPrice], [Baths], [Beds], [Banner], [isActive], [VideoURL], [FeaturedBanner], [HeaderBanner], [isSold]) VALUES (1008, 1, N'DHA PHASE 5', N'142, BLOCK H', N'<p><strong>142 DHA PHASE 5 BLOCK H Description:</strong></p>
<div>
<h2>What is Lorem Ipsum?</h2>
<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummied text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
</div>
<div>
<h2>Why do we use it?</h2>
<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humor and the like).</p>
</div>', NULL, N'a4c65be7-5337-46e7-ae02-b7e9e795f268', 2008, 1, 1, 50, 2, 0, 4, 4, N'f200a960-36cd-4b6c-a883-89ebcf621b6f.jpg', 0, NULL, NULL, NULL, 0)
INSERT [dbo].[Property] ([PropertyId], [TypeId], [Title], [SubTitle], [Description], [pdf], [guid], [LocationId], [Area], [AreaUnit], [Price], [PriceUnit], [OfferPrice], [Baths], [Beds], [Banner], [isActive], [VideoURL], [FeaturedBanner], [HeaderBanner], [isSold]) VALUES (2007, 1, N'Live the Luxury', N'One Kanal Mazhar Munir Designed Brand New Bungalow for Sale at Central Location - DHA Phase 5, Sector H, Lahore', N'<p>One Kanal Mazhar Munir Designed Brand New Bungalow for Sale at Central Location - DHA Phase 5, Sector H, Lahore <br /><strong>Highlights</strong>: Designed by Mr.Mazhar Munir Central Location Near to Park with Easy Access from Main 150ft Road and Commercial Area. Total Covered Area is 5,270 Sq. Ft. <br /><strong>Facilities</strong>: 2 Kitchen is Provided Euro with Appliances of Fotile 5 Bedrooms with Attach Bathroom Bathroom Accessories of Grohe and Porcelanosa&nbsp; Floor tiles of Roberto Cavalli Korian Vanities of Hanex 1 Drawing Room &amp; 2 TV Lounge 2 Servant Quarters in Basement 1 Powder Room 3 Car Parking Space Lush Green Lawn &amp; Much More</p>', NULL, N'52665f97-bf36-4a32-a9b1-88072d394efb', 3007, 1, 1, 6.6500000953674316, 1, 0, 5, 5, N'e3f21466-9f6a-442c-9da0-add3bc7b3ed7.jpg', 0, NULL, NULL, NULL, 0)
INSERT [dbo].[Property] ([PropertyId], [TypeId], [Title], [SubTitle], [Description], [pdf], [guid], [LocationId], [Area], [AreaUnit], [Price], [PriceUnit], [OfferPrice], [Baths], [Beds], [Banner], [isActive], [VideoURL], [FeaturedBanner], [HeaderBanner], [isSold]) VALUES (2008, 1, N'Live the Luxury', N'One Kanal Mazhar Munir Designed Brand New Bungalow for Sale at Central Location - DHA Phase 5, Sector H, Lahore', N'<p>One Kanal Mazhar Munir Designed Brand New Bungalow for Sale at Central Location - DHA Phase 5, Sector H, Lahore </p>
<p><strong>Highlights:</strong> Designed by Mr.Mazhar Munir Central Location Near to Park with Easy Access from Main 150ft Road and Commercial Area. Total Covered Area is 5,270 Sq. Ft.</p>
<p><strong>Facilities:</strong> 2 Kitchen is Provided Euro with Appliances of Fotile 5 Bedrooms with Attach Bathroom Bathroom Accessories of Grohe and Porcelanosa&nbsp; Floor tiles of Roberto Cavalli Korian Vanities of Hanex 1 Drawing Room &amp; 2 TV Lounge 2 Servant Quarters in Basement 1 Powder Room 3 Car Parking Space Lush Green Lawn &amp; Much More</p>', NULL, N'8af5ea04-6a0a-4a3f-ab2b-45ab3c4020c1', 3008, 1, 1, 6.6500000953674316, 1, 0, 5, 5, NULL, 0, NULL, NULL, NULL, 0)
INSERT [dbo].[Property] ([PropertyId], [TypeId], [Title], [SubTitle], [Description], [pdf], [guid], [LocationId], [Area], [AreaUnit], [Price], [PriceUnit], [OfferPrice], [Baths], [Beds], [Banner], [isActive], [VideoURL], [FeaturedBanner], [HeaderBanner], [isSold]) VALUES (2009, 1, N'Live the Luxury', N'One Kanal Mazhar Munir Designed Brand New Bungalow for Sale at Central Location - DHA Phase 5, Sector H, Lahore', N'<p>One Kanal Mazhar Munir Designed Brand New Bungalow for Sale at Central Location - DHA Phase 5, Sector H, Lahore </p>
<p><strong>Highlights:</strong> Designed by Mr.Mazhar Munir Central Location Near to Park with Easy Access from Main 150ft Road and Commercial Area. Total Covered Area is 5,270 Sq. Ft.</p>
<p><strong>Facilities:</strong> 2 Kitchen is Provided Euro with Appliances of Fotile 5 Bedrooms with Attach Bathroom Bathroom Accessories of Grohe and Porcelanosa&nbsp; Floor tiles of Roberto Cavalli Korian Vanities of Hanex 1 Drawing Room &amp; 2 TV Lounge 2 Servant Quarters in Basement 1 Powder Room 3 Car Parking Space Lush Green Lawn &amp; Much More</p>', NULL, N'29864ba0-a3e1-416e-b3ce-ceff32e448c3', 3009, 1, 1, 6.6500000953674316, 1, 0, 5, 5, N'ea90a098-1017-4625-b671-4497e77cf498.jpg', 0, NULL, NULL, NULL, 0)
INSERT [dbo].[Property] ([PropertyId], [TypeId], [Title], [SubTitle], [Description], [pdf], [guid], [LocationId], [Area], [AreaUnit], [Price], [PriceUnit], [OfferPrice], [Baths], [Beds], [Banner], [isActive], [VideoURL], [FeaturedBanner], [HeaderBanner], [isSold]) VALUES (2010, 1, N'Live the Luxury', N'One Kanal Mazhar Munir Designed Brand New Bungalow for Sale at Central Location - DHA Phase 5, Sector H, Lahore', N'<div class="freebirdFormviewerViewItemsItemItem freebirdFormviewerViewItemsTextTextItem" role="listitem" data-required="true" data-item-id="1032969055">
<div class="freebirdFormviewerViewItemsTextLongText freebirdFormviewerViewItemsTextDisabledText freebirdThemedInput">House Built in 2017 3 Number of Stories 2 Kitchen 5 Bedrooms with Attach Baths 1 Powder Room 1 Drawing Room &amp; 2 TV Lounge 2 Servant Quarters in Basement 2 Stores 3 Car Parking Space Utilities -- Gas / Electric Ready A/C Installed</div>
</div>
<div class="freebirdFormviewerViewItemsItemItem freebirdFormviewerViewItemsTextTextItem" role="listitem" data-required="true" data-item-id="1030976948">
<div class="freebirdFormviewerViewItemsItemItemHeader">
<div class="freebirdFormviewerViewItemsItemItemTitleContainer">
<div class="freebirdFormviewerViewItemsItemItemTitle freebirdCustomFont" dir="auto" role="heading" aria-level="2" aria-describedby="i.desc.1030976948 c214">Description of Property&nbsp;<span class="freebirdFormviewerViewItemsItemRequiredAsterisk" aria-label="Required question">*</span></div>
<div id="i.desc.1030976948" class="freebirdFormviewerViewItemsItemItemHelpText" dir="auto">At least 250 words</div>
</div>
</div>
<div class="freebirdFormviewerViewItemsTextLongText freebirdFormviewerViewItemsTextDisabledText freebirdThemedInput">One Kanal Mazhar Munir Designed Brand New Bungalow for Sale at Central Location - DHA Phase 5, Sector H, Lahore Highlights: Designed by Mr.Mazhar Munir Central Location Near to Park with Easy Access from Main 150ft Road and Commercial Area. Total Covered Area is 5,270 Sq. Ft. Facilities: 2 Kitchen is Provided Euro with Appliances of Fotile 5 Bedrooms with Attach Bathroom Bathroom Accessories of Grohe and Porcelanosa&nbsp; Floor tiles of Roberto Cavalli Korian Vanities of Hanex 1 Drawing Room &amp; 2 TV Lounge 2 Servant Quarters in Basement 1 Powder Room 3 Car Parking Space Lush Green Lawn &amp; Much More Don''t Miss the Opportunity Please Contact Us to Book an Appointment for Viewing +92 3353222777</div>
</div>', NULL, N'b8999774-03ab-4196-b701-5a960b88135d', 3010, 1, 1, 6.6500000953674316, 1, 0, 5, 5, N'783edcb7-10d6-4af4-906f-6a2508ad35b5.jpg', 0, NULL, NULL, NULL, 0)
INSERT [dbo].[Property] ([PropertyId], [TypeId], [Title], [SubTitle], [Description], [pdf], [guid], [LocationId], [Area], [AreaUnit], [Price], [PriceUnit], [OfferPrice], [Baths], [Beds], [Banner], [isActive], [VideoURL], [FeaturedBanner], [HeaderBanner], [isSold]) VALUES (2011, 1, N'Live the Luxury', N'One Kanal Mazhar Munir Designed Brand New Bungalow at Central Location - DHA Phase 5, Sector H, Lahore', N'<div>
<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
</div>
<div>
<h2>Why do we use it?</h2>
<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>
</div>', NULL, N'c2f28507-eefa-48ca-b7b5-9fe27a9de025', 4007, 1, 1, 6.6500000953674316, 1, 0, 4, 4, N'09912161-8083-44e0-b0da-12a1998b0453.jpg', 1, NULL, N'790e3d00-4bc3-4e0e-b579-73a839119170.jpg', N'cfde1bd8-77c0-4b7b-8415-3876686364a4.jpg', 0)
SET IDENTITY_INSERT [dbo].[Property] OFF
SET IDENTITY_INSERT [dbo].[PropertyReviews] ON 

INSERT [dbo].[PropertyReviews] ([ReviewId], [PropertyId], [UserId], [Description], [IsVerified], [onCreated], [onModified]) VALUES (1, 1006, 1, N'OsumPlace Buddy', 1, CAST(N'2017-08-22 02:00:33.507' AS DateTime), CAST(N'2017-08-22 02:00:33.510' AS DateTime))
INSERT [dbo].[PropertyReviews] ([ReviewId], [PropertyId], [UserId], [Description], [IsVerified], [onCreated], [onModified]) VALUES (2, 1006, 1, N'OsumPlace Buddy', 0, CAST(N'2017-08-22 02:01:25.770' AS DateTime), CAST(N'2017-08-22 02:01:25.770' AS DateTime))
INSERT [dbo].[PropertyReviews] ([ReviewId], [PropertyId], [UserId], [Description], [IsVerified], [onCreated], [onModified]) VALUES (3, 1006, 1, N'OsumPlace Buddy', 0, CAST(N'2017-08-22 02:01:31.933' AS DateTime), CAST(N'2017-08-22 02:01:31.933' AS DateTime))
INSERT [dbo].[PropertyReviews] ([ReviewId], [PropertyId], [UserId], [Description], [IsVerified], [onCreated], [onModified]) VALUES (4, 1006, 1, N'OsumPlace Buddy', 1, CAST(N'2017-08-22 02:01:32.033' AS DateTime), CAST(N'2017-08-22 02:01:32.033' AS DateTime))
INSERT [dbo].[PropertyReviews] ([ReviewId], [PropertyId], [UserId], [Description], [IsVerified], [onCreated], [onModified]) VALUES (5, 1006, 1, N'OsumPlace Buddy', 0, CAST(N'2017-08-22 02:01:32.307' AS DateTime), CAST(N'2017-08-22 02:01:32.307' AS DateTime))
INSERT [dbo].[PropertyReviews] ([ReviewId], [PropertyId], [UserId], [Description], [IsVerified], [onCreated], [onModified]) VALUES (6, 1006, 1, N'OsumPlace Buddy', 0, CAST(N'2017-08-22 02:01:32.417' AS DateTime), CAST(N'2017-08-22 02:01:32.417' AS DateTime))
INSERT [dbo].[PropertyReviews] ([ReviewId], [PropertyId], [UserId], [Description], [IsVerified], [onCreated], [onModified]) VALUES (7, 1006, 1, N'OsumPlace Buddy', 0, CAST(N'2017-08-22 02:01:32.687' AS DateTime), CAST(N'2017-08-22 02:01:32.687' AS DateTime))
INSERT [dbo].[PropertyReviews] ([ReviewId], [PropertyId], [UserId], [Description], [IsVerified], [onCreated], [onModified]) VALUES (8, 1006, 1, N'OsumPlace Buddy', 0, CAST(N'2017-08-22 02:01:34.297' AS DateTime), CAST(N'2017-08-22 02:01:34.297' AS DateTime))
INSERT [dbo].[PropertyReviews] ([ReviewId], [PropertyId], [UserId], [Description], [IsVerified], [onCreated], [onModified]) VALUES (9, 1006, 1, N'Osum Place Budy', 0, CAST(N'2017-08-22 02:03:14.703' AS DateTime), CAST(N'2017-08-22 02:03:14.707' AS DateTime))
INSERT [dbo].[PropertyReviews] ([ReviewId], [PropertyId], [UserId], [Description], [IsVerified], [onCreated], [onModified]) VALUES (10, 1006, 1, N'Osum Budy', 0, CAST(N'2017-08-22 02:05:14.617' AS DateTime), CAST(N'2017-08-22 02:05:14.617' AS DateTime))
INSERT [dbo].[PropertyReviews] ([ReviewId], [PropertyId], [UserId], [Description], [IsVerified], [onCreated], [onModified]) VALUES (11, 1006, 1, N'Osum Guys', 0, CAST(N'2017-08-22 02:06:42.763' AS DateTime), CAST(N'2017-08-22 02:06:42.763' AS DateTime))
INSERT [dbo].[PropertyReviews] ([ReviewId], [PropertyId], [UserId], [Description], [IsVerified], [onCreated], [onModified]) VALUES (12, 1006, 1, N'Osum', 0, CAST(N'2017-08-22 02:07:54.857' AS DateTime), CAST(N'2017-08-22 02:07:54.857' AS DateTime))
INSERT [dbo].[PropertyReviews] ([ReviewId], [PropertyId], [UserId], [Description], [IsVerified], [onCreated], [onModified]) VALUES (13, 1006, 1, N'Okzz', 0, CAST(N'2017-08-22 02:22:43.300' AS DateTime), CAST(N'2017-08-22 02:22:43.300' AS DateTime))
SET IDENTITY_INSERT [dbo].[PropertyReviews] OFF
SET IDENTITY_INSERT [dbo].[PropertyType] ON 

INSERT [dbo].[PropertyType] ([PropertyTypeId], [TypeName], [ParentTypeId]) VALUES (1, N'Homes', NULL)
INSERT [dbo].[PropertyType] ([PropertyTypeId], [TypeName], [ParentTypeId]) VALUES (2, N'Lands', NULL)
INSERT [dbo].[PropertyType] ([PropertyTypeId], [TypeName], [ParentTypeId]) VALUES (3, N'Plots', NULL)
INSERT [dbo].[PropertyType] ([PropertyTypeId], [TypeName], [ParentTypeId]) VALUES (4, N'Agricultural Lands', 2)
INSERT [dbo].[PropertyType] ([PropertyTypeId], [TypeName], [ParentTypeId]) VALUES (5, N'Commercial Lands', 2)
INSERT [dbo].[PropertyType] ([PropertyTypeId], [TypeName], [ParentTypeId]) VALUES (6, N'Residential Plots', 3)
SET IDENTITY_INSERT [dbo].[PropertyType] OFF
SET IDENTITY_INSERT [dbo].[SiteMeta] ON 

INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (1, N'section_1_1_img', N'869a15e6-8503-4ecf-9231-c109a65e0de2.jpeg')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (2, N'Index_Section_1', N'Index_Section_1')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (3, N'Index_Page', N'Index_Page')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (4, N'section_welcome_img', N'099eea6f-80e0-4365-ae1a-5e82732dbadc.jpeg')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (5, N'Index_Section_Welcome', N'Index_Section_Welcome')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (6, N'section_welcome_head', N'TIMELY & RATIONAL DECISIONS NURTURE GREATER RETURNS')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (7, N'section_welcome_text', N'We are a Team of highly experienced professionals and investors who have diversified hands-on experience and know how to increase investor’s wealth by capitalizing in Real Estate. We have Head Quarter in Lahore with customers and investors around the world mainly in USA, Canada, Europe, Middle East and Pakistan.

Our Goal is to generate attractive risk-adjusted returns (ROI) for our investors across cycles in short, medium and over the long term. MY Ventures Real Estate platform encompasses investments across the risk spectrum from opportunistic to core+ to value added.')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (8, N'section_Exclusive_1_img', N'd2728deb-30a7-4dc5-bf38-d09808d90940.jpeg')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (9, N'Index_Section_Exclusive', N'Index_Section_Exclusive')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (10, N'section_Exclusive_1_head', N'WELCOME HOME')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (11, N'section_Exclusive_1_text', N'Premium 3-bedroom villas from AED 999,999* – payable over 5 years')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (12, N'section_Exclusive_2_img', N'c58adf79-cabf-46bc-b66a-7581d1819362.jpeg')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (13, N'section_Exclusive_2_head', N'WELCOME PLOTS')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (14, N'section_Exclusive_2_text', N'Premium 3-bedroom villas from AED 999,999* – payable over 5 years')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (15, N'section_Exclusive_3_img', N'7dcbbd54-dfb8-4cb2-8563-6d606abdb06a.jpeg')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (16, N'section_Exclusive_3_head', N'WELCOME LANDS')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (17, N'section_Exclusive_3_text', N'Premium 3-bedroom villas from AED 999,999* – payable over 5 years')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (18, N'section_Exclusive_1_link', N'/Homes')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (19, N'section_Exclusive_2_link', N'/Plots')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (20, N'section_Exclusive_3_link', N'/Lands')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (21, N'section_1_2_img', N'85b35807-1715-41b7-9bc1-219420100d44.jpeg')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (22, N'section_1_3_img', N'e63f22aa-04a8-4108-a362-5280f1718a58.jpeg')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (23, N'section_1_4_img', N'499fa04c-b4bf-482e-833f-63b3ccd6e617.jpeg')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (24, N'section_1_5_img', N'0aeadae6-f457-4478-b6f8-913b45a0f018.jpeg')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (25, N'section_1_1_head', N'Portfolio / Assets Management')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (26, N'section_1_2_head', N'Project Marketing & Management')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (27, N'section_1_3_head', N'Real Estate Brokerage')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (28, N'section_1_4_head', N'Real Estate Consultancy')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (29, N'section_1_5_head', N'Construction Management')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (30, N'section_1_1_text', N'Growing Together - Helping to Increase Clients Wealth')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (31, N'section_1_2_text', N'Managing Assets and Projects Efficiently')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (32, N'section_1_3_text', N'Rational and Timely Decisions Leads to Smart Investments')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (33, N'section_1_4_text', N'We are Your Expert Property Advisers')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (34, N'section_1_5_text', N'Concept to Creation with Perfection')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (35, N'contact_location', N'182 DD, CCA, Phase IV, DHA , Lahore')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (36, N'Contact_Panel', N'Contact_Panel')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (37, N'Contact_Page', N'Contact_Page')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (38, N'contact_phone', N'+92 335 3222777
+92 (42) 35694332')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (39, N'contact_open', N'MON-SAT: 10AM-7PM')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (40, N'contact_email', N'info@myventures.pk')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (1002, N'about_small', N'We are a Real Estate Investment Firm in DHA Lahore. We pursue to generate attractive risk-adjusted returns for our investors across cycles and over the long term. MY Ventures Real Estate platform encompasses investments across the risk spectrum.')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (1003, N'About_Panel', N'About_Panel')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (1004, N'About_Page', N'About_Page')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (1005, N'ceo_message', N'<p>We are a Team of highly experienced professionals and investors who have diversified hands-on experience and know how to increase investor&rsquo;s wealth by capitalizing in Real Estate. We have Head Quarter in Lahore with customers and investors around the world mainly in USA, Canada, Europe, Middle East and Pakistan.</p>
<p>Our Goal is to generate attractive risk-adjusted returns (ROI) for our investors across cycles in short, medium and over the long term. MY Ventures Real Estate platform encompasses investments across the risk spectrum from opportunistic to core+ to value added.</p>
<p>We seek to acquire high-quality investments at discounts to Sell, Develop or Retain. Our efforts result in Solid Returns for investors and strong economic assets for communities. MY Ventures Real Estate focus is Residential, Commercial, Industrial properties and Land Acquisitions; while offering the following Services to our Prestigious Clients:</p>
<ul>
<li>Project Marketing &amp; Management</li>
<li>Portfolio/Assets Management</li>
<li>Real Estate Consultancy</li>
<li>Real Estate Brokerage</li>
<li>Construction Management</li>
</ul>
<p>There is always an opportunity to invest in Real Estate. Timely &amp; Rational Decisions Nurture Greater Returns. We believe and our Pride is to serve the customers to the maximum satisfaction with Quality Service, Transparency, Honesty and above all Dignity.</p>
<p>Growing Together - Our Motivation <br />&amp; Achieving Excellence &ndash; Our Aim</p>')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (1006, N'CEO', N'CEO')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (1007, N'ceo_name', N'Imran Rashid')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (1008, N'ceo_phone', N'+92 335 3222777')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (1009, N'ceo_email', N'imran@myventures.pk')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (1010, N'ceo_image', N'1b2f260b-9e0a-4613-8ce2-56c49f13a65d.jpg')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (1011, N'section_address_background_image', N'1072e758-0a0b-4231-81b4-6615efb04da7.jpeg')
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText]) VALUES (1012, N'Index_Section_Address', N'Index_Section_Address')
SET IDENTITY_INSERT [dbo].[SiteMeta] OFF
SET IDENTITY_INSERT [dbo].[SiteMetaMatch] ON 

INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (1, 2, 1)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (2, 3, 1)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (3, 5, 4)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (4, 3, 4)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (5, 5, 6)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (6, 3, 6)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (7, 5, 7)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (8, 3, 7)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (9, 9, 8)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (10, 3, 8)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (11, 9, 10)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (12, 3, 10)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (13, 9, 11)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (14, 3, 11)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (15, 9, 12)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (16, 3, 12)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (17, 9, 13)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (18, 3, 13)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (19, 9, 14)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (20, 3, 14)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (21, 9, 15)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (22, 3, 15)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (23, 9, 16)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (24, 3, 16)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (25, 9, 17)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (26, 3, 17)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (27, 9, 18)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (28, 3, 18)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (29, 9, 19)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (30, 3, 19)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (31, 9, 20)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (32, 3, 20)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (33, 2, 21)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (34, 3, 21)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (35, 2, 22)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (36, 3, 22)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (37, 2, 23)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (38, 3, 23)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (39, 2, 24)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (40, 3, 24)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (41, 2, 25)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (42, 3, 25)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (43, 2, 26)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (44, 3, 26)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (45, 2, 27)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (46, 3, 27)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (47, 2, 28)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (48, 3, 28)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (49, 2, 29)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (50, 3, 29)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (51, 2, 30)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (52, 3, 30)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (53, 2, 31)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (54, 3, 31)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (55, 2, 32)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (56, 3, 32)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (57, 2, 33)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (58, 3, 33)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (59, 2, 34)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (60, 3, 34)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (61, 36, 35)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (62, 37, 35)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (63, 3, 35)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (64, 36, 38)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (65, 37, 38)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (66, 3, 38)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (67, 36, 39)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (68, 37, 39)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (69, 3, 39)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (70, 36, 40)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (71, 37, 40)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (72, 3, 40)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (1002, 1003, 1002)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (1003, 1004, 1002)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (1004, 3, 1002)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (1005, 1006, 1005)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (1006, 1006, 1007)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (1007, 1006, 1008)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (1008, 1006, 1009)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (1009, 1006, 1010)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (1010, 3, 1011)
INSERT [dbo].[SiteMetaMatch] ([MatchMetaId], [MetaParentId], [MetaChildId]) VALUES (1011, 1012, 1011)
SET IDENTITY_INSERT [dbo].[SiteMetaMatch] OFF
SET IDENTITY_INSERT [dbo].[Units] ON 

INSERT [dbo].[Units] ([UnitId], [Name]) VALUES (1, N'Kanal')
INSERT [dbo].[Units] ([UnitId], [Name]) VALUES (2, N'Marla')
INSERT [dbo].[Units] ([UnitId], [Name]) VALUES (3, N'Sqaure Feet')
INSERT [dbo].[Units] ([UnitId], [Name]) VALUES (4, N'Square Yards')
INSERT [dbo].[Units] ([UnitId], [Name]) VALUES (5, N'Square Meters')
SET IDENTITY_INSERT [dbo].[Units] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [Email], [Name], [Phone], [Subscribed]) VALUES (1, N'tagheir@gmail.com', N'Hisham Asghar', NULL, 1)
INSERT [dbo].[Users] ([UserId], [Email], [Name], [Phone], [Subscribed]) VALUES (2, N'tagheir.hisham@gmail.com', N'Hisham Asghar', N'3214445292', 0)
INSERT [dbo].[Users] ([UserId], [Email], [Name], [Phone], [Subscribed]) VALUES (3, N'tagheir.hisham@gmail', N'Hisham Asghar', N'3214445292', 0)
INSERT [dbo].[Users] ([UserId], [Email], [Name], [Phone], [Subscribed]) VALUES (4, N'hisham.asghar5292@gmail.com', N'hisham.asghar5292@', NULL, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Index [IX_AmenitiesTypeId]    Script Date: 2/26/2018 8:33:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_AmenitiesTypeId] ON [dbo].[Amenities]
(
	[AmenitiesTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PropertyId]    Script Date: 2/26/2018 8:33:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_PropertyId] ON [dbo].[Amenities]
(
	[PropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ParentTypeId]    Script Date: 2/26/2018 8:33:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_ParentTypeId] ON [dbo].[AmenitiesType]
(
	[ParentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BlogViewTypeId]    Script Date: 2/26/2018 8:33:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_BlogViewTypeId] ON [dbo].[BlogViewItem]
(
	[BlogViewTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CountryID]    Script Date: 2/26/2018 8:33:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_CountryID] ON [dbo].[cities]
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TypeId]    Script Date: 2/26/2018 8:33:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_TypeId] ON [dbo].[Comments]
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 2/26/2018 8:33:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[Comments]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TypeId]    Script Date: 2/26/2018 8:33:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_TypeId] ON [dbo].[Files]
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PropertyId]    Script Date: 2/26/2018 8:33:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_PropertyId] ON [dbo].[Inquiries]
(
	[PropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 2/26/2018 8:33:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[Inquiries]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CityId]    Script Date: 2/26/2018 8:33:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_CityId] ON [dbo].[Location]
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BlogId]    Script Date: 2/26/2018 8:33:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_BlogId] ON [dbo].[MagzineItems]
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BlogItemId]    Script Date: 2/26/2018 8:33:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_BlogItemId] ON [dbo].[MagzineItems]
(
	[BlogItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MagzineId]    Script Date: 2/26/2018 8:33:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_MagzineId] ON [dbo].[MagzineItems]
(
	[MagzineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BlogViewTypeId]    Script Date: 2/26/2018 8:33:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_BlogViewTypeId] ON [dbo].[Magzines]
(
	[BlogViewTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CategoryId]    Script Date: 2/26/2018 8:33:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_CategoryId] ON [dbo].[Magzines]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AreaUnit]    Script Date: 2/26/2018 8:33:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_AreaUnit] ON [dbo].[Property]
(
	[AreaUnit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LocationId]    Script Date: 2/26/2018 8:33:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_LocationId] ON [dbo].[Property]
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PriceUnit]    Script Date: 2/26/2018 8:33:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_PriceUnit] ON [dbo].[Property]
(
	[PriceUnit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TypeId]    Script Date: 2/26/2018 8:33:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_TypeId] ON [dbo].[Property]
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ParentTypeId]    Script Date: 2/26/2018 8:33:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_ParentTypeId] ON [dbo].[PropertyType]
(
	[ParentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MetaChildId]    Script Date: 2/26/2018 8:33:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_MetaChildId] ON [dbo].[SiteMetaMatch]
(
	[MetaChildId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MetaParentId]    Script Date: 2/26/2018 8:33:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_MetaParentId] ON [dbo].[SiteMetaMatch]
(
	[MetaParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 2/26/2018 8:33:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[UserDetails]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Amenities]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Amenities_dbo.AmenitiesType_AmenitiesTypeId] FOREIGN KEY([AmenitiesTypeId])
REFERENCES [dbo].[AmenitiesType] ([AmenitiesTypeId])
GO
ALTER TABLE [dbo].[Amenities] CHECK CONSTRAINT [FK_dbo.Amenities_dbo.AmenitiesType_AmenitiesTypeId]
GO
ALTER TABLE [dbo].[Amenities]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Amenities_dbo.Property_PropertyId] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[Property] ([PropertyId])
GO
ALTER TABLE [dbo].[Amenities] CHECK CONSTRAINT [FK_dbo.Amenities_dbo.Property_PropertyId]
GO
ALTER TABLE [dbo].[AmenitiesType]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AmenitiesType_dbo.AmenitiesType_ParentTypeId] FOREIGN KEY([ParentTypeId])
REFERENCES [dbo].[AmenitiesType] ([AmenitiesTypeId])
GO
ALTER TABLE [dbo].[AmenitiesType] CHECK CONSTRAINT [FK_dbo.AmenitiesType_dbo.AmenitiesType_ParentTypeId]
GO
ALTER TABLE [dbo].[BlogViewItem]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BlogViewItem_dbo.BlogViewType_BlogViewTypeId] FOREIGN KEY([BlogViewTypeId])
REFERENCES [dbo].[BlogViewType] ([BlogViewTypeId])
GO
ALTER TABLE [dbo].[BlogViewItem] CHECK CONSTRAINT [FK_dbo.BlogViewItem_dbo.BlogViewType_BlogViewTypeId]
GO
ALTER TABLE [dbo].[cities]  WITH CHECK ADD  CONSTRAINT [FK_dbo.cities_dbo.Countries_CountryID] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Countries] ([CountryId])
GO
ALTER TABLE [dbo].[cities] CHECK CONSTRAINT [FK_dbo.cities_dbo.Countries_CountryID]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Comments_dbo.Magzines_TypeId] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Magzines] ([MagzineId])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_dbo.Comments_dbo.Magzines_TypeId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Comments_dbo.Property_TypeId] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Property] ([PropertyId])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_dbo.Comments_dbo.Property_TypeId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Comments_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_dbo.Comments_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[ContactMessage]  WITH CHECK ADD  CONSTRAINT [FK_ContactMessage_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[ContactMessage] CHECK CONSTRAINT [FK_ContactMessage_User]
GO
ALTER TABLE [dbo].[Files]  WITH NOCHECK ADD  CONSTRAINT [FK_dbo.Files_dbo.Magzines_TypeId] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Magzines] ([MagzineId])
GO
ALTER TABLE [dbo].[Files] NOCHECK CONSTRAINT [FK_dbo.Files_dbo.Magzines_TypeId]
GO
ALTER TABLE [dbo].[Files]  WITH NOCHECK ADD  CONSTRAINT [FK_dbo.Files_dbo.Property_TypeId] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Property] ([PropertyId])
GO
ALTER TABLE [dbo].[Files] NOCHECK CONSTRAINT [FK_dbo.Files_dbo.Property_TypeId]
GO
ALTER TABLE [dbo].[Inquiries]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Inquiries_dbo.Property_PropertyId] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[Property] ([PropertyId])
GO
ALTER TABLE [dbo].[Inquiries] CHECK CONSTRAINT [FK_dbo.Inquiries_dbo.Property_PropertyId]
GO
ALTER TABLE [dbo].[Inquiries]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Inquiries_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Inquiries] CHECK CONSTRAINT [FK_dbo.Inquiries_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Location_dbo.cities_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[cities] ([CityId])
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_dbo.Location_dbo.cities_CityId]
GO
ALTER TABLE [dbo].[MagzineItems]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MagzineItems_dbo.BlogViewItem_BlogItemId] FOREIGN KEY([BlogItemId])
REFERENCES [dbo].[BlogViewItem] ([BlogViewItemId])
GO
ALTER TABLE [dbo].[MagzineItems] CHECK CONSTRAINT [FK_dbo.MagzineItems_dbo.BlogViewItem_BlogItemId]
GO
ALTER TABLE [dbo].[MagzineItems]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MagzineItems_dbo.BlogViewType_BlogId] FOREIGN KEY([BlogId])
REFERENCES [dbo].[BlogViewType] ([BlogViewTypeId])
GO
ALTER TABLE [dbo].[MagzineItems] CHECK CONSTRAINT [FK_dbo.MagzineItems_dbo.BlogViewType_BlogId]
GO
ALTER TABLE [dbo].[MagzineItems]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MagzineItems_dbo.Magzines_MagzineId] FOREIGN KEY([MagzineId])
REFERENCES [dbo].[Magzines] ([MagzineId])
GO
ALTER TABLE [dbo].[MagzineItems] CHECK CONSTRAINT [FK_dbo.MagzineItems_dbo.Magzines_MagzineId]
GO
ALTER TABLE [dbo].[Magzines]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Magzines_dbo.BlogViewType_BlogViewTypeId] FOREIGN KEY([BlogViewTypeId])
REFERENCES [dbo].[BlogViewType] ([BlogViewTypeId])
GO
ALTER TABLE [dbo].[Magzines] CHECK CONSTRAINT [FK_dbo.Magzines_dbo.BlogViewType_BlogViewTypeId]
GO
ALTER TABLE [dbo].[Magzines]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Magzines_dbo.MagzineCategory_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[MagzineCategory] ([MagzineCategoryId])
GO
ALTER TABLE [dbo].[Magzines] CHECK CONSTRAINT [FK_dbo.Magzines_dbo.MagzineCategory_CategoryId]
GO
ALTER TABLE [dbo].[Property]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Property_dbo.Location_LocationId] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([LocationId])
GO
ALTER TABLE [dbo].[Property] CHECK CONSTRAINT [FK_dbo.Property_dbo.Location_LocationId]
GO
ALTER TABLE [dbo].[Property]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Property_dbo.PriceUnit_PriceUnit] FOREIGN KEY([PriceUnit])
REFERENCES [dbo].[PriceUnit] ([PriceUnitId])
GO
ALTER TABLE [dbo].[Property] CHECK CONSTRAINT [FK_dbo.Property_dbo.PriceUnit_PriceUnit]
GO
ALTER TABLE [dbo].[Property]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Property_dbo.PropertyType_TypeId] FOREIGN KEY([TypeId])
REFERENCES [dbo].[PropertyType] ([PropertyTypeId])
GO
ALTER TABLE [dbo].[Property] CHECK CONSTRAINT [FK_dbo.Property_dbo.PropertyType_TypeId]
GO
ALTER TABLE [dbo].[Property]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Property_dbo.Units_AreaUnit] FOREIGN KEY([AreaUnit])
REFERENCES [dbo].[Units] ([UnitId])
GO
ALTER TABLE [dbo].[Property] CHECK CONSTRAINT [FK_dbo.Property_dbo.Units_AreaUnit]
GO
ALTER TABLE [dbo].[PropertyReviews]  WITH CHECK ADD  CONSTRAINT [FK_PropertyReviews_Property] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[Property] ([PropertyId])
GO
ALTER TABLE [dbo].[PropertyReviews] CHECK CONSTRAINT [FK_PropertyReviews_Property]
GO
ALTER TABLE [dbo].[PropertyReviews]  WITH CHECK ADD  CONSTRAINT [FK_PropertyReviews_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[PropertyReviews] CHECK CONSTRAINT [FK_PropertyReviews_User]
GO
ALTER TABLE [dbo].[PropertyType]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PropertyType_dbo.PropertyType_ParentTypeId] FOREIGN KEY([ParentTypeId])
REFERENCES [dbo].[PropertyType] ([PropertyTypeId])
GO
ALTER TABLE [dbo].[PropertyType] CHECK CONSTRAINT [FK_dbo.PropertyType_dbo.PropertyType_ParentTypeId]
GO
ALTER TABLE [dbo].[SiteMetaMatch]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SiteMetaMatch_dbo.SiteMeta_MetaChildId] FOREIGN KEY([MetaChildId])
REFERENCES [dbo].[SiteMeta] ([MetaId])
GO
ALTER TABLE [dbo].[SiteMetaMatch] CHECK CONSTRAINT [FK_dbo.SiteMetaMatch_dbo.SiteMeta_MetaChildId]
GO
ALTER TABLE [dbo].[SiteMetaMatch]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SiteMetaMatch_dbo.SiteMeta_MetaParentId] FOREIGN KEY([MetaParentId])
REFERENCES [dbo].[SiteMeta] ([MetaId])
GO
ALTER TABLE [dbo].[SiteMetaMatch] CHECK CONSTRAINT [FK_dbo.SiteMetaMatch_dbo.SiteMeta_MetaParentId]
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserDetails_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_dbo.UserDetails_dbo.Users_UserId]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AmenitiesType"
            Begin Extent = 
               Top = 0
               Left = 331
               Bottom = 130
               Right = 531
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AmenitiesType_1"
            Begin Extent = 
               Top = 50
               Left = 38
               Bottom = 180
               Right = 238
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3345
         Alias = 4290
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AmenityView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AmenityView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ContactMessage"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 225
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Users"
            Begin Extent = 
               Top = 6
               Left = 263
               Bottom = 136
               Right = 433
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ContactMessageViewModel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ContactMessageViewModel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "cities"
            Begin Extent = 
               Top = 73
               Left = 10
               Bottom = 203
               Right = 180
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Units"
            Begin Extent = 
               Top = 6
               Left = 1078
               Bottom = 102
               Right = 1248
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PropertyType"
            Begin Extent = 
               Top = 3
               Left = 865
               Bottom = 116
               Right = 1035
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PriceUnit"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 102
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Location"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Property"
            Begin Extent = 
               Top = 161
               Left = 667
               Bottom = 291
               Right = 837
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PropertySmallView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'Alias = 2160
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PropertySmallView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PropertySmallView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "cities"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Location"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PriceUnit"
            Begin Extent = 
               Top = 138
               Left = 246
               Bottom = 251
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PropertyType"
            Begin Extent = 
               Top = 252
               Left = 246
               Bottom = 365
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Units"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 366
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Property"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 14
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
      ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PropertyView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'   Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PropertyView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PropertyView'
GO
USE [master]
GO
ALTER DATABASE [myventures] SET  READ_WRITE 
GO
