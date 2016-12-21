/*
Navicat SQL Server Data Transfer

Source Server         : 1
Source Server Version : 110000
Source Host           : 121.40.49.128:1433
Source Database       : bookdb
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 110000
File Encoding         : 65001

Date: 2016-12-21 23:06:45
*/


-- ----------------------------
-- Table structure for S_Admin
-- ----------------------------
DROP TABLE [dbo].[S_Admin]
GO
CREATE TABLE [dbo].[S_Admin] (
[id] int NOT NULL IDENTITY(1,1) ,
[name] nvarchar(50) NOT NULL ,
[pwd] nvarchar(50) NOT NULL 
)


GO

-- ----------------------------
-- Records of S_Admin
-- ----------------------------
SET IDENTITY_INSERT [dbo].[S_Admin] ON
GO
INSERT INTO [dbo].[S_Admin] ([id], [name], [pwd]) VALUES (N'1', N'admin', N'admin')
GO
GO
SET IDENTITY_INSERT [dbo].[S_Admin] OFF
GO

-- ----------------------------
-- Table structure for S_Book
-- ----------------------------
DROP TABLE [dbo].[S_Book]
GO
CREATE TABLE [dbo].[S_Book] (
[id] int NOT NULL IDENTITY(1,1) ,
[name] nvarchar(50) NOT NULL ,
[author] nvarchar(50) NOT NULL ,
[type_id] int NOT NULL ,
[shelf_id] int NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[S_Book]', RESEED, 4)
GO

-- ----------------------------
-- Records of S_Book
-- ----------------------------
SET IDENTITY_INSERT [dbo].[S_Book] ON
GO
INSERT INTO [dbo].[S_Book] ([id], [name], [author], [type_id], [shelf_id]) VALUES (N'1', N'LOL补兵与守塔技巧', N'谭浩强', N'1', N'1')
GO
GO
INSERT INTO [dbo].[S_Book] ([id], [name], [author], [type_id], [shelf_id]) VALUES (N'2', N'塔下反杀方法论', N'盖伦', N'2', N'1')
GO
GO
INSERT INTO [dbo].[S_Book] ([id], [name], [author], [type_id], [shelf_id]) VALUES (N'3', N'测试', N'123', N'1', N'1')
GO
GO
INSERT INTO [dbo].[S_Book] ([id], [name], [author], [type_id], [shelf_id]) VALUES (N'4', N'测试2', N'123', N'2', N'1')
GO
GO
SET IDENTITY_INSERT [dbo].[S_Book] OFF
GO

-- ----------------------------
-- Table structure for S_BookShelf
-- ----------------------------
DROP TABLE [dbo].[S_BookShelf]
GO
CREATE TABLE [dbo].[S_BookShelf] (
[id] int NOT NULL IDENTITY(1,1) ,
[name] nvarchar(50) NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[S_BookShelf]', RESEED, 3)
GO

-- ----------------------------
-- Records of S_BookShelf
-- ----------------------------
SET IDENTITY_INSERT [dbo].[S_BookShelf] ON
GO
INSERT INTO [dbo].[S_BookShelf] ([id], [name]) VALUES (N'1', N'T138-1')
GO
GO
INSERT INTO [dbo].[S_BookShelf] ([id], [name]) VALUES (N'3', N'T145-21')
GO
GO
SET IDENTITY_INSERT [dbo].[S_BookShelf] OFF
GO

-- ----------------------------
-- Table structure for S_BookType
-- ----------------------------
DROP TABLE [dbo].[S_BookType]
GO
CREATE TABLE [dbo].[S_BookType] (
[id] int NOT NULL IDENTITY(1,1) ,
[name] nvarchar(50) NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[S_BookType]', RESEED, 8)
GO

-- ----------------------------
-- Records of S_BookType
-- ----------------------------
SET IDENTITY_INSERT [dbo].[S_BookType] ON
GO
INSERT INTO [dbo].[S_BookType] ([id], [name]) VALUES (N'1', N'计算机科学')
GO
GO
INSERT INTO [dbo].[S_BookType] ([id], [name]) VALUES (N'2', N'数学')
GO
GO
INSERT INTO [dbo].[S_BookType] ([id], [name]) VALUES (N'6', N'测试')
GO
GO
SET IDENTITY_INSERT [dbo].[S_BookType] OFF
GO

-- ----------------------------
-- Table structure for S_Person
-- ----------------------------
DROP TABLE [dbo].[S_Person]
GO
CREATE TABLE [dbo].[S_Person] (
[id] int NOT NULL IDENTITY(1,1) ,
[name] nchar(10) NOT NULL ,
[phone] nvarchar(13) NOT NULL ,
[power_id] int NOT NULL 
)


GO

-- ----------------------------
-- Records of S_Person
-- ----------------------------
SET IDENTITY_INSERT [dbo].[S_Person] ON
GO
INSERT INTO [dbo].[S_Person] ([id], [name], [phone], [power_id]) VALUES (N'1', N'拉克丝       ', N'13000000000', N'2')
GO
GO
SET IDENTITY_INSERT [dbo].[S_Person] OFF
GO

-- ----------------------------
-- Table structure for S_Power
-- ----------------------------
DROP TABLE [dbo].[S_Power]
GO
CREATE TABLE [dbo].[S_Power] (
[id] int NOT NULL IDENTITY(1,1) ,
[name] nvarchar(50) NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[S_Power]', RESEED, 3)
GO

-- ----------------------------
-- Records of S_Power
-- ----------------------------
SET IDENTITY_INSERT [dbo].[S_Power] ON
GO
INSERT INTO [dbo].[S_Power] ([id], [name]) VALUES (N'1', N'老师')
GO
GO
INSERT INTO [dbo].[S_Power] ([id], [name]) VALUES (N'2', N'学生')
GO
GO
INSERT INTO [dbo].[S_Power] ([id], [name]) VALUES (N'3', N'职工')
GO
GO
SET IDENTITY_INSERT [dbo].[S_Power] OFF
GO

-- ----------------------------
-- Table structure for S_Record
-- ----------------------------
DROP TABLE [dbo].[S_Record]
GO
CREATE TABLE [dbo].[S_Record] (
[id] int NOT NULL IDENTITY(1,1) ,
[dtime] datetime NOT NULL ,
[reader_id] int NOT NULL ,
[book_id] int NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[S_Record]', RESEED, 2)
GO

-- ----------------------------
-- Records of S_Record
-- ----------------------------
SET IDENTITY_INSERT [dbo].[S_Record] ON
GO
INSERT INTO [dbo].[S_Record] ([id], [dtime], [reader_id], [book_id]) VALUES (N'1', N'2016-12-21 22:37:52.000', N'1', N'1')
GO
GO
INSERT INTO [dbo].[S_Record] ([id], [dtime], [reader_id], [book_id]) VALUES (N'2', N'2016-12-21 23:06:04.920', N'1', N'1')
GO
GO
SET IDENTITY_INSERT [dbo].[S_Record] OFF
GO

-- ----------------------------
-- Indexes structure for table S_Admin
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table S_Admin
-- ----------------------------
ALTER TABLE [dbo].[S_Admin] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table S_Book
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table S_Book
-- ----------------------------
ALTER TABLE [dbo].[S_Book] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table S_BookShelf
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table S_BookShelf
-- ----------------------------
ALTER TABLE [dbo].[S_BookShelf] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table S_BookType
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table S_BookType
-- ----------------------------
ALTER TABLE [dbo].[S_BookType] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table S_Person
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table S_Person
-- ----------------------------
ALTER TABLE [dbo].[S_Person] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table S_Power
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table S_Power
-- ----------------------------
ALTER TABLE [dbo].[S_Power] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table S_Record
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table S_Record
-- ----------------------------
ALTER TABLE [dbo].[S_Record] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[S_Book]
-- ----------------------------
ALTER TABLE [dbo].[S_Book] ADD FOREIGN KEY ([shelf_id]) REFERENCES [dbo].[S_BookShelf] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[S_Book] ADD FOREIGN KEY ([type_id]) REFERENCES [dbo].[S_BookType] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[S_Person]
-- ----------------------------
ALTER TABLE [dbo].[S_Person] ADD FOREIGN KEY ([power_id]) REFERENCES [dbo].[S_Power] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[S_Record]
-- ----------------------------
ALTER TABLE [dbo].[S_Record] ADD FOREIGN KEY ([book_id]) REFERENCES [dbo].[S_Book] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[S_Record] ADD FOREIGN KEY ([reader_id]) REFERENCES [dbo].[S_Person] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
GO
