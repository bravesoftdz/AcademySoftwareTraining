USE [master]
GO
/****** Object:  Database [GymDTD]    Script Date: 5/24/2017 1:55:52 PM ******/
CREATE DATABASE [GymDTD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GymDTD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\GymDTD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GymDTD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\GymDTD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GymDTD] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GymDTD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GymDTD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GymDTD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GymDTD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GymDTD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GymDTD] SET ARITHABORT OFF 
GO
ALTER DATABASE [GymDTD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GymDTD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GymDTD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GymDTD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GymDTD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GymDTD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GymDTD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GymDTD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GymDTD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GymDTD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GymDTD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GymDTD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GymDTD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GymDTD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GymDTD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GymDTD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GymDTD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GymDTD] SET RECOVERY FULL 
GO
ALTER DATABASE [GymDTD] SET  MULTI_USER 
GO
ALTER DATABASE [GymDTD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GymDTD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GymDTD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GymDTD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GymDTD] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'GymDTD', N'ON'
GO
ALTER DATABASE [GymDTD] SET QUERY_STORE = OFF
GO
USE [GymDTD]
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
USE [GymDTD]
GO
/****** Object:  Table [dbo].[ACCESS_PERMISSION]    Script Date: 5/24/2017 1:55:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACCESS_PERMISSION](
	[IdAcessPermission] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](60) NOT NULL,
	[StudentRegistration] [char](1) NOT NULL,
	[CoachRegistration] [char](1) NOT NULL,
	[StudentTrainingDataSheet] [char](1) NOT NULL,
	[CoachBuildDataSheet] [char](1) NOT NULL,
	[UserRegistration] [char](1) NOT NULL,
	[AccessPermition] [char](1) NOT NULL,
	[CoachScheduleRegistration] [char](1) NOT NULL,
	[CoachBuildChallenge] [char](1) NOT NULL,
	[StudentChallenge] [char](1) NOT NULL,
 CONSTRAINT [PK_ACCESS_PERMISSION] PRIMARY KEY CLUSTERED 
(
	[IdAcessPermission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHALLENGE]    Script Date: 5/24/2017 1:55:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHALLENGE](
	[IdChallenge] [int] IDENTITY(1,1) NOT NULL,
	[Objective] [varchar](60) NULL,
	[CStartDate] [date] NULL,
	[CEndDate] [date] NULL,
	[IdTraining] [int] NULL,
	[Confirmation] [char](1) NULL,
	[CDescription] [varchar](60) NULL,
	[Serie] [int] NULL,
	[Repetitions] [int] NULL,
	[Weight] [float] NULL,
	[Distance] [float] NULL,
	[Obs] [text] NULL,
 CONSTRAINT [PK_CHALLENGE] PRIMARY KEY CLUSTERED 
(
	[IdChallenge] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COACH]    Script Date: 5/24/2017 1:55:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COACH](
	[IdCoach] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](60) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[RG] [int] NOT NULL,
	[CPF] [varchar](12) NULL,
	[PIS] [int] NULL,
	[CLT] [varchar](20) NULL,
	[AdmissionDate] [date] NULL,
	[DemissionDate] [date] NULL,
	[ZipCode] [int] NOT NULL,
	[Address] [varchar](60) NOT NULL,
	[neighborhood] [varchar](50) NOT NULL,
	[Number] [int] NOT NULL,
	[Phone] [varchar](15) NULL,
	[Phone2] [varchar](15) NULL,
 CONSTRAINT [PK_COACH] PRIMARY KEY CLUSTERED 
(
	[IdCoach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COACH_HAS_SCHEDULE]    Script Date: 5/24/2017 1:55:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COACH_HAS_SCHEDULE](
	[idCoach] [int] NOT NULL,
	[idWSchedule] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EQUIPMENT]    Script Date: 5/24/2017 1:55:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EQUIPMENT](
	[IdEquipment] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](60) NOT NULL,
	[ManufactureDate] [date] NULL,
	[MaintanceDate] [date] NULL,
	[Brand] [varchar](50) NULL,
 CONSTRAINT [PK_EQUIPMENT] PRIMARY KEY CLUSTERED 
(
	[IdEquipment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOGIN]    Script Date: 5/24/2017 1:55:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOGIN](
	[IdLogin] [int] IDENTITY(1,1) NOT NULL,
	[UserRG] [int] NOT NULL,
	[Password] [int] NOT NULL,
	[IdAcessPermission] [int] NULL,
 CONSTRAINT [PK_LOGIN] PRIMARY KEY CLUSTERED 
(
	[IdLogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STUDENT]    Script Date: 5/24/2017 1:55:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STUDENT](
	[IdStudent] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](60) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[RG] [int] NOT NULL,
	[CPF] [varchar](12) NULL,
	[ZipCode] [int] NOT NULL,
	[Address] [varchar](60) NOT NULL,
	[Neighborhood] [varchar](50) NOT NULL,
	[Number] [int] NULL,
	[Complement] [varchar](60) NULL,
	[Phone] [varchar](15) NULL,
	[Phone2] [varchar](15) NULL,
	[MessageWith] [varchar](50) NULL,
	[idLogin] [int] NOT NULL,
	[Objective] [varchar](60) NOT NULL,
 CONSTRAINT [PK_STUDENT] PRIMARY KEY CLUSTERED 
(
	[IdStudent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STUDENT_HAS_TRAING]    Script Date: 5/24/2017 1:55:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STUDENT_HAS_TRAING](
	[IdStudent] [int] NOT NULL,
	[idCoach] [int] NOT NULL,
	[IdTraining] [int] NOT NULL,
	[IdChallenge] [int] NOT NULL,
	[TCOrder] [int] NULL,
	[IdTOrder] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_ORDER]    Script Date: 5/24/2017 1:55:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_ORDER](
	[IdTOrder] [int] IDENTITY(1,1) NOT NULL,
	[TOrder] [varchar](60) NOT NULL,
 CONSTRAINT [PK_T_ORDER] PRIMARY KEY CLUSTERED 
(
	[IdTOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRAINING]    Script Date: 5/24/2017 1:55:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRAINING](
	[IdTraining] [int] IDENTITY(1,1) NOT NULL,
	[idCategory] [int] NOT NULL,
	[idEquipment] [int] NOT NULL,
	[Name] [varchar](60) NOT NULL,
	[Serie] [int] NULL,
	[Repetitions] [int] NULL,
	[Weight] [float] NULL,
	[Distance] [float] NULL,
	[Time] [varchar](10) NULL,
 CONSTRAINT [PK_TRAINING] PRIMARY KEY CLUSTERED 
(
	[IdTraining] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRAINING_CATEGORY]    Script Date: 5/24/2017 1:55:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRAINING_CATEGORY](
	[IdTCategory] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](60) NULL,
 CONSTRAINT [PK_TRAINING_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[IdTCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WORK_SCHEDULE]    Script Date: 5/24/2017 1:55:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WORK_SCHEDULE](
	[IdWSchedule] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](60) NULL,
	[HEntry] [varchar](8) NOT NULL,
	[HExit] [varchar](8) NOT NULL,
	[Sunday] [char](1) NULL,
	[Monday] [char](1) NULL,
	[Tuesday] [char](1) NULL,
	[Wednesday] [char](1) NULL,
	[Thursday] [char](1) NULL,
	[Friday] [char](1) NULL,
	[Saturday] [char](1) NULL,
 CONSTRAINT [PK_WORK_SCHEDULE] PRIMARY KEY CLUSTERED 
(
	[IdWSchedule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ACCESS_PERMISSION] ON 

INSERT [dbo].[ACCESS_PERMISSION] ([IdAcessPermission], [Description], [StudentRegistration], [CoachRegistration], [StudentTrainingDataSheet], [CoachBuildDataSheet], [UserRegistration], [AccessPermition], [CoachScheduleRegistration], [CoachBuildChallenge], [StudentChallenge]) VALUES (2, N'Coach', N'T', N'T', N'T', N'T', N'F', N'F', N'F', N'T', N'T')
INSERT [dbo].[ACCESS_PERMISSION] ([IdAcessPermission], [Description], [StudentRegistration], [CoachRegistration], [StudentTrainingDataSheet], [CoachBuildDataSheet], [UserRegistration], [AccessPermition], [CoachScheduleRegistration], [CoachBuildChallenge], [StudentChallenge]) VALUES (3, N'Administrator', N'T', N'T', N'T', N'T', N'T', N'T', N'F', N'T', N'T')
INSERT [dbo].[ACCESS_PERMISSION] ([IdAcessPermission], [Description], [StudentRegistration], [CoachRegistration], [StudentTrainingDataSheet], [CoachBuildDataSheet], [UserRegistration], [AccessPermition], [CoachScheduleRegistration], [CoachBuildChallenge], [StudentChallenge]) VALUES (1002, N'Student', N'F', N'F', N'T', N'F', N'F', N'F', N'F', N'F', N'T')
SET IDENTITY_INSERT [dbo].[ACCESS_PERMISSION] OFF
SET IDENTITY_INSERT [dbo].[CHALLENGE] ON 

INSERT [dbo].[CHALLENGE] ([IdChallenge], [Objective], [CStartDate], [CEndDate], [IdTraining], [Confirmation], [CDescription], [Serie], [Repetitions], [Weight], [Distance], [Obs]) VALUES (1, N'No Challenge', CAST(N'2001-01-01' AS Date), CAST(N'2001-01-01' AS Date), 0, N'F', N'No Challenge', 0, 0, 0, 0, N'No Observation')
INSERT [dbo].[CHALLENGE] ([IdChallenge], [Objective], [CStartDate], [CEndDate], [IdTraining], [Confirmation], [CDescription], [Serie], [Repetitions], [Weight], [Distance], [Obs]) VALUES (3, N'Challenge Test', CAST(N'2017-05-09' AS Date), CAST(N'2017-05-09' AS Date), 10, N'Y', NULL, NULL, 12, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CHALLENGE] OFF
SET IDENTITY_INSERT [dbo].[COACH] ON 

INSERT [dbo].[COACH] ([IdCoach], [Name], [BirthDate], [RG], [CPF], [PIS], [CLT], [AdmissionDate], [DemissionDate], [ZipCode], [Address], [neighborhood], [Number], [Phone], [Phone2]) VALUES (11, N'Ricardão', CAST(N'1987-10-23' AS Date), 46532, N'534252353', 8374759, N'83726684', CAST(N'2015-07-17' AS Date), NULL, 39280, N'Louis St.', N'Cabral', 351, N'99872618', NULL)
INSERT [dbo].[COACH] ([IdCoach], [Name], [BirthDate], [RG], [CPF], [PIS], [CLT], [AdmissionDate], [DemissionDate], [ZipCode], [Address], [neighborhood], [Number], [Phone], [Phone2]) VALUES (12, N'Marcos Vinicius', CAST(N'1995-02-17' AS Date), 948380, N'99387283', 9281738, N'883716492', CAST(N'2016-01-20' AS Date), NULL, 80736, N'Dona Eleusina Plaisant St.', N'Santa Quiteria ', 234, N'998217892', N'30787787')
SET IDENTITY_INSERT [dbo].[COACH] OFF
INSERT [dbo].[COACH_HAS_SCHEDULE] ([idCoach], [idWSchedule]) VALUES (11, 2)
INSERT [dbo].[COACH_HAS_SCHEDULE] ([idCoach], [idWSchedule]) VALUES (12, 1)
SET IDENTITY_INSERT [dbo].[EQUIPMENT] ON 

INSERT [dbo].[EQUIPMENT] ([IdEquipment], [Name], [ManufactureDate], [MaintanceDate], [Brand]) VALUES (4, N'Triceps chair', CAST(N'2017-04-01' AS Date), CAST(N'2017-05-15' AS Date), N'Cyber Gyn')
INSERT [dbo].[EQUIPMENT] ([IdEquipment], [Name], [ManufactureDate], [MaintanceDate], [Brand]) VALUES (5, N'Running Machine', CAST(N'2017-01-17' AS Date), CAST(N'2017-12-12' AS Date), N'Oxyn')
INSERT [dbo].[EQUIPMENT] ([IdEquipment], [Name], [ManufactureDate], [MaintanceDate], [Brand]) VALUES (6, N'Leg Press', CAST(N'2016-10-08' AS Date), CAST(N'2017-06-10' AS Date), N'Cyber Gyn')
INSERT [dbo].[EQUIPMENT] ([IdEquipment], [Name], [ManufactureDate], [MaintanceDate], [Brand]) VALUES (14, N'Halter', CAST(N'2016-10-08' AS Date), CAST(N'2017-06-10' AS Date), N'Cyber Gym')
SET IDENTITY_INSERT [dbo].[EQUIPMENT] OFF
SET IDENTITY_INSERT [dbo].[LOGIN] ON 

INSERT [dbo].[LOGIN] ([IdLogin], [UserRG], [Password], [IdAcessPermission]) VALUES (1, 98804200, 290315, 3)
INSERT [dbo].[LOGIN] ([IdLogin], [UserRG], [Password], [IdAcessPermission]) VALUES (2, 948380, 1234, 2)
INSERT [dbo].[LOGIN] ([IdLogin], [UserRG], [Password], [IdAcessPermission]) VALUES (3, 987654321, 4321, 1002)
SET IDENTITY_INSERT [dbo].[LOGIN] OFF
SET IDENTITY_INSERT [dbo].[STUDENT] ON 

INSERT [dbo].[STUDENT] ([IdStudent], [Name], [BirthDate], [RG], [CPF], [ZipCode], [Address], [Neighborhood], [Number], [Complement], [Phone], [Phone2], [MessageWith], [idLogin], [Objective]) VALUES (4, N'Adriano', CAST(N'1988-10-06' AS Date), 98804200, N'0752496298', 80310290, N'Dona Eleusina Plaisant St.', N'Santa Quiteria', 315, NULL, N'(41)992091729', NULL, NULL, 1, N'Hipertrofy')
INSERT [dbo].[STUDENT] ([IdStudent], [Name], [BirthDate], [RG], [CPF], [ZipCode], [Address], [Neighborhood], [Number], [Complement], [Phone], [Phone2], [MessageWith], [idLogin], [Objective]) VALUES (6, N'Gabriel Lopes', CAST(N'1990-01-02' AS Date), 987654321, N'827278913', 80392887, N'Test St.', N'Portao', 154, NULL, N'992817283', NULL, NULL, 3, N'Physical Conditioning')
SET IDENTITY_INSERT [dbo].[STUDENT] OFF
INSERT [dbo].[STUDENT_HAS_TRAING] ([IdStudent], [idCoach], [IdTraining], [IdChallenge], [TCOrder], [IdTOrder]) VALUES (4, 12, 9, 1, 1, 2)
INSERT [dbo].[STUDENT_HAS_TRAING] ([IdStudent], [idCoach], [IdTraining], [IdChallenge], [TCOrder], [IdTOrder]) VALUES (4, 12, 10, 3, 2, 3)
INSERT [dbo].[STUDENT_HAS_TRAING] ([IdStudent], [idCoach], [IdTraining], [IdChallenge], [TCOrder], [IdTOrder]) VALUES (6, 12, 11, 1, 1, 2)
SET IDENTITY_INSERT [dbo].[T_ORDER] ON 

INSERT [dbo].[T_ORDER] ([IdTOrder], [TOrder]) VALUES (1, N'Pre Training')
INSERT [dbo].[T_ORDER] ([IdTOrder], [TOrder]) VALUES (2, N'In Training')
INSERT [dbo].[T_ORDER] ([IdTOrder], [TOrder]) VALUES (3, N'Post Training')
SET IDENTITY_INSERT [dbo].[T_ORDER] OFF
SET IDENTITY_INSERT [dbo].[TRAINING] ON 

INSERT [dbo].[TRAINING] ([IdTraining], [idCategory], [idEquipment], [Name], [Serie], [Repetitions], [Weight], [Distance], [Time]) VALUES (9, 5, 5, N'test', 1, 2, 2, NULL, NULL)
INSERT [dbo].[TRAINING] ([IdTraining], [idCategory], [idEquipment], [Name], [Serie], [Repetitions], [Weight], [Distance], [Time]) VALUES (10, 7, 6, N'test 2', 4, 4, 4, 3, NULL)
INSERT [dbo].[TRAINING] ([IdTraining], [idCategory], [idEquipment], [Name], [Serie], [Repetitions], [Weight], [Distance], [Time]) VALUES (11, 7, 4, N'Lifting Chair', 4, 10, 16, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TRAINING] OFF
SET IDENTITY_INSERT [dbo].[TRAINING_CATEGORY] ON 

INSERT [dbo].[TRAINING_CATEGORY] ([IdTCategory], [Name]) VALUES (4, N'Biceps')
INSERT [dbo].[TRAINING_CATEGORY] ([IdTCategory], [Name]) VALUES (5, N'Triceps')
INSERT [dbo].[TRAINING_CATEGORY] ([IdTCategory], [Name]) VALUES (6, N'Back')
INSERT [dbo].[TRAINING_CATEGORY] ([IdTCategory], [Name]) VALUES (7, N'Chest')
INSERT [dbo].[TRAINING_CATEGORY] ([IdTCategory], [Name]) VALUES (8, N'Aerobic')
INSERT [dbo].[TRAINING_CATEGORY] ([IdTCategory], [Name]) VALUES (9, N'Leg')
SET IDENTITY_INSERT [dbo].[TRAINING_CATEGORY] OFF
SET IDENTITY_INSERT [dbo].[WORK_SCHEDULE] ON 

INSERT [dbo].[WORK_SCHEDULE] ([IdWSchedule], [Description], [HEntry], [HExit], [Sunday], [Monday], [Tuesday], [Wednesday], [Thursday], [Friday], [Saturday]) VALUES (1, N'Morning Shift', N'08:00', N'12:00', N'F', N'T', N'T', N'T', N'T', N'T', N'F')
INSERT [dbo].[WORK_SCHEDULE] ([IdWSchedule], [Description], [HEntry], [HExit], [Sunday], [Monday], [Tuesday], [Wednesday], [Thursday], [Friday], [Saturday]) VALUES (2, N'Afternoon Shift', N'13:00', N'17:30', N'F', N'T', N'T', N'T', N'T', N'T', N'F')
SET IDENTITY_INSERT [dbo].[WORK_SCHEDULE] OFF
ALTER TABLE [dbo].[COACH_HAS_SCHEDULE]  WITH CHECK ADD  CONSTRAINT [FK_COACH_HAS_SCHEDULE_COACH] FOREIGN KEY([idCoach])
REFERENCES [dbo].[COACH] ([IdCoach])
GO
ALTER TABLE [dbo].[COACH_HAS_SCHEDULE] CHECK CONSTRAINT [FK_COACH_HAS_SCHEDULE_COACH]
GO
ALTER TABLE [dbo].[COACH_HAS_SCHEDULE]  WITH CHECK ADD  CONSTRAINT [FK_COACH_HAS_SCHEDULE_WORK_SCHEDULE] FOREIGN KEY([idWSchedule])
REFERENCES [dbo].[WORK_SCHEDULE] ([IdWSchedule])
GO
ALTER TABLE [dbo].[COACH_HAS_SCHEDULE] CHECK CONSTRAINT [FK_COACH_HAS_SCHEDULE_WORK_SCHEDULE]
GO
ALTER TABLE [dbo].[LOGIN]  WITH CHECK ADD  CONSTRAINT [FK_LOGIN_ACCESS_PERMISSION] FOREIGN KEY([IdAcessPermission])
REFERENCES [dbo].[ACCESS_PERMISSION] ([IdAcessPermission])
GO
ALTER TABLE [dbo].[LOGIN] CHECK CONSTRAINT [FK_LOGIN_ACCESS_PERMISSION]
GO
ALTER TABLE [dbo].[STUDENT]  WITH CHECK ADD  CONSTRAINT [FK_STUDENT_LOGIN] FOREIGN KEY([idLogin])
REFERENCES [dbo].[LOGIN] ([IdLogin])
GO
ALTER TABLE [dbo].[STUDENT] CHECK CONSTRAINT [FK_STUDENT_LOGIN]
GO
ALTER TABLE [dbo].[STUDENT_HAS_TRAING]  WITH CHECK ADD  CONSTRAINT [FK_STUDENT_HAS_TRAING_CHALLENGE] FOREIGN KEY([IdChallenge])
REFERENCES [dbo].[CHALLENGE] ([IdChallenge])
GO
ALTER TABLE [dbo].[STUDENT_HAS_TRAING] CHECK CONSTRAINT [FK_STUDENT_HAS_TRAING_CHALLENGE]
GO
ALTER TABLE [dbo].[STUDENT_HAS_TRAING]  WITH CHECK ADD  CONSTRAINT [FK_STUDENT_HAS_TRAING_COACH] FOREIGN KEY([idCoach])
REFERENCES [dbo].[COACH] ([IdCoach])
GO
ALTER TABLE [dbo].[STUDENT_HAS_TRAING] CHECK CONSTRAINT [FK_STUDENT_HAS_TRAING_COACH]
GO
ALTER TABLE [dbo].[STUDENT_HAS_TRAING]  WITH CHECK ADD  CONSTRAINT [FK_STUDENT_HAS_TRAING_STUDENT] FOREIGN KEY([IdStudent])
REFERENCES [dbo].[STUDENT] ([IdStudent])
GO
ALTER TABLE [dbo].[STUDENT_HAS_TRAING] CHECK CONSTRAINT [FK_STUDENT_HAS_TRAING_STUDENT]
GO
ALTER TABLE [dbo].[STUDENT_HAS_TRAING]  WITH CHECK ADD  CONSTRAINT [FK_STUDENT_HAS_TRAING_T_ORDER] FOREIGN KEY([IdTOrder])
REFERENCES [dbo].[T_ORDER] ([IdTOrder])
GO
ALTER TABLE [dbo].[STUDENT_HAS_TRAING] CHECK CONSTRAINT [FK_STUDENT_HAS_TRAING_T_ORDER]
GO
ALTER TABLE [dbo].[STUDENT_HAS_TRAING]  WITH CHECK ADD  CONSTRAINT [FK_STUDENT_HAS_TRAING_TRAINING] FOREIGN KEY([IdTraining])
REFERENCES [dbo].[TRAINING] ([IdTraining])
GO
ALTER TABLE [dbo].[STUDENT_HAS_TRAING] CHECK CONSTRAINT [FK_STUDENT_HAS_TRAING_TRAINING]
GO
ALTER TABLE [dbo].[TRAINING]  WITH CHECK ADD  CONSTRAINT [FK_TRAINING_EQUIPMENT] FOREIGN KEY([idEquipment])
REFERENCES [dbo].[EQUIPMENT] ([IdEquipment])
GO
ALTER TABLE [dbo].[TRAINING] CHECK CONSTRAINT [FK_TRAINING_EQUIPMENT]
GO
ALTER TABLE [dbo].[TRAINING]  WITH CHECK ADD  CONSTRAINT [FK_TRAINING_TRAINING_CATEGORY] FOREIGN KEY([idCategory])
REFERENCES [dbo].[TRAINING_CATEGORY] ([IdTCategory])
GO
ALTER TABLE [dbo].[TRAINING] CHECK CONSTRAINT [FK_TRAINING_TRAINING_CATEGORY]
GO
USE [master]
GO
ALTER DATABASE [GymDTD] SET  READ_WRITE 
GO
