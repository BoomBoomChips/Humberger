USE [master]
GO
/****** Object:  Database [PhoneBook]    Script Date: 08/22/2015 14:04:31 ******/
CREATE DATABASE [PhoneBook] ON  PRIMARY 
( NAME = N'PhoneBook', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\PhoneBook.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PhoneBook_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\PhoneBook_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PhoneBook] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PhoneBook].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PhoneBook] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [PhoneBook] SET ANSI_NULLS OFF
GO
ALTER DATABASE [PhoneBook] SET ANSI_PADDING OFF
GO
ALTER DATABASE [PhoneBook] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [PhoneBook] SET ARITHABORT OFF
GO
ALTER DATABASE [PhoneBook] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [PhoneBook] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [PhoneBook] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [PhoneBook] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [PhoneBook] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [PhoneBook] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [PhoneBook] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [PhoneBook] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [PhoneBook] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [PhoneBook] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [PhoneBook] SET  DISABLE_BROKER
GO
ALTER DATABASE [PhoneBook] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [PhoneBook] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [PhoneBook] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [PhoneBook] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [PhoneBook] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [PhoneBook] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [PhoneBook] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [PhoneBook] SET  READ_WRITE
GO
ALTER DATABASE [PhoneBook] SET RECOVERY FULL
GO
ALTER DATABASE [PhoneBook] SET  MULTI_USER
GO
ALTER DATABASE [PhoneBook] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [PhoneBook] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'PhoneBook', N'ON'
GO
USE [PhoneBook]
GO
/****** Object:  Role [aspnet_ChangeNotification_ReceiveNotificationsOnlyAccess]    Script Date: 08/22/2015 14:04:31 ******/
CREATE ROLE [aspnet_ChangeNotification_ReceiveNotificationsOnlyAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [aspnet_ChangeNotification_ReceiveNotificationsOnlyAccess]    Script Date: 08/22/2015 14:04:31 ******/
CREATE SCHEMA [aspnet_ChangeNotification_ReceiveNotificationsOnlyAccess] AUTHORIZATION [aspnet_ChangeNotification_ReceiveNotificationsOnlyAccess]
GO
/****** Object:  Table [dbo].[AccountInfo]    Script Date: 08/22/2015 14:04:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Account] [nvarchar](64) NULL,
	[AccountName] [nvarchar](50) NULL,
	[Pwd] [nvarchar](50) NULL,
 CONSTRAINT [PK_AccountInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AccountInfo] ON
INSERT [dbo].[AccountInfo] ([ID], [Account], [AccountName], [Pwd]) VALUES (1, N'wl', N'王林', N'E10ADC3949BA59ABBE56E057F20F883E')
SET IDENTITY_INSERT [dbo].[AccountInfo] OFF
/****** Object:  Table [dbo].[GroupInfo]    Script Date: 08/22/2015 14:04:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupInfo](
	[GroupId] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_GroupInfo] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[GroupInfo] ON
INSERT [dbo].[GroupInfo] ([GroupId], [GroupName]) VALUES (1, N'老板')
INSERT [dbo].[GroupInfo] ([GroupId], [GroupName]) VALUES (2, N'朋友')
INSERT [dbo].[GroupInfo] ([GroupId], [GroupName]) VALUES (3, N'亲人')
INSERT [dbo].[GroupInfo] ([GroupId], [GroupName]) VALUES (4, N'同事')
INSERT [dbo].[GroupInfo] ([GroupId], [GroupName]) VALUES (5, N'其他')
INSERT [dbo].[GroupInfo] ([GroupId], [GroupName]) VALUES (209, N'猪八戒')
SET IDENTITY_INSERT [dbo].[GroupInfo] OFF
/****** Object:  Table [dbo].[ContactInGroup]    Script Date: 08/22/2015 14:04:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContactInGroup](
	[Id] [varchar](128) NOT NULL,
	[Account] [nvarchar](64) NOT NULL,
	[GroupNumber] [nvarchar](16) NOT NULL,
	[ContactId] [varchar](128) NOT NULL,
	[IsDelete] [int] NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_ContactInGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_ContactInGroup] ON [dbo].[ContactInGroup] 
(
	[GroupNumber] ASC,
	[ContactId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ContactInGroup_IsDelete] ON [dbo].[ContactInGroup] 
(
	[IsDelete] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[ContactInGroup] ([Id], [Account], [GroupNumber], [ContactId], [IsDelete], [UpdateTime]) VALUES (N'1', N'json', N'A001', N'1', 0, NULL)
INSERT [dbo].[ContactInGroup] ([Id], [Account], [GroupNumber], [ContactId], [IsDelete], [UpdateTime]) VALUES (N'2', N'json', N'A001', N'2', 0, NULL)
/****** Object:  Table [dbo].[ContactInfo]    Script Date: 08/22/2015 14:04:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ContactId] [nvarchar](128) NOT NULL,
	[IsDelete] [int] NOT NULL,
	[Account] [nvarchar](64) NOT NULL,
	[ContactName] [nvarchar](50) NOT NULL,
	[CommonMobile] [nvarchar](50) NULL,
	[HeadPortrait] [nvarchar](256) NULL,
	[AttFile] [nvarchar](256) NULL,
	[GroupId] [int] NULL,
 CONSTRAINT [PK_ContactInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_GroupInfoId] ON [dbo].[ContactInfo] 
(
	[GroupId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ContactInfo] ON
INSERT [dbo].[ContactInfo] ([ID], [ContactId], [IsDelete], [Account], [ContactName], [CommonMobile], [HeadPortrait], [AttFile], [GroupId]) VALUES (2, N'a0002', 1, N'wl11111', N'史玉柱<脑白金>', N'138999999983232', N'3a5abdda-3f64-4b22-8c0c-f7f649a83488.gif', N'1.AVI', 2)
INSERT [dbo].[ContactInfo] ([ID], [ContactId], [IsDelete], [Account], [ContactName], [CommonMobile], [HeadPortrait], [AttFile], [GroupId]) VALUES (6, N'a0003', 1, N'wl', N'楼上太对', N'13888888888888888', N'13f028e0-b536-4159-8ed9-2ff41a1444a1.jpg', N'shiyuzhu.txt', 209)
INSERT [dbo].[ContactInfo] ([ID], [ContactId], [IsDelete], [Account], [ContactName], [CommonMobile], [HeadPortrait], [AttFile], [GroupId]) VALUES (8, N'a0003', 0, N'wl', N'李天一', N'13899999998', N'6e912458-6d59-4ad7-a68d-886d529c6b5a.jpg', N'shiyuzhu.txt', 5)
INSERT [dbo].[ContactInfo] ([ID], [ContactId], [IsDelete], [Account], [ContactName], [CommonMobile], [HeadPortrait], [AttFile], [GroupId]) VALUES (9, N'a0003', 0, N'wl', N'李刚是我爸', N'13899999998', N'1bfdf6d4-75f3-4bf7-8c10-c0594d2c8580.jpg', N'mahuateng.txt', 1)
INSERT [dbo].[ContactInfo] ([ID], [ContactId], [IsDelete], [Account], [ContactName], [CommonMobile], [HeadPortrait], [AttFile], [GroupId]) VALUES (10, N'a0003', 0, N'wl', N'csdn老总', N'110', N'7f52b778-ac66-43a1-a50b-6b0e54524c1d.jpg', N'mahuateng.txt', 209)
INSERT [dbo].[ContactInfo] ([ID], [ContactId], [IsDelete], [Account], [ContactName], [CommonMobile], [HeadPortrait], [AttFile], [GroupId]) VALUES (11, N'a00034', 0, N'wl', N'电话号码', N'13899999998', N'20130903151439_a0003.png', N'mahuateng.txt', 2)
INSERT [dbo].[ContactInfo] ([ID], [ContactId], [IsDelete], [Account], [ContactName], [CommonMobile], [HeadPortrait], [AttFile], [GroupId]) VALUES (12, N'a0003', 0, N'wl', N'这就是爱情', N'13899999998', N'20130903151439_a0003.png', N'mahuateng.txt', 1)
INSERT [dbo].[ContactInfo] ([ID], [ContactId], [IsDelete], [Account], [ContactName], [CommonMobile], [HeadPortrait], [AttFile], [GroupId]) VALUES (13, N'a0003', 0, N'wl', N'因为爱情所以你悲伤', N'13899999998', N'20130903151439_a0003.png', N'mahuateng.txt', 2)
INSERT [dbo].[ContactInfo] ([ID], [ContactId], [IsDelete], [Account], [ContactName], [CommonMobile], [HeadPortrait], [AttFile], [GroupId]) VALUES (16, N'a0001', 0, N'Wl', N'小蛮腰2222', N'13899999999', N'', N'', 5)
INSERT [dbo].[ContactInfo] ([ID], [ContactId], [IsDelete], [Account], [ContactName], [CommonMobile], [HeadPortrait], [AttFile], [GroupId]) VALUES (17, N'1111e', 0, N'wl', N'水桶腰111', N'110', N'11', N'11', 2)
INSERT [dbo].[ContactInfo] ([ID], [ContactId], [IsDelete], [Account], [ContactName], [CommonMobile], [HeadPortrait], [AttFile], [GroupId]) VALUES (18, N'11111', 0, N'wl', N'我的楼下', N'100', N'', N'', 2)
INSERT [dbo].[ContactInfo] ([ID], [ContactId], [IsDelete], [Account], [ContactName], [CommonMobile], [HeadPortrait], [AttFile], [GroupId]) VALUES (19, N'11111', 1, N'wl', N'吉泽明步', N'119', N'', N'', 2)
INSERT [dbo].[ContactInfo] ([ID], [ContactId], [IsDelete], [Account], [ContactName], [CommonMobile], [HeadPortrait], [AttFile], [GroupId]) VALUES (21, N'11111', 0, N'11111', N'11111', N'11111', N'', N'', 209)
INSERT [dbo].[ContactInfo] ([ID], [ContactId], [IsDelete], [Account], [ContactName], [CommonMobile], [HeadPortrait], [AttFile], [GroupId]) VALUES (22, N'a0003', 0, N'wl', N'奥巴马', N'911', NULL, NULL, 1)
INSERT [dbo].[ContactInfo] ([ID], [ContactId], [IsDelete], [Account], [ContactName], [CommonMobile], [HeadPortrait], [AttFile], [GroupId]) VALUES (23, N'a0002', 0, N'wl', N'李刚', N'110', N'', N'asdf', 2)
INSERT [dbo].[ContactInfo] ([ID], [ContactId], [IsDelete], [Account], [ContactName], [CommonMobile], [HeadPortrait], [AttFile], [GroupId]) VALUES (24, N'a0002', 0, N'wl', N'你好啊', N'1380909438', N'', N'asdf', 2)
INSERT [dbo].[ContactInfo] ([ID], [ContactId], [IsDelete], [Account], [ContactName], [CommonMobile], [HeadPortrait], [AttFile], [GroupId]) VALUES (26, N'a123', 1, N'wl', N'hollow', N'123', N'12312', N'adad', NULL)
SET IDENTITY_INSERT [dbo].[ContactInfo] OFF
/****** Object:  Default [DF_ContactInGroup_IsDelete]    Script Date: 08/22/2015 14:04:31 ******/
ALTER TABLE [dbo].[ContactInGroup] ADD  CONSTRAINT [DF_ContactInGroup_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
/****** Object:  Default [DF_Contact_IsDelete]    Script Date: 08/22/2015 14:04:31 ******/
ALTER TABLE [dbo].[ContactInfo] ADD  CONSTRAINT [DF_Contact_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
/****** Object:  ForeignKey [FK_ContactInfo_GroupInfo]    Script Date: 08/22/2015 14:04:31 ******/
ALTER TABLE [dbo].[ContactInfo]  WITH CHECK ADD  CONSTRAINT [FK_ContactInfo_GroupInfo] FOREIGN KEY([GroupId])
REFERENCES [dbo].[GroupInfo] ([GroupId])
GO
ALTER TABLE [dbo].[ContactInfo] CHECK CONSTRAINT [FK_ContactInfo_GroupInfo]
GO
