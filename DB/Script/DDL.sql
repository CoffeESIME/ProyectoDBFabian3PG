USE [master]
GO
/****** Objecto:  Base de datos de vacunación******/
CREATE DATABASE [VaccinationVersionFabian]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VaccinationVersionFabian', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\VaccinationVersionFabian.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VaccinationVersionFabian_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\VaccinationVersionFabian_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [VaccinationVersionFabian] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VaccinationVersionFabian].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VaccinationVersionFabian] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VaccinationVersionFabian] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VaccinationVersionFabian] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VaccinationVersionFabian] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VaccinationVersionFabian] SET ARITHABORT OFF 
GO
ALTER DATABASE [VaccinationVersionFabian] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VaccinationVersionFabian] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VaccinationVersionFabian] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VaccinationVersionFabian] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VaccinationVersionFabian] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VaccinationVersionFabian] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VaccinationVersionFabian] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VaccinationVersionFabian] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VaccinationVersionFabian] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VaccinationVersionFabian] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VaccinationVersionFabian] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VaccinationVersionFabian] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VaccinationVersionFabian] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VaccinationVersionFabian] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VaccinationVersionFabian] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VaccinationVersionFabian] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VaccinationVersionFabian] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VaccinationVersionFabian] SET RECOVERY FULL 
GO
ALTER DATABASE [VaccinationVersionFabian] SET  MULTI_USER 
GO
ALTER DATABASE [VaccinationVersionFabian] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VaccinationVersionFabian] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VaccinationVersionFabian] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VaccinationVersionFabian] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VaccinationVersionFabian] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VaccinationVersionFabian] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'vaccination', N'ON'
GO
ALTER DATABASE [vaccination] SET QUERY_STORE = OFF
GO
USE [VaccinationVersionFabian]
GO
/****** Object:  Table [dbo].[Campus]    Script Date: 9/30/2021 6:37:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campus](
	[idCampus] [tinyint] IDENTITY(1,1) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[Date] [smalldatetime] NULL,
	[idState] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCampus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Citizen]    Script Date: 9/30/2021 6:37:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Citizen](
	[idCitizen] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Maternal surname] [varchar](100) NOT NULL,
	[Paternal surname] [varchar](100) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[Telephone number] [varchar](10) NOT NULL,
	[Age] [tinyint] NOT NULL,
	[idCampus] [tinyint] NULL,
	[idVaccine] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCitizen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Citizen report]    Script Date: 9/30/2021 6:37:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Citizen report](
	[idReport] [int] IDENTITY(1,1) NOT NULL,
	[idCitizen] [int] NULL,
	[idCampus] [tinyint] NULL,
	[idVaccine] [tinyint] NULL,
	[Dose number] [tinyint] NULL,
	[Vaccination date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idReport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personnel]    Script Date: 9/30/2021 6:37:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personnel](
	[idPersonnel] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Maternal surname] [varchar](100) NOT NULL,
	[Paternal surname] [varchar](100) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[Telephone number] [varchar](10) NOT NULL,
	[idPersonnel key] [tinyint] NULL,
	[idCampus] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[idPersonnel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personnel key]    Script Date: 9/30/2021 6:37:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personnel key](
	[idPersonnel key] [tinyint] NOT NULL,
	[Name] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPersonnel key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 9/30/2021 6:37:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[idState] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vaccine]    Script Date: 9/30/2021 6:37:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vaccine](
	[idVaccine] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Dose] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idVaccine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Campus]  WITH CHECK ADD FOREIGN KEY([idState])
REFERENCES [dbo].[State] ([idState])
GO
ALTER TABLE [dbo].[Citizen]  WITH CHECK ADD FOREIGN KEY([idCampus])
REFERENCES [dbo].[Campus] ([idCampus])
GO
ALTER TABLE [dbo].[Citizen]  WITH CHECK ADD FOREIGN KEY([idVaccine])
REFERENCES [dbo].[Vaccine] ([idVaccine])
GO
ALTER TABLE [dbo].[Citizen report]  WITH CHECK ADD FOREIGN KEY([idCampus])
REFERENCES [dbo].[Campus] ([idCampus])
GO
ALTER TABLE [dbo].[Citizen report]  WITH CHECK ADD FOREIGN KEY([idCitizen])
REFERENCES [dbo].[Citizen] ([idCitizen])
GO
ALTER TABLE [dbo].[Citizen report]  WITH CHECK ADD FOREIGN KEY([idVaccine])
REFERENCES [dbo].[Vaccine] ([idVaccine])
GO
ALTER TABLE [dbo].[Personnel]  WITH CHECK ADD FOREIGN KEY([idCampus])
REFERENCES [dbo].[Campus] ([idCampus])
GO
ALTER TABLE [dbo].[Personnel]  WITH CHECK ADD FOREIGN KEY([idPersonnel key])
REFERENCES [dbo].[Personnel key] ([idPersonnel key])
GO
USE [master]
GO
ALTER DATABASE [VaccinationVersionFabian] SET  READ_WRITE 
GO
