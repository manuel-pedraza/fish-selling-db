USE [master]
GO
/****** Object:  Database [FishSellingDB]    Script Date: 3/20/2025 7:18:14 PM ******/
CREATE DATABASE [FishSellingDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FishSellingDB', FILENAME = N'/var/opt/mssql/data/FishSellingDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FishSellingDB_log', FILENAME = N'/var/opt/mssql/data/FishSellingDB_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FishSellingDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
	EXEC [FishSellingDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FishSellingDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FishSellingDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FishSellingDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FishSellingDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FishSellingDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [FishSellingDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FishSellingDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FishSellingDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FishSellingDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FishSellingDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FishSellingDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FishSellingDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FishSellingDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FishSellingDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FishSellingDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FishSellingDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FishSellingDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FishSellingDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FishSellingDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FishSellingDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FishSellingDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FishSellingDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FishSellingDB] SET RECOVERY FULL 
GO
ALTER DATABASE [FishSellingDB] SET  MULTI_USER 
GO
ALTER DATABASE [FishSellingDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FishSellingDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FishSellingDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FishSellingDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FishSellingDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FishSellingDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FishSellingDB', N'ON'
GO
ALTER DATABASE [FishSellingDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [FishSellingDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FishSellingDB]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 3/20/2025 7:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses]
(
	[id] [int] NOT NULL,
	[worldRegion] [nvarchar](50) NOT NULL,
	[country] [nvarchar](50) NOT NULL,
	[stateProvince] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[postalCode] [nvarchar](50) NULL,
	[addressLine1] [nvarchar](50) NULL,
	[addressLine2] [nvarchar](50) NULL,
	CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catches]    Script Date: 3/20/2025 7:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catches]
(
	[id] [int] NOT NULL,
	[fishermanId] [int] NOT NULL,
	[date] [date] NULL,
	CONSTRAINT [PK_Catches] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 3/20/2025 7:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts]
(
	[id] [int] NOT NULL,
	[email] [nvarchar](50) NULL,
	[phoneNumber1] [nvarchar](50) NULL,
	[phoneNumber2] [nvarchar](50) NULL,
	CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 3/20/2025 7:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers]
(
	[id] [int] NOT NULL,
	[firstName] [nvarchar](50) NULL,
	[lastName] [nvarchar](50) NULL,
	[age] [smallint] NULL,
	[addressId] [int] NULL,
	[contactId] [int] NULL,
	CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLogs]    Script Date: 3/20/2025 7:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLogs]
(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](max) NOT NULL,
	[errorNumber] [int] NOT NULL,
	[errorSeverity] [int] NOT NULL,
	[errorState] [int] NOT NULL,
	[errorProcedure] [nvarchar](50) NULL,
	[errorLine] [int] NOT NULL,
	[errorMessage] [nvarchar](50) NOT NULL,
	CONSTRAINT [PK_ErrorLogs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fish]    Script Date: 3/20/2025 7:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fish]
(
	[id] [int] NOT NULL,
	[color] [nvarchar](50) NULL,
	[length] [float] NULL,
	[speciesId] [int] NULL,
	CONSTRAINT [PK_Fish] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FishCatch]    Script Date: 3/20/2025 7:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FishCatch]
(
	[id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[weight] [decimal](18, 0) NULL,
	[time] [time](3) NULL,
	[fishId] [int] NOT NULL,
	[locationId] [int] NOT NULL,
	[catchId] [int] NOT NULL,
	CONSTRAINT [PK_FishCatch] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fishermen]    Script Date: 3/20/2025 7:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fishermen]
(
	[id] [int] NOT NULL,
	[firstName] [nvarchar](50) NULL,
	[lastName] [nvarchar](50) NULL,
	[age] [smallint] NULL,
	[addressId] [int] NULL,
	[contactId] [int] NULL,
	CONSTRAINT [PK_Fishermen] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FishOrder]    Script Date: 3/20/2025 7:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FishOrder]
