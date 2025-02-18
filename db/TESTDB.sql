USE [master]
GO
/****** Object:  Database [TESTDB]    Script Date: 11/7/2024 1:35:58 pm ******/
CREATE DATABASE [TESTDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TESTDB', FILENAME = N'C:\DevTools\Microsoft SQL Server\MSSQL16.MSSQL\MSSQL\DATA\TESTDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TESTDB_log', FILENAME = N'C:\DevTools\Microsoft SQL Server\MSSQL16.MSSQL\MSSQL\DATA\TESTDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TESTDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TESTDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TESTDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TESTDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TESTDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TESTDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TESTDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TESTDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TESTDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TESTDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TESTDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TESTDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TESTDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TESTDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TESTDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TESTDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TESTDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TESTDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TESTDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TESTDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TESTDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TESTDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TESTDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TESTDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TESTDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TESTDB] SET  MULTI_USER 
GO
ALTER DATABASE [TESTDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TESTDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TESTDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TESTDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TESTDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TESTDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TESTDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [TESTDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TESTDB]
GO
/****** Object:  User [api_user_one]    Script Date: 11/7/2024 1:35:58 pm ******/
CREATE USER [api_user_one] FOR LOGIN [api_login] WITH DEFAULT_SCHEMA=[LIBRARY]
GO
ALTER ROLE [db_owner] ADD MEMBER [api_user_one]
GO
ALTER ROLE [db_datareader] ADD MEMBER [api_user_one]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [api_user_one]
GO
/****** Object:  Schema [LIBRARY]    Script Date: 11/7/2024 1:35:58 pm ******/
CREATE SCHEMA [LIBRARY]
GO
/****** Object:  Table [LIBRARY].[user]    Script Date: 11/7/2024 1:35:58 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [LIBRARY].[user](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[created_date] [datetime2](6) NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[password] [varchar](255) NULL,
	[updated_date] [datetime2](6) NOT NULL,
	[username] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [LIBRARY].[user] ON 

INSERT [LIBRARY].[user] ([id], [created_date], [is_active], [is_deleted], [password], [updated_date], [username]) VALUES (1, CAST(N'2023-11-24T18:15:03.0000000' AS DateTime2), 1, 0, N'$2a$10$TSjY6QO43uAYkojp9CNuuO/QSPE6tcWw1zD1FR9119DMwj9UvY4B.', CAST(N'2024-02-18T02:31:15.0000000' AS DateTime2), N'user1')
INSERT [LIBRARY].[user] ([id], [created_date], [is_active], [is_deleted], [password], [updated_date], [username]) VALUES (2, CAST(N'2024-07-04T03:25:35.0000000' AS DateTime2), 0, 0, N'$2a$10$TSjY6QO43uAYkojp9CNuuO/QSPE6tcWw1zD1FR9119DMwj9UvY4B.', CAST(N'2023-10-26T12:37:37.0000000' AS DateTime2), N'user2')
INSERT [LIBRARY].[user] ([id], [created_date], [is_active], [is_deleted], [password], [updated_date], [username]) VALUES (3, CAST(N'2023-11-28T06:39:56.0000000' AS DateTime2), 1, 0, N'$2a$10$TSjY6QO43uAYkojp9CNuuO/QSPE6tcWw1zD1FR9119DMwj9UvY4B.', CAST(N'2024-07-03T16:33:31.0000000' AS DateTime2), N'user3')
INSERT [LIBRARY].[user] ([id], [created_date], [is_active], [is_deleted], [password], [updated_date], [username]) VALUES (4, CAST(N'2024-02-21T14:05:01.0000000' AS DateTime2), 0, 0, N'$2a$04$hq.udfJenvTnJjgE5rXLK.USx0dCV0ko.8DMjyMsrCDO9bRmQcchW', CAST(N'2024-03-27T07:48:27.0000000' AS DateTime2), N'cnormanville3')
INSERT [LIBRARY].[user] ([id], [created_date], [is_active], [is_deleted], [password], [updated_date], [username]) VALUES (5, CAST(N'2023-09-08T10:21:51.0000000' AS DateTime2), 1, 1, N'$2a$04$x/VOymBRN.DtzD0Oq6nrzOALfren/H6ZXZAYOiNDs4VjpYqIBxwq.', CAST(N'2024-02-14T13:21:41.0000000' AS DateTime2), N'snenci4')
INSERT [LIBRARY].[user] ([id], [created_date], [is_active], [is_deleted], [password], [updated_date], [username]) VALUES (6, CAST(N'2024-01-29T23:11:32.0000000' AS DateTime2), 1, 1, N'$2a$04$R30OFyVrV0jL2kxn02Gq5ejYqiBCX0xnHKgPR0EdpNzIpvGzeGZqy', CAST(N'2024-04-17T18:15:05.0000000' AS DateTime2), N'sharcus5')
INSERT [LIBRARY].[user] ([id], [created_date], [is_active], [is_deleted], [password], [updated_date], [username]) VALUES (7, CAST(N'2023-12-10T08:50:57.0000000' AS DateTime2), 1, 0, N'$2a$04$WVrJ8bH2b2KvwqL0MF6xE.bEkEWIO2HMxnCOR0Tufozq8qwZ5fUhm', CAST(N'2024-03-14T17:26:15.0000000' AS DateTime2), N'anewick6')
INSERT [LIBRARY].[user] ([id], [created_date], [is_active], [is_deleted], [password], [updated_date], [username]) VALUES (8, CAST(N'2024-02-06T06:45:51.0000000' AS DateTime2), 1, 0, N'$2a$04$30FwhkVMGCkgr9c5py4xj.0ucE.G22PaKlazoN/3LAW51zxDV8tYS', CAST(N'2024-04-13T08:45:09.0000000' AS DateTime2), N'rstibbs7')
INSERT [LIBRARY].[user] ([id], [created_date], [is_active], [is_deleted], [password], [updated_date], [username]) VALUES (9, CAST(N'2023-11-05T20:33:41.0000000' AS DateTime2), 0, 0, N'$2a$04$zLF/S9RJjMrt2/wTGmV9ceTViOG5xVQVP6mbKNdMKvXS3jRIa4qiW', CAST(N'2024-04-15T05:58:59.0000000' AS DateTime2), N'aattenborough8')
INSERT [LIBRARY].[user] ([id], [created_date], [is_active], [is_deleted], [password], [updated_date], [username]) VALUES (10, CAST(N'2023-07-14T08:41:38.0000000' AS DateTime2), 0, 1, N'$2a$04$70XG9eLJSNihP8n8KHtKkefAm8YBO.3WzM/mZqhiqre90jNhQjePy', CAST(N'2023-11-17T02:03:26.0000000' AS DateTime2), N'bsharply9')
INSERT [LIBRARY].[user] ([id], [created_date], [is_active], [is_deleted], [password], [updated_date], [username]) VALUES (11, CAST(N'2024-05-19T02:13:20.0000000' AS DateTime2), 0, 1, N'$2a$04$uNuEQjT6xUE4Jp/r05/7UeWN9/sbeZURiV.uft2qXCQ1FIgOw84La', CAST(N'2023-07-28T20:22:52.0000000' AS DateTime2), N'redlinga')
INSERT [LIBRARY].[user] ([id], [created_date], [is_active], [is_deleted], [password], [updated_date], [username]) VALUES (12, CAST(N'2023-11-21T14:18:09.0000000' AS DateTime2), 0, 0, N'$2a$04$6rvnW6ZfQro7mEwcY4JMJ.H8fAb/4XtTR.NE7zRsHGG8/bStCC7aC', CAST(N'2024-04-12T09:47:05.0000000' AS DateTime2), N'arocksb')
INSERT [LIBRARY].[user] ([id], [created_date], [is_active], [is_deleted], [password], [updated_date], [username]) VALUES (13, CAST(N'2023-07-18T08:27:21.0000000' AS DateTime2), 0, 1, N'$2a$04$k.8urf98GAvCgPupUPl3memGodgDmdj9ztehKlPfXXMcLV/93ZrfC', CAST(N'2024-06-20T15:39:00.0000000' AS DateTime2), N'kpraterc')
INSERT [LIBRARY].[user] ([id], [created_date], [is_active], [is_deleted], [password], [updated_date], [username]) VALUES (14, CAST(N'2024-04-04T09:41:26.0000000' AS DateTime2), 0, 0, N'$2a$04$FMKegk/AeQq67962i0zFNeentBj/JHab/ShnbSaGio2GzYmOpxyge', CAST(N'2023-08-16T16:31:58.0000000' AS DateTime2), N'jyated')
INSERT [LIBRARY].[user] ([id], [created_date], [is_active], [is_deleted], [password], [updated_date], [username]) VALUES (15, CAST(N'2024-01-06T06:44:20.0000000' AS DateTime2), 0, 0, N'$2a$04$iZKlTwogqyn5J9NKXRejq.d09vTAc9qvC3G3h5dY1Mj0QJPXlfjrK', CAST(N'2024-05-23T12:51:15.0000000' AS DateTime2), N'mhannigere')
INSERT [LIBRARY].[user] ([id], [created_date], [is_active], [is_deleted], [password], [updated_date], [username]) VALUES (16, CAST(N'2024-03-29T12:24:30.0000000' AS DateTime2), 1, 0, N'$2a$04$tf1d0K9kGrsXsVTZ0T/sC.trYeotWwz5ZFNKvnzItmypXPedTeNAO', CAST(N'2023-10-22T09:58:32.0000000' AS DateTime2), N'aunwinsf')
INSERT [LIBRARY].[user] ([id], [created_date], [is_active], [is_deleted], [password], [updated_date], [username]) VALUES (17, CAST(N'2024-06-13T21:24:05.0000000' AS DateTime2), 0, 0, N'$2a$04$vaCYRCMqogNwBBJZhNadCuqSMd4Z7hMVUc.u.QrR9RE4G362l01YS', CAST(N'2023-09-24T07:22:28.0000000' AS DateTime2), N'nandriulisg')
INSERT [LIBRARY].[user] ([id], [created_date], [is_active], [is_deleted], [password], [updated_date], [username]) VALUES (18, CAST(N'2024-02-09T04:40:27.0000000' AS DateTime2), 0, 0, N'$2a$04$S0IJuBa7N0etHDgg/wS/duzeF6tG3qJi2XMhXU.jx17Rt4h9cswkK', CAST(N'2023-08-06T19:41:17.0000000' AS DateTime2), N'jsweetloveh')
INSERT [LIBRARY].[user] ([id], [created_date], [is_active], [is_deleted], [password], [updated_date], [username]) VALUES (19, CAST(N'2023-11-22T07:43:46.0000000' AS DateTime2), 1, 1, N'$2a$04$URTwHdSv1MDZRyhg3pK1UuyPwsxSJkAJXAzQh1HlvOtd0m3d.tOQi', CAST(N'2024-02-06T20:48:34.0000000' AS DateTime2), N'rmckinnoni')
INSERT [LIBRARY].[user] ([id], [created_date], [is_active], [is_deleted], [password], [updated_date], [username]) VALUES (20, CAST(N'2024-05-09T18:05:19.0000000' AS DateTime2), 1, 0, N'$2a$04$k5NZo267rRELQHtcDlZf9uPtHduaGvWDzm7adLxSosbZNKdHFyqPu', CAST(N'2023-08-03T09:12:18.0000000' AS DateTime2), N'apetrishchevj')
INSERT [LIBRARY].[user] ([id], [created_date], [is_active], [is_deleted], [password], [updated_date], [username]) VALUES (21, CAST(N'2024-07-11T00:19:52.6695420' AS DateTime2), 0, 0, N'$2a$10$tyuNRUG4z7KEa2BrirBnYeAltfA3jtbZ5xs4JD0DMG.9rCwwLYGCe', CAST(N'2024-07-11T01:53:56.6667820' AS DateTime2), N'usernameABCD')
INSERT [LIBRARY].[user] ([id], [created_date], [is_active], [is_deleted], [password], [updated_date], [username]) VALUES (22, CAST(N'2024-07-11T01:12:53.7822160' AS DateTime2), 0, 0, N'$2a$10$6FgXw45aux0L5Rts3PYMIeutpRscFir5EBd7oGcgSe8P.EJeWj.Ba', CAST(N'2024-07-11T02:36:35.4604430' AS DateTime2), N'usernameAlpha')
INSERT [LIBRARY].[user] ([id], [created_date], [is_active], [is_deleted], [password], [updated_date], [username]) VALUES (23, CAST(N'2024-07-11T03:19:29.7119270' AS DateTime2), 0, 0, N'$2a$10$6FgXw45aux0L5Rts3PYMIeutpRscFir5EBd7oGcgSe8P.EJeWj.Ba', CAST(N'2024-07-11T03:19:29.7119270' AS DateTime2), N'user23')
INSERT [LIBRARY].[user] ([id], [created_date], [is_active], [is_deleted], [password], [updated_date], [username]) VALUES (27, CAST(N'2024-07-11T03:21:49.2454810' AS DateTime2), 0, 0, N'$2a$10$YCUMDgSZDg4jFBNt1W852.Dech6/8gzt7Bg1SDXtPeKDqyoEODOle', CAST(N'2024-07-11T03:21:49.2454810' AS DateTime2), N'user24')
SET IDENTITY_INSERT [LIBRARY].[user] OFF
GO
USE [master]
GO
ALTER DATABASE [TESTDB] SET  READ_WRITE 
GO
