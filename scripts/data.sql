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
	[errorProcedure] [int] NULL,
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
USE [FishSellingDB]
GO
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (1, 'Catfish', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (2, 'Carp', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (3, 'Trout', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (4, 'Pike', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (5, 'Perch', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (6, 'Tilapia', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (7, 'Sturgeon', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (8, 'Guppy', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (9, 'Tetra', NULL)

-- Saltwater Fish
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (10, 'Tuna', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (11, 'Mackerel', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (12, 'Cod', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (13, 'Snapper', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (14, 'Grouper', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (15, 'Halibut', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (16, 'Flounder', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (17, 'Marlin', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (18, 'Swordfish', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (19, 'Barracuda', NULL)

-- Sharks & Rays
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (20, 'Shark', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (21, 'Great White Shark', 20)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (22, 'Tiger Shark', 20)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (23, 'Hammerhead Shark', 20)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (24, 'Bull Shark', 20)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (25, 'Whale Shark', 20)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (26, 'Manta Ray', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (27, 'Stingray', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (28, 'Sawfish', NULL)

-- Coral Reef Fish
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (29, 'Clownfish', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (30, 'Angelfish', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (31, 'Parrotfish', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (32, 'Butterflyfish', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (33, 'Tang', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (34, 'Wrasse', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (35, 'Goby', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (36, 'Mandarinfish', NULL)

-- Ancient & Unique Fish
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (37, 'Coelacanth', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (38, 'Lungfish', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (39, 'Paddlefish', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (40, 'Archerfish', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (41, 'Electric Eel', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (42, 'Arowana', NULL)

INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (43, 'Channel Catfish', 1)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (44, 'Blue Catfish', 1)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (45, 'Flathead Catfish', 1)

INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (46, 'Common Carp', 2)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (47, 'Mirror Carp', 2)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (48, 'Grass Carp', 2)

INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (49, 'Rainbow Trout', 3)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (50, 'Brown Trout', 3)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (51, 'Brook Trout', 3)

INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (52, 'Northern Pike', 4)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (53, 'Muskellunge', 4)

INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (54, 'Yellow Perch', 5)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (55, 'European Perch', 5)

INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (56, 'Bluefin Tuna', 10)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (57, 'Yellowfin Tuna', 10)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (58, 'Skipjack Tuna', 10)

INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (59, 'Giant Manta Ray', 26)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (60, 'Reef Manta Ray', 26)

INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (61, 'Percula Clownfish', 29)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (62, 'Ocellaris Clownfish', 29)

INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (63, 'Emperor Angelfish', 30)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (64, 'Queen Angelfish', 30)

INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (65, 'Blue Tang', 33)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (66, 'Yellow Tang', 33)

INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (67, 'West Indian Ocean Coelacanth', 37)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (68, 'Indonesian Coelacanth', 37)

-- Subspecies of Subspecies (Parent is a Subspecies)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (69, 'Albino Channel Catfish', 43);
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (70, 'Leather Carp', 46);
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (71, 'Fully Scaled Mirror Carp', 46);
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (72, 'Golden Rainbow Trout', 49);
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (73, 'Salvelinus fontinalis timagamiensis', 51);
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (74, 'Great Hammerhead', 23);
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (75, 'Scalloped Hammerhead', 23);
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (76, 'Bonnethead Shark', 23);
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (77, 'Atlantic Manta Ray', 59);

INSERT INTO [dbo].[WaterBodyTypes] ([id],[typeName],[size],[description]) VALUES (1, 'Ocean', 'Large', 'The largest body of saltwater, covering most of the Earth''s surface.')
INSERT INTO [dbo].[WaterBodyTypes] ([id],[typeName],[size],[description]) VALUES (2, 'Sea', 'Large', 'A large saltwater body, smaller than an ocean, often partly enclosed by land.')
INSERT INTO [dbo].[WaterBodyTypes] ([id],[typeName],[size],[description]) VALUES (3, 'Gulf', 'Large', 'A large portion of the sea partially enclosed by land.')
INSERT INTO [dbo].[WaterBodyTypes] ([id],[typeName],[size],[description]) VALUES (4, 'Bay', 'Large', 'A broad inlet of the sea where the land curves inward.')
INSERT INTO [dbo].[WaterBodyTypes] ([id],[typeName],[size],[description]) VALUES (5, 'Sound', 'Large', 'A large sea or ocean inlet, often between two bodies of land.')

INSERT INTO [dbo].[WaterBodyTypes] ([id],[typeName],[size],[description]) VALUES (6, 'Lake', 'Medium', 'A large inland body of water, usually freshwater, but some are saltwater.')
INSERT INTO [dbo].[WaterBodyTypes] ([id],[typeName],[size],[description]) VALUES (7, 'Lagoo', 'Medium', 'A shallow body of water separated from a larger body by a barrier (e.g., reefs).')
INSERT INTO [dbo].[WaterBodyTypes] ([id],[typeName],[size],[description]) VALUES (8, 'Reservoir', 'Medium', 'A man-made lake used for storing water.')
INSERT INTO [dbo].[WaterBodyTypes] ([id],[typeName],[size],[description]) VALUES (9, 'Estuary', 'Medium', 'A coastal area where freshwater from rivers meets saltwater from the sea.')

INSERT INTO [dbo].[WaterBodyTypes] ([id],[typeName],[size],[description]) VALUES (10, 'River', 'Large', 'A large, flowing body of freshwater that moves towards an ocean, sea, or lake.')
INSERT INTO [dbo].[WaterBodyTypes] ([id],[typeName],[size],[description]) VALUES (11, 'Stream', 'Small', 'A small, narrow river')
INSERT INTO [dbo].[WaterBodyTypes] ([id],[typeName],[size],[description]) VALUES (12, 'Brook', 'Very Small', 'A very small, natural stream of water.')
INSERT INTO [dbo].[WaterBodyTypes] ([id],[typeName],[size],[description]) VALUES (13, 'Creek', 'Medium', 'A medium-sized stream, often smaller than a river but larger than a brook.')
INSERT INTO [dbo].[WaterBodyTypes] ([id],[typeName],[size],[description]) VALUES (14, 'Tributary', 'Medium', 'A smaller river or stream that flows into a larger one.')

INSERT INTO [dbo].[WaterBodyTypes] ([id],[typeName],[size],[description]) VALUES (15, 'Pond', 'Small', 'A small, still body of water, usually smaller than a lake.')
INSERT INTO [dbo].[WaterBodyTypes] ([id],[typeName],[size],[description]) VALUES (16, 'Pool', 'Small', 'A small, still water body, can be natural or artificial.')
INSERT INTO [dbo].[WaterBodyTypes] ([id],[typeName],[size],[description]) VALUES (17, 'Spring', 'Small', 'A natural water source where groundwater flows to the surface.')
INSERT INTO [dbo].[WaterBodyTypes] ([id],[typeName],[size],[description]) VALUES (18, 'Oasis', 'Small', 'A water source in a desert, often surrounded by vegetation.')

INSERT INTO [dbo].[WaterBodyTypes] ([id],[typeName],[size],[description]) VALUES (19, 'Fjord', 'Long', 'A long, deep sea inlet between cliffs, formed by glaciers.')
INSERT INTO [dbo].[WaterBodyTypes] ([id],[typeName],[size],[description]) VALUES (20, 'Marsh', 'Small', 'A wetland with soft, grassy vegetation and standing water.')
INSERT INTO [dbo].[WaterBodyTypes] ([id],[typeName],[size],[description]) VALUES (21, 'Swamp', 'Small', 'A wetland dominated by trees and standing or slow-moving water.')
INSERT INTO [dbo].[WaterBodyTypes] ([id],[typeName],[size],[description]) VALUES (22, 'Canal', 'Long', 'A man-made waterway for transportation or irrigation.')
INSERT INTO [dbo].[WaterBodyTypes] ([id],[typeName],[size],[description]) VALUES (23, 'Strait', 'Small', 'A narrow passage of water connecting two larger bodies of water.')
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (1, 'shourston0@google.com.br', '846-170-8299', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (2, null, null, null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (3, 'rkingswell2@oaic.gov.au', null, '690-285-4365');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (4, 'gdefilippi3@printfriendly.com', '263-969-8331', '131-540-0762');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (5, null, null, '530-979-1383');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (6, 'ksandels5@naver.com', '210-464-5721', '583-935-4160');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (7, 'cteather6@blogtalkradio.com', '236-575-0915', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (8, 'cszantho7@rambler.ru', null, '191-773-2647');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (9, 'mrosini8@oakley.com', '352-951-4258', '367-332-0061');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (10, 'afilkin9@i2i.jp', '717-417-3611', '569-542-4688');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (11, 'cwombwella@blogspot.com', '284-528-3835', '265-399-2088');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (12, 'msorrieb@vkontakte.ru', '257-806-3530', '155-877-4859');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (13, 'mdelias0@drupal.org', '(809) 3796064', '(191) 1265583');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (14, 'zdownton1@smh.com.au', '(408) 2816448', '(476) 1028008');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (15, 'qdavisson2@bing.com', '(306) 3023567', '(526) 3980902');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (16, 'kcoffin3@narod.ru', '(769) 4872892', '(487) 5595806');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (17, 'dsirkett4@dot.gov', '(246) 3781319', '(288) 5614175');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (18, 'lflowers5@youtube.com', '(204) 6854669', '(604) 6692195');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (19, 'adelcastel6@cbc.ca', '(380) 4786652', '(592) 2066913');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (20, 'smobley7@rediff.com', '(473) 7750307', '(669) 3164707');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (21, 'rworts8@hostgator.com', '(480) 9475859', '(683) 3584179');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (22, null, null, '(542) 4658431');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (23, 'twivella@illinois.edu', null, '(535) 8869464');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (24, 'pkobpacb@free.fr', '(204) 1354323', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (25, 'dbalmadier0@unicef.org', '570 664 9403', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (26, 'rallaker1@sitemeter.com', '673 517 1640', '707 960 3623');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (27, 'bmarsay2@tmall.com', null, '322 701 0467');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (28, 'rrowcastle3@yolasite.com', '927 503 5562', '381 299 3944');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (29, 'ctillett4@twitpic.com', '325 359 4617', '253 585 3420');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (30, 'vcater5@google.es', '645 277 8449', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (31, null, '202 594 7642', '858 406 7008');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (32, null, '821 152 3002', '509 742 1410');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (33, 'rforte8@sphinn.com', '125 858 2665', '905 390 2346');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (34, 'mscholes9@moonfruit.com', '431 262 1675', '250 184 8687');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (35, null, '314 268 9069', '603 893 2933');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (36, 'rbellyb@flickr.com', '868 228 7984', '203 818 7065');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (37, null, '+54 441 894 5867', '+351 693 544 9073');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (38, null, '+86 353 611 0950', '+55 429 946 8005');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (39, 'mmulqueen2@europa.eu', null, '+62 580 275 8706');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (40, null, '+507 314 502 0779', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (41, 'tegdale4@cpanel.net', '+30 842 232 3785', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (42, 'gdiehn5@businessinsider.com', null, null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (43, 'fhaythorne6@tuttocitta.it', null, '+86 178 233 6778');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (44, null, '+52 438 667 7234', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (45, null, '+62 154 922 5716', '+86 788 817 1981');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (46, 'itarplee9@toplist.cz', '+995 610 907 6559', '+62 353 240 3878');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (47, 'lbasinigazzia@geocities.com', '+27 318 780 2408', '+86 427 250 5855');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (48, null, '+86 440 605 5137', '+351 718 145 3594');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (49, 'jheustace0@exblog.jp', null, '+351 (123) 946-8370');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (50, null, '+55 (961) 805-5833', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (51, 'rthorneloe2@i2i.jp', null, '+7 (544) 914-3158');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (52, 'ojuleff3@elegantthemes.com', '+504 (385) 559-4169', '+62 (997) 665-1060');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (53, 'tandersen4@cafepress.com', '+55 (761) 281-6426', '+48 (187) 825-0844');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (54, 'belt5@oaic.gov.au', null, null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (55, 'djaquest6@businesswire.com', null, null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (56, 'adockrey7@cmu.edu', null, '+972 (257) 841-1604');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (57, 'imoloney8@jalbum.net', '+1 (229) 853-1489', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (58, 'landrzejewski9@sciencedirect.com', '+55 (258) 720-6159', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (59, 'ecornhilla@moonfruit.com', '+47 (644) 368-0161', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (60, 'spatinkinb@businessweek.com', '+968 (332) 454-2092', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (61, 'wdefau0@myspace.com', '+86-400-701-8215', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (62, 'lascroft1@scientificamerican.com', '+46-253-191-0642', '+66-640-804-4757');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (63, 'blottrington2@yelp.com', null, '+967-556-666-3966');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (64, 'cphonix3@bbb.org', '+62-723-205-9929', '+258-988-300-1025');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (65, 'avann4@youtu.be', null, '+62-685-802-1761');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (66, 'csimcox5@salon.com', null, null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (67, 'ccoath6@drupal.org', null, '+381-948-389-6717');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (68, 'elapidus7@parallels.com', null, '+1-202-167-6063');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (69, 'tebbin8@reddit.com', '+269-502-616-6455', '+386-965-392-4327');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (70, null, '+55-239-178-6743', '+385-939-288-9495');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (71, 'rmarmona@jiathis.com', null, '+880-738-762-0194');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (72, 'tclemonb@ftc.gov', '+62-658-977-5268', '+62-882-133-7817');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (73, 'slackmann0@cornell.edu', '371(667)443-4682', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (74, 'lgommey1@zimbio.com', '351(437)541-3869', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (75, null, '86(952)103-5644', '66(944)790-5322');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (76, 'jtrickett3@apple.com', '55(458)373-6878', '86(836)414-6772');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (77, null, '63(208)879-6001', '52(521)250-0308');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (78, 'alaboune5@epa.gov', null, '266(583)711-3264');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (79, 'eabbey6@europa.eu', null, '256(768)263-3206');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (80, null, '242(495)918-5050', '55(673)591-3076');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (81, null, '86(463)981-2147', '63(475)379-4988');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (82, 'ltroup9@tamu.edu', '63(237)634-8897', '36(281)510-8552');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (83, null, '81(603)935-8617', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (84, 'hgerreltb@mozilla.org', '506(677)460-5921', '383(990)750-3070');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (85, null, null, '3423741191');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (86, 'chodjetts1@free.fr', '5958305983', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (87, 'lkleingrub2@oaic.gov.au', '1067109597', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (88, 'escalera3@parallels.com', '8183412968', '2513410690');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (89, 'rbessett4@go.com', '2709363920', '5472938610');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (90, null, '6265650681', '6799402096');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (91, 'zheugh6@illinois.edu', '7623584531', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (92, null, null, '4036981900');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (93, 'mluxton8@xrea.com', '2629613686', '6401159180');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (94, 'ihansod9@phpbb.com', '1621226325', '8556163297');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (95, 'dchaplinga@diigo.com', null, '3593284034');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (96, 'apymb@google.de', '9305533406', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (97, 'bgonzalo0@booking.com', '3446373992', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (98, 'nkoppel1@mashable.com', '6567311275', '9525963589');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (99, null, '3522273917', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (100, 'sgwillym3@wikia.com', '2177255552', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (101, 'sleifer4@engadget.com', '2661372266', '6278714264');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (102, 'hbagshaw5@flickr.com', '5115458037', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (103, 'mtitmarsh6@wikia.com', null, '6718257939');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (104, 'ndener7@deliciousdays.com', '5713589198', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (105, 'sbloxland8@dyndns.org', '4995638543', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (106, 'lklimentyev9@indiegogo.com', '4663585607', '1541796073');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (107, null, '8057329349', '3307522892');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (108, 'cpickerillb@cpanel.net', '4239887277', '6955366613');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (109, 'tevequec@weibo.com', '3145750645', '1957842153');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (110, null, '8713549790', '9628593415');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (111, 'nizchakie@sakura.ne.jp', '1431155700', '7669434499');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (112, 'asnodayf@google.cn', '6558962410', '6708507797');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (113, 'ltunnyg@altervista.org', '6368483039', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (114, null, '9904843298', '2492757471');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (115, null, null, '4397493067');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (116, 'thabishawj@icq.com', '9169407801', '4745193551');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (117, null, '5627206423', '9712812117');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (118, null, '7226152267', '1886052528');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (119, 'wbrayshaym@seattletimes.com', '5495050572', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (120, null, '4024689125', '7229716799');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (121, 'qiacobettoo@cloudflare.com', '8461691831', '9095843854');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (122, 'vmailesp@blinklist.com', '8558368173', '4605987859');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (123, 'agorvinq@nydailynews.com', null, '1251936859');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (124, null, '6837539282', '4942917685');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (125, 'aluckins@nature.com', '1394802307', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (126, 'tonowlant@about.me', null, '7671697892');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (127, 'hdasu@blogs.com', '2485408094', '6915418973');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (128, 'ggronousv@independent.co.uk', '5521843880', '5027529864');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (129, null, '9355981047', '2916340581');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (130, 'hboguex@liveinternet.ru', '2687470963', '1731443042');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (131, null, '9823548093', '1759528769');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (132, 'kvasentsovz@wisc.edu', '8252728340', '4135307406');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (133, null, '4435426886', '8489755578');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (134, 'bjuett11@histats.com', '8014985005', '5522934805');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (135, null, '6305969297', '9217460042');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (136, 'bpavkovic13@friendfeed.com', '7623638164', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (137, 'rcorss14@blogtalkradio.com', '4559853507', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (138, null, null, '8277336943');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (139, null, '1121615707', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (140, 'adanielli17@upenn.edu', null, '7972569750');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (141, null, '3159665459', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (142, 'joliverpaull19@ameblo.jp', '8858233528', '2735123790');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (143, 'tgethins1a@youtube.com', '8101539244', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (144, 'nhillyatt1b@ebay.com', null, '8458450288');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (145, null, '4017783383', '6455252670');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (146, 'fmatteacci1d@paypal.com', '9563997113', '4089648975');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (147, 'afreeth1e@skype.com', '5324076943', '3993167870');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (148, 'tduffield1f@freewebs.com', '2581529240', '8335052421');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (149, 'cforesight1g@hhs.gov', '9961565915', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (150, 'kmuzzollo1h@sourceforge.net', '8422569890', '8289043541');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (151, 'mdomanek1i@addtoany.com', '2669005823', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (152, null, '3737998368', '8756607264');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (153, 'lduffy1k@illinois.edu', '7582486027', '3903399798');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (154, null, '1299639783', '6455368633');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (155, 'kemmins1m@opensource.org', null, '4989950215');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (156, 'sjowle1n@netscape.com', null, '8674495849');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (157, null, '8077959382', '5042095105');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (158, 'wpeirce1p@e-recht24.de', '9343188983', '9147923072');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (159, 'dgrandham1q@ox.ac.uk', '6181476724', '3889626077');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (160, 'bgoodwill1r@sphinn.com', '8322360299', '7845431187');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (161, null, '3743389747', '6454606602');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (162, 'lstanistreet1t@hatena.ne.jp', '2194196691', '4655958300');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (163, 'chanscom1u@theguardian.com', '9549867075', '5726787459');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (164, null, '8685482675', '4444568767');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (165, null, '8706451877', '1053667053');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (166, 'dkopfen1x@admin.ch', '5177767861', '4514658132');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (167, 'cscutchings1y@gov.uk', null, '9316513452');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (168, 'jfillingham1z@yandex.ru', '7411937725', '7995610728');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (169, 'tsneesby20@nps.gov', '2123870295', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (170, 'wmaling21@umn.edu', '7474383424', '5088088986');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (171, 'rrembaud22@microsoft.com', '2849077650', '5641467113');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (172, null, '7377111858', '3697097674');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (173, 'eworcs24@joomla.org', null, '4739839505');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (174, 'xdmtrovic25@4shared.com', '6586406750', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (175, null, '3523578742', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (176, 'dmcgloin27@reddit.com', null, '2078322122');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (177, 'mcicchinelli28@dailymail.co.uk', '7167429615', '8452263512');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (178, 'csaddington29@yelp.com', '8005451057', '1955901353');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (179, null, '7239963148', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (180, null, null, '6442538747');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (181, 'smary2c@time.com', '1303825179', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (182, 'cgepp2d@pen.io', null, '7713298619');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (183, 'hdalbey2e@senate.gov', '9711966351', '3786394508');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (184, 'trennison2f@lulu.com', '5419551696', '6074198322');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (185, 'amuddicliffe2g@mozilla.com', '5884510927', '5534439870');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (186, 'mbradman2h@umn.edu', '4039199548', '4491747174');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (187, 'swyre2i@kickstarter.com', '7886254279', '5658000964');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (188, 'tausiello2j@archive.org', '3112266181', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (189, 'gmotte2k@state.tx.us', '5559955800', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (190, 'sloveland2l@behance.net', '3535317140', '9465924844');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (191, null, '3667696492', '1213152881');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (192, 'atuttiett2n@cyberchimps.com', '9776278913', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (193, 'mweyman2o@fastcompany.com', '5229727261', '6105099893');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (194, 'kwoolard2p@mtv.com', '6005362832', null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (195, 'amarages2q@ovh.net', '3326376452', '8458822665');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (196, 'gmatyashev2r@columbia.edu', '6093422298', '1938580376');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (197, 'leynaud2s@com.com', null, '3589706924');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (198, 'pchester2t@miitbeian.gov.cn', '9534101633', '5641877426');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (199, 'gstoile2u@hao123.com', '6789119227', '7466328074');
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (200, 'alumsdon2v@w3.org', null, null);
INSERT INTO Contacts (id, email, phoneNumber1, phoneNumber2) VALUES (201, 'ekeel2w@nationalgeographic.com', '8073067519', '3412700301');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (1, 'Latin America and Caribbean', 'Colombia', null, 'Sevilla', '762538', '13313 Katie Avenue', '340 Elmside Road');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (2, 'Europe and Central Asia', 'Denmark', 'Region Hovedstaden', 'København', '1098', '174 Talmadge Place', '5763 Commercial Center');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (3, 'East Asia and Pacific', 'Indonesia', null, 'Palamadu', null, '19 Spaight Circle', '273 Spaight Road');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (4, 'Europe and Central Asia', 'Sweden', 'Norrbotten', 'Luleå', '973 23', '39 Westport Point', '3 Pond Pass');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (5, 'East Asia and Pacific', 'Indonesia', null, 'Ipuh', null, '0532 Erie Crossing', '97265 Buena Vista Center');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (6, 'East Asia and Pacific', 'China', null, 'Dalianhe', null, '2738 Blaine Park', '56475 Harper Pass');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (7, 'East Asia and Pacific', 'Indonesia', null, 'Siluman', null, '1107 Toban Road', '19816 Lyons Plaza');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (8, 'East Asia and Pacific', 'Mongolia', null, 'Tsagaan-Olom', null, '50252 Hanson Lane', '57720 Sunfield Center');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (9, 'Latin America and Caribbean', 'Brazil', null, 'Arroio Grande', '96330-000', '3 Hagan Junction', '4 Waxwing Park');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (10, 'Europe and Central Asia', 'Kazakhstan', null, 'Bestöbe', null, '57 Bunker Hill Court', '57 Prairieview Place');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (11, 'Latin America and Caribbean', 'Colombia', null, 'Margarita', '133028', '87 Columbus Way', '2 Porter Center');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (12, 'East Asia and Pacific', 'China', null, 'Sanjiang', null, '92903 Dapin Park', '347 Anderson Drive');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (13, 'East Asia and Pacific', 'Philippines', null, 'Magdalena', '4007', '9 Chinook Way', '819 Dixon Court');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (14, 'Europe and Central Asia', 'Russia', null, 'Meget', '155381', '67807 Hermina Point', '038 Killdeer Court');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (15, 'East Asia and Pacific', 'China', null, 'Lianhua', null, '1599 Mendota Terrace', '11142 Roth Alley');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (16, 'East Asia and Pacific', 'China', null, 'Shuigou', null, '33 Corscot Parkway', '83776 Randy Drive');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (17, 'Latin America and Caribbean', 'Venezuela', null, 'Táriba', null, '9198 Dorton Pass', '24 Washington Center');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (18, 'East Asia and Pacific', 'Philippines', null, 'Socorro', '8416', '3372 Ohio Terrace', '02959 Shoshone Court');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (19, 'Europe and Central Asia', 'Colombia', null, 'Armenia', '630008', '90991 Oxford Terrace', '3267 Thierer Circle');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (20, 'East Asia and Pacific', 'Indonesia', null, 'Cibuah', null, '40759 Erie Street', '3017 Chinook Center');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (21, 'Europe and Central Asia', 'France', 'Nord-Pas-de-Calais', 'Valenciennes', '59304 CEDEX', '5644 Fallview Pass', '711 Morningstar Place');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (22, 'East Asia and Pacific', 'China', null, 'Tianjin', null, '84 Autumn Leaf Road', '143 Manufacturers Hill');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (23, 'East Asia and Pacific', 'Indonesia', null, 'Pringgoboyo', null, '7 Orin Drive', '42 Raven Point');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (24, 'Europe and Central Asia', 'Italy', 'Campania', 'Salerno', '84135', '711 Schiller Way', '396 Northview Circle');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (25, 'Europe and Central Asia', 'Tajikistan', null, 'Norak', null, '159 Stephen Terrace', '5 Onsgard Avenue');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (26, 'eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan', 'Martinique', 'Martinique', 'Fort-de-France', '97254 CEDEX', '5 Riverside Alley', '28656 Fallview Lane');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (27, 'East Asia and Pacific', 'Indonesia', null, 'Bunder', null, '00906 Springs Court', '23147 Scoville Avenue');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (28, 'Sub-Saharan Africa', 'South Africa', null, 'Garies', '8223', '04459 Goodland Plaza', '0600 Loeprich Place');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (29, 'East Asia and Pacific', 'China', null, 'Meixi', null, '56 Blackbird Plaza', '4 Northfield Road');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (30, 'Europe and Central Asia', 'France', 'Île-de-France', 'Fontenay-sous-Bois', '94124 CEDEX', '25854 Hansons Way', '234 Debra Street');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (31, 'Europe and Central Asia', 'Ukraine', null, 'Nyrkiv', null, '4589 Tennessee Drive', '38382 Debra Drive');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (32, 'Europe and Central Asia', 'Germany', 'Berlin', 'Berlin', '10587', '4339 Hauk Terrace', '018 Saint Paul Parkway');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (33, 'Latin America and Caribbean', 'Chile', null, 'Longaví', null, '970 Scott Junction', '66786 Spohn Park');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (34, 'East Asia and Pacific', 'China', null, 'Zhongguan', null, '7 Karstens Terrace', '138 Corscot Parkway');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (35, 'Latin America and Caribbean', 'Brazil', null, 'Mogi Mirim', '13800-000', '797 Express Junction', '348 Hermina Point');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (36, 'Latin America and Caribbean', 'Argentina', null, 'Villa Castelli', '5355', '39 Mayfield Avenue', '067 Heath Lane');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (37, 'North America', 'Canada', 'Ontario', 'St. Thomas', 'N5R', '4679 Fairview Hill', '92 Burning Wood Way');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (38, 'East Asia and Pacific', 'China', null, 'Yushan', null, '28703 Porter Place', '8 Miller Crossing');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (39, 'East Asia and Pacific', 'China', null, 'Jiyang', null, '82 Bobwhite Drive', '5 Graceland Way');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (40, 'Europe and Central Asia', 'Poland', null, 'Baligród', '38-606', '84 Warbler Parkway', '853 Sunbrook Circle');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (41, 'East Asia and Pacific', 'Philippines', null, 'Tubo', '2814', '437 Graedel Crossing', '9 Red Cloud Hill');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (42, 'Latin America and Caribbean', 'Brazil', null, 'Barão de Cocais', '35970-000', '409 Jenna Place', '6 Independence Street');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (43, 'Europe and Central Asia', 'Portugal', 'Lisboa', 'Torres Vedras', '2560-234', '845 Becker Drive', '5 Del Mar Alley');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (44, 'East Asia and Pacific', 'Indonesia', null, 'Pembuanghulu', null, '71109 Dexter Court', '7 La Follette Junction');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (45, 'Sub-Saharan Africa', 'Angola', null, 'N’dalatando', null, '44 Lighthouse Bay Parkway', '7 Jay Plaza');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (46, 'pretium iaculis diam erat fermentum justo nec condimentum neque sapien', 'Palestinian Territory', null, 'Jūrīsh', null, '8640 Sage Road', '49 Kim Court');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (47, 'Europe and Central Asia', 'Portugal', 'Viana do Castelo', 'Barreiro', '4950-642', '12 Melody Terrace', '71 Kings Plaza');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (48, 'East Asia and Pacific', 'Philippines', null, 'Malita', '8012', '84203 Esch Terrace', '005 Graedel Terrace');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (49, 'Europe and Central Asia', 'Sweden', 'Östergötland', 'Norrköping', '603 72', '8943 Hallows Parkway', '500 Banding Center');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (50, 'Latin America and Caribbean', 'Brazil', null, 'Coxim', '79400-000', '09724 Gina Center', '8 Longview Crossing');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (51, 'Europe and Central Asia', 'Sweden', 'Värmland', 'Karlstad', '652 22', '3 Dayton Center', '4 Sheridan Center');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (52, 'Sub-Saharan Africa', 'Nigeria', null, 'Monguno', null, '372 Warrior Place', '4295 Village Parkway');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (53, 'Sub-Saharan Africa', 'South Africa', null, 'Plettenberg Bay', '6606', '49 Dawn Avenue', '59 Sunnyside Crossing');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (54, 'East Asia and Pacific', 'China', null, 'Shangzhuang', null, '09 Marquette Hill', '0850 Prairieview Trail');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (55, 'Middle East and North Africa', 'Saudi Arabia', null, 'Duba', null, '5500 Stuart Hill', '032 Almo Pass');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (56, 'Europe and Central Asia', 'Ukraine', null, 'Broshniv-Osada', null, '631 Daystar Parkway', '501 Forster Plaza');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (57, 'Sub-Saharan Africa', 'Burkina Faso', null, 'Réo', null, '1 Thompson Hill', '7 Elgar Point');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (58, 'Europe and Central Asia', 'Slovenia', null, 'Legen', '2383', '29261 Oneill Park', '84609 Dexter Place');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (59, 'Europe and Central Asia', 'Tajikistan', null, 'Obikiik', null, '79 Golf Drive', '6 Orin Parkway');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (60, 'East Asia and Pacific', 'China', null, 'Shanmu', null, '14226 Burrows Trail', '57841 Ruskin Way');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (61, 'East Asia and Pacific', 'China', null, 'Qinghua', null, '1774 Mandrake Way', '7 Mifflin Center');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (62, 'Europe and Central Asia', 'Russia', null, 'Novokubansk', '352244', '844 Valley Edge Lane', '856 Oakridge Pass');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (63, 'Europe and Central Asia', 'Russia', null, 'Ostashkov', '175276', '51 Kim Terrace', '16181 West Road');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (64, 'Europe and Central Asia', 'Serbia', null, 'Zrenjanin', null, '73 Anthes Road', '68737 Fallview Hill');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (65, 'South Asia', 'Sri Lanka', null, 'Moratuwa', '10400', '7 Nobel Hill', '205 Vidon Court');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (66, 'East Asia and Pacific', 'China', null, 'Fengtai', null, '9 Kedzie Hill', '00 Bunker Hill Park');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (67, 'East Asia and Pacific', 'Japan', null, 'Kameda-honchō', '956-0053', '928 Burrows Parkway', '19 Dahle Avenue');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (68, 'Europe and Central Asia', 'Russia', null, 'Staronizhestebliyevskaya', '606231', '87649 Sloan Lane', '89087 Maple Circle');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (69, 'Europe and Central Asia', 'Bulgaria', null, 'Chernomorets', '8151', '2485 Redwing Trail', '6 Arkansas Plaza');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (70, 'East Asia and Pacific', 'China', null, 'Yingtan', null, '15 Bay Drive', '508 Kensington Place');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (71, 'East Asia and Pacific', 'Japan', null, 'Tarumizu', '861-0133', '8 Acker Hill', '312 Hagan Hill');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (72, 'Latin America and Caribbean', 'Venezuela', null, 'Barinitas', null, '2 Memorial Parkway', '82 Wayridge Center');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (73, 'East Asia and Pacific', 'Philippines', null, 'Bualan', '9706', '9 5th Crossing', '62194 Rigney Road');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (74, 'aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas', 'Ivory Coast', null, 'Abengourou', null, '18922 Melvin Crossing', '7 Warrior Trail');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (75, 'Europe and Central Asia', 'Russia', null, 'Kalinovo', '624127', '8310 Stephen Hill', '315 Graceland Road');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (76, 'Europe and Central Asia', 'Germany', 'Niedersachsen', 'Hannover', '30167', '22 Everett Crossing', '759 Grover Street');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (77, 'Sub-Saharan Africa', 'Uganda', null, 'Kaliro', null, '5747 Portage Alley', '36 Hallows Circle');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (78, 'East Asia and Pacific', 'Philippines', null, 'Matlang', '6540', '39013 Leroy Pass', '674 Burrows Parkway');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (79, 'Europe and Central Asia', 'Poland', null, 'Orzesze', '43-188', '67 Spohn Terrace', '2732 Cascade Circle');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (80, 'East Asia and Pacific', 'Indonesia', null, 'Sarirejo Satu', null, '717 Clarendon Pass', '60 Toban Point');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (81, 'Europe and Central Asia', 'Albania', null, 'Cerava', null, '25 John Wall Trail', '87 Rowland Alley');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (82, 'Sub-Saharan Africa', 'Tanzania', null, 'Wete', null, '677 Rowland Pass', '3109 Mosinee Terrace');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (83, 'East Asia and Pacific', 'China', null, 'Jianshe', null, '0 Lillian Hill', '272 Northport Trail');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (84, 'East Asia and Pacific', 'China', null, 'Yaogou', null, '21 Spaight Parkway', '98 Cottonwood Crossing');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (85, 'Europe and Central Asia', 'Poland', null, 'Stronie', '34-145', '7 Onsgard Crossing', '4508 Kropf Way');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (86, 'Europe and Central Asia', 'France', 'Bretagne', 'Douarnenez', '29174 CEDEX', '30 West Court', '7538 Mcbride Crossing');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (87, 'East Asia and Pacific', 'China', null, 'Huashu', null, '12 Mcguire Circle', '47486 Northwestern Drive');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (88, 'Europe and Central Asia', 'Czech Republic', null, 'Miřetice', '539 55', '63 Heffernan Road', '6933 Forest Dale Plaza');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (89, 'North America', 'Canada', 'Québec', 'Sainte-Anne-de-Bellevue', 'H9X', '3 Rieder Pass', '8125 Oneill Park');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (90, 'East Asia and Pacific', 'Philippines', null, 'Rizal', '7104', '0 Riverside Way', '77185 Fairfield Trail');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (91, 'East Asia and Pacific', 'Indonesia', null, 'Ciherang', null, '0 Brown Circle', '535 Old Gate Center');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (92, 'Europe and Central Asia', 'Portugal', 'Porto', 'Linhares', '4620-620', '39 1st Terrace', '0 Warbler Parkway');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (93, 'East Asia and Pacific', 'Indonesia', null, 'Ceper', null, '57 Forster Alley', '33 Elgar Junction');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (94, 'Europe and Central Asia', 'Portugal', 'Santarém', 'Arrepiado', '2140-605', '67513 Stoughton Court', '59859 Bartelt Junction');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (95, 'East Asia and Pacific', 'Taiwan', null, 'Zhubei', null, '36637 Green Ridge Junction', '125 Bunker Hill Plaza');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (96, 'East Asia and Pacific', 'Indonesia', null, 'Cinangka', null, '593 Surrey Avenue', '128 Morningstar Pass');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (97, 'Europe and Central Asia', 'Sweden', 'Västra Götaland', 'Göteborg', '403 13', '82633 Dapin Place', '78 Pepper Wood Avenue');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (98, 'Europe and Central Asia', 'Czech Republic', null, 'Libochovice', '411 17', '05169 Judy Center', '95926 Lake View Plaza');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (99, 'East Asia and Pacific', 'China', null, 'Guicheng', null, '214 Melvin Park', '60020 Old Gate Trail');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (100, 'East Asia and Pacific', 'China', null, 'Hanghuadian', null, '71 Golden Leaf Pass', '50 Pepper Wood Parkway');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (101, 'East Asia and Pacific', 'China', null, 'Guangshan', null, '89 Gale Junction', '1 Eagan Place');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (102, 'Latin America and Caribbean', 'Dominican Republic', null, 'Santo Domingo Este', '11806', '0975 Village Green Circle', '4072 Pond Junction');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (103, 'East Asia and Pacific', 'Malaysia', 'Kuala Lumpur', 'Kuala Lumpur', '50933', '9603 Glacier Hill Junction', '903 American Ash Park');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (104, 'Sub-Saharan Africa', 'Djibouti', null, 'Ḏânan', null, '0 Clarendon Crossing', '46 Thierer Way');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (105, 'East Asia and Pacific', 'China', null, 'Weixin', null, '50 Arrowood Center', '521 Manufacturers Junction');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (106, 'Europe and Central Asia', 'Kazakhstan', null, 'Petropavlovsk', null, '6 Sutherland Park', '62306 Amoth Way');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (107, 'Europe and Central Asia', 'Germany', 'Baden-Württemberg', 'Stuttgart', '70190', '3 Chinook Lane', '57 Melvin Park');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (108, 'suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique', 'American Samoa', null, 'Vailoatai', '96799', '8 Porter Crossing', '5 Hermina Plaza');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (109, 'Europe and Central Asia', 'Russia', null, 'Pesochnoye', '662360', '403 Arrowood Terrace', '99376 Welch Crossing');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (110, 'Europe and Central Asia', 'Russia', null, 'Sapernoye', '188966', '443 Brown Road', '410 Emmet Court');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (111, 'East Asia and Pacific', 'China', null, 'Zhangjiafan', null, '7274 West Pass', '4 Lake View Avenue');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (112, 'East Asia and Pacific', 'China', null, 'Taozhou', null, '9 Hayes Way', '5238 Hollow Ridge Drive');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (113, 'Europe and Central Asia', 'Azerbaijan', null, 'Ramana', null, '385 Northland Parkway', '162 Pine View Place');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (114, 'Latin America and Caribbean', 'Brazil', null, 'São Bento do Sul', '89290-000', '976 Lerdahl Court', '3 Rusk Trail');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (115, 'Europe and Central Asia', 'Russia', null, 'Pyatigorskiy', '102192', '17750 Burrows Pass', '57 Moland Pass');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (116, 'East Asia and Pacific', 'Japan', null, 'Kawage', '519-0142', '28413 Sachs Pass', '2 Menomonie Place');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (117, 'Europe and Central Asia', 'Poland', null, 'Domaradz', '36-230', '60 Kropf Junction', '423 Dapin Hill');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (118, 'East Asia and Pacific', 'China', null, 'Xinying', null, '7096 Declaration Crossing', '4 High Crossing Crossing');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (119, 'East Asia and Pacific', 'Indonesia', null, 'Bago', null, '48506 Dexter Lane', '5 Dottie Street');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (120, 'Latin America and Caribbean', 'Argentina', null, 'Laguna Limpia', '3515', '3043 Mendota Pass', '66003 Kipling Point');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (121, 'East Asia and Pacific', 'China', null, 'Zheshan', null, '58747 Bowman Avenue', '94 Village Center');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (122, 'North America', 'United States', 'New Mexico', 'Albuquerque', '87140', '178 Nevada Hill', '4 Thompson Road');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (123, 'Europe and Central Asia', 'France', 'Bretagne', 'Rennes', '35047 CEDEX 9', '175 Carioca Place', '45440 Bluejay Street');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (124, 'East Asia and Pacific', 'Indonesia', null, 'Belang', null, '8 Karstens Place', '6 Dennis Avenue');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (125, 'Europe and Central Asia', 'Poland', null, 'Mława', '06-501', '6453 Service Court', '5 Esker Pass');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (126, 'Latin America and Caribbean', 'Brazil', null, 'Jaru', '78940-000', '74 Glendale Parkway', '6 Gateway Alley');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (127, 'Europe and Central Asia', 'Portugal', 'Lisboa', 'São João das Lampas', '2705-785', '47 High Crossing Point', '9224 Menomonie Way');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (128, 'East Asia and Pacific', 'China', null, 'Jiangqiao', null, '42588 Northport Hill', '62035 Goodland Terrace');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (129, 'East Asia and Pacific', 'China', null, 'Xiaomei', null, '4 Brickson Park Place', '25 Mendota Park');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (130, 'East Asia and Pacific', 'Philippines', null, 'Cawayan', '5409', '95 Superior Crossing', '2 Glacier Hill Circle');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (131, 'Latin America and Caribbean', 'Brazil', null, 'Tapes', '96760-000', '2 Butterfield Street', '42 Doe Crossing Center');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (132, 'Latin America and Caribbean', 'Colombia', null, 'Elías', '417018', '84058 Pleasure Avenue', '7539 Bonner Plaza');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (133, 'East Asia and Pacific', 'Indonesia', null, 'Taman', null, '28420 Summer Ridge Street', '9380 Morrow Plaza');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (134, 'East Asia and Pacific', 'Philippines', null, 'Cardona', '1950', '63 Oxford Terrace', '394 Kenwood Point');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (135, 'East Asia and Pacific', 'China', null, 'Zaojiacheng', null, '9238 Union Plaza', '96368 Vermont Point');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (136, 'North America', 'Canada', 'Québec', 'Mont-Tremblant', 'J8E', '021 Pearson Alley', '33 Huxley Plaza');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (137, 'Sub-Saharan Africa', 'Ghana', null, 'Hohoe', null, '294 Stang Trail', '91 Derek Court');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (138, 'Europe and Central Asia', 'Russia', null, 'Vyatskiye Polyany', '622937', '522 Gateway Parkway', '68452 Erie Place');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (139, 'Europe and Central Asia', 'Russia', null, 'Khvastovichi', '249360', '08 Dexter Drive', '6 Huxley Court');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (140, 'East Asia and Pacific', 'China', null, 'Xinquan', null, '716 Holmberg Street', '01606 Mifflin Terrace');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (141, 'Europe and Central Asia', 'France', 'Midi-Pyrénées', 'Tarbes', '65022 CEDEX 9', '20 West Court', '92878 Mcbride Pass');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (142, 'East Asia and Pacific', 'Philippines', null, 'Patpata Segundo', '3604', '2 Lukken Drive', '08849 Esch Center');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (143, 'Europe and Central Asia', 'France', 'Île-de-France', 'Pantin', '93504 CEDEX', '92123 Manley Road', '3 Green Pass');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (144, 'Latin America and Caribbean', 'Bolivia', null, 'Trinidad', null, '0 Farragut Plaza', '6 Coolidge Way');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (145, 'East Asia and Pacific', 'China', null, 'Duishan', null, '68929 La Follette Hill', '55 Gulseth Plaza');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (146, 'East Asia and Pacific', 'Philippines', null, 'San Remigio', '6011', '70 Dakota Court', '30 Glendale Way');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (147, 'South Asia', 'Bangladesh', null, 'Mathba', '8566', '95 Sutteridge Lane', '793 Dakota Alley');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (148, 'Europe and Central Asia', 'Russia', null, 'Orekhovo-Borisovo Severnoye', '142717', '0 Old Shore Trail', '9152 Londonderry Park');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (149, 'Europe and Central Asia', 'France', 'Île-de-France', 'Lagny-sur-Marne', '77404 CEDEX', '7 Gale Street', '1 Leroy Place');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (150, 'North America', 'United States', 'Oklahoma', 'Tulsa', '74116', '10 Waxwing Drive', '136 Nelson Trail');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (151, 'Europe and Central Asia', 'Norway', 'Oslo', 'Oslo', '0773', '004 Anthes Lane', '1639 Lyons Hill');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (152, 'Middle East and North Africa', 'Syria', null, 'Muḩambal', null, '1 Northfield Plaza', '08363 Norway Maple Hill');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (153, 'Europe and Central Asia', 'Croatia', null, 'Samobor', '10430', '22650 Merry Way', '86 Green Ridge Parkway');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (154, 'Europe and Central Asia', 'Poland', null, 'Bojszowy Nowe', '43-220', '116 Fulton Street', '00 Lawn Court');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (155, 'Europe and Central Asia', 'Greece', null, 'Sofádes', null, '75 Portage Place', '45911 Merchant Circle');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (156, 'Europe and Central Asia', 'Russia', null, 'Krasnokamsk', '397325', '9332 Dottie Trail', '924 Summer Ridge Plaza');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (157, 'Latin America and Caribbean', 'Mexico', 'Oaxaca', 'Santa Cruz', '70762', '782 Ridgeway Parkway', '9 Manufacturers Alley');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (158, 'East Asia and Pacific', 'China', null, 'Muyi', null, '894 Nelson Avenue', '55 Upham Street');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (159, 'Europe and Central Asia', 'Russia', null, 'Donskoy', '347735', '2 Pearson Drive', '0790 Boyd Center');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (160, 'Europe and Central Asia', 'Macedonia', null, 'Belčišta', '6344', '5336 Hoffman Crossing', '954 Ramsey Avenue');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (161, 'East Asia and Pacific', 'Indonesia', null, 'Tanahwangko', null, '74121 Dawn Parkway', '10 Park Meadow Way');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (162, 'Europe and Central Asia', 'Czech Republic', null, 'Telč', '588 62', '77 Crowley Court', '9443 Tennessee Circle');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (163, 'East Asia and Pacific', 'Indonesia', null, 'Cimanggu Girang', null, '18543 Spohn Point', '4712 Autumn Leaf Alley');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (164, 'Europe and Central Asia', 'Russia', null, 'Chishmy', '431674', '594 Loftsgordon Road', '55 Mallory Pass');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (165, 'East Asia and Pacific', 'Mongolia', null, 'Tosontsengel', null, '4168 Duke Junction', '11713 Northfield Terrace');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (166, 'Latin America and Caribbean', 'Brazil', null, 'Muzambinho', '37890-000', '818 Truax Road', '23 Evergreen Alley');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (167, 'Europe and Central Asia', 'Russia', null, 'Borok', '152743', '4 Northview Avenue', '84 Coolidge Park');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (168, 'East Asia and Pacific', 'China', null, 'Shadili', null, '173 Gerald Terrace', '7001 Jackson Plaza');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (169, 'Europe and Central Asia', 'Portugal', 'Lisboa', 'São Pedro do Estoril', '2765-343', '27463 Anthes Road', '62125 Saint Paul Terrace');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (170, 'vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula', 'Sint Maarten', null, 'Philipsburg', null, '3 Londonderry Street', '3 Mockingbird Crossing');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (171, 'Europe and Central Asia', 'France', 'Basse-Normandie', 'Caen', '14922 CEDEX 9', '05764 Fordem Hill', '7 Elgar Court');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (172, 'Latin America and Caribbean', 'Brazil', null, 'Poá', '08550-000', '6194 Fairview Point', '6663 Ridge Oak Park');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (173, 'East Asia and Pacific', 'China', null, 'Qijiaxi', null, '321 Forest Run Way', '41 Gale Hill');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (174, 'North America', 'United States', 'Minnesota', 'Saint Paul', '55108', '812 Acker Hill', '09841 Del Mar Road');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (175, 'Europe and Central Asia', 'France', 'Île-de-France', 'Cergy-Pontoise', '95061 CEDEX 1', '8 Delaware Parkway', '7 Crowley Place');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (176, 'Europe and Central Asia', 'Albania', null, 'Krrabë', null, '5904 Fair Oaks Avenue', '2 Tomscot Alley');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (177, 'Middle East and North Africa', 'Iran', null, 'Lordegān', null, '42 Kedzie Place', '38176 Messerschmidt Street');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (178, 'East Asia and Pacific', 'Indonesia', null, 'Sukowono', null, '09 Monument Point', '1 Kedzie Hill');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (179, 'Latin America and Caribbean', 'Colombia', null, 'Curití', '684039', '104 Helena Crossing', '1 Dayton Place');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (180, 'Latin America and Caribbean', 'Chile', null, 'Melipilla', null, '95956 Marquette Place', '497 Grover Park');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (181, 'East Asia and Pacific', 'Vietnam', null, 'Vĩnh Thuận', null, '2 Eastwood Junction', '9 Jay Drive');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (182, 'Sub-Saharan Africa', 'Kenya', null, 'Siaya', null, '4243 Crowley Junction', '4662 Luster Avenue');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (183, 'Latin America and Caribbean', 'Colombia', null, 'San José de Miranda', '682027', '994 Sauthoff Crossing', '41 Magdeline Park');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (184, 'North America', 'Canada', 'Alberta', 'Blackfalds', 'J5K', '0800 Continental Place', '269 Macpherson Place');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (185, 'East Asia and Pacific', 'China', null, 'Qiling', null, '65927 Buhler Drive', '0 Lien Street');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (186, 'East Asia and Pacific', 'Indonesia', null, 'Pekuncen', null, '8 Portage Junction', '9208 Dakota Place');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (187, 'East Asia and Pacific', 'Indonesia', null, 'Baleber', null, '418 Farwell Hill', '51847 Dexter Avenue');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (188, 'East Asia and Pacific', 'China', null, 'Qianjin', null, '79971 Bultman Plaza', '67 Ryan Circle');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (189, 'East Asia and Pacific', 'China', null, 'Lianhua', null, '0 Transport Drive', '19927 Lyons Lane');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (190, 'East Asia and Pacific', 'China', null, 'Mazongshan', null, '5138 Namekagon Trail', '681 Bunker Hill Road');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (191, 'Latin America and Caribbean', 'Cuba', null, 'Las Tunas', null, '740 Darwin Court', '0266 Derek Point');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (192, 'Europe and Central Asia', 'Russia', null, 'Neya', '157571', '5919 Kenwood Pass', '72 Memorial Hill');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (193, 'Latin America and Caribbean', 'Peru', null, 'La Breita', null, '699 Fremont Street', '0059 Judy Avenue');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (194, 'Europe and Central Asia', 'Czech Republic', null, 'Štítná nad Vláří', '763 33', '9 Blackbird Point', '9458 Portage Park');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (195, 'Europe and Central Asia', 'Russia', null, 'Sivaki', '403467', '8570 Maple Circle', '107 Thackeray Lane');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (196, 'East Asia and Pacific', 'Japan', null, 'Minokamo', '509-0307', '98 Meadow Vale Place', '5344 Ryan Drive');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (197, 'Europe and Central Asia', 'France', 'Île-de-France', 'Paris 01', '75032 CEDEX 01', '8627 Meadow Vale Way', '0 Shelley Avenue');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (198, 'East Asia and Pacific', 'China', null, 'Pingdong', null, '27 Alpine Drive', '2005 Buhler Court');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (199, 'East Asia and Pacific', 'China', null, 'Wujian', null, '9599 Grover Court', '91 Bluestem Lane');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (200, 'Europe and Central Asia', 'Russia', null, 'Atamanovka', '672530', '43 Westridge Terrace', '133 Armistice Alley');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (201, 'East Asia and Pacific', 'China', null, 'Zhangdun', null, '15527 Alpine Pass', '5829 Fair Oaks Parkway');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (202, 'East Asia and Pacific', 'China', null, 'Laiguangying', null, '9973 Alpine Crossing', '57220 Golf Course Point');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (203, 'East Asia and Pacific', 'Indonesia', null, 'Batusangkar', null, '1 New Castle Circle', '54 Packers Plaza');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (204, 'East Asia and Pacific', 'Philippines', null, 'Timpas', '5805', '80339 Jenna Way', '4154 Almo Alley');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (205, 'Sub-Saharan Africa', 'Togo', null, 'Bassar', null, '772 School Court', '8263 Clyde Gallagher Center');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (206, 'East Asia and Pacific', 'Indonesia', null, 'Leran Kulon', null, '632 Nobel Plaza', '7 Corscot Avenue');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (207, 'East Asia and Pacific', 'Philippines', null, 'Culacling', '4409', '48 Dakota Court', '98 Burning Wood Way');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (208, 'East Asia and Pacific', 'China', null, 'Baolong', null, '565 Steensland Terrace', '01265 Rutledge Court');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (209, 'East Asia and Pacific', 'Indonesia', null, 'Cihaur', null, '6862 Heath Way', '0725 Morrow Avenue');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (210, 'Middle East and North Africa', 'Jordan', null, 'Al Azraq ash Shamālī', null, '8916 Erie Road', '48828 Utah Street');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (211, 'Europe and Central Asia', 'Bulgaria', null, 'Zavet', '7330', '6837 Ridgeview Drive', '91 Riverside Terrace');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (212, 'East Asia and Pacific', 'Indonesia', null, 'Kadumelati', null, '1 Vernon Junction', '5824 Mayfield Pass');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (213, 'North America', 'Canada', 'Québec', 'La Tuque', 'G9X', '6219 Cardinal Place', '59707 Redwing Alley');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (214, 'North America', 'United States', 'Connecticut', 'Hartford', '06105', '33174 Jana Park', '320 Delladonna Pass');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (215, 'Middle East and North Africa', 'Tunisia', null, 'Nefta', null, '4354 Knutson Junction', '0 Northridge Street');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (216, 'Europe and Central Asia', 'Portugal', 'Viseu', 'Nagosela', '3440-635', '76379 Debs Point', '169 Paget Crossing');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (217, 'East Asia and Pacific', 'China', null, 'Kedian', null, '61837 Roxbury Road', '4626 Cherokee Drive');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (218, 'East Asia and Pacific', 'Philippines', null, 'Loay', '6202', '28105 Sauthoff Center', '06 Vahlen Road');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (219, 'East Asia and Pacific', 'Indonesia', null, 'Banjar Lalangpasek', null, '435 6th Crossing', '806 Magdeline Way');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (220, 'Europe and Central Asia', 'Portugal', 'Braga', 'Boavista', '4905-014', '90 Beilfuss Circle', '3 Farwell Alley');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (221, 'Europe and Central Asia', 'Norway', 'Hordaland', 'Bergen', '5806', '55499 Alpine Way', '306 Porter Alley');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (222, 'East Asia and Pacific', 'China', null, 'Xiuyu', null, '2 Meadow Vale Hill', '86 Namekagon Park');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (223, 'Europe and Central Asia', 'Portugal', 'Porto', 'Calçada', '4615-467', '4557 Elgar Drive', '499 Sycamore Avenue');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (224, 'East Asia and Pacific', 'China', null, 'Hengli', null, '4070 Schiller Circle', '78119 Fisk Plaza');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (225, 'Europe and Central Asia', 'Russia', null, 'Mogzon', '613594', '6 Blaine Trail', '19 Jay Crossing');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (226, 'East Asia and Pacific', 'Philippines', null, 'San Felipe Old', '2806', '11 Thompson Point', '8821 American Avenue');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (227, 'Latin America and Caribbean', 'Argentina', null, 'Mattaldi', '6271', '9 Butternut Alley', '05 Birchwood Alley');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (228, 'East Asia and Pacific', 'China', null, 'Ji’an', null, '9637 Duke Court', '22280 Jackson Point');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (229, 'Europe and Central Asia', 'Portugal', 'Porto', 'Lavadorinhos', '4415-708', '670 Pleasure Alley', '8693 Burrows Plaza');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (230, 'East Asia and Pacific', 'Malaysia', 'Negeri Sembilan', 'Seremban', '70536', '61254 Schurz Point', '86972 Stoughton Crossing');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (231, 'East Asia and Pacific', 'Mongolia', null, 'Delgermörön', null, '6 Hallows Drive', '508 Bartillon Point');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (232, 'East Asia and Pacific', 'Vietnam', null, 'Lộc Bình', null, '70350 Onsgard Center', '690 Sommers Road');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (233, 'East Asia and Pacific', 'China', null, 'Dacun', null, '0452 Memorial Road', '7953 1st Street');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (234, 'Europe and Central Asia', 'Azerbaijan', null, 'Kyurdarmir', null, '562 Shopko Trail', '06 Hallows Hill');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (235, 'Latin America and Caribbean', 'Peru', null, 'El Ingenio', null, '2 Kipling Hill', '304 High Crossing Lane');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (236, 'East Asia and Pacific', 'China', null, 'Wenfang', null, '069 Nancy Junction', '80536 Bashford Crossing');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (237, 'Europe and Central Asia', 'Bosnia and Herzegovina', null, 'Marićka', null, '129 Towne Circle', '55355 Autumn Leaf Circle');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (238, 'Sub-Saharan Africa', 'Ethiopia', null, 'Āsbe Teferī', null, '998 Maryland Center', '398 Eggendart Plaza');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (239, 'East Asia and Pacific', 'Philippines', null, 'Mayantoc', '2304', '0200 Heffernan Place', '2 New Castle Alley');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (240, 'North America', 'United States', 'Hawaii', 'Honolulu', '96835', '5 Old Gate Trail', '10306 Dixon Trail');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (241, 'North America', 'United States', 'Kentucky', 'Frankfort', '40618', '53281 Erie Crossing', '9 Basil Point');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (242, 'East Asia and Pacific', 'Indonesia', null, 'Maredakalada', null, '84 Thackeray Trail', '65 Main Street');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (243, 'Latin America and Caribbean', 'Peru', null, 'Bajo Pichanaqui', null, '9548 Maywood Plaza', '49 Grover Court');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (244, 'East Asia and Pacific', 'Japan', null, 'Arai', '989-2463', '3275 Meadow Vale Crossing', '9 Sunnyside Crossing');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (245, 'Europe and Central Asia', 'France', 'Rhône-Alpes', 'Guilherand-Granges', '07509 CEDEX', '1041 Gale Place', '606 Fieldstone Road');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (246, 'East Asia and Pacific', 'China', null, 'Qiaolin', null, '41038 Spohn Drive', '8597 Ryan Lane');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (247, 'Latin America and Caribbean', 'Uruguay', null, 'Palmitas', null, '81 La Follette Place', '0883 Morningstar Drive');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (248, 'East Asia and Pacific', 'Japan', null, 'Akita', '480-0132', '3191 Hagan Place', '637 Forest Run Parkway');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (249, 'East Asia and Pacific', 'Indonesia', null, 'Tambakrejo', null, '2 Homewood Center', '28 Cambridge Way');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (250, 'Latin America and Caribbean', 'Brazil', null, 'Guaratuba', '83280-000', '571 Morning Street', '45 Utah Place');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (251, 'East Asia and Pacific', 'China', null, 'Liujiachang', null, '76 Susan Terrace', '43536 Jenifer Hill');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (252, 'Europe and Central Asia', 'Portugal', 'Ilha Terceira', 'Porto Martins', '9760-099', '749 Northland Point', '17 Del Sol Circle');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (253, 'Sub-Saharan Africa', 'Nigeria', null, 'Kwatarkwashi', null, '35990 Lien Pass', '548 Banding Road');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (254, 'East Asia and Pacific', 'China', null, 'Changning', null, '9 Harbort Drive', '4 Bobwhite Crossing');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (255, 'Europe and Central Asia', 'Czech Republic', null, 'Roudnice nad Labem', '413 01', '6836 Delladonna Circle', '78 Sunfield Parkway');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (256, 'Latin America and Caribbean', 'Brazil', null, 'Rio Largo', '57100-000', '57282 Stoughton Trail', '15 Monica Center');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (257, 'East Asia and Pacific', 'Philippines', null, 'Limbalod', '9407', '1632 Goodland Avenue', '6 Porter Road');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (258, 'Europe and Central Asia', 'Portugal', 'Porto', 'Santiago de Subrrifana', '4560-776', '66 Colorado Park', '1 American Alley');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (259, 'East Asia and Pacific', 'Philippines', null, 'Calsib', '4335', '12390 Hudson Way', '0 Chinook Center');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (260, 'East Asia and Pacific', 'Philippines', null, 'Suyo', '2715', '77 Barby Parkway', '75 Forster Crossing');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (261, 'East Asia and Pacific', 'China', null, 'Xuetian', null, '94283 Barnett Street', '345 Brickson Park Hill');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (262, 'East Asia and Pacific', 'Indonesia', null, 'Karanglo', null, '76 Thompson Court', '6 Maple Wood Road');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (263, 'East Asia and Pacific', 'Philippines', null, 'Sumalig', '9211', '61 Sauthoff Drive', '561 Colorado Lane');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (264, 'Europe and Central Asia', 'Portugal', 'Coimbra', 'Colmeal', '3070-094', '233 Mesta Alley', '630 Elgar Park');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (265, 'Europe and Central Asia', 'France', 'Rhône-Alpes', 'Grenoble', '38066 CEDEX 2', '00319 Orin Junction', '573 Quincy Way');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (266, 'Europe and Central Asia', 'Tajikistan', null, 'Yovon', null, '3083 Bellgrove Pass', '265 Lillian Road');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (267, 'Europe and Central Asia', 'Croatia', null, 'Ozalj', '47280', '79 Lyons Road', '08053 Prairieview Street');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (268, 'East Asia and Pacific', 'Indonesia', null, 'Sukamantri Satu', null, '56 Fairfield Center', '335 Dunning Plaza');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (269, 'Europe and Central Asia', 'Czech Republic', null, 'Svoboda nad Úpou', '542 24', '4 3rd Plaza', '88 Glacier Hill Hill');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (270, 'Latin America and Caribbean', 'Peru', null, 'Haquira', null, '24 Barnett Park', '7960 Sundown Trail');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (271, 'East Asia and Pacific', 'Philippines', null, 'Cantao-an', '9023', '47391 Lukken Point', '86882 Petterle Road');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (272, 'Europe and Central Asia', 'Portugal', 'Santarém', 'Porto Alto', '2135-027', '7 Algoma Way', '641 Mesta Court');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (273, 'Latin America and Caribbean', 'Brazil', null, 'Sacramento', '38190-000', '7103 Bashford Hill', '827 Green Park');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (274, 'Sub-Saharan Africa', 'Nigeria', null, 'Mafa', null, '6854 Novick Park', '63 Del Sol Parkway');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (275, 'Latin America and Caribbean', 'Colombia', null, 'Pore', '852058', '790 Evergreen Circle', '9915 Jackson Pass');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (276, 'Latin America and Caribbean', 'Brazil', null, 'Passos', '37900-000', '4811 Hovde Avenue', '2617 Acker Junction');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (277, 'Europe and Central Asia', 'Turkmenistan', null, 'Bayramaly', null, '613 Bluejay Alley', '5392 American Ash Lane');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (278, 'East Asia and Pacific', 'China', null, 'Nanqiao', null, '95 Moland Place', '6840 Stone Corner Pass');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (279, 'Latin America and Caribbean', 'Dominican Republic', null, 'Boca Chica', '11102', '15220 Farwell Lane', '9068 Fair Oaks Road');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (280, 'North America', 'United States', 'Ohio', 'Columbus', '43215', '5 Basil Hill', '8946 Superior Street');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (281, 'Europe and Central Asia', 'Kyrgyzstan', null, 'Tash-Kumyr', null, '82751 Springview Place', '0 Carberry Avenue');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (282, 'East Asia and Pacific', 'China', null, 'Jindong', null, '66404 Duke Avenue', '68 Westridge Center');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (283, 'East Asia and Pacific', 'China', null, 'Meijiang', null, '93192 Hooker Center', '34319 Melrose Lane');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (284, 'East Asia and Pacific', 'China', null, 'Daying', null, '57516 Meadow Ridge Park', '244 Red Cloud Terrace');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (285, 'Europe and Central Asia', 'Russia', null, 'Lesogorsk', '665501', '50113 Fulton Pass', '28353 Blaine Parkway');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (286, 'East Asia and Pacific', 'Indonesia', null, 'Tuamese', null, '204 Banding Trail', '0 Acker Parkway');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (287, 'Europe and Central Asia', 'Macedonia', null, 'Bosilovo', '2431', '724 Tennessee Terrace', '618 Aberg Crossing');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (288, 'Europe and Central Asia', 'Norway', 'Hordaland', 'Bergen', '5007', '3988 Riverside Park', '943 Merchant Trail');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (289, 'East Asia and Pacific', 'China', null, 'Huangsha', null, '6775 West Lane', '202 Duke Circle');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (290, 'Europe and Central Asia', 'Poland', null, 'Kamieniec', '64-061', '00430 Killdeer Avenue', '6 Thierer Street');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (291, 'East Asia and Pacific', 'Philippines', null, 'Kinalaglagan', '5614', '3709 Arizona Court', '3 Menomonie Parkway');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (292, 'East Asia and Pacific', 'Indonesia', null, 'Pundong', null, '1 Killdeer Trail', '714 Ridge Oak Plaza');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (293, 'East Asia and Pacific', 'Philippines', null, 'Kagawasan', '7036', '74 Pearson Alley', '98445 Johnson Crossing');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (294, 'East Asia and Pacific', 'Indonesia', null, 'Karang', null, '938 Cascade Parkway', '7194 Hagan Pass');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (295, 'South Asia', 'Afghanistan', null, 'Barakī Barak', null, '412 Ridge Oak Drive', '36 Tennessee Place');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (296, 'Europe and Central Asia', 'Finland', null, 'Kauhava', '62201', '7608 Rowland Drive', '6421 Washington Way');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (297, 'Latin America and Caribbean', 'Brazil', null, 'Arujá', '07400-000', '8 Waywood Way', '6 Artisan Point');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (298, 'Europe and Central Asia', 'Russia', null, 'El’brus', '361603', '13 Brickson Park Junction', '6 American Ash Avenue');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (299, 'East Asia and Pacific', 'China', null, 'Sandao', null, '59015 Banding Court', '2 Bayside Terrace');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (300, 'Europe and Central Asia', 'Russia', null, 'Kochevo', '619320', '28892 Bartillon Way', '3813 Park Meadow Circle');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (301, 'East Asia and Pacific', 'China', null, 'Zhushan', null, '17 Straubel Court', '6696 Jay Point');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (302, 'Europe and Central Asia', 'Russia', null, 'Krasnyy Oktyabr’', '188903', '25147 Helena Center', '057 Oneill Hill');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (303, 'North America', 'United States', 'California', 'Sacramento', '94237', '84 Debs Place', '75 Vera Lane');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (304, 'East Asia and Pacific', 'Indonesia', null, 'Bunirasa', null, '61642 Glendale Road', '3708 Waubesa Way');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (305, 'Sub-Saharan Africa', 'Sierra Leone', null, 'Daru', null, '6806 Shoshone Drive', '03714 Lawn Hill');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (306, 'Latin America and Caribbean', 'Peru', null, 'Obas', null, '66284 Maywood Way', '74225 Dayton Drive');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (307, 'Latin America and Caribbean', 'Bahamas', null, 'West End', null, '46 Nova Pass', '40 Basil Avenue');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (308, 'East Asia and Pacific', 'Laos', null, 'Khoa', null, '6 Dryden Terrace', '9547 Manufacturers Pass');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (309, 'East Asia and Pacific', 'China', null, 'Zhushan Chengguanzhen', null, '182 Hintze Circle', '6 Michigan Center');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (310, 'Sub-Saharan Africa', 'Zimbabwe', null, 'Mount Darwin', null, '4 Sutteridge Alley', '635 Main Road');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (311, 'Europe and Central Asia', 'Russia', null, 'Volzhskiy', '404109', '9 Bunker Hill Circle', '3288 Warner Street');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (312, 'Europe and Central Asia', 'Sweden', 'Halland', 'Onsala', '439 24', '10 Fallview Parkway', '61 Division Center');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (313, 'Europe and Central Asia', 'Poland', null, 'Wierzchucino', '84-113', '554 Meadow Valley Park', '97 Stone Corner Alley');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (314, 'East Asia and Pacific', 'China', null, 'Guangli', null, '6 Hauk Place', '9 Buhler Circle');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (315, 'East Asia and Pacific', 'Vietnam', null, 'Đắk Glei', null, '185 Swallow Way', '1 Pepper Wood Way');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (316, 'Sub-Saharan Africa', 'Zambia', null, 'Lukulu', null, '7492 Basil Circle', '40 Mosinee Parkway');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (317, 'East Asia and Pacific', 'Philippines', null, 'Pangascasan', '2504', '311 West Crossing', '81674 Golden Leaf Park');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (318, 'East Asia and Pacific', 'Malaysia', 'Kuala Lumpur', 'Kuala Lumpur', '55100', '1 Maryland Lane', '1509 Larry Place');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (319, 'Sub-Saharan Africa', 'Chad', null, 'Kelo', null, '64 Eastlawn Hill', '0847 Shopko Drive');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (320, 'East Asia and Pacific', 'China', null, 'Baota', null, '91203 Truax Junction', '41138 School Crossing');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (321, 'North America', 'United States', 'North Carolina', 'Charlotte', '28225', '2195 Miller Place', '60344 Melody Circle');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (322, 'East Asia and Pacific', 'Philippines', null, 'Cabiao', '3107', '23 Cambridge Park', '208 Del Sol Junction');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (323, 'Latin America and Caribbean', 'Brazil', null, 'Barra do Corda', '65950-000', '402 Welch Plaza', '41936 Tony Way');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (324, 'Europe and Central Asia', 'Bosnia and Herzegovina', null, 'Piskavica', null, '286 John Wall Terrace', '53 Birchwood Avenue');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (325, 'East Asia and Pacific', 'China', null, 'Langxi', null, '5 Gerald Crossing', '1494 Green Ridge Junction');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (326, 'East Asia and Pacific', 'China', null, 'Sheli', null, '19253 Sycamore Alley', '72721 Del Mar Court');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (327, 'Europe and Central Asia', 'Portugal', 'Santarém', 'Vale de Figueira', '2000-715', '346 Colorado Way', '58 Delaware Circle');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (328, 'at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non', 'French Guiana', 'Guyane', 'Kourou', '97374 CEDEX', '25440 Village Green Center', '00 Kingsford Park');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (329, 'Middle East and North Africa', 'Yemen', null, 'Al ‘Aqabah', null, '5 Huxley Terrace', '20 Montana Pass');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (330, 'East Asia and Pacific', 'China', null, 'Chengzhong', null, '893 Kensington Circle', '347 Chive Road');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (331, 'potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris', 'Palestinian Territory', null, 'Ash Shuhadā’', null, '4068 Pennsylvania Lane', '77085 Eagan Parkway');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (332, 'Latin America and Caribbean', 'Mexico', 'Guerrero', 'Vista Hermosa', '39130', '9975 Daystar Street', '79822 Mitchell Alley');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (333, 'Middle East and North Africa', 'Qatar', null, 'Umm Sa‘īd', null, '55051 Schmedeman Center', '379 Hovde Lane');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (334, 'East Asia and Pacific', 'Indonesia', null, 'Janaka', null, '23 Claremont Avenue', '4 Elmside Court');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (335, 'East Asia and Pacific', 'Indonesia', null, 'Dahu', null, '1 Maywood Road', '586 Pond Trail');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (336, 'North America', 'United States', 'Florida', 'Largo', '34643', '9754 Fieldstone Drive', '8 Bay Street');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (337, 'East Asia and Pacific', 'Indonesia', null, 'Gemuruh', null, '93094 Shoshone Trail', '08594 Vahlen Point');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (338, 'East Asia and Pacific', 'Indonesia', null, 'Fatukanutu', null, '43713 Shasta Point', '5 Havey Park');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (339, 'East Asia and Pacific', 'China', null, 'Hengli', null, '96 Becker Alley', '45 Kim Way');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (340, 'East Asia and Pacific', 'China', null, 'Quanyang', null, '36 Almo Drive', '4 Maple Alley');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (341, 'Latin America and Caribbean', 'Panama', null, 'Capira', null, '3206 Sycamore Junction', '56536 Burrows Junction');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (342, 'Europe and Central Asia', 'Poland', null, 'Wilkołaz', '23-212', '57 Memorial Trail', '442 Armistice Hill');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (343, 'Europe and Central Asia', 'Poland', null, 'Jadów', '05-280', '0 Lunder Drive', '65474 Ridge Oak Alley');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (344, 'East Asia and Pacific', 'Indonesia', null, 'Purbalingga', null, '9 Lindbergh Pass', '56 Debs Court');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (345, 'Europe and Central Asia', 'Greece', null, 'Valsamáta', null, '5 Merrick Hill', '33 Oxford Place');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (346, 'East Asia and Pacific', 'China', null, 'Guandukou', null, '9778 Hauk Drive', '1354 Ronald Regan Circle');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (347, 'East Asia and Pacific', 'Vietnam', null, 'Hương Sơn', null, '94433 Brown Plaza', '28 Rowland Park');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (348, 'Europe and Central Asia', 'Kazakhstan', null, 'Kyzylorda', null, '1317 8th Place', '2855 Holmberg Hill');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (349, 'Europe and Central Asia', 'Germany', 'Baden-Württemberg', 'Reutlingen', '72768', '050 Charing Cross Terrace', '6 Delladonna Center');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (350, 'East Asia and Pacific', 'Indonesia', null, 'Salamrejo', null, '59341 Saint Paul Junction', '6 7th Plaza');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (351, 'East Asia and Pacific', 'Indonesia', null, 'Mojomulyokrajan', null, '2 Summer Ridge Trail', '96 Warrior Crossing');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (352, 'Europe and Central Asia', 'Macedonia', null, 'Ilinden', '1041', '81084 Brickson Park Drive', '3 International Junction');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (353, 'Europe and Central Asia', 'Poland', null, 'Jasienica', '43-385', '80 Carey Terrace', '6 Amoth Drive');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (354, 'Europe and Central Asia', 'Russia', null, 'Staritsa', '171399', '4 Katie Place', '7528 Hayes Junction');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (355, 'Sub-Saharan Africa', 'Senegal', null, 'Tiébo', null, '804 Bonner Parkway', '0 Forster Place');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (356, 'East Asia and Pacific', 'China', null, 'Yueyahe', null, '308 Vermont Trail', '33 Londonderry Trail');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (357, 'Europe and Central Asia', 'France', 'Pays de la Loire', 'Cholet', '49321 CEDEX', '6110 Mockingbird Court', '8 Lukken Hill');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (358, 'Europe and Central Asia', 'Russia', null, 'Korfovskiy', '601423', '994 Fieldstone Pass', '44 Bay Circle');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (359, 'Europe and Central Asia', 'Russia', null, 'Sovetskoye', '359120', '059 Reinke Road', '8 Lakewood Gardens Crossing');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (360, 'East Asia and Pacific', 'Philippines', null, 'Bato', '6525', '42901 Center Circle', '89083 Pond Court');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (361, 'Latin America and Caribbean', 'Brazil', null, 'Ortigueira', '84350-000', '40718 Oneill Avenue', '96052 Derek Pass');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (362, 'Europe and Central Asia', 'Portugal', 'Évora', 'Monte Branco', '7005-838', '867 Darwin Point', '11556 Jenifer Place');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (363, 'Latin America and Caribbean', 'Colombia', null, 'Los Santos', '684009', '7000 Karstens Junction', '7 Mallory Drive');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (364, 'Europe and Central Asia', 'France', 'Pays de la Loire', 'Nantes', '44265 CEDEX 2', '5 Buell Way', '4180 Kim Hill');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (365, 'Latin America and Caribbean', 'Peru', null, 'Bretaña', null, '5 Havey Road', '7565 Gina Center');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (366, 'Europe and Central Asia', 'Albania', null, 'Kastrat', null, '76975 Pankratz Hill', '27131 Everett Alley');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (367, 'East Asia and Pacific', 'China', null, 'Huyuan', null, '71937 Clove Crossing', '2162 Pearson Trail');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (368, 'Europe and Central Asia', 'Estonia', null, 'Võhma', null, '7 Troy Avenue', '45215 Clarendon Parkway');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (369, 'East Asia and Pacific', 'Indonesia', null, 'Mojorembun', null, '171 Maple Crossing', '25457 Stuart Junction');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (370, 'Sub-Saharan Africa', 'Sierra Leone', null, 'Kukuna', null, '5 Bartelt Avenue', '3 Stuart Circle');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (371, 'Europe and Central Asia', 'Russia', null, 'Masalovka', '347837', '90379 American Ash Parkway', '84401 Saint Paul Avenue');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (372, 'Europe and Central Asia', 'Portugal', 'Castelo Branco', 'Tortosendo', '6200-723', '4559 Oneill Trail', '64237 Dorton Drive');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (373, 'Europe and Central Asia', 'Russia', null, 'Shchëkino', '301259', '0 Michigan Park', '91 Novick Lane');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (374, 'East Asia and Pacific', 'Indonesia', null, 'Karangasem', null, '1819 Sutherland Street', '64274 Sutherland Park');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (375, 'Europe and Central Asia', 'Ukraine', null, 'Novopskov', null, '01972 Warrior Road', '37 Welch Lane');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (376, 'Europe and Central Asia', 'Czech Republic', null, 'Police nad Metují', '549 54', '724 Hovde Place', '50 Spohn Trail');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (377, 'East Asia and Pacific', 'Japan', null, 'Tsubata', '929-0323', '23096 Manitowish Road', '31 Atwood Terrace');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (378, 'Latin America and Caribbean', 'Argentina', null, 'Zapala', '8340', '3 Redwing Road', '24 Scoville Point');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (379, 'Latin America and Caribbean', 'Honduras', null, 'Santa Lucía', null, '6992 Scofield Place', '0 Meadow Ridge Way');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (380, 'Latin America and Caribbean', 'Argentina', null, 'General Martín Miguel de Güemes', '5383', '017 Melody Point', '5514 Bluestem Court');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (381, 'Europe and Central Asia', 'Greece', null, 'Patitírion', null, '67131 Lakewood Circle', '42548 Melrose Park');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (382, 'Sub-Saharan Africa', 'Nigeria', null, 'Oguma', null, '2 Fuller Pass', '7984 Village Parkway');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (383, 'East Asia and Pacific', 'Philippines', null, 'San Casimiro', '4332', '7867 Glendale Street', '872 Steensland Place');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (384, 'Sub-Saharan Africa', 'Nigeria', null, 'Gwadabawa', null, '9 Lindbergh Court', '77572 Brentwood Court');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (385, 'East Asia and Pacific', 'Indonesia', null, 'Jengglungharjo', null, '5174 Blue Bill Park Circle', '2153 American Trail');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (386, 'Europe and Central Asia', 'Sweden', 'Västmanland', 'Västerås', '722 25', '27202 Comanche Pass', '6478 Kensington Parkway');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (387, 'Latin America and Caribbean', 'Argentina', null, 'Tostado', '4242', '811 Amoth Hill', '9058 Armistice Alley');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (388, 'East Asia and Pacific', 'Indonesia', null, 'Labuhankananga', null, '3426 Lake View Lane', '97913 Dahle Way');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (389, 'Middle East and North Africa', 'Yemen', null, 'Najd al Jumā‘ī', null, '039 Bonner Plaza', '26603 Novick Place');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (390, 'Europe and Central Asia', 'Russia', null, 'Tekstil’shchiki', '678126', '6 Nelson Court', '842 Bluestem Center');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (391, 'Europe and Central Asia', 'Portugal', 'Braga', 'Sande São Lourenço', '4805-583', '9458 Bashford Hill', '731 Delladonna Center');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (392, 'Latin America and Caribbean', 'Peru', null, 'Aucallama', null, '66204 Coolidge Avenue', '307 Anniversary Pass');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (393, 'Middle East and North Africa', 'Israel', null, 'Petaẖ Tiqwa', null, '1 Banding Circle', '0200 Reindahl Road');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (394, 'Sub-Saharan Africa', 'South Africa', null, 'Duiwelskloof', '0815', '182 Hoepker Pass', '1 Algoma Alley');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (395, 'Europe and Central Asia', 'Sweden', 'Östergötland', 'Norrköping', '603 52', '7 Merrick Terrace', '12557 Clove Avenue');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (396, 'Sub-Saharan Africa', 'Nigeria', null, 'Ikeja', null, '2 Thierer Junction', '05869 Ridgeway Drive');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (397, 'Europe and Central Asia', 'Russia', null, 'Tula', '300999', '4 Pierstorff Terrace', '8 Crescent Oaks Trail');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (398, 'Europe and Central Asia', 'France', 'Provence-Alpes-Côte d''Azur', 'Aubagne', '13674 CEDEX', '423 Heath Point', '74 Shoshone Pass');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (399, 'East Asia and Pacific', 'Indonesia', null, 'South Tangerang', null, '1 Westridge Place', '8247 Del Mar Place');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (400, 'Europe and Central Asia', 'Portugal', 'Lisboa', 'Carregado', '2580-466', '92 Sullivan Drive', '5 Stone Corner Circle');
INSERT INTO Addresses (id, worldRegion, country, stateProvince, city, postalCode, addressLine1, addressLine2) VALUES (401, 'Europe and Central Asia', 'Macedonia', null, 'Sedlarevo', '1231', '738 Judy Park', '2 Charing Cross Road');

GO
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (1, 'Bianka', 'Ackred', 23, 3, 4);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (2, 'Ralina', 'Edeler', 74, 7, 6);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (3, 'Tiphani', 'Clell', 33, 9, 8);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (4, 'Frankie', 'Lintill', 100, 11, 11);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (5, 'Bree', 'Chellam', 97, 14, 13);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (6, 'Dmitri', 'Blakden', 101, 18, 14);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (7, 'Stephani', 'Lattin', 99, 19, 16);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (8, 'Fianna', 'Cowern', 15, 22, 19);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (9, 'Guinna', 'Dicte', 89, 25, 21);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (10, 'Priscilla', 'Warcup', 38, 27, 23);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (11, 'Xena', 'Stickland', 55, 30, 24);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (12, 'Emmett', 'Turbat', 57, 31, 29);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (13, 'Inge', 'Sigward', 89, 34, 31);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (14, 'Brad', 'Akid', 20, 36, 34);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (15, 'Maureen', 'Pierson', 45, 39, 35);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (16, 'Tiffani', 'Prati', 85, 41, 40);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (17, 'Wade', 'Lum', 70, 45, 42);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (18, 'Sari', 'O''Donnelly', 24, 48, 43);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (19, 'Gilberte', 'Shallcrass', 34, 50, 46);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (20, 'Gale', 'Doerr', 16, 52, 49);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (21, 'Hadley', 'Beach', 64, 55, 51);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (22, 'Marcelle', 'Siderfin', 32, 58, 54);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (23, 'Orelie', 'Ibarra', 15, 60, 55);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (24, 'Lynde', 'Normanvill', 69, 62, 57);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (25, 'Ofelia', 'Pelham', 100, 65, 62);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (26, 'Leonidas', 'Darter', 57, 66, 63);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (27, 'Marielle', 'Neve', 97, 69, 65);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (28, 'Daria', 'Weaben', 42, 71, 68);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (29, 'Homer', 'McGerr', 20, 74, 70);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (30, 'Claire', 'Bold', 73, 76, 71);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (31, 'Zedekiah', 'Lippiett', 29, 79, 73);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (32, 'Karim', 'Hessay', 101, 81, 76);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (33, 'Gertrude', 'Krauze', 23, 83, 77);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (34, 'Lucas', 'Keays', 92, 86, 79);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (35, 'Emanuel', 'MacCaffery', 61, 89, 81);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (36, 'Waverly', 'Threlfall', 25, 91, 84);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (37, 'Greer', 'Glavias', 61, 94, 85);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (38, 'Allyn', 'Ridehalgh', 83, 96, 87);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (39, 'Dorthea', 'Bollen', 87, 98, 88);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (40, 'Clemens', 'Czajkowska', 102, 101, 92);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (41, 'Emilie', 'Lintott', 68, 104, 93);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (42, 'Gabriele', 'Wapple', 18, 106, 95);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (43, 'Toma', 'Jayes', 88, 109, 96);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (44, 'Albrecht', 'Organ', 59, 111, 99);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (45, 'Darci', 'Basile', 75, 114, 101);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (46, 'Danya', 'Sacker', 43, 117, 102);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (47, 'Nickola', 'Ghirardi', 56, 120, 104);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (48, 'Humfried', 'Grogor', 66, 122, 105);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (49, 'Lawrence', 'Warlow', 105, 125, 108);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (50, 'Renado', 'McGuire', 83, 127, 110);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (51, 'Berne', 'Cranton', 14, 130, 111);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (52, 'Inesita', 'Seyfart', 41, 132, 113);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (53, 'Shoshanna', 'Carty', 51, 135, 114);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (54, 'Sidonnie', 'Copins', 63, 137, 117);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (55, 'Lauree', 'Aldgate', 56, 140, 119);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (56, 'Paolo', 'Stanworth', 30, 143, 120);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (57, 'Seamus', 'Pierson', 17, 145, 122);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (58, 'Sharia', 'Sherwen', 21, 147, 123);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (59, 'Christoper', 'Morgan', 57, 150, 126);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (60, 'Land', 'Sweatman', 45, 153, 128);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (61, 'Rebekkah', 'Rushbury', 102, 155, 129);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (62, 'Kara', 'Loyndon', 91, 157, 131);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (63, 'Mordecai', 'Ferrarin', 66, 160, 132);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (64, 'Madel', 'McDermot', 21, 162, 135);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (65, 'Darren', 'Babin', 76, 165, 137);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (66, 'Bailey', 'Fripps', 66, 168, 138);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (67, 'Bendicty', 'Dellenty', 43, 170, 140);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (68, 'Ardelis', 'Salliss', 78, 173, 141);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (69, 'Phillipe', 'Van de Vlies', 83, 175, 144);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (70, 'Sloan', 'Knutsen', 88, 178, 146);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (71, 'Stavro', 'Roblett', 13, 180, 147);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (72, 'Cyrillus', 'Ransley', 29, 182, 149);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (73, 'Baudoin', 'Garbott', 21, 185, 150);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (74, 'Frank', 'Allingham', 43, 187, 153);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (75, 'Chryste', 'Keeri', 25, 190, 155);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (76, 'Seward', 'Hounsham', 83, 193, 156);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (77, 'Chrisy', 'Asey', 32, 195, 158);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (78, 'Lawry', 'Dudley', 63, 198, 159);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (79, 'Odell', 'Pedron', 64, 200, 162);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (80, 'Husain', 'Freebury', 64, 203, 164);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (81, 'Ambrosi', 'Echalier', 46, 205, 165);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (82, 'Merrel', 'Gorioli', 29, 207, 167);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (83, 'Ely', 'Trickett', 96, 210, 168);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (84, 'Nola', 'Akrigg', 102, 213, 171);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (85, 'Haslett', 'Mendenhall', 26, 215, 173);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (86, 'Tonye', 'Hairsnape', 17, 218, 174);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (87, 'Mitchel', 'Phillp', 44, 221, 176);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (88, 'Kit', 'Bennike', 39, 223, 177);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (89, 'Maryellen', 'Gavaran', 107, 225, 180);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (90, 'Des', 'Byrd', 34, 228, 182);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (91, 'Nissie', 'Trehearn', 55, 230, 183);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (92, 'Clevey', 'Morton', 76, 232, 185);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (93, 'Geri', 'Gerrets', 34, 235, 186);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (94, 'Tobe', 'Barnfather', 15, 238, 189);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (95, 'Rex', 'Ferrari', 75, 240, 191);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (96, 'Kellyann', 'Heakey', 91, 243, 192);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (97, 'Edgardo', 'Muslim', 48, 246, 194);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (98, 'Hill', 'Van Arsdalen', 92, 248, 195);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (99, 'Ashlee', 'Ryves', 47, 250, 198);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age, addressId, contactId) VALUES (100, 'Terrance', 'Greenroyd', 46, 253, 200);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (1, 'Violette', 'Milstead', 14, 256, 3);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (2, 'Rea', 'Measey', 108, 258, 7);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (3, 'Minna', 'Fawson', 77, 261, 12);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (4, 'Haley', 'Pashen', 49, 263, 18);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (5, 'Brooke', 'Kebell', 109, 266, 22);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (6, 'Alidia', 'Gavaran', 66, 269, 25);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (7, 'Isabel', 'Abbes', 17, 271, 28);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (8, 'Silvie', 'Gillice', 20, 274, 30);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (9, 'Korry', 'Baldick', 25, 276, 33);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (10, 'Dulce', 'Bidmead', 76, 279, 36);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (11, 'Trefor', 'Shaxby', 98, 281, 39);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (12, 'Derick', 'Brockhouse', 108, 284, 41);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (13, 'Maurits', 'Southers', 54, 287, 44);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (14, 'Glenden', 'Nan Carrow', 87, 289, 47);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (15, 'Belia', 'Chicotti', 88, 291, 50);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (16, 'Toddy', 'Wogdon', 14, 294, 53);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (17, 'Kristel', 'Sabates', 28, 297, 56);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (18, 'Forbes', 'Legon', 76, 299, 58);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (19, 'Coreen', 'Gegg', 58, 302, 61);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (20, 'Anetta', 'Tesmond', 26, 305, 64);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (21, 'Nadiya', 'Whitley', 58, 307, 67);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (22, 'Merilee', 'Parvin', 104, 310, 69);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (23, 'Ida', 'Deare', 46, 312, 72);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (24, 'Helen-elizabeth', 'Willson', 77, 315, 75);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (25, 'Izabel', 'Toulson', 40, 318, 78);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (26, 'Aloise', 'Pioli', 84, 320, 80);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (27, 'Jemmy', 'Woolliams', 99, 322, 83);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (28, 'Novelia', 'Lytle', 74, 325, 86);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (29, 'Chrisy', 'McHugh', 92, 328, 89);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (30, 'Heath', 'Bleakman', 53, 330, 91);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (31, 'Marysa', 'Battisson', 32, 333, 94);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (32, 'Flin', 'Warriner', 31, 336, 97);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (33, 'Rancell', 'Guerreiro', 17, 338, 100);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (34, 'Martica', 'Shower', 28, 340, 103);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (35, 'Verne', 'Braywood', 56, 343, 106);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (36, 'Paulette', 'Taggett', 107, 346, 109);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (37, 'Pippa', 'Boam', 49, 348, 112);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (38, 'Norrie', 'Rizzello', 13, 350, 115);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (39, 'Bernardina', 'Rosenwasser', 37, 353, 118);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (40, 'Algernon', 'Edmons', 99, 356, 121);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (41, 'Tito', 'Crickett', 71, 359, 124);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (42, 'Charleen', 'Le Huquet', 99, 361, 127);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (43, 'Umberto', 'Pingstone', 97, 364, 130);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (44, 'Stephani', 'Arling', 81, 366, 133);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (45, 'Aldis', 'Bunt', 14, 369, 136);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (46, 'Nora', 'Gierke', 43, 372, 139);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (47, 'Leticia', 'Croxford', 89, 374, 142);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (48, 'Suzi', 'Stride', 47, 377, 145);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (49, 'Alphard', 'Geerits', 32, 380, 148);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (50, 'Ethelda', 'Warwicker', 91, 382, 151);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (51, 'Moyna', 'Weatherhogg', 45, 385, 154);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (52, 'Hugibert', 'Ahearne', 106, 387, 157);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (53, 'Alberik', 'Bestiman', 93, 390, 160);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (54, 'Tabbi', 'Berzins', 22, 392, 163);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (55, 'Bill', 'Studdeard', 108, 395, 166);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (56, 'Griswold', 'Taill', 48, 398, 169);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (57, 'Talyah', 'Gollin', 107, 400, 172);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (58, 'Trish', 'Moorerud', 44, 1, 175);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (59, 'Clemmy', 'Brewers', 47, 6, 178);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (60, 'Far', 'Dockerty', 76, 13, 181);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (61, 'Moyna', 'Schimon', 80, 17, 184);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (62, 'Gisele', 'Beynke', 92, 21, 187);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (63, 'Hadlee', 'Frostdyke', 18, 28, 190);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (64, 'Mersey', 'Schade', 79, 32, 193);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (65, 'Katheryn', 'Duesbury', 41, 38, 196);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (66, 'Anya', 'Talman', 81, 42, 199);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (67, 'Sullivan', 'Patrie', 92, 47, 1);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (68, 'Domenic', 'Margram', 89, 53, 5);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (69, 'Eugenio', 'Armal', 27, 57, 10);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (70, 'Ilse', 'Sinclar', 65, 63, 15);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (71, 'Danny', 'Dohrmann', 35, 67, 20);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (72, 'Delphinia', 'Scoon', 64, 72, 26);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (73, 'Hadley', 'Petworth', 29, 78, 32);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (74, 'Krystal', 'Thirkettle', 55, 85, 38);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (75, 'Harriet', 'Feavers', 70, 88, 45);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (76, 'Arnaldo', 'Gullick', 72, 92, 52);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (77, 'Sibylla', 'Polgreen', 58, 97, 59);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (78, 'Amos', 'Snepp', 103, 103, 66);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (79, 'Nedi', 'Whittall', 99, 107, 74);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (80, 'Matthew', 'Cornhill', 77, 113, 82);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (81, 'Garrot', 'Ratnege', 18, 119, 90);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (82, 'Gothart', 'Aldcorne', 18, 124, 98);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (83, 'Terrill', 'Coning', 81, 129, 107);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (84, 'Bertrando', 'Copozio', 26, 133, 116);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (85, 'Kennie', 'Stanistrete', 90, 138, 125);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (86, 'Arty', 'Tewkesberrie', 35, 144, 134);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (87, 'Foster', 'Penhale', 97, 149, 143);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (88, 'Jehu', 'MacSorley', 62, 152, 152);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (89, 'Christi', 'Cambell', 25, 158, 161);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (90, 'Yuma', 'Fairham', 92, 164, 170);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (91, 'Eolande', 'Stoffels', 46, 169, 179);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (92, 'Milton', 'Farmer', 93, 174, 188);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (93, 'Doe', 'Nassey', 64, 179, 197);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (94, 'Ronny', 'Luby', 88, 184, 2);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (95, 'Kelley', 'Frostdick', 30, 189, 9);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (96, 'Kent', 'Colisbe', 100, 196, 17);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (97, 'Ninnette', 'Rudolph', 105, 202, 27);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (98, 'Noni', 'Ubsdell', 88, 209, 37);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (99, 'Jeanna', 'Nagle', 103, 214, 48);
INSERT INTO Customers (id, firstName, lastName, age, addressId, contactId) VALUES (100, 'Aloin', 'Kings', 75, 220, 60);
INSERT INTO WaterBodies (name, typeId) VALUES ('Rutrum.mp3', 12);
INSERT INTO WaterBodies (name, typeId) VALUES ('SapienSapienNon.mp3', 17);
INSERT INTO WaterBodies (name, typeId) VALUES ('Placerat.jpeg', 16);
INSERT INTO WaterBodies (name, typeId) VALUES ('PhasellusInFelis.ppt', 17);
INSERT INTO WaterBodies (name, typeId) VALUES ('Vel.avi', 2);
INSERT INTO WaterBodies (name, typeId) VALUES ('EtUltricesPosuere.mp3', 4);
INSERT INTO WaterBodies (name, typeId) VALUES ('Tempus.ppt', 8);
INSERT INTO WaterBodies (name, typeId) VALUES ('FaucibusOrci.avi', 16);
INSERT INTO WaterBodies (name, typeId) VALUES ('Sit.avi', 22);
INSERT INTO WaterBodies (name, typeId) VALUES ('Luctus.mp3', 7);
INSERT INTO WaterBodies (name, typeId) VALUES ('MiSitAmet.tiff', 3);
INSERT INTO WaterBodies (name, typeId) VALUES ('In.ppt', 12);
INSERT INTO WaterBodies (name, typeId) VALUES ('MassaTempor.avi', 22);
INSERT INTO WaterBodies (name, typeId) VALUES ('QuisquePortaVolutpat.txt', 23);
INSERT INTO WaterBodies (name, typeId) VALUES ('Tortor.avi', 19);
INSERT INTO WaterBodies (name, typeId) VALUES ('VulputateVitaeNisl.mp3', 3);
INSERT INTO WaterBodies (name, typeId) VALUES ('EuTinciduntIn.mp3', 1);
INSERT INTO WaterBodies (name, typeId) VALUES ('SollicitudinVitaeConsectetuer.avi', 7);
INSERT INTO WaterBodies (name, typeId) VALUES ('Quis.avi', 18);
INSERT INTO WaterBodies (name, typeId) VALUES ('EuEstCongue.gif', 13);
INSERT INTO WaterBodies (name, typeId) VALUES ('ProinAt.avi', 17);
INSERT INTO WaterBodies (name, typeId) VALUES ('LoremIdLigula.xls', 16);
INSERT INTO WaterBodies (name, typeId) VALUES ('DuisAliquam.mpeg', 14);
INSERT INTO WaterBodies (name, typeId) VALUES ('Porttitor.avi', 11);
INSERT INTO WaterBodies (name, typeId) VALUES ('Velit.avi', 17);
INSERT INTO WaterBodies (name, typeId) VALUES ('PlateaDictumstMaecenas.png', 4);
INSERT INTO WaterBodies (name, typeId) VALUES ('Amet.avi', 1);
INSERT INTO WaterBodies (name, typeId) VALUES ('Suspendisse.txt', 17);
INSERT INTO WaterBodies (name, typeId) VALUES ('Eu.avi', 15);
INSERT INTO WaterBodies (name, typeId) VALUES ('Elementum.ppt', 18);
INSERT INTO WaterBodies (name, typeId) VALUES ('CurabiturAt.avi', 17);
INSERT INTO WaterBodies (name, typeId) VALUES ('CongueElementum.pdf', 13);
INSERT INTO WaterBodies (name, typeId) VALUES ('EuTincidunt.txt', 20);
INSERT INTO WaterBodies (name, typeId) VALUES ('QuisqueUtErat.mp3', 5);
INSERT INTO WaterBodies (name, typeId) VALUES ('Enim.txt', 14);
INSERT INTO WaterBodies (name, typeId) VALUES ('PraesentLectusVestibulum.ppt', 3);
INSERT INTO WaterBodies (name, typeId) VALUES ('Enim.tiff', 23);
INSERT INTO WaterBodies (name, typeId) VALUES ('DapibusDuisAt.tiff', 20);
INSERT INTO WaterBodies (name, typeId) VALUES ('IdOrnare.avi', 13);
INSERT INTO WaterBodies (name, typeId) VALUES ('QuisOdioConsequat.mpeg', 22);
INSERT INTO WaterBodies (name, typeId) VALUES ('AmetConsectetuer.mp3', 22);
INSERT INTO WaterBodies (name, typeId) VALUES ('AliquetMassaId.avi', 16);
INSERT INTO WaterBodies (name, typeId) VALUES ('RhoncusAliquetPulvinar.xls', 23);
INSERT INTO WaterBodies (name, typeId) VALUES ('LiberoNam.jpeg', 10);
INSERT INTO WaterBodies (name, typeId) VALUES ('MorbiSem.doc', 10);
INSERT INTO WaterBodies (name, typeId) VALUES ('SitAmetNunc.tiff', 16);
INSERT INTO WaterBodies (name, typeId) VALUES ('Pellentesque.avi', 16);
INSERT INTO WaterBodies (name, typeId) VALUES ('Ultrices.tiff', 20);
INSERT INTO WaterBodies (name, typeId) VALUES ('NonMattisPulvinar.mpeg', 13);
INSERT INTO WaterBodies (name, typeId) VALUES ('TellusSemperInterdum.avi', 22);
INSERT INTO WaterBodies (name, typeId) VALUES ('CuraeMauris.xls', 5);
INSERT INTO WaterBodies (name, typeId) VALUES ('Magnis.mov', 13);
INSERT INTO WaterBodies (name, typeId) VALUES ('PraesentBlandit.mp3', 6);
INSERT INTO WaterBodies (name, typeId) VALUES ('AdipiscingMolestieHendrerit.doc', 14);
INSERT INTO WaterBodies (name, typeId) VALUES ('Non.png', 9);
INSERT INTO WaterBodies (name, typeId) VALUES ('NullamOrci.avi', 10);
INSERT INTO WaterBodies (name, typeId) VALUES ('AdipiscingElit.png', 20);
INSERT INTO WaterBodies (name, typeId) VALUES ('InFaucibusOrci.xls', 16);
INSERT INTO WaterBodies (name, typeId) VALUES ('NullaFacilisiCras.mov', 3);
INSERT INTO WaterBodies (name, typeId) VALUES ('ArcuAdipiscingMolestie.doc', 8);
INSERT INTO WaterBodies (name, typeId) VALUES ('Magna.mp3', 9);
INSERT INTO WaterBodies (name, typeId) VALUES ('NisiVenenatis.avi', 1);
INSERT INTO WaterBodies (name, typeId) VALUES ('Rutrum.mp3', 11);
INSERT INTO WaterBodies (name, typeId) VALUES ('EgetEros.ppt', 22);
INSERT INTO WaterBodies (name, typeId) VALUES ('EtUltrices.avi', 8);
INSERT INTO WaterBodies (name, typeId) VALUES ('CongueElementumIn.ppt', 19);
INSERT INTO WaterBodies (name, typeId) VALUES ('SagittisNamCongue.png', 12);
INSERT INTO WaterBodies (name, typeId) VALUES ('Blandit.ppt', 11);
INSERT INTO WaterBodies (name, typeId) VALUES ('DuisAliquam.mp3', 4);
INSERT INTO WaterBodies (name, typeId) VALUES ('RidiculusMusEtiam.mp3', 14);
INSERT INTO WaterBodies (name, typeId) VALUES ('Purus.pdf', 12);
INSERT INTO WaterBodies (name, typeId) VALUES ('TellusNullaUt.avi', 9);
INSERT INTO WaterBodies (name, typeId) VALUES ('VestibulumRutrumRutrum.avi', 2);
INSERT INTO WaterBodies (name, typeId) VALUES ('ParturientMontes.ppt', 11);
INSERT INTO WaterBodies (name, typeId) VALUES ('Consequat.mp3', 15);
INSERT INTO WaterBodies (name, typeId) VALUES ('FelisEuSapien.mp3', 16);
INSERT INTO WaterBodies (name, typeId) VALUES ('SuspendisseAccumsan.avi', 5);
INSERT INTO WaterBodies (name, typeId) VALUES ('VelitEuEst.mov', 16);
INSERT INTO WaterBodies (name, typeId) VALUES ('Convallis.tiff', 20);
INSERT INTO WaterBodies (name, typeId) VALUES ('At.mp3', 2);
INSERT INTO WaterBodies (name, typeId) VALUES ('Augue.mp3', 3);
INSERT INTO WaterBodies (name, typeId) VALUES ('Tincidunt.avi', 17);
INSERT INTO WaterBodies (name, typeId) VALUES ('Faucibus.mpeg', 14);
INSERT INTO WaterBodies (name, typeId) VALUES ('Luctus.xls', 11);
INSERT INTO WaterBodies (name, typeId) VALUES ('LeoPellentesqueUltrices.gif', 14);
INSERT INTO WaterBodies (name, typeId) VALUES ('Accumsan.mp3', 21);
INSERT INTO WaterBodies (name, typeId) VALUES ('EtiamJustoEtiam.xls', 6);
INSERT INTO WaterBodies (name, typeId) VALUES ('Ipsum.ppt', 15);
INSERT INTO WaterBodies (name, typeId) VALUES ('Lorem.mpeg', 6);
INSERT INTO WaterBodies (name, typeId) VALUES ('Massa.mp3', 6);
INSERT INTO WaterBodies (name, typeId) VALUES ('Tincidunt.avi', 21);
INSERT INTO WaterBodies (name, typeId) VALUES ('AmetSem.mp3', 2);
INSERT INTO WaterBodies (name, typeId) VALUES ('InImperdiet.mp3', 18);
INSERT INTO WaterBodies (name, typeId) VALUES ('VenenatisTurpisEnim.avi', 2);
INSERT INTO WaterBodies (name, typeId) VALUES ('PrimisIn.avi', 3);
INSERT INTO WaterBodies (name, typeId) VALUES ('MalesuadaInImperdiet.doc', 3);
INSERT INTO WaterBodies (name, typeId) VALUES ('FaucibusOrci.gif', 4);
INSERT INTO WaterBodies (name, typeId) VALUES ('Sed.ppt', 7);
INSERT INTO WaterBodies (name, typeId) VALUES ('VelitNecNisi.ppt', 19);
INSERT INTO WaterBodies (name, typeId) VALUES ('Laoreet.tiff', 9);
INSERT INTO Fish (id, color, length, speciesId) VALUES (1, 'Violet', 35.158, 33);
INSERT INTO Fish (id, color, length, speciesId) VALUES (2, 'Khaki', 135.221, 9);
INSERT INTO Fish (id, color, length, speciesId) VALUES (3, 'Pink', 40.983, 38);
INSERT INTO Fish (id, color, length, speciesId) VALUES (4, 'Pink', 136.376, 26);
INSERT INTO Fish (id, color, length, speciesId) VALUES (5, 'Purple', 68.859, 38);
INSERT INTO Fish (id, color, length, speciesId) VALUES (6, 'Red', 138.572, 5);
INSERT INTO Fish (id, color, length, speciesId) VALUES (7, 'Turquoise', 61.637, 31);
INSERT INTO Fish (id, color, length, speciesId) VALUES (8, 'Crimson', 24.1, 28);
INSERT INTO Fish (id, color, length, speciesId) VALUES (9, 'Turquoise', 118.013, 13);
INSERT INTO Fish (id, color, length, speciesId) VALUES (10, 'Fuscia', 73.239, 17);
INSERT INTO Fish (id, color, length, speciesId) VALUES (11, 'Crimson', 144.507, 21);
INSERT INTO Fish (id, color, length, speciesId) VALUES (12, 'Green', 58.583, 31);
INSERT INTO Fish (id, color, length, speciesId) VALUES (13, 'Turquoise', 70.186, 15);
INSERT INTO Fish (id, color, length, speciesId) VALUES (14, 'Blue', 48.26, 14);
INSERT INTO Fish (id, color, length, speciesId) VALUES (15, 'Maroon', 134.172, 9);
INSERT INTO Fish (id, color, length, speciesId) VALUES (16, 'Purple', 135.97, 14);
INSERT INTO Fish (id, color, length, speciesId) VALUES (17, 'Indigo', 29.78, 23);
INSERT INTO Fish (id, color, length, speciesId) VALUES (18, 'Violet', 83.794, 14);
INSERT INTO Fish (id, color, length, speciesId) VALUES (19, 'Blue', 97.777, 10);
INSERT INTO Fish (id, color, length, speciesId) VALUES (20, 'Blue', 149.883, 31);
INSERT INTO Fish (id, color, length, speciesId) VALUES (21, 'Indigo', 148.867, 32);
INSERT INTO Fish (id, color, length, speciesId) VALUES (22, 'Blue', 91.011, 16);
INSERT INTO Fish (id, color, length, speciesId) VALUES (23, 'Turquoise', 8.454, 38);
INSERT INTO Fish (id, color, length, speciesId) VALUES (24, 'Goldenrod', 22.367, 25);
INSERT INTO Fish (id, color, length, speciesId) VALUES (25, 'Puce', 137.538, 34);
INSERT INTO Fish (id, color, length, speciesId) VALUES (26, 'Puce', 29.704, 15);
INSERT INTO Fish (id, color, length, speciesId) VALUES (27, 'Maroon', 7.955, 18);
INSERT INTO Fish (id, color, length, speciesId) VALUES (28, 'Khaki', 65.366, 38);
INSERT INTO Fish (id, color, length, speciesId) VALUES (29, 'Red', 69.27, 36);
INSERT INTO Fish (id, color, length, speciesId) VALUES (30, 'Teal', 62.222, 8);
INSERT INTO Fish (id, color, length, speciesId) VALUES (31, 'Fuscia', 101.253, 5);
INSERT INTO Fish (id, color, length, speciesId) VALUES (32, 'Puce', 92.69, 38);
INSERT INTO Fish (id, color, length, speciesId) VALUES (33, 'Goldenrod', 99.806, 41);
INSERT INTO Fish (id, color, length, speciesId) VALUES (34, 'Pink', 144.745, 4);
INSERT INTO Fish (id, color, length, speciesId) VALUES (35, 'Aquamarine', 135.165, 28);
INSERT INTO Fish (id, color, length, speciesId) VALUES (36, 'Turquoise', 82.992, 16);
INSERT INTO Fish (id, color, length, speciesId) VALUES (37, 'Red', 110.984, 1);
INSERT INTO Fish (id, color, length, speciesId) VALUES (38, 'Teal', 53.304, 26);
INSERT INTO Fish (id, color, length, speciesId) VALUES (39, 'Red', 142.646, 28);
INSERT INTO Fish (id, color, length, speciesId) VALUES (40, 'Indigo', 110.977, 14);
INSERT INTO Fish (id, color, length, speciesId) VALUES (41, 'Violet', 89.444, 31);
INSERT INTO Fish (id, color, length, speciesId) VALUES (42, 'Blue', 28.736, 5);
INSERT INTO Fish (id, color, length, speciesId) VALUES (43, 'Khaki', 118.075, 20);
INSERT INTO Fish (id, color, length, speciesId) VALUES (44, 'Mauve', 10.637, 39);
INSERT INTO Fish (id, color, length, speciesId) VALUES (45, 'Maroon', 130.652, 23);
INSERT INTO Fish (id, color, length, speciesId) VALUES (46, 'Yellow', 1.5, 15);
INSERT INTO Fish (id, color, length, speciesId) VALUES (47, 'Purple', 95.169, 42);
INSERT INTO Fish (id, color, length, speciesId) VALUES (48, 'Teal', 49.639, 36);
INSERT INTO Fish (id, color, length, speciesId) VALUES (49, 'Blue', 56.7, 40);
INSERT INTO Fish (id, color, length, speciesId) VALUES (50, 'Goldenrod', 126.347, 2);
INSERT INTO Fish (id, color, length, speciesId) VALUES (51, 'Maroon', 72.348, 33);
INSERT INTO Fish (id, color, length, speciesId) VALUES (52, 'Red', 118.439, 27);
INSERT INTO Fish (id, color, length, speciesId) VALUES (53, 'Mauve', 14.983, 11);
INSERT INTO Fish (id, color, length, speciesId) VALUES (54, 'Green', 49.833, 21);
INSERT INTO Fish (id, color, length, speciesId) VALUES (55, 'Maroon', 83.833, 14);
INSERT INTO Fish (id, color, length, speciesId) VALUES (56, 'Yellow', 6.388, 26);
INSERT INTO Fish (id, color, length, speciesId) VALUES (57, 'Teal', 138.48, 11);
INSERT INTO Fish (id, color, length, speciesId) VALUES (58, 'Maroon', 82.623, 2);
INSERT INTO Fish (id, color, length, speciesId) VALUES (59, 'Green', 96.265, 31);
INSERT INTO Fish (id, color, length, speciesId) VALUES (60, 'Red', 28.256, 33);
INSERT INTO Fish (id, color, length, speciesId) VALUES (61, 'Pink', 122.466, 17);
INSERT INTO Fish (id, color, length, speciesId) VALUES (62, 'Turquoise', 94.962, 18);
INSERT INTO Fish (id, color, length, speciesId) VALUES (63, 'Aquamarine', 146.656, 28);
INSERT INTO Fish (id, color, length, speciesId) VALUES (64, 'Purple', 122.116, 37);
INSERT INTO Fish (id, color, length, speciesId) VALUES (65, 'Aquamarine', 118.504, 24);
INSERT INTO Fish (id, color, length, speciesId) VALUES (66, 'Red', 50.405, 24);
INSERT INTO Fish (id, color, length, speciesId) VALUES (67, 'Teal', 95.42, 19);
INSERT INTO Fish (id, color, length, speciesId) VALUES (68, 'Indigo', 100.997, 23);
INSERT INTO Fish (id, color, length, speciesId) VALUES (69, 'Fuscia', 64.3, 13);
INSERT INTO Fish (id, color, length, speciesId) VALUES (70, 'Pink', 66.911, 40);
INSERT INTO Fish (id, color, length, speciesId) VALUES (71, 'Indigo', 6.804, 19);
INSERT INTO Fish (id, color, length, speciesId) VALUES (72, 'Mauve', 141.54, 36);
INSERT INTO Fish (id, color, length, speciesId) VALUES (73, 'Indigo', 23.593, 38);
INSERT INTO Fish (id, color, length, speciesId) VALUES (74, 'Blue', 109.317, 37);
INSERT INTO Fish (id, color, length, speciesId) VALUES (75, 'Goldenrod', 9.988, 21);
INSERT INTO Fish (id, color, length, speciesId) VALUES (76, 'Yellow', 127.015, 11);
INSERT INTO Fish (id, color, length, speciesId) VALUES (77, 'Maroon', 109.961, 2);
INSERT INTO Fish (id, color, length, speciesId) VALUES (78, 'Maroon', 86.12, 2);
INSERT INTO Fish (id, color, length, speciesId) VALUES (79, 'Purple', 40.77, 41);
INSERT INTO Fish (id, color, length, speciesId) VALUES (80, 'Violet', 121.566, 41);
INSERT INTO Fish (id, color, length, speciesId) VALUES (81, 'Violet', 30.148, 13);
INSERT INTO Fish (id, color, length, speciesId) VALUES (82, 'Maroon', 78.66, 33);
INSERT INTO Fish (id, color, length, speciesId) VALUES (83, 'Yellow', 119.16, 35);
INSERT INTO Fish (id, color, length, speciesId) VALUES (84, 'Green', 89.346, 8);
INSERT INTO Fish (id, color, length, speciesId) VALUES (85, 'Goldenrod', 18.283, 4);
INSERT INTO Fish (id, color, length, speciesId) VALUES (86, 'Pink', 100.6, 29);
INSERT INTO Fish (id, color, length, speciesId) VALUES (87, 'Puce', 113.029, 26);
INSERT INTO Fish (id, color, length, speciesId) VALUES (88, 'Goldenrod', 4.83, 40);
INSERT INTO Fish (id, color, length, speciesId) VALUES (89, 'Yellow', 36.814, 14);
INSERT INTO Fish (id, color, length, speciesId) VALUES (90, 'Khaki', 84.652, 10);
INSERT INTO Fish (id, color, length, speciesId) VALUES (91, 'Red', 29.771, 33);
INSERT INTO Fish (id, color, length, speciesId) VALUES (92, 'Crimson', 44.414, 9);
INSERT INTO Fish (id, color, length, speciesId) VALUES (93, 'Violet', 103.348, 5);
INSERT INTO Fish (id, color, length, speciesId) VALUES (94, 'Purple', 129.478, 20);
INSERT INTO Fish (id, color, length, speciesId) VALUES (95, 'Khaki', 143.37, 34);
INSERT INTO Fish (id, color, length, speciesId) VALUES (96, 'Pink', 55.446, 15);
INSERT INTO Fish (id, color, length, speciesId) VALUES (97, 'Teal', 122.339, 7);
INSERT INTO Fish (id, color, length, speciesId) VALUES (98, 'Green', 121.343, 18);
INSERT INTO Fish (id, color, length, speciesId) VALUES (99, 'Mauve', 44.252, 3);
INSERT INTO Fish (id, color, length, speciesId) VALUES (100, 'Mauve', 58.408, 8);
INSERT INTO Fish (id, color, length, speciesId) VALUES (101, 'Puce', 2229.284, 75);
INSERT INTO Fish (id, color, length, speciesId) VALUES (102, 'Orange', 5422.313, 70);
INSERT INTO Fish (id, color, length, speciesId) VALUES (103, 'Orange', 8845.276, 67);
INSERT INTO Fish (id, color, length, speciesId) VALUES (104, 'Green', 7212.717, 76);
INSERT INTO Fish (id, color, length, speciesId) VALUES (105, 'Purple', 3131.396, 63);
INSERT INTO Fish (id, color, length, speciesId) VALUES (106, 'Maroon', 6876.335, 46);
INSERT INTO Fish (id, color, length, speciesId) VALUES (107, 'Orange', 2477.363, 49);
INSERT INTO Fish (id, color, length, speciesId) VALUES (108, 'Blue', 4518.823, 70);
INSERT INTO Fish (id, color, length, speciesId) VALUES (109, 'Maroon', 6947.357, 50);
INSERT INTO Fish (id, color, length, speciesId) VALUES (110, 'Teal', 2544.575, 52);
INSERT INTO Fish (id, color, length, speciesId) VALUES (111, 'Yellow', 2712.012, 68);
INSERT INTO Fish (id, color, length, speciesId) VALUES (112, 'Pink', 8073.431, 55);
INSERT INTO Fish (id, color, length, speciesId) VALUES (113, 'Orange', 2879.495, 64);
INSERT INTO Fish (id, color, length, speciesId) VALUES (114, 'Violet', 8466.761, 62);
INSERT INTO Fish (id, color, length, speciesId) VALUES (115, 'Pink', 6530.676, 65);
INSERT INTO Fish (id, color, length, speciesId) VALUES (116, 'Maroon', 1544.534, 44);
INSERT INTO Fish (id, color, length, speciesId) VALUES (117, 'Mauv', 3588.468, 55);
INSERT INTO Fish (id, color, length, speciesId) VALUES (118, 'Khaki', 6085.999, 51);
INSERT INTO Fish (id, color, length, speciesId) VALUES (119, 'Goldenrod', 1184.562, 74);
INSERT INTO Fish (id, color, length, speciesId) VALUES (120, 'Fuscia', 2853.673, 66);
INSERT INTO Fish (id, color, length, speciesId) VALUES (121, 'Puce', 1367.623, 71);
INSERT INTO Fish (id, color, length, speciesId) VALUES (122, 'Aquamarine', 2637.853, 43);
INSERT INTO Fish (id, color, length, speciesId) VALUES (123, 'Crimson', 6062.858, 53);
INSERT INTO Fish (id, color, length, speciesId) VALUES (124, 'Yellow', 9579.92, 48);
INSERT INTO Fish (id, color, length, speciesId) VALUES (125, 'Maroon', 2634.562, 60);
INSERT INTO Fish (id, color, length, speciesId) VALUES (126, 'Orange', 6116.766, 71);
INSERT INTO Fish (id, color, length, speciesId) VALUES (127, 'Aquamarine', 8908.539, 64);
INSERT INTO Fish (id, color, length, speciesId) VALUES (128, 'Blue', 2701.683, 58);
INSERT INTO Fish (id, color, length, speciesId) VALUES (129, 'Teal', 6930.26, 76);
INSERT INTO Fish (id, color, length, speciesId) VALUES (130, 'Aquamarine', 8917.522, 50);
INSERT INTO Fish (id, color, length, speciesId) VALUES (131, 'Fuscia', 7672.584, 67);
INSERT INTO Fish (id, color, length, speciesId) VALUES (132, 'Maroon', 3337.973, 48);
INSERT INTO Fish (id, color, length, speciesId) VALUES (133, 'Turquoise', 5258.877, 45);
INSERT INTO Fish (id, color, length, speciesId) VALUES (134, 'Teal', 3482.12, 73);
INSERT INTO Fish (id, color, length, speciesId) VALUES (135, 'Mauv', 8403.114, 58);
INSERT INTO Fish (id, color, length, speciesId) VALUES (136, 'Mauv', 3862.16, 53);
INSERT INTO Fish (id, color, length, speciesId) VALUES (137, 'Maroon', 4788.096, 71);
INSERT INTO Fish (id, color, length, speciesId) VALUES (138, 'Mauv', 996.679, 52);
INSERT INTO Fish (id, color, length, speciesId) VALUES (139, 'Aquamarine', 8389.26, 43);
INSERT INTO Fish (id, color, length, speciesId) VALUES (140, 'Red', 9964.127, 77);
INSERT INTO Fish (id, color, length, speciesId) VALUES (141, 'Violet', 3092.488, 67);
INSERT INTO Fish (id, color, length, speciesId) VALUES (142, 'Pink', 4525.442, 48);
INSERT INTO Fish (id, color, length, speciesId) VALUES (143, 'Green', 4621.535, 68);
INSERT INTO Fish (id, color, length, speciesId) VALUES (144, 'Goldenrod', 2553.614, 47);
INSERT INTO Fish (id, color, length, speciesId) VALUES (145, 'Pink', 4410.736, 63);
INSERT INTO Fish (id, color, length, speciesId) VALUES (146, 'Teal', 8251.357, 60);
INSERT INTO Fish (id, color, length, speciesId) VALUES (147, 'Red', 4049.067, 52);
INSERT INTO Fish (id, color, length, speciesId) VALUES (148, 'Green', 9305.617, 69);
INSERT INTO Fish (id, color, length, speciesId) VALUES (149, 'Pink', 8285.711, 57);
INSERT INTO Fish (id, color, length, speciesId) VALUES (150, 'Goldenrod', 7161.217, 65);
INSERT INTO Fish (id, color, length, speciesId) VALUES (151, 'Goldenrod', 9253.632, 60);
INSERT INTO Fish (id, color, length, speciesId) VALUES (152, 'Turquoise', 4528.591, 53);
INSERT INTO Fish (id, color, length, speciesId) VALUES (153, 'Violet', 998.594, 72);
INSERT INTO Fish (id, color, length, speciesId) VALUES (154, 'Goldenrod', 8990.98, 71);
INSERT INTO Fish (id, color, length, speciesId) VALUES (155, 'Green', 4750.814, 49);
INSERT INTO Fish (id, color, length, speciesId) VALUES (156, 'Fuscia', 9487.66, 45);
INSERT INTO Fish (id, color, length, speciesId) VALUES (157, 'Turquoise', 3240.716, 76);
INSERT INTO Fish (id, color, length, speciesId) VALUES (158, 'Orange', 3436.864, 76);
INSERT INTO Fish (id, color, length, speciesId) VALUES (159, 'Fuscia', 8138.782, 55);
INSERT INTO Fish (id, color, length, speciesId) VALUES (160, 'Crimson', 2625.615, 72);
INSERT INTO Fish (id, color, length, speciesId) VALUES (161, 'Blue', 6050.417, 53);
INSERT INTO Fish (id, color, length, speciesId) VALUES (162, 'Fuscia', 7660.452, 68);
INSERT INTO Fish (id, color, length, speciesId) VALUES (163, 'Blue', 5323.724, 67);
INSERT INTO Fish (id, color, length, speciesId) VALUES (164, 'Khaki', 9356.996, 55);
INSERT INTO Fish (id, color, length, speciesId) VALUES (165, 'Turquoise', 9784.051, 68);
INSERT INTO Fish (id, color, length, speciesId) VALUES (166, 'Indigo', 8306.718, 67);
INSERT INTO Fish (id, color, length, speciesId) VALUES (167, 'Mauv', 1274.309, 62);
INSERT INTO Fish (id, color, length, speciesId) VALUES (168, 'Red', 3273.77, 68);
INSERT INTO Fish (id, color, length, speciesId) VALUES (169, 'Purple', 4894.167, 50);
INSERT INTO Fish (id, color, length, speciesId) VALUES (170, 'Mauv', 1380.515, 65);
GO
INSERT INTO Catches (id, fishermanId, date) VALUES (1, 24, '4/5/1981');
INSERT INTO Catches (id, fishermanId, date) VALUES (2, 45, '6/23/1986');
INSERT INTO Catches (id, fishermanId, date) VALUES (3, 11, '10/15/1994');
INSERT INTO Catches (id, fishermanId, date) VALUES (4, 23, '8/18/1994');
INSERT INTO Catches (id, fishermanId, date) VALUES (5, 83, '12/19/2021');
INSERT INTO Catches (id, fishermanId, date) VALUES (6, 77, '11/14/2013');
INSERT INTO Catches (id, fishermanId, date) VALUES (7, 64, '10/2/1993');
INSERT INTO Catches (id, fishermanId, date) VALUES (8, 70, '11/9/2020');
INSERT INTO Catches (id, fishermanId, date) VALUES (9, 56, '6/24/1999');
INSERT INTO Catches (id, fishermanId, date) VALUES (10, 18, '10/4/2008');
INSERT INTO Catches (id, fishermanId, date) VALUES (11, 77, '5/20/2022');
INSERT INTO Catches (id, fishermanId, date) VALUES (12, 39, '5/30/1992');
INSERT INTO Catches (id, fishermanId, date) VALUES (13, 38, '3/13/2000');
INSERT INTO Catches (id, fishermanId, date) VALUES (14, 19, '5/8/2006');
INSERT INTO Catches (id, fishermanId, date) VALUES (15, 18, '6/23/1988');
INSERT INTO Catches (id, fishermanId, date) VALUES (16, 99, '5/13/1982');
INSERT INTO Catches (id, fishermanId, date) VALUES (17, 54, '5/21/2010');
INSERT INTO Catches (id, fishermanId, date) VALUES (18, 4, '2/23/2015');
INSERT INTO Catches (id, fishermanId, date) VALUES (19, 50, '11/8/1981');
INSERT INTO Catches (id, fishermanId, date) VALUES (20, 89, '6/16/2017');
INSERT INTO Catches (id, fishermanId, date) VALUES (21, 40, '11/21/2011');
INSERT INTO Catches (id, fishermanId, date) VALUES (22, 31, '7/9/1989');
INSERT INTO Catches (id, fishermanId, date) VALUES (23, 17, '2/26/2012');
INSERT INTO Catches (id, fishermanId, date) VALUES (24, 1, '1/30/2001');
INSERT INTO Catches (id, fishermanId, date) VALUES (25, 26, '2/12/2008');
INSERT INTO Catches (id, fishermanId, date) VALUES (26, 88, '6/23/1984');
INSERT INTO Catches (id, fishermanId, date) VALUES (27, 47, '5/11/2000');
INSERT INTO Catches (id, fishermanId, date) VALUES (28, 62, '5/6/2001');
INSERT INTO Catches (id, fishermanId, date) VALUES (29, 52, '12/10/2013');
INSERT INTO Catches (id, fishermanId, date) VALUES (30, 98, '5/5/1992');
INSERT INTO Catches (id, fishermanId, date) VALUES (31, 35, '5/30/1995');
INSERT INTO Catches (id, fishermanId, date) VALUES (32, 60, '5/26/2006');
INSERT INTO Catches (id, fishermanId, date) VALUES (33, 8, '4/8/2014');
INSERT INTO Catches (id, fishermanId, date) VALUES (34, 43, '11/21/1992');
INSERT INTO Catches (id, fishermanId, date) VALUES (35, 66, '10/11/1998');
INSERT INTO Catches (id, fishermanId, date) VALUES (36, 51, '9/29/2007');
INSERT INTO Catches (id, fishermanId, date) VALUES (37, 9, '12/30/2004');
INSERT INTO Catches (id, fishermanId, date) VALUES (38, 13, '2/27/2014');
INSERT INTO Catches (id, fishermanId, date) VALUES (39, 41, '8/31/2013');
INSERT INTO Catches (id, fishermanId, date) VALUES (40, 13, '7/10/1999');
INSERT INTO Catches (id, fishermanId, date) VALUES (41, 99, '12/1/2010');
INSERT INTO Catches (id, fishermanId, date) VALUES (42, 34, '12/8/1984');
INSERT INTO Catches (id, fishermanId, date) VALUES (43, 43, '3/1/2021');
INSERT INTO Catches (id, fishermanId, date) VALUES (44, 54, '6/18/2022');
INSERT INTO Catches (id, fishermanId, date) VALUES (45, 50, '8/7/2015');
INSERT INTO Catches (id, fishermanId, date) VALUES (46, 7, '11/26/1982');
INSERT INTO Catches (id, fishermanId, date) VALUES (47, 6, '10/11/1989');
INSERT INTO Catches (id, fishermanId, date) VALUES (48, 90, '3/7/1997');
INSERT INTO Catches (id, fishermanId, date) VALUES (49, 2, '5/12/2013');
INSERT INTO Catches (id, fishermanId, date) VALUES (50, 44, '8/15/2022');
INSERT INTO Catches (id, fishermanId, date) VALUES (51, 96, '6/23/1981');
INSERT INTO Catches (id, fishermanId, date) VALUES (52, 11, '7/29/1999');
INSERT INTO Catches (id, fishermanId, date) VALUES (53, 56, '4/25/1996');
INSERT INTO Catches (id, fishermanId, date) VALUES (54, 46, '1/30/1985');
INSERT INTO Catches (id, fishermanId, date) VALUES (55, 74, '7/24/2001');
INSERT INTO Catches (id, fishermanId, date) VALUES (56, 74, '4/26/1989');
INSERT INTO Catches (id, fishermanId, date) VALUES (57, 55, '9/30/2021');
INSERT INTO Catches (id, fishermanId, date) VALUES (58, 10, '1/8/2009');
INSERT INTO Catches (id, fishermanId, date) VALUES (59, 38, '11/15/1991');
INSERT INTO Catches (id, fishermanId, date) VALUES (60, 40, '1/23/1992');
INSERT INTO Catches (id, fishermanId, date) VALUES (61, 19, '3/20/2015');
INSERT INTO Catches (id, fishermanId, date) VALUES (62, 42, '10/2/1987');
INSERT INTO Catches (id, fishermanId, date) VALUES (63, 17, '7/12/2005');
INSERT INTO Catches (id, fishermanId, date) VALUES (64, 2, '5/2/1989');
INSERT INTO Catches (id, fishermanId, date) VALUES (65, 61, '2/15/2004');
INSERT INTO Catches (id, fishermanId, date) VALUES (66, 95, '9/27/2024');
INSERT INTO Catches (id, fishermanId, date) VALUES (67, 57, '9/2/2004');
INSERT INTO Catches (id, fishermanId, date) VALUES (68, 53, '12/19/2019');
INSERT INTO Catches (id, fishermanId, date) VALUES (69, 82, '9/28/2000');
INSERT INTO Catches (id, fishermanId, date) VALUES (70, 100, '6/20/2022');
INSERT INTO Catches (id, fishermanId, date) VALUES (71, 72, '8/28/1984');
INSERT INTO Catches (id, fishermanId, date) VALUES (72, 34, '10/25/2000');
INSERT INTO Catches (id, fishermanId, date) VALUES (73, 55, '11/16/1987');
INSERT INTO Catches (id, fishermanId, date) VALUES (74, 75, '10/29/1996');
INSERT INTO Catches (id, fishermanId, date) VALUES (75, 70, '12/4/2016');
INSERT INTO Catches (id, fishermanId, date) VALUES (76, 25, '4/21/1986');
INSERT INTO Catches (id, fishermanId, date) VALUES (77, 95, '8/27/2003');
INSERT INTO Catches (id, fishermanId, date) VALUES (78, 61, '2/22/1994');
INSERT INTO Catches (id, fishermanId, date) VALUES (79, 5, '2/14/2012');
INSERT INTO Catches (id, fishermanId, date) VALUES (80, 10, '7/16/2009');
INSERT INTO Catches (id, fishermanId, date) VALUES (81, 20, '10/21/2003');
INSERT INTO Catches (id, fishermanId, date) VALUES (82, 1, '5/14/1990');
INSERT INTO Catches (id, fishermanId, date) VALUES (83, 20, '1/26/2021');
INSERT INTO Catches (id, fishermanId, date) VALUES (84, 5, '5/29/1984');
INSERT INTO Catches (id, fishermanId, date) VALUES (85, 23, '4/5/1988');
INSERT INTO Catches (id, fishermanId, date) VALUES (86, 17, '3/27/2010');
INSERT INTO Catches (id, fishermanId, date) VALUES (87, 39, '5/16/2006');
INSERT INTO Catches (id, fishermanId, date) VALUES (88, 30, '4/8/1999');
INSERT INTO Catches (id, fishermanId, date) VALUES (89, 93, '4/4/2015');
INSERT INTO Catches (id, fishermanId, date) VALUES (90, 9, '12/14/2003');
INSERT INTO Catches (id, fishermanId, date) VALUES (91, 18, '10/4/2003');
INSERT INTO Catches (id, fishermanId, date) VALUES (92, 49, '4/15/1987');
INSERT INTO Catches (id, fishermanId, date) VALUES (93, 27, '8/13/2019');
INSERT INTO Catches (id, fishermanId, date) VALUES (94, 30, '1/20/1999');
INSERT INTO Catches (id, fishermanId, date) VALUES (95, 91, '10/14/1994');
INSERT INTO Catches (id, fishermanId, date) VALUES (96, 8, '5/18/2013');
INSERT INTO Catches (id, fishermanId, date) VALUES (97, 71, '6/25/2007');
INSERT INTO Catches (id, fishermanId, date) VALUES (98, 82, '4/5/2005');
INSERT INTO Catches (id, fishermanId, date) VALUES (99, 98, '4/15/1991');
INSERT INTO Catches (id, fishermanId, date) VALUES (100, 18, '8/13/1985');
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (1, '8/28/2012', 1, 97);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (2, '8/31/2020', 0, 29);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (3, '10/20/1988', 0, 52);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (4, '9/17/1984', 0, 34);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (5, '7/13/1993', 0, 17);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (6, '7/31/1992', 1, 45);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (7, '9/15/2019', 0, 32);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (8, '5/11/1987', 1, 71);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (9, '4/10/1997', 1, 26);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (10, '12/31/2022', 0, 20);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (11, '11/30/2010', 1, 10);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (12, '9/19/1997', 1, 3);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (13, '3/9/2020', 0, 99);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (14, '8/1/1992', 0, 87);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (15, '9/22/2006', 1, 3);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (16, '8/4/2021', 1, 57);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (17, '8/8/2010', 0, 78);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (18, '4/11/2008', 0, 84);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (19, '7/30/2002', 1, 28);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (20, '9/2/2007', 0, 3);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (21, '7/25/2002', 1, 49);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (22, '12/12/2019', 1, 64);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (23, '12/21/2005', 1, 38);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (24, '1/31/1999', 0, 42);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (25, '11/6/2003', 1, 26);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (26, '11/30/1998', 0, 36);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (27, '11/27/1998', 0, 64);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (28, '2/24/2008', 0, 80);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (29, '10/28/1983', 0, 73);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (30, '1/5/2002', 0, 38);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (31, '3/16/1991', 0, 11);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (32, '9/8/2023', 0, 90);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (33, '4/18/2021', 1, 1);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (34, '5/8/2005', 1, 1);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (35, '3/10/2022', 0, 45);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (36, '11/19/2021', 0, 64);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (37, '12/1/1984', 0, 32);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (38, '9/2/1984', 1, 14);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (39, '5/6/2002', 0, 23);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (40, '6/26/2023', 1, 59);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (41, '6/22/2006', 1, 83);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (42, '6/8/1997', 1, 16);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (43, '7/30/2003', 1, 57);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (44, '9/5/2012', 0, 62);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (45, '5/12/1997', 0, 93);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (46, '9/1/2022', 0, 63);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (47, '12/23/2022', 0, 29);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (48, '3/28/1990', 0, 91);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (49, '7/20/2018', 0, 67);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (50, '7/30/2006', 1, 67);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (51, '8/26/1995', 0, 31);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (52, '10/5/2002', 0, 6);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (53, '8/10/1995', 0, 9);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (54, '10/5/1995', 1, 23);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (55, '8/8/2007', 0, 28);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (56, '7/29/2009', 0, 7);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (57, '6/21/1983', 1, 49);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (58, '8/28/1987', 0, 1);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (59, '10/20/2009', 1, 56);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (60, '1/18/1997', 0, 88);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (61, '11/29/2024', 0, 21);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (62, '8/26/2001', 0, 2);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (63, '8/17/2016', 1, 62);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (64, '2/20/1992', 0, 97);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (65, '3/21/1998', 1, 61);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (66, '1/18/1982', 1, 48);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (67, '6/28/2013', 1, 91);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (68, '7/31/2003', 1, 79);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (69, '1/19/1994', 1, 55);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (70, '6/16/1986', 1, 56);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (71, '10/24/1983', 1, 56);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (72, '10/11/2016', 0, 22);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (73, '1/28/2003', 0, 3);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (74, '6/24/1995', 0, 72);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (75, '9/8/2021', 0, 44);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (76, '12/30/1993', 1, 79);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (77, '4/26/1984', 0, 79);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (78, '2/3/2007', 0, 12);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (79, '11/18/2018', 0, 6);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (80, '11/16/2007', 1, 71);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (81, '5/22/2007', 0, 47);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (82, '1/21/1997', 0, 73);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (83, '9/30/1983', 1, 19);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (84, '3/12/1996', 0, 74);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (85, '11/13/1994', 1, 24);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (86, '6/13/2015', 1, 20);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (87, '9/20/1980', 1, 25);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (88, '2/15/2024', 0, 100);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (89, '5/24/1996', 1, 4);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (90, '3/6/2014', 1, 42);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (91, '7/15/2013', 1, 57);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (92, '7/15/1992', 1, 23);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (93, '10/13/1987', 0, 48);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (94, '10/28/1995', 1, 87);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (95, '9/25/2008', 0, 49);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (96, '6/16/2005', 0, 99);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (97, '9/28/2001', 0, 47);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (98, '12/18/2012', 0, 63);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (99, '5/10/2001', 1, 56);
INSERT INTO Orders (id, dateToDeliver, wasDelivered, customerId) VALUES (100, '5/30/1995', 0, 80);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (78, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (77, 32);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (29, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (12, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (83, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (99, 6);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (80, 13);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (33, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (83, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (20, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (40, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (68, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (22, 42);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (66, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (67, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 29);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (95, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (8, 7);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (74, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (16, 13);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (61, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (11, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (85, 13);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (95, 7);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (54, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (57, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (8, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (6, 38);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (82, 6);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (94, 40);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (87, 7);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (96, 14);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (35, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (44, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (25, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (81, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (9, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (43, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (99, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (96, 8);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (88, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (7, 32);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (38, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (89, 40);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (16, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (56, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (72, 32);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (44, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (87, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (68, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (54, 23);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (71, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (15, 6);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (10, 33);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (8, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (46, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (3, 42);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (46, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (28, 38);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (13, 17);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (39, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 7);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (88, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (86, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (9, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (87, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 13);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (83, 8);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (100, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (31, 38);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (96, 8);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (79, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (92, 3);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (10, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (68, 17);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (34, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (12, 13);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (10, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (95, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (77, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (3, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (63, 29);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (35, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (75, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (83, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (56, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (8, 38);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (92, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (45, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (63, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (38, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (100, 32);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (75, 14);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (16, 32);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (91, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (94, 23);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (44, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (3, 17);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (91, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (81, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (7, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (40, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (91, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (25, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (25, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (85, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (29, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (81, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (17, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (93, 17);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (16, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (8, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (9, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (71, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (23, 23);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (1, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (71, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (79, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (32, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (61, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (76, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (48, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (28, 17);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (25, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (76, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (63, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (97, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (93, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (56, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (65, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (36, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (49, 8);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (27, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (38, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (10, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (26, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (72, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (2, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (15, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (48, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (58, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (45, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (61, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (59, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (2, 42);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (60, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (37, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (82, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (39, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (30, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (31, 40);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (75, 42);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (35, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 29);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (23, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (78, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (2, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (43, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (80, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (42, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (87, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (43, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (67, 33);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (32, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (2, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (79, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (17, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (82, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (67, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (53, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (97, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (41, 8);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (77, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (36, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (88, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (7, 42);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (87, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (79, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (7, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (63, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (19, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (3, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (92, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 38);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (41, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (95, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (75, 14);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (20, 9);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (82, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (30, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (12, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (56, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (2, 32);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (44, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (28, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (99, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (17, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (78, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (92, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (95, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (34, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (58, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (53, 9);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (1, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 9);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (38, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (38, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (7, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (10, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (91, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (58, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (25, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (11, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (12, 17);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (88, 38);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (10, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (11, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (50, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (78, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (2, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (52, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (4, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (10, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (37, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (79, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (6, 3);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (3, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (75, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (94, 14);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (93, 23);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (26, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 3);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (75, 9);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (60, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 40);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (27, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (92, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (9, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (56, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (61, 6);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (69, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (42, 29);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 38);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (61, 8);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (53, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (83, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (83, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (96, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (81, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (95, 32);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (80, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (84, 8);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (43, 38);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (27, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (77, 7);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (35, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (58, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (71, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (45, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (88, 29);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (34, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (4, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (66, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (92, 14);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (39, 6);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 38);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 9);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (80, 3);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (53, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (58, 3);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (71, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (22, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (90, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (8, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (84, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (6, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (1, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (45, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (10, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (30, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (33, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (83, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (25, 40);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (49, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (56, 6);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (20, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (50, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (26, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 8);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (90, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (69, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (29, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (39, 42);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 23);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (76, 9);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (46, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (13, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (45, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (85, 3);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (36, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 23);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (86, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (35, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (58, 33);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 17);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (63, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (70, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (39, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (88, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (11, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (28, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (82, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (32, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (14, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (87, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (85, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (31, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (36, 33);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (8, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (12, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (79, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (14, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (23, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (46, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (31, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (78, 32);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (42, 29);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (11, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (14, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (45, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (1, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (15, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (18, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (71, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (5, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (46, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (49, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (100, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (91, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (53, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (38, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (96, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (16, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (54, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (30, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (20, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (66, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (78, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (74, 13);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (63, 33);

INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (38, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (100, 32);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (75, 14);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (16, 32);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (91, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (94, 23);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (44, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (3, 17);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (91, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (81, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (7, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (40, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (91, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (25, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (25, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (85, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (29, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (81, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (17, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (93, 17);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (16, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (8, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (9, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (71, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (23, 23);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (1, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (71, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (79, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (32, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (61, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (76, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (48, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (28, 17);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (25, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (76, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (63, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (97, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (93, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (56, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (65, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (36, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (49, 8);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (27, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (38, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (10, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (26, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (72, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (2, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (15, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (48, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (58, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (45, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (61, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (59, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (2, 42);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (60, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (37, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (82, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (39, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (30, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (31, 40);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (75, 42);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (35, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 29);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (23, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (78, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (2, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (43, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (80, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (42, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (87, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (43, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (67, 33);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (32, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (2, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (79, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (17, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (82, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (67, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (53, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (97, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (41, 8);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (77, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (36, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (88, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (7, 42);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (87, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (79, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (7, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (63, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (19, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (3, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (92, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 38);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (41, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (95, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (75, 14);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (20, 9);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (82, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (30, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (12, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (56, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (2, 32);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (44, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (28, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (99, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (17, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (78, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (92, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (95, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (34, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (58, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (53, 9);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (1, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 9);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (38, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (38, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (7, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (10, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (91, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (58, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (25, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (11, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (12, 17);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (88, 38);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (10, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (11, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (50, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (78, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (2, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (52, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (4, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (10, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (37, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (79, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (6, 3);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (3, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (75, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (94, 14);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (93, 23);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (26, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 3);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (75, 9);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (60, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 40);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (27, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (92, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (9, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (56, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (61, 6);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (69, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (42, 29);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 38);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (61, 8);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (53, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (83, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (83, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (96, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (81, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (95, 32);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (80, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (84, 8);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (43, 38);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (27, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (77, 7);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (35, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (58, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (71, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (45, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (88, 29);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (34, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (4, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (66, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (92, 14);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (39, 6);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 38);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 9);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (80, 3);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (53, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (58, 3);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (71, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (22, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (90, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (8, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (84, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (6, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (1, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (45, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (10, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (30, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (33, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (83, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (25, 40);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (49, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (56, 6);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (20, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (50, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (26, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 8);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (90, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (69, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (29, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (39, 42);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 23);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (76, 9);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (46, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (13, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (45, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (85, 3);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (36, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 23);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (86, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (35, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (58, 33);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 17);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (63, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (70, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (39, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (88, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (11, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (28, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (82, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (32, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (14, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (87, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (85, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (31, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (36, 33);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (8, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (12, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (79, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (14, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (23, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (46, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (31, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (78, 32);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (42, 29);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (11, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (14, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (45, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (1, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (15, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (18, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (71, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (5, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (46, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (49, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (100, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (91, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (53, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (38, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (96, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (16, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (54, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (30, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (20, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (66, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (78, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (74, 13);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (63, 33);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (38, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (100, 32);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (75, 14);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (16, 32);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (91, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (94, 23);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (44, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (3, 17);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (91, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (81, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (7, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (40, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (91, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (25, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (25, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (85, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (29, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (81, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (17, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (93, 17);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (16, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (8, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (9, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (71, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (23, 23);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (1, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (71, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (79, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (32, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (61, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (76, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (48, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (28, 17);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (25, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (76, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (63, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (97, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (93, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (56, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (65, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (36, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (49, 8);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (27, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (38, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (10, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (26, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (72, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (2, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (15, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (48, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (58, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (45, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (61, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (59, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (2, 42);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (60, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (37, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (82, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (39, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (30, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (31, 40);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (75, 42);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (35, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 29);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (23, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (78, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (2, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (43, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (80, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (42, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (87, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (43, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (67, 33);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (32, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (2, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (79, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (17, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (82, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (67, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (53, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (97, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (41, 8);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (77, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (36, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (88, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (7, 42);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (87, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (79, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (7, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (63, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (19, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (3, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (92, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 38);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (41, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (95, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (75, 14);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (20, 9);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (82, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (30, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (12, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (56, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (2, 32);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (44, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (28, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (99, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (17, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (78, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (92, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (95, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (34, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (58, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (53, 9);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (1, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 9);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (38, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (38, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (7, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (10, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (91, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (58, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (25, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (11, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (12, 17);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (88, 38);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (10, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (11, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (50, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (78, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (2, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (52, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (4, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (10, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (37, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (79, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (6, 3);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (3, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (75, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (94, 14);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (93, 23);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (26, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 3);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (75, 9);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (60, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 40);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (27, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (92, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (9, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (56, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (61, 6);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (69, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (42, 29);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 38);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (61, 8);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (53, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (83, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (83, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (96, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (81, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (95, 32);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (80, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (84, 8);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (43, 38);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (27, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (77, 7);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (35, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (58, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (71, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (45, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (88, 29);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (34, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (4, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (66, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (92, 14);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (39, 6);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 38);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 9);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (80, 3);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (53, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (58, 3);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (71, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (22, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (90, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (8, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (84, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (6, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (1, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (45, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (10, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (30, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (33, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (83, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (25, 40);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (49, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (56, 6);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (20, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (50, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (26, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 8);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (90, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (69, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (29, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (39, 42);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 23);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (76, 9);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (46, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (13, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (45, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (85, 3);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (36, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 23);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (86, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (35, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (58, 33);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 17);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (63, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (70, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (39, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (88, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (11, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (28, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (82, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (32, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (14, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (87, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (85, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (31, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (36, 33);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (8, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (12, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (79, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (14, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (23, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (46, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (31, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (78, 32);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (42, 29);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (11, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (14, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (45, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (1, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (15, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (18, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (71, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (5, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (46, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (49, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (100, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (91, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (53, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (38, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (96, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (16, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (54, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (30, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (20, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (66, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (78, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (74, 13);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (63, 33);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (38, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (100, 32);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (75, 14);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (16, 32);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (91, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (94, 23);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (44, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (3, 17);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (91, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (81, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (7, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (40, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (91, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (25, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (25, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (85, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (29, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (81, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (17, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (93, 17);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (16, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (8, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (9, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (71, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (23, 23);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (1, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (71, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (79, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (32, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (61, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (76, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (48, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (28, 17);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (25, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (76, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (63, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (97, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (93, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (56, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (65, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (36, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (49, 8);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (27, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (38, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (10, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (26, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (72, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (2, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (15, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (48, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (58, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (45, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (61, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (59, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (2, 42);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (60, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (37, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (82, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (39, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (30, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (31, 40);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (75, 42);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (35, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 29);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (23, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (78, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (2, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (43, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (80, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (42, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (87, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (43, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (67, 33);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (32, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (2, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (79, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (17, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (82, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (67, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (53, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (97, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (41, 8);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (77, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (36, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (88, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (7, 42);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (87, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (79, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (7, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (63, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (19, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (3, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (92, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 38);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (41, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (95, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (75, 14);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (20, 9);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (82, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (30, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (12, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (56, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (2, 32);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (44, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (28, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (99, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (17, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (78, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (92, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (95, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (34, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (58, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (53, 9);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (1, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 9);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (38, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (38, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (7, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (10, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (91, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (58, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (25, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (11, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (12, 17);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (88, 38);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (10, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (11, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (50, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (78, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (2, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (52, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (4, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (10, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (37, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (79, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (6, 3);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (3, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (75, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (94, 14);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (93, 23);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (26, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 3);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (75, 9);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (60, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 40);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (27, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (92, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (9, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (56, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (61, 6);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (69, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (42, 29);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 38);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (61, 8);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (53, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (83, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (83, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (96, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (81, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (95, 32);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (80, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (84, 8);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (43, 38);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (27, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (77, 7);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (35, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (58, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (71, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (45, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (88, 29);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (34, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (4, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (66, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (92, 14);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (39, 6);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 38);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 9);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (80, 3);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (53, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (58, 3);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (71, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (22, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (90, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (8, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (84, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (6, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (1, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (45, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (10, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (30, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (33, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (83, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (25, 40);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (49, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (56, 6);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (20, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (50, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (26, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 8);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (90, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (69, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (29, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (39, 42);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 23);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (76, 9);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (46, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (13, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (45, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (85, 3);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (36, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 23);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (86, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (35, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (58, 33);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 17);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (63, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (70, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (39, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (88, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (11, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (28, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (82, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (32, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (14, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (87, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (85, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (31, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (36, 33);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (8, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (12, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (79, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (14, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (23, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (46, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (31, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (78, 32);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (42, 29);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (11, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (14, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (45, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (1, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (15, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (18, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (71, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (5, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (46, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (49, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (100, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (91, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (53, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (38, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (96, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (16, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (54, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (30, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (20, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (66, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (78, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (74, 13);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (63, 33);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (38, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (100, 32);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (75, 14);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (16, 32);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (91, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (94, 23);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (44, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (3, 17);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (91, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (81, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (7, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (40, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (91, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (25, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (25, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (85, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (29, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (81, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (17, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (93, 17);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (16, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (8, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (9, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (71, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (23, 23);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (1, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (71, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (79, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (32, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (61, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (76, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (48, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (28, 17);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (25, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (76, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (63, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (97, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (93, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (56, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (65, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (36, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (49, 8);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (27, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (38, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (10, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (26, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (72, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (2, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (15, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (48, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (58, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (45, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (61, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (59, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (2, 42);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (60, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (37, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (82, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (39, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (30, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (31, 40);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (75, 42);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (35, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 29);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (23, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (78, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (2, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (43, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (80, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (42, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (87, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (43, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (67, 33);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (32, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (2, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (79, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (17, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (82, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (67, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (53, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (97, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (41, 8);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (77, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (36, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (88, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (7, 42);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (87, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (79, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (7, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (63, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (19, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (3, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (92, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 38);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (41, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (95, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (75, 14);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (20, 9);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (82, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (30, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (12, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (56, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (2, 32);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (44, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (28, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (99, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (17, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (78, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (92, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (95, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (34, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (58, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (53, 9);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (1, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 9);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (38, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (38, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (7, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (10, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (91, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (58, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (25, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (11, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (12, 17);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (88, 38);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (10, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (11, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (50, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (78, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (2, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (52, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (4, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (10, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (37, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (79, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (6, 3);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (3, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (75, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (94, 14);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (93, 23);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (26, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 3);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (75, 9);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (60, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 40);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (27, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (92, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (9, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (56, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (61, 6);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (69, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (42, 29);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 38);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (61, 8);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (53, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (83, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (83, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (96, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (81, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (95, 32);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (80, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (84, 8);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (43, 38);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (27, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (77, 7);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (35, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (58, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (71, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (55, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (45, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (88, 29);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (34, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (4, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (66, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (92, 14);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (39, 6);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 38);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 9);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (80, 3);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (53, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (58, 3);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (71, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (22, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (90, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (8, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (84, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (6, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (1, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (45, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (10, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (30, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (33, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (83, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (25, 40);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (49, 2);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (56, 6);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (20, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (50, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (26, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 8);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (90, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (69, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (29, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (39, 42);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 23);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (76, 9);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (46, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (13, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (45, 12);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (85, 3);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (36, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (51, 23);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (86, 27);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (35, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (58, 33);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 17);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (63, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (70, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (39, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (88, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (11, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (28, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (82, 11);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (32, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (14, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 24);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (87, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (85, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (73, 4);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (31, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (36, 33);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (8, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (12, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (79, 18);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (14, 5);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (23, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (46, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (31, 16);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (78, 32);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (42, 29);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (11, 22);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (14, 36);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (45, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (1, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (15, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (18, 41);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (71, 37);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (5, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (24, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (46, 10);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (49, 20);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (100, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (91, 15);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (53, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 30);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (38, 34);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (96, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (16, 1);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (54, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (64, 25);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (30, 39);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (20, 31);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (98, 19);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (66, 21);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (78, 28);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (21, 35);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (62, 26);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (74, 13);
INSERT INTO Habitats
    (waterBodyId, speciesId)
VALUES
    (63, 33);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (1, -72.77228, 7.539403, 15);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (2, 114.1142079, -8.4456045, 20);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (3, 112.0118669, -8.0475926, 47);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (4, 30.734995, 28.4233602, 79);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (5, 33.4406638, 69.1979686, 27);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (6, 113.140004, 40.255866, 89);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (7, 115.067761, 26.520513, 84);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (8, 124.3032719, -9.7085741, 79);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (9, 113.1981987, -8.1545561, 38);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (10, -85.6480724, 42.9267976, 36);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (11, -76.2294444, -12.1613589, 22);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (12, 114.021538, 33.387684, 45);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (13, 4.6419648, 52.3811357, 12);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (14, 43.6312634, 43.9576632, 94);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (15, 37.5643911, 55.847796, 2);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (16, 106.6281901, 10.7900517, 24);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (17, -3.2575562, 54.9872681, 90);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (18, 111.997187, 29.316819, 52);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (19, 114.9749001, 27.1840722, 26);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (20, 13.6263627, 45.8899146, 82);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (21, 123.3026369, 9.3140186, 61);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (22, 118.017938, 36.806669, 72);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (23, 83.142888, 49.4753404, 57);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (24, -68.1434996, 47.02018, 28);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (25, 44.1783042, 40.03553, 46);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (26, 95.9145568, 4.4715955, 96);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (27, 3.5751746, 47.794456, 41);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (28, 99.9129845, 13.3601931, 3);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (29, -121.4970294, 38.5603056, 96);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (30, -72.831906, 5.768717, 38);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (31, 50.0969652, 40.5152444, 44);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (32, -51.3429885, -18.7643566, 83);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (33, 107.7251314, -6.6183695, 28);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (34, 22.0126949, 41.4410475, 72);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (35, 116.951541, 24.646975, 36);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (36, 68.4494842, 28.4499078, 1);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (37, 48.0736, 35.4399, 49);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (38, 20.9089378, 38.6218706, 68);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (39, 31.7822278, 3.3783808, 69);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (40, 109.31826, 45.79817, 2);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (41, 15.5189476, 56.6226418, 48);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (42, 20.598197, 50.186053, 20);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (43, 101.948349, 14.5042512, 79);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (44, 116.321659, 24.057648, 2);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (45, -73.4499872, 46.0285851, 62);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (46, 108.8818859, -7.347756, 13);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (47, -7.3141388, 41.0640191, 8);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (48, 120.8868617, 14.955476, 79);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (49, 122.749282, 42.654146, 6);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (50, -86.2209316, 15.5211125, 73);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (51, 41.7631303, 52.6738562, 76);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (52, 72.9401509, 41.8760133, 7);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (53, 14.297845, 50.5624395, 11);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (54, 21.0119834, 45.2011955, 24);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (55, 28.187043, 53.5324492, 33);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (56, 110.2374621, 41.2867601, 31);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (57, 16.0427679, 50.3946667, 69);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (58, 121.0507098, -8.8196754, 35);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (59, 55.4247503, -20.8878921, 27);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (60, 104.198771, 35.338192, 3);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (61, 27.993441, 8.303998, 76);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (62, 113.791708, 26.948759, 82);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (63, 112.76965, 23.074045, 49);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (64, 35.38711, 32.23647, 8);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (65, 21.6199869, 51.5615169, 17);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (66, -35.2280343, -7.7427496, 35);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (67, -97.3354531, 32.6786908, 30);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (68, -25.5651478, 37.7621762, 76);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (69, 171.0279044, -44.284437, 95);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (70, 134.3028193, 34.5465928, 56);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (71, 114.8982871, -8.3837341, 2);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (72, -69.9520561, 9.4312231, 9);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (73, -89.217002, 13.9755122, 41);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (74, 112.171131, 29.411309, 33);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (75, 10.7533775, 53.903083, 79);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (76, 104.669996, 16.0445969, 34);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (77, 121.0286448, 14.6440549, 7);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (78, 111.910516, -8.2840556, 82);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (79, 27.8428651, -22.0028763, 43);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (80, 88.880492, 29.270311, 88);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (81, -97.1466695, 31.549333, 95);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (82, 10.1815316, 36.8064948, 21);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (83, 32.5498069, 29.9668343, 3);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (84, 27.6546469, 48.1665542, 38);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (85, 107.5357224, -6.6970726, 78);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (86, 5.2527741, 13.7946714, 61);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (87, -90.5279231, 14.602493, 63);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (88, 96.7065914, 3.9201154, 19);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (89, 29.1913918, -26.5157792, 65);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (90, 106.0164, -6.3376, 92);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (91, 115.1204095, -8.4704285, 22);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (92, 125.1797741, 44.439044, 61);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (93, 112.8915932, 30.5211502, 95);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (94, 119.3062749, 26.0952694, 22);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (95, 31.033333, -26.2333329, 65);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (96, 63.4567092, 40.1274545, 72);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (97, -57.5872528, -25.3823822, 93);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (98, 3.7636128, 49.2937975, 93);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (99, -46.8598812, -23.5000295, 22);
INSERT INTO Locations (id, x, y, waterBodyId) VALUES (100, 113.7870822, -8.4412858, 42);
GO
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (1, 78, 127856, '3:00:45', 26, 93, 386.442);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (2, 65, 859379, '17:44:13', 83, 30, 343.196);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (3, 36, 397462, '22:58:41', 19, 94, 117.528);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (4, 19, 179634, '0:14:09', 46, 5, 138.035);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (5, 46, 163891, '5:42:29', 88, 78, 380.285);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (6, 82, 919080, '3:36:37', 42, 76, 315.728);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (7, 76, 871002, '0:45:58', 29, 88, 274.053);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (8, 64, 811011, '16:13:28', 94, 62, 367.018);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (9, 89, 635725, '19:13:05', 42, 46, 65.827);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (10, 71, 763577, '19:28:34', 85, 34, 173.955);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (11, 68, 420701, '6:32:18', 27, 25, 264.265);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (12, 34, 265692, '17:14:16', 91, 1, 169.696);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (13, 100, 270682, '13:27:17', 42, 93, 26.587);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (14, 99, 646008, '13:17:26', 47, 65, 348.587);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (15, 11, 235774, '8:39:04', 32, 61, 185.745);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (16, 11, 298526, '21:16:01', 42, 33, 193.206);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (17, 91, 365954, '1:38:34', 88, 95, 227.335);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (18, 97, 524916, '19:26:18', 93, 33, 329.897);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (19, 92, 812349, '13:15:19', 4, 77, 266.245);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (20, 36, 9625, '8:41:22', 41, 75, 245.173);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (21, 18, 881944, '14:17:01', 23, 74, 176.379);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (22, 38, 694935, '5:38:46', 35, 42, 95.028);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (23, 64, 296853, '17:10:46', 2, 14, 381.298);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (24, 67, 324224, '19:40:02', 73, 22, 237.393);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (25, 61, 25287, '15:08:32', 34, 83, 257.028);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (26, 12, 984452, '8:33:41', 33, 53, 210.236);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (27, 5, 786645, '3:24:34', 66, 97, 347.901);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (28, 16, 350077, '1:32:57', 74, 48, 123.223);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (29, 71, 648983, '4:46:37', 46, 45, 124.236);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (30, 30, 152303, '23:26:21', 60, 76, 50.708);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (31, 50, 215291, '1:23:45', 29, 46, 302.067);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (32, 79, 216333, '19:06:49', 74, 83, 143.718);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (33, 39, 901801, '2:11:56', 82, 98, 332.055);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (34, 62, 422200, '12:35:41', 64, 53, 309.975);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (35, 96, 672628, '22:30:36', 18, 2, 131.516);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (36, 10, 363832, '12:18:24', 66, 43, 383.884);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (37, 89, 615508, '14:34:29', 30, 95, 65.263);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (38, 73, 734692, '19:15:01', 68, 60, 68.518);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (39, 14, 534209, '13:03:01', 97, 65, 155.502);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (40, 81, 790127, '4:16:36', 57, 62, 12.869);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (41, 11, 220942, '13:17:11', 90, 93, 341.067);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (42, 20, 367541, '7:13:55', 44, 53, 349.643);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (43, 83, 923351, '18:08:35', 53, 45, 28.726);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (44, 69, 164736, '2:38:11', 90, 43, 229.636);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (45, 67, 764297, '3:01:07', 47, 70, 218.475);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (46, 28, 601226, '4:08:13', 34, 8, 26.852);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (47, 12, 951151, '3:41:59', 44, 73, 38.425);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (48, 14, 413348, '18:26:58', 21, 100, 3.718);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (49, 21, 400897, '3:55:24', 3, 29, 368.009);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (50, 65, 463628, '23:40:31', 9, 4, 243.022);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (51, 81, 738604, '4:08:00', 31, 48, 379.945);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (52, 12, 453670, '15:06:16', 36, 22, 246.419);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (53, 33, 802066, '8:38:19', 99, 78, 388.088);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (54, 50, 256375, '6:52:25', 51, 49, 165.556);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (55, 56, 763470, '14:10:41', 98, 98, 211.564);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (56, 76, 338911, '8:58:37', 64, 56, 59.428);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (57, 12, 113783, '11:50:51', 83, 8, 271.424);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (58, 68, 489049, '7:45:18', 70, 86, 200.038);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (59, 8, 728730, '23:29:12', 23, 78, 107.697);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (60, 21, 70521, '13:52:51', 75, 11, 240.167);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (61, 13, 171552, '19:14:00', 8, 31, 231.242);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (62, 65, 740237, '2:34:51', 84, 85, 102.487);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (63, 74, 374332, '3:04:55', 46, 30, 317.526);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (64, 53, 54990, '14:16:05', 26, 13, 49.916);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (65, 17, 666024, '3:05:58', 54, 56, 212.656);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (66, 73, 989253, '15:29:01', 74, 23, 19.508);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (67, 18, 347765, '9:06:00', 50, 2, 90.641);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (68, 75, 679719, '0:42:19', 55, 88, 55.923);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (69, 1, 796376, '17:16:14', 86, 45, 1.147);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (70, 37, 377698, '18:41:07', 48, 15, 7.922);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (71, 51, 262013, '13:28:27', 21, 53, 87.872);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (72, 42, 418694, '13:17:47', 87, 24, 234.408);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (73, 88, 726880, '1:15:06', 82, 100, 246.259);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (74, 28, 61416, '4:19:27', 72, 83, 130.719);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (75, 6, 150014, '2:35:44', 2, 15, 351.802);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (76, 72, 383924, '4:23:50', 98, 8, 98.108);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (77, 57, 690706, '3:10:31', 21, 75, 13.858);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (78, 52, 666820, '3:58:29', 66, 98, 173.824);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (79, 63, 771009, '14:11:25', 2, 81, 171.028);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (80, 7, 994539, '23:48:00', 77, 86, 8.397);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (81, 70, 287598, '13:29:42', 57, 17, 37.427);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (82, 69, 984410, '7:20:26', 46, 97, 111.393);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (83, 89, 3137, '10:48:52', 97, 88, 15.618);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (84, 32, 612979, '12:22:08', 41, 41, 133.055);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (85, 71, 147756, '21:06:35', 26, 92, 202.089);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (86, 52, 880181, '5:01:01', 42, 35, 115.709);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (87, 53, 200621, '13:05:48', 94, 80, 189.533);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (88, 40, 453046, '11:08:38', 11, 59, 263.866);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (89, 85, 517655, '9:09:46', 72, 42, 100.498);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (90, 32, 232264, '12:59:55', 21, 13, 45.837);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (91, 51, 403772, '15:14:03', 82, 89, 356.659);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (92, 50, 549800, '8:46:44', 83, 7, 357.556);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (93, 27, 302475, '17:25:01', 98, 55, 7.584);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (94, 77, 203624, '22:54:13', 85, 36, 25.993);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (95, 87, 489884, '4:08:50', 37, 16, 177.263);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (96, 22, 905192, '8:35:16', 76, 25, 263.992);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (97, 74, 344464, '4:21:33', 65, 87, 230.747);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (98, 66, 138847, '4:12:17', 44, 19, 312.91);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (99, 44, 165656, '0:50:18', 24, 79, 223.148);
INSERT INTO FishCatch (id, fishId, quantity, time, locationId, catchId, weight) VALUES (100, 94, 246024, '15:18:26', 60, 87, 347.453);
GO
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (1, 14206, 872269.06, 93, 14, '$40794.70');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (2, 53175, 544789.54, 44, 63, '$8529.95');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (3, 11475, 260745.662, 87, 2, '$14584.55');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (4, 42005, 632066.536, 43, 75, '$52259.80');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (5, 47623, 255478.604, 91, 40, '$68893.71');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (6, 25311, 851828.518, 47, 33, '$81043.45');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (7, 67371, 838617.613, 28, 46, '$71613.08');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (8, 57961, 438691.913, 67, 17, '$30002.21');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (9, 94509, 139049.672, 18, 13, '$2939.42');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (10, 85963, 963311.397, 68, 34, '$77343.38');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (11, 19007, 597480.571, 67, 90, '$61843.02');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (12, 93321, 458609.665, 83, 97, '$36335.06');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (13, 22334, 348543.578, 76, 21, '$68098.68');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (14, 74803, 336016.454, 18, 16, '$21365.01');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (15, 51294, 510325.203, 68, 4, '$60600.26');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (16, 33211, 199938.355, 3, 50, '$17521.32');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (17, 42468, 997320.935, 17, 70, '$35744.85');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (18, 79466, 712121.214, 89, 38, '$96902.11');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (19, 78883, 428811.775, 11, 65, '$87483.35');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (20, 30061, 149801.495, 8, 79, '$15818.39');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (21, 7674, 380758.5, 1, 29, '$64831.33');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (22, 79463, 56024.59, 79, 82, '$69676.21');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (23, 53594, 82520.081, 7, 66, '$34712.17');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (24, 17848, 708382.797, 19, 75, '$62790.86');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (25, 40144, 306443.995, 35, 92, '$50921.23');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (26, 82244, 807162.913, 54, 75, '$29774.96');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (27, 15066, 72818.096, 99, 88, '$5374.94');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (28, 69874, 553418.965, 25, 47, '$45549.47');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (29, 41904, 541831.991, 82, 98, '$14870.68');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (30, 11435, 591967.855, 37, 96, '$50260.68');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (31, 29396, 842992.835, 60, 92, '$83179.81');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (32, 31381, 972757.429, 48, 47, '$13777.27');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (33, 14352, 959435.456, 3, 52, '$284.29');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (34, 41807, 684766.092, 73, 92, '$25998.86');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (35, 92046, 993603.647, 51, 79, '$52842.07');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (36, 70071, 737475.217, 63, 43, '$9227.09');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (37, 76309, 491067.577, 28, 75, '$50200.74');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (38, 52162, 169159.475, 83, 49, '$56729.86');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (39, 44307, 274542.461, 69, 32, '$28681.37');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (40, 19200, 802256.495, 44, 69, '$93931.58');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (41, 25227, 512823.268, 1, 75, '$38473.57');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (42, 12208, 391976.471, 13, 26, '$1218.33');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (43, 81674, 548254.532, 97, 30, '$3065.66');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (44, 15795, 691470.884, 7, 52, '$1165.75');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (45, 63381, 555303.418, 87, 51, '$96188.41');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (46, 41988, 992304.394, 35, 13, '$75237.49');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (47, 86013, 21400.967, 35, 16, '$35965.09');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (48, 19537, 110871.508, 44, 37, '$18557.31');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (49, 4774, 883174.668, 99, 74, '$73832.88');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (50, 73954, 312179.393, 100, 89, '$3198.06');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (51, 12695, 917548.644, 37, 8, '$6825.64');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (52, 40683, 419972.216, 80, 7, '$70946.42');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (53, 95829, 12321.634, 46, 32, '$74602.58');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (54, 70539, 432006.1, 44, 93, '$22157.54');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (55, 7968, 630914.925, 74, 78, '$26313.60');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (56, 66855, 114346.002, 17, 83, '$17781.78');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (57, 31504, 315953.728, 28, 99, '$43808.15');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (58, 62979, 744509.615, 1, 76, '$11971.00');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (59, 57306, 955862.158, 21, 19, '$35478.67');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (60, 58505, 938857.133, 36, 69, '$72070.73');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (61, 70210, 661304.082, 66, 13, '$79450.85');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (62, 27902, 172674.546, 64, 92, '$22815.94');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (63, 10147, 817483.641, 30, 64, '$34433.64');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (64, 74984, 634583.2, 51, 40, '$44491.81');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (65, 14829, 261810.065, 8, 40, '$57658.46');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (66, 6148, 199289.886, 50, 38, '$38419.94');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (67, 4116, 524850.965, 23, 1, '$39263.62');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (68, 25496, 481945.421, 23, 13, '$39005.76');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (69, 11350, 11827.346, 92, 27, '$29690.26');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (70, 31325, 798038.579, 54, 4, '$83055.75');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (71, 1808, 939203.371, 46, 82, '$37555.90');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (72, 70835, 62985.756, 57, 16, '$43143.79');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (73, 10853, 512255.172, 31, 34, '$42272.39');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (74, 88524, 305530.285, 60, 65, '$78176.53');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (75, 15868, 165242.022, 11, 73, '$16848.57');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (76, 83996, 512101.218, 61, 94, '$35055.40');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (77, 30007, 189839.211, 17, 84, '$15244.60');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (78, 59837, 579748.577, 47, 69, '$33703.78');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (79, 72318, 827177.936, 22, 52, '$43437.32');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (80, 93980, 699096.706, 86, 32, '$36992.62');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (81, 49908, 674074.845, 67, 30, '$37395.27');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (82, 33841, 439839.695, 83, 48, '$74593.59');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (83, 94558, 872528.489, 12, 61, '$4100.33');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (84, 97347, 151700.644, 99, 9, '$51061.12');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (85, 68490, 57861.965, 55, 86, '$15844.91');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (86, 79189, 392772.004, 84, 90, '$76642.40');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (87, 90852, 412599.595, 40, 72, '$81513.63');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (88, 85333, 494729.019, 49, 48, '$54961.97');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (89, 90834, 695719.198, 14, 14, '$95700.46');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (90, 6926, 582187.305, 55, 26, '$69506.99');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (91, 7243, 983706.722, 54, 57, '$6970.95');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (92, 80828, 892976.54, 62, 79, '$20586.39');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (93, 3875, 353786.981, 86, 86, '$8394.44');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (94, 50073, 778075.23, 57, 73, '$95916.33');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (95, 87833, 997753.37, 22, 15, '$65772.56');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (96, 12970, 154079.19, 82, 69, '$55633.27');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (97, 61679, 773712.121, 7, 59, '$81975.53');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (98, 84891, 266960.171, 21, 20, '$2798.28');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (99, 56667, 266935.013, 95, 59, '$55603.14');
INSERT INTO FishOrder (id, quantity, weight, fishCatchId, orderId, price) VALUES (100, 35643, 696100.673, 15, 23, '$64190.44');
GO
