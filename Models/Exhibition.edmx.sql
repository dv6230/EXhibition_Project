
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/20/2022 22:59:49
-- Generated from EDMX file: D:\C# project\EXhibition\Models\Exhibition.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Exhibition];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__events__HID__2E1BDC42]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[events] DROP CONSTRAINT [FK__events__HID__2E1BDC42];
GO
IF OBJECT_ID(N'[dbo].[FK__exhibitinf__EVID__31EC6D26]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[exhibitinfo] DROP CONSTRAINT [FK__exhibitinf__EVID__31EC6D26];
GO
IF OBJECT_ID(N'[dbo].[FK__exhibitinfo__EID__32E0915F]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[exhibitinfo] DROP CONSTRAINT [FK__exhibitinfo__EID__32E0915F];
GO
IF OBJECT_ID(N'[dbo].[FK__Tickets__EVID__70DDC3D8]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tickets] DROP CONSTRAINT [FK__Tickets__EVID__70DDC3D8];
GO
IF OBJECT_ID(N'[dbo].[FK__Tickets__UID__71D1E811]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tickets] DROP CONSTRAINT [FK__Tickets__UID__71D1E811];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[events]', 'U') IS NOT NULL
    DROP TABLE [dbo].[events];
GO
IF OBJECT_ID(N'[dbo].[eventTags]', 'U') IS NOT NULL
    DROP TABLE [dbo].[eventTags];
GO
IF OBJECT_ID(N'[dbo].[exhibitinfo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[exhibitinfo];
GO
IF OBJECT_ID(N'[dbo].[exhibitors]', 'U') IS NOT NULL
    DROP TABLE [dbo].[exhibitors];
GO
IF OBJECT_ID(N'[dbo].[forgetPassword]', 'U') IS NOT NULL
    DROP TABLE [dbo].[forgetPassword];
GO
IF OBJECT_ID(N'[dbo].[hosts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[hosts];
GO
IF OBJECT_ID(N'[dbo].[orderDetail]', 'U') IS NOT NULL
    DROP TABLE [dbo].[orderDetail];
GO
IF OBJECT_ID(N'[dbo].[orders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[orders];
GO
IF OBJECT_ID(N'[dbo].[QRCodeLoginToken]', 'U') IS NOT NULL
    DROP TABLE [dbo].[QRCodeLoginToken];
GO
IF OBJECT_ID(N'[dbo].[request_log]', 'U') IS NOT NULL
    DROP TABLE [dbo].[request_log];
GO
IF OBJECT_ID(N'[dbo].[TagsName]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TagsName];
GO
IF OBJECT_ID(N'[dbo].[Tickets]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tickets];
GO
IF OBJECT_ID(N'[dbo].[users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[users];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'events'
CREATE TABLE [dbo].[events] (
    [EVID] int IDENTITY(1,1) NOT NULL,
    [HID] int  NOT NULL,
    [name] nvarchar(50)  NOT NULL,
    [startdate] datetime  NOT NULL,
    [enddate] datetime  NOT NULL,
    [venue] nvarchar(50)  NOT NULL,
    [image] nvarchar(50)  NULL,
    [floorplanimg] nvarchar(50)  NULL,
    [category] nvarchar(50)  NULL,
    [eventinfo] nvarchar(500)  NOT NULL,
    [note] nvarchar(500)  NULL,
    [ticketprice] decimal(19,4)  NOT NULL,
    [verify] bit  NOT NULL,
    [createAt] datetime  NULL
);
GO

-- Creating table 'exhibitinfo'
CREATE TABLE [dbo].[exhibitinfo] (
    [EVID] int  NOT NULL,
    [EID] int  NOT NULL,
    [link] nvarchar(100)  NULL,
    [image] nvarchar(50)  NULL,
    [boothnumber] nvarchar(50)  NULL,
    [productinfo] nvarchar(500)  NULL,
    [status] nvarchar(50)  NULL,
    [verify] bit  NULL,
    [id] int IDENTITY(1,1) NOT NULL,
    [reviewDateTime] datetime  NULL,
    [reason] nvarchar(100)  NULL,
    [createAt] datetime  NULL
);
GO

-- Creating table 'exhibitors'
CREATE TABLE [dbo].[exhibitors] (
    [EID] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(50)  NOT NULL,
    [phone] nvarchar(20)  NOT NULL,
    [email] nvarchar(100)  NOT NULL,
    [link] nvarchar(100)  NOT NULL,
    [password] nchar(64)  NOT NULL,
    [verify] bit  NOT NULL
);
GO

-- Creating table 'hosts'
CREATE TABLE [dbo].[hosts] (
    [HID] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(50)  NOT NULL,
    [phone] nvarchar(20)  NOT NULL,
    [email] nvarchar(100)  NOT NULL,
    [link] nvarchar(100)  NOT NULL,
    [password] nchar(64)  NOT NULL,
    [image] nvarchar(50)  NULL,
    [verify] bit  NOT NULL
);
GO

-- Creating table 'users'
CREATE TABLE [dbo].[users] (
    [UID] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(50)  NOT NULL,
    [phone] nvarchar(20)  NOT NULL,
    [email] nvarchar(100)  NOT NULL,
    [password] nchar(64)  NOT NULL,
    [verify] bit  NOT NULL
);
GO

-- Creating table 'Tickets'
CREATE TABLE [dbo].[Tickets] (
    [TID] int IDENTITY(1,1) NOT NULL,
    [EVID] int  NOT NULL,
    [UID] int  NOT NULL,
    [paid] bit  NOT NULL,
    [passed] bit  NOT NULL,
    [token] nvarchar(100)  NULL,
    [createAt] datetime  NULL,
    [tokenExistenceTime] datetime  NULL
);
GO

-- Creating table 'orderDetail'
CREATE TABLE [dbo].[orderDetail] (
    [id] int IDENTITY(1,1) NOT NULL,
    [orderId] int  NOT NULL,
    [price] int  NULL,
    [ticketId] int  NULL
);
GO

-- Creating table 'QRCodeLoginToken'
CREATE TABLE [dbo].[QRCodeLoginToken] (
    [id] int IDENTITY(1,1) NOT NULL,
    [token] nvarchar(100)  NULL,
    [createAt] datetime  NULL,
    [accountType] nvarchar(50)  NULL,
    [accountId] int  NULL
);
GO

-- Creating table 'eventTags'
CREATE TABLE [dbo].[eventTags] (
    [id] int IDENTITY(1,1) NOT NULL,
    [EVID] int  NOT NULL,
    [tagID] int  NOT NULL
);
GO

-- Creating table 'TagsName'
CREATE TABLE [dbo].[TagsName] (
    [id] int IDENTITY(1,1) NOT NULL,
    [tagName] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'orders'
CREATE TABLE [dbo].[orders] (
    [id] int IDENTITY(1,1) NOT NULL,
    [createDateTime] datetime  NULL,
    [userId] int  NOT NULL,
    [totalPrice] int  NOT NULL,
    [discount] int  NULL,
    [finalPrice] int  NULL,
    [isPay] bit  NULL,
    [paypal_Id] nvarchar(50)  NULL
);
GO

-- Creating table 'forgetPassword'
CREATE TABLE [dbo].[forgetPassword] (
    [id] int IDENTITY(1,1) NOT NULL,
    [email] nvarchar(50)  NULL,
    [uuid] nvarchar(50)  NULL,
    [userType] nvarchar(50)  NULL
);
GO

-- Creating table 'request_log'
CREATE TABLE [dbo].[request_log] (
    [id] int IDENTITY(1,1) NOT NULL,
    [client_ip] nvarchar(50)  NOT NULL,
    [access_time] datetime  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [EVID] in table 'events'
ALTER TABLE [dbo].[events]
ADD CONSTRAINT [PK_events]
    PRIMARY KEY CLUSTERED ([EVID] ASC);
GO

-- Creating primary key on [id] in table 'exhibitinfo'
ALTER TABLE [dbo].[exhibitinfo]
ADD CONSTRAINT [PK_exhibitinfo]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [EID] in table 'exhibitors'
ALTER TABLE [dbo].[exhibitors]
ADD CONSTRAINT [PK_exhibitors]
    PRIMARY KEY CLUSTERED ([EID] ASC);
GO

-- Creating primary key on [HID] in table 'hosts'
ALTER TABLE [dbo].[hosts]
ADD CONSTRAINT [PK_hosts]
    PRIMARY KEY CLUSTERED ([HID] ASC);
GO

-- Creating primary key on [UID] in table 'users'
ALTER TABLE [dbo].[users]
ADD CONSTRAINT [PK_users]
    PRIMARY KEY CLUSTERED ([UID] ASC);
GO

-- Creating primary key on [TID] in table 'Tickets'
ALTER TABLE [dbo].[Tickets]
ADD CONSTRAINT [PK_Tickets]
    PRIMARY KEY CLUSTERED ([TID] ASC);
GO

-- Creating primary key on [id] in table 'orderDetail'
ALTER TABLE [dbo].[orderDetail]
ADD CONSTRAINT [PK_orderDetail]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'QRCodeLoginToken'
ALTER TABLE [dbo].[QRCodeLoginToken]
ADD CONSTRAINT [PK_QRCodeLoginToken]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'eventTags'
ALTER TABLE [dbo].[eventTags]
ADD CONSTRAINT [PK_eventTags]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'TagsName'
ALTER TABLE [dbo].[TagsName]
ADD CONSTRAINT [PK_TagsName]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'orders'
ALTER TABLE [dbo].[orders]
ADD CONSTRAINT [PK_orders]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'forgetPassword'
ALTER TABLE [dbo].[forgetPassword]
ADD CONSTRAINT [PK_forgetPassword]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'request_log'
ALTER TABLE [dbo].[request_log]
ADD CONSTRAINT [PK_request_log]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [HID] in table 'events'
ALTER TABLE [dbo].[events]
ADD CONSTRAINT [FK__events__HID__2E1BDC42]
    FOREIGN KEY ([HID])
    REFERENCES [dbo].[hosts]
        ([HID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__events__HID__2E1BDC42'
CREATE INDEX [IX_FK__events__HID__2E1BDC42]
ON [dbo].[events]
    ([HID]);
GO

-- Creating foreign key on [EVID] in table 'exhibitinfo'
ALTER TABLE [dbo].[exhibitinfo]
ADD CONSTRAINT [FK__exhibitinf__EVID__31EC6D26]
    FOREIGN KEY ([EVID])
    REFERENCES [dbo].[events]
        ([EVID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__exhibitinf__EVID__31EC6D26'
CREATE INDEX [IX_FK__exhibitinf__EVID__31EC6D26]
ON [dbo].[exhibitinfo]
    ([EVID]);
GO

-- Creating foreign key on [EID] in table 'exhibitinfo'
ALTER TABLE [dbo].[exhibitinfo]
ADD CONSTRAINT [FK__exhibitinfo__EID__32E0915F]
    FOREIGN KEY ([EID])
    REFERENCES [dbo].[exhibitors]
        ([EID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__exhibitinfo__EID__32E0915F'
CREATE INDEX [IX_FK__exhibitinfo__EID__32E0915F]
ON [dbo].[exhibitinfo]
    ([EID]);
GO

-- Creating foreign key on [EVID] in table 'Tickets'
ALTER TABLE [dbo].[Tickets]
ADD CONSTRAINT [FK__Tickets__EVID__70DDC3D8]
    FOREIGN KEY ([EVID])
    REFERENCES [dbo].[events]
        ([EVID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Tickets__EVID__70DDC3D8'
CREATE INDEX [IX_FK__Tickets__EVID__70DDC3D8]
ON [dbo].[Tickets]
    ([EVID]);
GO

-- Creating foreign key on [UID] in table 'Tickets'
ALTER TABLE [dbo].[Tickets]
ADD CONSTRAINT [FK__Tickets__UID__71D1E811]
    FOREIGN KEY ([UID])
    REFERENCES [dbo].[users]
        ([UID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Tickets__UID__71D1E811'
CREATE INDEX [IX_FK__Tickets__UID__71D1E811]
ON [dbo].[Tickets]
    ([UID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------