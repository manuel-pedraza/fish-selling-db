USE [master]
GO
/****** Object:  Database [FishSellingDB]    Script Date: 2/25/2025 9:02:59 PM ******/
CREATE DATABASE [FishSellingDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FishSellingDB', FILENAME = N'/var/opt/mssql/data/FishSellingDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FishSellingDB_log', FILENAME = N'/var/opt/mssql/data/FishSellingDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[Catches]    Script Date: 2/25/2025 9:02:59 PM ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 2/25/2025 9:02:59 PM ******/
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
	CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fish]    Script Date: 2/25/2025 9:02:59 PM ******/
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
/****** Object:  Table [dbo].[FishCatch]    Script Date: 2/25/2025 9:02:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FishCatch]
(
	[id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[weight] [decimal](18, 0) NULL,
	[timestamp] [date] NULL,
	[fishId] [int] NOT NULL,
	[locationId] [int] NOT NULL,
	[catchId] [int] NOT NULL,
	CONSTRAINT [PK_FishCatch] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fishermen]    Script Date: 2/25/2025 9:02:59 PM ******/
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
	CONSTRAINT [PK_Fishermen] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FishOrder]    Script Date: 2/25/2025 9:02:59 PM ******/
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
/****** Object:  Table [dbo].[Habitats]    Script Date: 2/25/2025 9:02:59 PM ******/
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
/****** Object:  Table [dbo].[Locations]    Script Date: 2/25/2025 9:02:59 PM ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 2/25/2025 9:02:59 PM ******/
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
/****** Object:  Table [dbo].[Species]    Script Date: 2/25/2025 9:02:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Species]
(
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	CONSTRAINT [PK_Species] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WaterBodies]    Script Date: 2/25/2025 9:02:59 PM ******/
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
/****** Object:  Table [dbo].[WaterBodyTypes]    Script Date: 2/25/2025 9:02:59 PM ******/
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
ALTER TABLE [dbo].[WaterBodies]  WITH CHECK ADD  CONSTRAINT [FK_WaterBodies_WaterBodiesTypes] FOREIGN KEY([typeId])
REFERENCES [dbo].[WaterBodyTypes] ([id])
GO
ALTER TABLE [dbo].[WaterBodies] CHECK CONSTRAINT [FK_WaterBodies_WaterBodiesTypes]
GO
USE [master]
GO
ALTER DATABASE [FishSellingDB] SET  READ_WRITE 
GO
USE [FishSellingDB]
GO
INSERT INTO [dbo].[Species] (id, [name]) VALUES (1,'Catfish')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (2,'Carp')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (3,'Trout')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (4,'Pike')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (5,'Perch')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (6,'Tilapia')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (7,'Sturgeon')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (8,'Guppy')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (9,'Tetra')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (10,'Tuna')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (11,'Mackerel')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (12,'Cod')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (13,'Snapper')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (14,'Grouper')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (15,'Halibut')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (16,'Flounder')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (17,'Marlin')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (18,'Swordfish')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (19,'Barracuda')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (20,'Great ')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (21,'Shark')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (22,'Tiger Shark')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (23,'Hammerhead')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (24,'Bull Shark')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (25,'Whale Shark')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (26,'Manta Ray')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (27,'Stingray')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (28,'Sawfish')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (29,'Clownfish')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (30,'Angelfish')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (31,'Parrotfish')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (32,'Butterflyfish')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (33,'Tang')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (34,'Wrasse')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (35,'Goby')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (36,'Mandarinfish')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (37,'Coelacanth')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (38,'Lungfish')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (39,'Paddlefish')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (40,'Archerfish')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (41,'Electric Eel')
INSERT INTO [dbo].[Species] (id, [name]) VALUES (42,'Arowana')
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (1, 'Bianka', 'Ackred', 23);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (2, 'Ralina', 'Edeler', 74);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (3, 'Tiphani', 'Clell', 33);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (4, 'Frankie', 'Lintill', 100);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (5, 'Bree', 'Chellam', 97);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (6, 'Dmitri', 'Blakden', 101);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (7, 'Stephani', 'Lattin', 99);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (8, 'Fianna', 'Cowern', 15);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (9, 'Guinna', 'Dicte', 89);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (10, 'Priscilla', 'Warcup', 38);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (11, 'Xena', 'Stickland', 55);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (12, 'Emmett', 'Turbat', 57);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (13, 'Inge', 'Sigward', 89);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (14, 'Brad', 'Akid', 20);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (15, 'Maureen', 'Pierson', 45);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (16, 'Tiffani', 'Prati', 85);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (17, 'Wade', 'Lum', 70);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (18, 'Sari', 'O''Donnelly', 24);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (19, 'Gilberte', 'Shallcrass', 34);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (20, 'Gale', 'Doerr', 16);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (21, 'Hadley', 'Beach', 64);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (22, 'Marcelle', 'Siderfin', 32);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (23, 'Orelie', 'Ibarra', 15);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (24, 'Lynde', 'Normanvill', 69);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (25, 'Ofelia', 'Pelham', 100);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (26, 'Leonidas', 'Darter', 57);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (27, 'Marielle', 'Neve', 97);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (28, 'Daria', 'Weaben', 42);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (29, 'Homer', 'McGerr', 20);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (30, 'Claire', 'Bold', 73);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (31, 'Zedekiah', 'Lippiett', 29);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (32, 'Karim', 'Hessay', 101);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (33, 'Gertrude', 'Krauze', 23);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (34, 'Lucas', 'Keays', 92);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (35, 'Emanuel', 'MacCaffery', 61);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (36, 'Waverly', 'Threlfall', 25);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (37, 'Greer', 'Glavias', 61);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (38, 'Allyn', 'Ridehalgh', 83);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (39, 'Dorthea', 'Bollen', 87);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (40, 'Clemens', 'Czajkowska', 102);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (41, 'Emilie', 'Lintott', 68);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (42, 'Gabriele', 'Wapple', 18);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (43, 'Toma', 'Jayes', 88);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (44, 'Albrecht', 'Organ', 59);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (45, 'Darci', 'Basile', 75);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (46, 'Danya', 'Sacker', 43);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (47, 'Nickola', 'Ghirardi', 56);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (48, 'Humfried', 'Grogor', 66);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (49, 'Lawrence', 'Warlow', 105);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (50, 'Renado', 'McGuire', 83);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (51, 'Berne', 'Cranton', 14);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (52, 'Inesita', 'Seyfart', 41);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (53, 'Shoshanna', 'Carty', 51);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (54, 'Sidonnie', 'Copins', 63);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (55, 'Lauree', 'Aldgate', 56);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (56, 'Paolo', 'Stanworth', 30);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (57, 'Seamus', 'Pierson', 17);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (58, 'Sharia', 'Sherwen', 21);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (59, 'Christoper', 'Morgan', 57);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (60, 'Land', 'Sweatman', 45);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (61, 'Rebekkah', 'Rushbury', 102);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (62, 'Kara', 'Loyndon', 91);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (63, 'Mordecai', 'Ferrarin', 66);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (64, 'Madel', 'McDermot', 21);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (65, 'Darren', 'Babin', 76);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (66, 'Bailey', 'Fripps', 66);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (67, 'Bendicty', 'Dellenty', 43);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (68, 'Ardelis', 'Salliss', 78);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (69, 'Phillipe', 'Van de Vlies', 83);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (70, 'Sloan', 'Knutsen', 88);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (71, 'Stavro', 'Roblett', 13);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (72, 'Cyrillus', 'Ransley', 29);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (73, 'Baudoin', 'Garbott', 21);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (74, 'Frank', 'Allingham', 43);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (75, 'Chryste', 'Keeri', 25);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (76, 'Seward', 'Hounsham', 83);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (77, 'Chrisy', 'Asey', 32);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (78, 'Lawry', 'Dudley', 63);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (79, 'Odell', 'Pedron', 64);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (80, 'Husain', 'Freebury', 64);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (81, 'Ambrosi', 'Echalier', 46);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (82, 'Merrel', 'Gorioli', 29);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (83, 'Ely', 'Trickett', 96);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (84, 'Nola', 'Akrigg', 102);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (85, 'Haslett', 'Mendenhall', 26);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (86, 'Tonye', 'Hairsnape', 17);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (87, 'Mitchel', 'Phillp', 44);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (88, 'Kit', 'Bennike', 39);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (89, 'Maryellen', 'Gavaran', 107);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (90, 'Des', 'Byrd', 34);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (91, 'Nissie', 'Trehearn', 55);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (92, 'Clevey', 'Morton', 76);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (93, 'Geri', 'Gerrets', 34);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (94, 'Tobe', 'Barnfather', 15);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (95, 'Rex', 'Ferrari', 75);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (96, 'Kellyann', 'Heakey', 91);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (97, 'Edgardo', 'Muslim', 48);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (98, 'Hill', 'Van Arsdalen', 92);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (99, 'Ashlee', 'Ryves', 47);
INSERT INTO [dbo].[Fishermen] (id, firstName, lastName, age) VALUES (100, 'Terrance', 'Greenroyd', 46);INSERT INTO [dbo].[WaterBodyTypes] ([id],[typeName],[size],[description]) VALUES (1, 'Ocean', 'Large', 'The largest body of saltwater, covering most of the Earth''s surface.')
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
INSERT INTO Customers (id, firstName, lastName, age) VALUES (1, 'Violette', 'Milstead', 14);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (2, 'Rea', 'Measey', 108);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (3, 'Minna', 'Fawson', 77);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (4, 'Haley', 'Pashen', 49);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (5, 'Brooke', 'Kebell', 109);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (6, 'Alidia', 'Gavaran', 66);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (7, 'Isabel', 'Abbes', 17);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (8, 'Silvie', 'Gillice', 20);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (9, 'Korry', 'Baldick', 25);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (10, 'Dulce', 'Bidmead', 76);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (11, 'Trefor', 'Shaxby', 98);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (12, 'Derick', 'Brockhouse', 108);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (13, 'Maurits', 'Southers', 54);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (14, 'Glenden', 'Nan Carrow', 87);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (15, 'Belia', 'Chicotti', 88);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (16, 'Toddy', 'Wogdon', 14);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (17, 'Kristel', 'Sabates', 28);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (18, 'Forbes', 'Legon', 76);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (19, 'Coreen', 'Gegg', 58);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (20, 'Anetta', 'Tesmond', 26);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (21, 'Nadiya', 'Whitley', 58);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (22, 'Merilee', 'Parvin', 104);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (23, 'Ida', 'Deare', 46);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (24, 'Helen-elizabeth', 'Willson', 77);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (25, 'Izabel', 'Toulson', 40);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (26, 'Aloise', 'Pioli', 84);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (27, 'Jemmy', 'Woolliams', 99);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (28, 'Novelia', 'Lytle', 74);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (29, 'Chrisy', 'McHugh', 92);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (30, 'Heath', 'Bleakman', 53);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (31, 'Marysa', 'Battisson', 32);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (32, 'Flin', 'Warriner', 31);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (33, 'Rancell', 'Guerreiro', 17);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (34, 'Martica', 'Shower', 28);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (35, 'Verne', 'Braywood', 56);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (36, 'Paulette', 'Taggett', 107);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (37, 'Pippa', 'Boam', 49);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (38, 'Norrie', 'Rizzello', 13);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (39, 'Bernardina', 'Rosenwasser', 37);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (40, 'Algernon', 'Edmons', 99);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (41, 'Tito', 'Crickett', 71);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (42, 'Charleen', 'Le Huquet', 99);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (43, 'Umberto', 'Pingstone', 97);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (44, 'Stephani', 'Arling', 81);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (45, 'Aldis', 'Bunt', 14);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (46, 'Nora', 'Gierke', 43);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (47, 'Leticia', 'Croxford', 89);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (48, 'Suzi', 'Stride', 47);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (49, 'Alphard', 'Geerits', 32);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (50, 'Ethelda', 'Warwicker', 91);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (51, 'Moyna', 'Weatherhogg', 45);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (52, 'Hugibert', 'Ahearne', 106);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (53, 'Alberik', 'Bestiman', 93);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (54, 'Tabbi', 'Berzins', 22);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (55, 'Bill', 'Studdeard', 108);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (56, 'Griswold', 'Taill', 48);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (57, 'Talyah', 'Gollin', 107);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (58, 'Trish', 'Moorerud', 44);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (59, 'Clemmy', 'Brewers', 47);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (60, 'Far', 'Dockerty', 76);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (61, 'Moyna', 'Schimon', 80);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (62, 'Gisele', 'Beynke', 92);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (63, 'Hadlee', 'Frostdyke', 18);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (64, 'Mersey', 'Schade', 79);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (65, 'Katheryn', 'Duesbury', 41);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (66, 'Anya', 'Talman', 81);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (67, 'Sullivan', 'Patrie', 92);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (68, 'Domenic', 'Margram', 89);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (69, 'Eugenio', 'Armal', 27);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (70, 'Ilse', 'Sinclar', 65);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (71, 'Danny', 'Dohrmann', 35);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (72, 'Delphinia', 'Scoon', 64);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (73, 'Hadley', 'Petworth', 29);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (74, 'Krystal', 'Thirkettle', 55);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (75, 'Harriet', 'Feavers', 70);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (76, 'Arnaldo', 'Gullick', 72);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (77, 'Sibylla', 'Polgreen', 58);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (78, 'Amos', 'Snepp', 103);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (79, 'Nedi', 'Whittall', 99);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (80, 'Matthew', 'Cornhill', 77);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (81, 'Garrot', 'Ratnege', 18);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (82, 'Gothart', 'Aldcorne', 18);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (83, 'Terrill', 'Coning', 81);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (84, 'Bertrando', 'Copozio', 26);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (85, 'Kennie', 'Stanistrete', 90);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (86, 'Arty', 'Tewkesberrie', 35);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (87, 'Foster', 'Penhale', 97);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (88, 'Jehu', 'MacSorley', 62);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (89, 'Christi', 'Cambell', 25);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (90, 'Yuma', 'Fairham', 92);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (91, 'Eolande', 'Stoffels', 46);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (92, 'Milton', 'Farmer', 93);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (93, 'Doe', 'Nassey', 64);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (94, 'Ronny', 'Luby', 88);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (95, 'Kelley', 'Frostdick', 30);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (96, 'Kent', 'Colisbe', 100);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (97, 'Ninnette', 'Rudolph', 105);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (98, 'Noni', 'Ubsdell', 88);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (99, 'Jeanna', 'Nagle', 103);
INSERT INTO Customers (id, firstName, lastName, age) VALUES (100, 'Aloin', 'Kings', 75);
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
GO
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
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (1, 78, 127856, '3:00:45', 26, 93, 386.442);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (2, 65, 859379, '17:44:13', 83, 30, 343.196);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (3, 36, 397462, '22:58:41', 19, 94, 117.528);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (4, 19, 179634, '0:14:09', 46, 5, 138.035);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (5, 46, 163891, '5:42:29', 88, 78, 380.285);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (6, 82, 919080, '3:36:37', 42, 76, 315.728);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (7, 76, 871002, '0:45:58', 29, 88, 274.053);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (8, 64, 811011, '16:13:28', 94, 62, 367.018);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (9, 89, 635725, '19:13:05', 42, 46, 65.827);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (10, 71, 763577, '19:28:34', 85, 34, 173.955);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (11, 68, 420701, '6:32:18', 27, 25, 264.265);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (12, 34, 265692, '17:14:16', 91, 1, 169.696);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (13, 100, 270682, '13:27:17', 42, 93, 26.587);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (14, 99, 646008, '13:17:26', 47, 65, 348.587);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (15, 11, 235774, '8:39:04', 32, 61, 185.745);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (16, 11, 298526, '21:16:01', 42, 33, 193.206);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (17, 91, 365954, '1:38:34', 88, 95, 227.335);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (18, 97, 524916, '19:26:18', 93, 33, 329.897);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (19, 92, 812349, '13:15:19', 4, 77, 266.245);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (20, 36, 9625, '8:41:22', 41, 75, 245.173);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (21, 18, 881944, '14:17:01', 23, 74, 176.379);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (22, 38, 694935, '5:38:46', 35, 42, 95.028);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (23, 64, 296853, '17:10:46', 2, 14, 381.298);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (24, 67, 324224, '19:40:02', 73, 22, 237.393);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (25, 61, 25287, '15:08:32', 34, 83, 257.028);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (26, 12, 984452, '8:33:41', 33, 53, 210.236);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (27, 5, 786645, '3:24:34', 66, 97, 347.901);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (28, 16, 350077, '1:32:57', 74, 48, 123.223);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (29, 71, 648983, '4:46:37', 46, 45, 124.236);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (30, 30, 152303, '23:26:21', 60, 76, 50.708);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (31, 50, 215291, '1:23:45', 29, 46, 302.067);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (32, 79, 216333, '19:06:49', 74, 83, 143.718);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (33, 39, 901801, '2:11:56', 82, 98, 332.055);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (34, 62, 422200, '12:35:41', 64, 53, 309.975);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (35, 96, 672628, '22:30:36', 18, 2, 131.516);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (36, 10, 363832, '12:18:24', 66, 43, 383.884);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (37, 89, 615508, '14:34:29', 30, 95, 65.263);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (38, 73, 734692, '19:15:01', 68, 60, 68.518);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (39, 14, 534209, '13:03:01', 97, 65, 155.502);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (40, 81, 790127, '4:16:36', 57, 62, 12.869);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (41, 11, 220942, '13:17:11', 90, 93, 341.067);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (42, 20, 367541, '7:13:55', 44, 53, 349.643);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (43, 83, 923351, '18:08:35', 53, 45, 28.726);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (44, 69, 164736, '2:38:11', 90, 43, 229.636);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (45, 67, 764297, '3:01:07', 47, 70, 218.475);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (46, 28, 601226, '4:08:13', 34, 8, 26.852);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (47, 12, 951151, '3:41:59', 44, 73, 38.425);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (48, 14, 413348, '18:26:58', 21, 100, 3.718);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (49, 21, 400897, '3:55:24', 3, 29, 368.009);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (50, 65, 463628, '23:40:31', 9, 4, 243.022);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (51, 81, 738604, '4:08:00', 31, 48, 379.945);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (52, 12, 453670, '15:06:16', 36, 22, 246.419);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (53, 33, 802066, '8:38:19', 99, 78, 388.088);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (54, 50, 256375, '6:52:25', 51, 49, 165.556);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (55, 56, 763470, '14:10:41', 98, 98, 211.564);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (56, 76, 338911, '8:58:37', 64, 56, 59.428);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (57, 12, 113783, '11:50:51', 83, 8, 271.424);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (58, 68, 489049, '7:45:18', 70, 86, 200.038);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (59, 8, 728730, '23:29:12', 23, 78, 107.697);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (60, 21, 70521, '13:52:51', 75, 11, 240.167);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (61, 13, 171552, '19:14:00', 8, 31, 231.242);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (62, 65, 740237, '2:34:51', 84, 85, 102.487);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (63, 74, 374332, '3:04:55', 46, 30, 317.526);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (64, 53, 54990, '14:16:05', 26, 13, 49.916);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (65, 17, 666024, '3:05:58', 54, 56, 212.656);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (66, 73, 989253, '15:29:01', 74, 23, 19.508);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (67, 18, 347765, '9:06:00', 50, 2, 90.641);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (68, 75, 679719, '0:42:19', 55, 88, 55.923);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (69, 1, 796376, '17:16:14', 86, 45, 1.147);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (70, 37, 377698, '18:41:07', 48, 15, 7.922);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (71, 51, 262013, '13:28:27', 21, 53, 87.872);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (72, 42, 418694, '13:17:47', 87, 24, 234.408);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (73, 88, 726880, '1:15:06', 82, 100, 246.259);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (74, 28, 61416, '4:19:27', 72, 83, 130.719);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (75, 6, 150014, '2:35:44', 2, 15, 351.802);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (76, 72, 383924, '4:23:50', 98, 8, 98.108);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (77, 57, 690706, '3:10:31', 21, 75, 13.858);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (78, 52, 666820, '3:58:29', 66, 98, 173.824);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (79, 63, 771009, '14:11:25', 2, 81, 171.028);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (80, 7, 994539, '23:48:00', 77, 86, 8.397);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (81, 70, 287598, '13:29:42', 57, 17, 37.427);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (82, 69, 984410, '7:20:26', 46, 97, 111.393);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (83, 89, 3137, '10:48:52', 97, 88, 15.618);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (84, 32, 612979, '12:22:08', 41, 41, 133.055);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (85, 71, 147756, '21:06:35', 26, 92, 202.089);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (86, 52, 880181, '5:01:01', 42, 35, 115.709);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (87, 53, 200621, '13:05:48', 94, 80, 189.533);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (88, 40, 453046, '11:08:38', 11, 59, 263.866);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (89, 85, 517655, '9:09:46', 72, 42, 100.498);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (90, 32, 232264, '12:59:55', 21, 13, 45.837);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (91, 51, 403772, '15:14:03', 82, 89, 356.659);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (92, 50, 549800, '8:46:44', 83, 7, 357.556);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (93, 27, 302475, '17:25:01', 98, 55, 7.584);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (94, 77, 203624, '22:54:13', 85, 36, 25.993);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (95, 87, 489884, '4:08:50', 37, 16, 177.263);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (96, 22, 905192, '8:35:16', 76, 25, 263.992);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (97, 74, 344464, '4:21:33', 65, 87, 230.747);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (98, 66, 138847, '4:12:17', 44, 19, 312.91);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (99, 44, 165656, '0:50:18', 24, 79, 223.148);
INSERT INTO FishCatch (id, fishId, quantity, timestamp, locationId, catchId, weight) VALUES (100, 94, 246024, '15:18:26', 60, 87, 347.453);
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
