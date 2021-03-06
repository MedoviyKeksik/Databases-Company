USE [master]
GO
/****** Object:  Database [Company]    Script Date: 29.06.2021 23:18:33 ******/
CREATE DATABASE [Company]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Company', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Company.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Company_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Company_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Company] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Company].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Company] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [Company] SET ANSI_NULLS ON 
GO
ALTER DATABASE [Company] SET ANSI_PADDING ON 
GO
ALTER DATABASE [Company] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [Company] SET ARITHABORT ON 
GO
ALTER DATABASE [Company] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Company] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Company] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Company] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Company] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [Company] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [Company] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Company] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [Company] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Company] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Company] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Company] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Company] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Company] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Company] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Company] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Company] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Company] SET RECOVERY FULL 
GO
ALTER DATABASE [Company] SET  MULTI_USER 
GO
ALTER DATABASE [Company] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [Company] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Company] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Company] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Company] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Company] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Company', N'ON'
GO
ALTER DATABASE [Company] SET QUERY_STORE = OFF
GO
USE [Company]
GO
/****** Object:  UserDefinedFunction [dbo].[GetSalary]    Script Date: 29.06.2021 23:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE FUNCTION [dbo].[GetSalary]
(
	@EmployeeId int,
	@DateStart datetime,
	@DateEnd datetime
)
RETURNS INT
AS
BEGIN
	DECLARE @Result int
	SELECT @Result = SUM(Amount) FROM Salary
		WHERE EmployeeId = @EmployeeId AND DATETIMEFROMPARTS(Year, Month, 1, 0, 0, 0, 0) BETWEEN @DateStart AND @DateEnd	
	RETURN @Result
END
GO
/****** Object:  Table [dbo].[Career]    Script Date: 29.06.2021 23:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Career](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [int] NOT NULL,
	[DepartmentId] [int] NULL,
	[DateHired] [datetime] NULL,
	[DateDismissed] [datetime] NULL,
	[EmployeeName] [nchar](100) NULL,
	[EmployeeSurname] [nchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 29.06.2021 23:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nchar](100) NULL,
	[Address] [varchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job]    Script Date: 29.06.2021 23:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nchar](100) NULL,
	[Salary] [money] NOT NULL,
 CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[EmployeeDistribution]    Script Date: 29.06.2021 23:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[EmployeeDistribution]
	AS SELECT COUNT(*) AS 'Count', Department.Title as 'Department', Job.Title as 'Job' FROM Career
	JOIN Department ON Career.DepartmentId = Department.Id
	JOIN Job ON Career.JobId = Job.Id
	WHERE GETDATE() BETWEEN Career.DateHired and Career.DateDismissed
	GROUP BY Department.Title, Job.Title
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 29.06.2021 23:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Surname] [nchar](100) NOT NULL,
	[Name] [nchar](100) NOT NULL,
	[DateOfBirth] [datetime] NULL,
	[Email] [nchar](255) NOT NULL,
 CONSTRAINT [PK_Employee_NS] PRIMARY KEY CLUSTERED 
(
	[Name] ASC,
	[Surname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salary]    Script Date: 29.06.2021 23:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salary](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[Amount] [money] NULL,
	[EmployeeName] [nchar](100) NULL,
	[EmployeeSurname] [nchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Career] ON 

INSERT [dbo].[Career] ([Id], [JobId], [DepartmentId], [DateHired], [DateDismissed], [EmployeeName], [EmployeeSurname]) VALUES (6, 1, 1, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-08-20T00:00:00.000' AS DateTime), N'Klim                                                                                                ', N'Severin                                                                                             ')
INSERT [dbo].[Career] ([Id], [JobId], [DepartmentId], [DateHired], [DateDismissed], [EmployeeName], [EmployeeSurname]) VALUES (7, 1, 1, CAST(N'2021-03-20T00:00:00.000' AS DateTime), CAST(N'2021-07-20T00:00:00.000' AS DateTime), N'Pavel                                                                                               ', N'Slyaz                                                                                               ')
INSERT [dbo].[Career] ([Id], [JobId], [DepartmentId], [DateHired], [DateDismissed], [EmployeeName], [EmployeeSurname]) VALUES (8, 2, 1, CAST(N'2022-03-20T00:00:00.000' AS DateTime), CAST(N'2023-07-20T00:00:00.000' AS DateTime), N'Pavel                                                                                               ', N'Slyaz                                                                                               ')
INSERT [dbo].[Career] ([Id], [JobId], [DepartmentId], [DateHired], [DateDismissed], [EmployeeName], [EmployeeSurname]) VALUES (9, 3, 2, CAST(N'2021-03-17T00:00:00.000' AS DateTime), CAST(N'2021-07-17T00:00:00.000' AS DateTime), N'Alena                                                                                               ', N'Strunevskaya                                                                                        ')
INSERT [dbo].[Career] ([Id], [JobId], [DepartmentId], [DateHired], [DateDismissed], [EmployeeName], [EmployeeSurname]) VALUES (10, 3, 2, CAST(N'2022-03-17T00:00:00.000' AS DateTime), CAST(N'2023-07-17T00:00:00.000' AS DateTime), N'Alena                                                                                               ', N'Strunevskaya                                                                                        ')
SET IDENTITY_INSERT [dbo].[Career] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Title], [Address]) VALUES (1, N'D01                                                                                                 ', N'611 Reggie River Apt. 125 Port Mitchelstad, WA 80031-0415')
INSERT [dbo].[Department] ([Id], [Title], [Address]) VALUES (2, N'D02                                                                                                 ', N'95139 Beverly Parkways Port Ole, MO 02571')
INSERT [dbo].[Department] ([Id], [Title], [Address]) VALUES (3, N'D03                                                                                                 ', N'48720 Wiza Coves Suite 901 East Nico, CA 28488-1010')
INSERT [dbo].[Department] ([Id], [Title], [Address]) VALUES (4, N'D04                                                                                                 ', N'194 Zetta Fort Port Jeramiefurt, ME 49155-4797')
INSERT [dbo].[Department] ([Id], [Title], [Address]) VALUES (5, N'D05                                                                                                 ', N'3532 Sallie Corner Suite 826 South Ambroseborough, NE 80623-3900')
INSERT [dbo].[Department] ([Id], [Title], [Address]) VALUES (6, N'D06                                                                                                 ', N'61753 Treutel Radial Apt. 767 West Gwendolynhaven, NH 21188')
INSERT [dbo].[Department] ([Id], [Title], [Address]) VALUES (7, N'D01                                                                                                 ', N'611 Reggie River Apt. 125 Port Mitchelstad, WA 80031-0415')
INSERT [dbo].[Department] ([Id], [Title], [Address]) VALUES (8, N'D02                                                                                                 ', N'95139 Beverly Parkways Port Ole, MO 02571')
INSERT [dbo].[Department] ([Id], [Title], [Address]) VALUES (9, N'D03                                                                                                 ', N'48720 Wiza Coves Suite 901 East Nico, CA 28488-1010')
INSERT [dbo].[Department] ([Id], [Title], [Address]) VALUES (10, N'D04                                                                                                 ', N'194 Zetta Fort Port Jeramiefurt, ME 49155-4797')
INSERT [dbo].[Department] ([Id], [Title], [Address]) VALUES (11, N'D05                                                                                                 ', N'3532 Sallie Corner Suite 826 South Ambroseborough, NE 80623-3900')
INSERT [dbo].[Department] ([Id], [Title], [Address]) VALUES (12, N'D06                                                                                                 ', N'61753 Treutel Radial Apt. 767 West Gwendolynhaven, NH 21188')
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
INSERT [dbo].[Employee] ([Surname], [Name], [DateOfBirth], [Email]) VALUES (N'Strunevskaya                                                                                        ', N'Alena                                                                                               ', CAST(N'2000-10-19T00:00:00.000' AS DateTime), N'SomMail1@wasd.com                                                                                                                                                                                                                                              ')
INSERT [dbo].[Employee] ([Surname], [Name], [DateOfBirth], [Email]) VALUES (N'Severin                                                                                             ', N'Klim                                                                                                ', CAST(N'2001-05-03T00:00:00.000' AS DateTime), N'Klim.Seviaryn@itechart-group.com                                                                                                                                                                                                                               ')
INSERT [dbo].[Employee] ([Surname], [Name], [DateOfBirth], [Email]) VALUES (N'Slyaz                                                                                               ', N'Pavel                                                                                               ', CAST(N'2001-07-25T00:00:00.000' AS DateTime), N'SomMail@wasd.com                                                                                                                                                                                                                                               ')
GO
SET IDENTITY_INSERT [dbo].[Job] ON 

INSERT [dbo].[Job] ([Id], [Title], [Salary]) VALUES (1, N'Junior Software Engeneer                                                                            ', 400.0000)
INSERT [dbo].[Job] ([Id], [Title], [Salary]) VALUES (2, N'Middle Software Engeneer                                                                            ', 1000.0000)
INSERT [dbo].[Job] ([Id], [Title], [Salary]) VALUES (3, N'Senior Software Engeneer                                                                            ', 2000.0000)
INSERT [dbo].[Job] ([Id], [Title], [Salary]) VALUES (4, N'Project Manajer                                                                                     ', 3000.0000)
INSERT [dbo].[Job] ([Id], [Title], [Salary]) VALUES (5, N'Team Lead                                                                                           ', 4000.0000)
INSERT [dbo].[Job] ([Id], [Title], [Salary]) VALUES (6, N'Junior Software Engeneer                                                                            ', 400.0000)
INSERT [dbo].[Job] ([Id], [Title], [Salary]) VALUES (7, N'Middle Software Engeneer                                                                            ', 1000.0000)
INSERT [dbo].[Job] ([Id], [Title], [Salary]) VALUES (8, N'Senior Software Engeneer                                                                            ', 2000.0000)
INSERT [dbo].[Job] ([Id], [Title], [Salary]) VALUES (9, N'Project Manajer                                                                                     ', 3000.0000)
INSERT [dbo].[Job] ([Id], [Title], [Salary]) VALUES (10, N'Team Lead                                                                                           ', 4000.0000)
SET IDENTITY_INSERT [dbo].[Job] OFF
GO
SET IDENTITY_INSERT [dbo].[Salary] ON 

INSERT [dbo].[Salary] ([Id], [Month], [Year], [Amount], [EmployeeName], [EmployeeSurname]) VALUES (8, 1, 2015, 450.0000, N'Klim                                                                                                ', N'Severin                                                                                             ')
INSERT [dbo].[Salary] ([Id], [Month], [Year], [Amount], [EmployeeName], [EmployeeSurname]) VALUES (9, 1, 2015, 550.0000, N'Pavel                                                                                               ', N'Slyaz                                                                                               ')
INSERT [dbo].[Salary] ([Id], [Month], [Year], [Amount], [EmployeeName], [EmployeeSurname]) VALUES (10, 5, 2015, 500.0000, N'Klim                                                                                                ', N'Severin                                                                                             ')
INSERT [dbo].[Salary] ([Id], [Month], [Year], [Amount], [EmployeeName], [EmployeeSurname]) VALUES (11, 5, 2015, 500.0000, N'Pavel                                                                                               ', N'Slyaz                                                                                               ')
INSERT [dbo].[Salary] ([Id], [Month], [Year], [Amount], [EmployeeName], [EmployeeSurname]) VALUES (12, 1, 2015, 3000.0000, N'Alena                                                                                               ', N'Strunevskaya                                                                                        ')
INSERT [dbo].[Salary] ([Id], [Month], [Year], [Amount], [EmployeeName], [EmployeeSurname]) VALUES (13, 1, 2013, 3000.0000, N'Alena                                                                                               ', N'Strunevskaya                                                                                        ')
INSERT [dbo].[Salary] ([Id], [Month], [Year], [Amount], [EmployeeName], [EmployeeSurname]) VALUES (14, 1, 2012, 3000.0000, N'Alena                                                                                               ', N'Strunevskaya                                                                                        ')
SET IDENTITY_INSERT [dbo].[Salary] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AK_Employee_Email]    Script Date: 29.06.2021 23:18:33 ******/
CREATE UNIQUE NONCLUSTERED INDEX [AK_Employee_Email] ON [dbo].[Employee]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Career]  WITH CHECK ADD  CONSTRAINT [FK_Career_ToDepartment] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Career] CHECK CONSTRAINT [FK_Career_ToDepartment]
GO
ALTER TABLE [dbo].[Career]  WITH CHECK ADD  CONSTRAINT [FK_Career_ToEmployee] FOREIGN KEY([EmployeeName], [EmployeeSurname])
REFERENCES [dbo].[Employee] ([Name], [Surname])
GO
ALTER TABLE [dbo].[Career] CHECK CONSTRAINT [FK_Career_ToEmployee]
GO
ALTER TABLE [dbo].[Career]  WITH CHECK ADD  CONSTRAINT [FK_Career_ToJob] FOREIGN KEY([JobId])
REFERENCES [dbo].[Job] ([Id])
GO
ALTER TABLE [dbo].[Career] CHECK CONSTRAINT [FK_Career_ToJob]
GO
ALTER TABLE [dbo].[Salary]  WITH CHECK ADD  CONSTRAINT [FK_Salary_ToEmployee] FOREIGN KEY([EmployeeName], [EmployeeSurname])
REFERENCES [dbo].[Employee] ([Name], [Surname])
GO
ALTER TABLE [dbo].[Salary] CHECK CONSTRAINT [FK_Salary_ToEmployee]
GO
/****** Object:  StoredProcedure [dbo].[GetWorkGistory]    Script Date: 29.06.2021 23:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetWorkGistory]
	@Name nchar(100),
	@Surname nchar(100)
AS
	SELECT Job.Title FROM Career
	JOIN Job ON Career.JobId = Job.Id
	JOIN Employee ON Career.EmployeeId = Employee.Id
	WHERE @Name = Employee.Name AND @Surname = Employee.Surname; 
GO
/****** Object:  StoredProcedure [dbo].[GetWorkHistory]    Script Date: 29.06.2021 23:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetWorkHistory]
	@Name nchar(100),
	@Surname nchar(100)
AS
	SELECT Job.Title FROM Career
	JOIN Job ON Career.JobId = Job.Id
	JOIN Employee ON Career.EmployeeId = Employee.Id
	WHERE @Name = Employee.Name AND @Surname = Employee.Surname;
GO
USE [master]
GO
ALTER DATABASE [Company] SET  READ_WRITE 
GO