(
	[id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[weight] [decimal](18, 0) NULL,
	[price] [money] NOT NULL,
	[fishCatchId] [int] NOT NULL,
	[orderId] [int] NOT NULL,
	CONSTRAINT [PK_FishOrder] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habitats]    Script Date: 3/20/2025 7:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitats]
(
	[speciesId] [int] NULL,
	[waterBodyId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 3/20/2025 7:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations]
(
	[id] [int] NOT NULL,
	[x] [decimal](18, 0) NULL,
	[y] [decimal](18, 0) NULL,
	[waterBodyId] [int] NOT NULL,
	CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/20/2025 7:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders]
(
	[id] [int] NOT NULL,
	[dateToDeliver] [date] NOT NULL,
	[wasDelivered] [bit] NOT NULL,
	[customerId] [int] NOT NULL,
	CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Species]    Script Date: 3/20/2025 7:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Species]
(
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[parentSpeciesId] [int] NULL,
	CONSTRAINT [PK_Species] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WaterBodies]    Script Date: 3/20/2025 7:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WaterBodies]
(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[typeId] [int] NOT NULL,
	CONSTRAINT [PK_WaterBodies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WaterBodyTypes]    Script Date: 3/20/2025 7:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WaterBodyTypes]
(
	[id] [int] NOT NULL,
	[typeName] [nvarchar](50) NOT NULL,
	[size] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	CONSTRAINT [PK_WaterBodiesTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Catches]  WITH CHECK ADD  CONSTRAINT [FK_Catches_Fishermen] FOREIGN KEY([fishermanId])
REFERENCES [dbo].[Fishermen] ([id])
GO
ALTER TABLE [dbo].[Catches] CHECK CONSTRAINT [FK_Catches_Fishermen]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Addresses] FOREIGN KEY([addressId])
REFERENCES [dbo].[Addresses] ([id])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Addresses]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Contacts] FOREIGN KEY([contactId])
REFERENCES [dbo].[Contacts] ([id])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Contacts]
GO
ALTER TABLE [dbo].[Fish]  WITH CHECK ADD  CONSTRAINT [FK_Fish_Species] FOREIGN KEY([speciesId])
REFERENCES [dbo].[Species] ([id])
GO
ALTER TABLE [dbo].[Fish] CHECK CONSTRAINT [FK_Fish_Species]
GO
ALTER TABLE [dbo].[FishCatch]  WITH CHECK ADD  CONSTRAINT [FK_FishCatch_Catches] FOREIGN KEY([catchId])
REFERENCES [dbo].[Catches] ([id])
GO
ALTER TABLE [dbo].[FishCatch] CHECK CONSTRAINT [FK_FishCatch_Catches]
GO
ALTER TABLE [dbo].[FishCatch]  WITH CHECK ADD  CONSTRAINT [FK_FishCatch_Fish] FOREIGN KEY([fishId])
REFERENCES [dbo].[Fish] ([id])
GO
ALTER TABLE [dbo].[FishCatch] CHECK CONSTRAINT [FK_FishCatch_Fish]
GO
ALTER TABLE [dbo].[FishCatch]  WITH CHECK ADD  CONSTRAINT [FK_FishCatch_Locations] FOREIGN KEY([locationId])
REFERENCES [dbo].[Locations] ([id])
GO
ALTER TABLE [dbo].[FishCatch] CHECK CONSTRAINT [FK_FishCatch_Locations]
GO
ALTER TABLE [dbo].[Fishermen]  WITH CHECK ADD  CONSTRAINT [FK_Fishermen_Addresses] FOREIGN KEY([addressId])
REFERENCES [dbo].[Addresses] ([id])
GO
ALTER TABLE [dbo].[Fishermen] CHECK CONSTRAINT [FK_Fishermen_Addresses]
GO
ALTER TABLE [dbo].[Fishermen]  WITH CHECK ADD  CONSTRAINT [FK_Fishermen_Contacts] FOREIGN KEY([contactId])
REFERENCES [dbo].[Contacts] ([id])
GO
ALTER TABLE [dbo].[Fishermen] CHECK CONSTRAINT [FK_Fishermen_Contacts]
GO
ALTER TABLE [dbo].[FishOrder]  WITH CHECK ADD  CONSTRAINT [FK_FishOrder_FishCatch] FOREIGN KEY([fishCatchId])
REFERENCES [dbo].[FishCatch] ([id])
GO
ALTER TABLE [dbo].[FishOrder] CHECK CONSTRAINT [FK_FishOrder_FishCatch]
GO
ALTER TABLE [dbo].[FishOrder]  WITH CHECK ADD  CONSTRAINT [FK_FishOrder_Orders] FOREIGN KEY([orderId])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[FishOrder] CHECK CONSTRAINT [FK_FishOrder_Orders]
GO
ALTER TABLE [dbo].[Habitats]  WITH CHECK ADD  CONSTRAINT [FK_Habitats_Species] FOREIGN KEY([speciesId])
REFERENCES [dbo].[Species] ([id])
GO
ALTER TABLE [dbo].[Habitats] CHECK CONSTRAINT [FK_Habitats_Species]
GO
ALTER TABLE [dbo].[Habitats]  WITH CHECK ADD  CONSTRAINT [FK_Habitats_WaterBodies] FOREIGN KEY([waterBodyId])
REFERENCES [dbo].[WaterBodies] ([id])
GO
ALTER TABLE [dbo].[Habitats] CHECK CONSTRAINT [FK_Habitats_WaterBodies]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_WaterBodies] FOREIGN KEY([waterBodyId])
REFERENCES [dbo].[WaterBodies] ([id])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_WaterBodies]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([customerId])
REFERENCES [dbo].[Customers] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Species]  WITH CHECK ADD  CONSTRAINT [FK_Species_Species] FOREIGN KEY([parentSpeciesId])
REFERENCES [dbo].[Species] ([id])
GO
ALTER TABLE [dbo].[Species] CHECK CONSTRAINT [FK_Species_Species]
GO
ALTER TABLE [dbo].[WaterBodies]  WITH CHECK ADD  CONSTRAINT [FK_WaterBodies_WaterBodiesTypes] FOREIGN KEY([typeId])
REFERENCES [dbo].[WaterBodyTypes] ([id])
GO
ALTER TABLE [dbo].[WaterBodies] CHECK CONSTRAINT [FK_WaterBodies_WaterBodiesTypes]
GO
/****** Object:  StoredProcedure [dbo].[ErrorLogger]    Script Date: 3/20/2025 7:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ErrorLogger]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT FishSellingDB.dbo.ErrorLogs
		(
		[userName],
		[errorNumber],
		[errorSeverity],
		[errorState],
		[errorProcedure],
		[errorLine],
		[errorMessage]
		)
	VALUES
		(
			CONVERT(sysname, CURRENT_USER),
			ERROR_NUMBER(),
			ERROR_SEVERITY(),
			ERROR_STATE(),
			ERROR_PROCEDURE(),
			ERROR_LINE(),
			ERROR_MESSAGE()
        );
END
GO
/****** Object:  StoredProcedure [dbo].[PrintError]    Script Date: 3/20/2025 7:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PrintError]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	PRINT 'Error ' + CONVERT(varchar(50), ERROR_NUMBER()) +
        ', Severity ' + CONVERT(varchar(5), ERROR_SEVERITY()) +
        ', State ' + CONVERT(varchar(5), ERROR_STATE()) + 
        ', Procedure ' + ISNULL(ERROR_PROCEDURE(), '-') + 
        ', Line ' + CONVERT(varchar(5), ERROR_LINE());
	PRINT ERROR_MESSAGE();
END
GO
USE [master]
GO
ALTER DATABASE [FishSellingDB] SET  READ_WRITE 
GO
