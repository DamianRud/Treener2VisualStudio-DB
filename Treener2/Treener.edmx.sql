
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/13/2026 08:50:58
-- Generated from EDMX file: C:\Users\opilane\source\repos\Treener2\Treener2\Treener.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Treener2];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_SpordiLiikmeTreeniregistrerimine]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TreeniregistrerimineSet1] DROP CONSTRAINT [FK_SpordiLiikmeTreeniregistrerimine];
GO
IF OBJECT_ID(N'[dbo].[FK_SpordiLiikmeLiikvoistluses]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LiikvoistlusesSet] DROP CONSTRAINT [FK_SpordiLiikmeLiikvoistluses];
GO
IF OBJECT_ID(N'[dbo].[FK_VoistlusLiikvoistluses]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LiikvoistlusesSet] DROP CONSTRAINT [FK_VoistlusLiikvoistluses];
GO
IF OBJECT_ID(N'[dbo].[FK_SaalTreening]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TreeningSet] DROP CONSTRAINT [FK_SaalTreening];
GO
IF OBJECT_ID(N'[dbo].[FK_TreenerTreening]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TreeningSet] DROP CONSTRAINT [FK_TreenerTreening];
GO
IF OBJECT_ID(N'[dbo].[FK_TreeningTreeniregistrerimine]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TreeniregistrerimineSet1] DROP CONSTRAINT [FK_TreeningTreeniregistrerimine];
GO
IF OBJECT_ID(N'[dbo].[FK_SpordiLiikmeLiikmelisusePaketti]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LiikmelisusePakettiSet] DROP CONSTRAINT [FK_SpordiLiikmeLiikmelisusePaketti];
GO
IF OBJECT_ID(N'[dbo].[FK_SpordiLiikmeLiikvoistluses1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LiikvoistlusesSet] DROP CONSTRAINT [FK_SpordiLiikmeLiikvoistluses1];
GO
IF OBJECT_ID(N'[dbo].[FK_SpordialaVoistlus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[VoistlusSet] DROP CONSTRAINT [FK_SpordialaVoistlus];
GO
IF OBJECT_ID(N'[dbo].[FK_LiikvoistlusesOsalemine]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OsalemineSet] DROP CONSTRAINT [FK_LiikvoistlusesOsalemine];
GO
IF OBJECT_ID(N'[dbo].[FK_ToodeIDOst]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OstSet] DROP CONSTRAINT [FK_ToodeIDOst];
GO
IF OBJECT_ID(N'[dbo].[FK_OstOstuRida]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OstuRidaSet] DROP CONSTRAINT [FK_OstOstuRida];
GO
IF OBJECT_ID(N'[dbo].[FK_ToodeIDOstuRida]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OstuRidaSet] DROP CONSTRAINT [FK_ToodeIDOstuRida];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[SpordiLiikmeSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SpordiLiikmeSet];
GO
IF OBJECT_ID(N'[dbo].[VoistlusSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[VoistlusSet];
GO
IF OBJECT_ID(N'[dbo].[TreeniregistrerimineSet1]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TreeniregistrerimineSet1];
GO
IF OBJECT_ID(N'[dbo].[LiikmelisusePakettiSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LiikmelisusePakettiSet];
GO
IF OBJECT_ID(N'[dbo].[TreenerSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TreenerSet];
GO
IF OBJECT_ID(N'[dbo].[TreeningSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TreeningSet];
GO
IF OBJECT_ID(N'[dbo].[SaalSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SaalSet];
GO
IF OBJECT_ID(N'[dbo].[LiikvoistlusesSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LiikvoistlusesSet];
GO
IF OBJECT_ID(N'[dbo].[SpordialaSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SpordialaSet];
GO
IF OBJECT_ID(N'[dbo].[OsalemineSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OsalemineSet];
GO
IF OBJECT_ID(N'[dbo].[ToodeIDSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ToodeIDSet];
GO
IF OBJECT_ID(N'[dbo].[OstSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OstSet];
GO
IF OBJECT_ID(N'[dbo].[OstuRidaSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OstuRidaSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'SpordiLiikmeSet'
CREATE TABLE [dbo].[SpordiLiikmeSet] (
    [LiikID] int IDENTITY(1,1) NOT NULL,
    [eesnimi] nvarchar(max)  NOT NULL,
    [perekonnanimi] nvarchar(max)  NOT NULL,
    [sunniaeg] datetime  NULL,
    [epost] nvarchar(max)  NULL,
    [telefonnumber] nvarchar(max)  NULL
);
GO

-- Creating table 'VoistlusSet'
CREATE TABLE [dbo].[VoistlusSet] (
    [VoistlusID] int IDENTITY(1,1) NOT NULL,
    [nimi] nvarchar(max)  NOT NULL,
    [kuupaev] datetime  NOT NULL,
    [asukoht] nvarchar(max)  NULL,
    [kirjeldus] nvarchar(max)  NULL,
    [SpordialaID] int  NOT NULL,
    [Spordiala_SpordialaID] int  NOT NULL
);
GO

-- Creating table 'TreeniregistrerimineSet1'
CREATE TABLE [dbo].[TreeniregistrerimineSet1] (
    [RegistrerimineID] int IDENTITY(1,1) NOT NULL,
    [LiikID] int  NOT NULL,
    [TreeningID] int  NOT NULL,
    [registreriminekuupaev] datetime  NOT NULL,
    [Status] nvarchar(max)  NOT NULL,
    [SpordiLiikme_LiikID] int  NOT NULL,
    [Treening_TreeningID] int  NOT NULL
);
GO

-- Creating table 'LiikmelisusePakettiSet'
CREATE TABLE [dbo].[LiikmelisusePakettiSet] (
    [PaketID] int IDENTITY(1,1) NOT NULL,
    [nimi] nvarchar(max)  NULL,
    [kuutasu] decimal(18,2)  NOT NULL,
    [kirjeldus] nvarchar(max)  NULL,
    [LiikID] int  NOT NULL,
    [SpordiLiikme_LiikID] int  NOT NULL
);
GO

-- Creating table 'TreenerSet'
CREATE TABLE [dbo].[TreenerSet] (
    [TreenerID] int IDENTITY(1,1) NOT NULL,
    [nimi] nvarchar(max)  NOT NULL,
    [epost] nvarchar(max)  NULL,
    [telefon] nvarchar(max)  NULL,
    [eriala] nvarchar(max)  NULL
);
GO

-- Creating table 'TreeningSet'
CREATE TABLE [dbo].[TreeningSet] (
    [TreeningID] int IDENTITY(1,1) NOT NULL,
    [nimi] nvarchar(max)  NOT NULL,
    [kirjeldus] nvarchar(max)  NULL,
    [kestus] nvarchar(max)  NULL,
    [raskustate] nvarchar(max)  NULL,
    [aeg] time  NOT NULL,
    [SaalID] int  NOT NULL,
    [TreenerID] int  NULL,
    [Saal_SaalID] int  NOT NULL,
    [Treener_TreenerID] int  NOT NULL
);
GO

-- Creating table 'SaalSet'
CREATE TABLE [dbo].[SaalSet] (
    [SaalID] int IDENTITY(1,1) NOT NULL,
    [number] nvarchar(max)  NOT NULL,
    [nimi] nvarchar(max)  NULL,
    [maksimalnemahutus] int  NOT NULL
);
GO

-- Creating table 'LiikvoistlusesSet'
CREATE TABLE [dbo].[LiikvoistlusesSet] (
    [LiikvoistlusedID] int IDENTITY(1,1) NOT NULL,
    [LiikID] int  NOT NULL,
    [VoistlusID] int  NOT NULL,
    [SpordiLiikme_LiikID] int  NOT NULL,
    [Voistlus_VoistlusID] int  NOT NULL,
    [SpordiLiikme1_LiikID] int  NOT NULL
);
GO

-- Creating table 'SpordialaSet'
CREATE TABLE [dbo].[SpordialaSet] (
    [SpordialaID] int IDENTITY(1,1) NOT NULL,
    [nimi] nvarchar(max)  NOT NULL,
    [kirjeldus] nvarchar(max)  NULL
);
GO

-- Creating table 'OsalemineSet'
CREATE TABLE [dbo].[OsalemineSet] (
    [OsalemineID] int IDENTITY(1,1) NOT NULL,
    [LiikvõistlusedID] int  NOT NULL,
    [tulemus] nvarchar(max)  NULL,
    [koht] nvarchar(max)  NULL,
    [Liikvoistluses_LiikvoistlusedID] int  NOT NULL
);
GO

-- Creating table 'ToodeIDSet'
CREATE TABLE [dbo].[ToodeIDSet] (
    [ToodeId] int IDENTITY(1,1) NOT NULL,
    [nimi] nvarchar(max)  NOT NULL,
    [hind] decimal(18,2)  NOT NULL,
    [kirjeldus] nvarchar(max)  NULL,
    [laoseis] int  NOT NULL
);
GO

-- Creating table 'OstSet'
CREATE TABLE [dbo].[OstSet] (
    [OstID] int IDENTITY(1,1) NOT NULL,
    [LiikID] int  NOT NULL,
    [ToodeID] int  NOT NULL,
    [kuupaev] datetime  NOT NULL,
    [kogus] int  NOT NULL,
    [ToodeID1_ToodeId] int  NOT NULL
);
GO

-- Creating table 'OstuRidaSet'
CREATE TABLE [dbo].[OstuRidaSet] (
    [OsturidaID] int IDENTITY(1,1) NOT NULL,
    [OstID] int  NOT NULL,
    [ToodeID] int  NOT NULL,
    [kogus] int  NOT NULL,
    [Ost_OstID] int  NOT NULL,
    [ToodeID1_ToodeId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [LiikID] in table 'SpordiLiikmeSet'
ALTER TABLE [dbo].[SpordiLiikmeSet]
ADD CONSTRAINT [PK_SpordiLiikmeSet]
    PRIMARY KEY CLUSTERED ([LiikID] ASC);
GO

-- Creating primary key on [VoistlusID] in table 'VoistlusSet'
ALTER TABLE [dbo].[VoistlusSet]
ADD CONSTRAINT [PK_VoistlusSet]
    PRIMARY KEY CLUSTERED ([VoistlusID] ASC);
GO

-- Creating primary key on [RegistrerimineID] in table 'TreeniregistrerimineSet1'
ALTER TABLE [dbo].[TreeniregistrerimineSet1]
ADD CONSTRAINT [PK_TreeniregistrerimineSet1]
    PRIMARY KEY CLUSTERED ([RegistrerimineID] ASC);
GO

-- Creating primary key on [PaketID] in table 'LiikmelisusePakettiSet'
ALTER TABLE [dbo].[LiikmelisusePakettiSet]
ADD CONSTRAINT [PK_LiikmelisusePakettiSet]
    PRIMARY KEY CLUSTERED ([PaketID] ASC);
GO

-- Creating primary key on [TreenerID] in table 'TreenerSet'
ALTER TABLE [dbo].[TreenerSet]
ADD CONSTRAINT [PK_TreenerSet]
    PRIMARY KEY CLUSTERED ([TreenerID] ASC);
GO

-- Creating primary key on [TreeningID] in table 'TreeningSet'
ALTER TABLE [dbo].[TreeningSet]
ADD CONSTRAINT [PK_TreeningSet]
    PRIMARY KEY CLUSTERED ([TreeningID] ASC);
GO

-- Creating primary key on [SaalID] in table 'SaalSet'
ALTER TABLE [dbo].[SaalSet]
ADD CONSTRAINT [PK_SaalSet]
    PRIMARY KEY CLUSTERED ([SaalID] ASC);
GO

-- Creating primary key on [LiikvoistlusedID] in table 'LiikvoistlusesSet'
ALTER TABLE [dbo].[LiikvoistlusesSet]
ADD CONSTRAINT [PK_LiikvoistlusesSet]
    PRIMARY KEY CLUSTERED ([LiikvoistlusedID] ASC);
GO

-- Creating primary key on [SpordialaID] in table 'SpordialaSet'
ALTER TABLE [dbo].[SpordialaSet]
ADD CONSTRAINT [PK_SpordialaSet]
    PRIMARY KEY CLUSTERED ([SpordialaID] ASC);
GO

-- Creating primary key on [OsalemineID] in table 'OsalemineSet'
ALTER TABLE [dbo].[OsalemineSet]
ADD CONSTRAINT [PK_OsalemineSet]
    PRIMARY KEY CLUSTERED ([OsalemineID] ASC);
GO

-- Creating primary key on [ToodeId] in table 'ToodeIDSet'
ALTER TABLE [dbo].[ToodeIDSet]
ADD CONSTRAINT [PK_ToodeIDSet]
    PRIMARY KEY CLUSTERED ([ToodeId] ASC);
GO

-- Creating primary key on [OstID] in table 'OstSet'
ALTER TABLE [dbo].[OstSet]
ADD CONSTRAINT [PK_OstSet]
    PRIMARY KEY CLUSTERED ([OstID] ASC);
GO

-- Creating primary key on [OsturidaID] in table 'OstuRidaSet'
ALTER TABLE [dbo].[OstuRidaSet]
ADD CONSTRAINT [PK_OstuRidaSet]
    PRIMARY KEY CLUSTERED ([OsturidaID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [SpordiLiikme_LiikID] in table 'TreeniregistrerimineSet1'
ALTER TABLE [dbo].[TreeniregistrerimineSet1]
ADD CONSTRAINT [FK_SpordiLiikmeTreeniregistrerimine]
    FOREIGN KEY ([SpordiLiikme_LiikID])
    REFERENCES [dbo].[SpordiLiikmeSet]
        ([LiikID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SpordiLiikmeTreeniregistrerimine'
CREATE INDEX [IX_FK_SpordiLiikmeTreeniregistrerimine]
ON [dbo].[TreeniregistrerimineSet1]
    ([SpordiLiikme_LiikID]);
GO

-- Creating foreign key on [SpordiLiikme_LiikID] in table 'LiikvoistlusesSet'
ALTER TABLE [dbo].[LiikvoistlusesSet]
ADD CONSTRAINT [FK_SpordiLiikmeLiikvoistluses]
    FOREIGN KEY ([SpordiLiikme_LiikID])
    REFERENCES [dbo].[SpordiLiikmeSet]
        ([LiikID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SpordiLiikmeLiikvoistluses'
CREATE INDEX [IX_FK_SpordiLiikmeLiikvoistluses]
ON [dbo].[LiikvoistlusesSet]
    ([SpordiLiikme_LiikID]);
GO

-- Creating foreign key on [Voistlus_VoistlusID] in table 'LiikvoistlusesSet'
ALTER TABLE [dbo].[LiikvoistlusesSet]
ADD CONSTRAINT [FK_VoistlusLiikvoistluses]
    FOREIGN KEY ([Voistlus_VoistlusID])
    REFERENCES [dbo].[VoistlusSet]
        ([VoistlusID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_VoistlusLiikvoistluses'
CREATE INDEX [IX_FK_VoistlusLiikvoistluses]
ON [dbo].[LiikvoistlusesSet]
    ([Voistlus_VoistlusID]);
GO

-- Creating foreign key on [Saal_SaalID] in table 'TreeningSet'
ALTER TABLE [dbo].[TreeningSet]
ADD CONSTRAINT [FK_SaalTreening]
    FOREIGN KEY ([Saal_SaalID])
    REFERENCES [dbo].[SaalSet]
        ([SaalID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SaalTreening'
CREATE INDEX [IX_FK_SaalTreening]
ON [dbo].[TreeningSet]
    ([Saal_SaalID]);
GO

-- Creating foreign key on [Treener_TreenerID] in table 'TreeningSet'
ALTER TABLE [dbo].[TreeningSet]
ADD CONSTRAINT [FK_TreenerTreening]
    FOREIGN KEY ([Treener_TreenerID])
    REFERENCES [dbo].[TreenerSet]
        ([TreenerID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TreenerTreening'
CREATE INDEX [IX_FK_TreenerTreening]
ON [dbo].[TreeningSet]
    ([Treener_TreenerID]);
GO

-- Creating foreign key on [Treening_TreeningID] in table 'TreeniregistrerimineSet1'
ALTER TABLE [dbo].[TreeniregistrerimineSet1]
ADD CONSTRAINT [FK_TreeningTreeniregistrerimine]
    FOREIGN KEY ([Treening_TreeningID])
    REFERENCES [dbo].[TreeningSet]
        ([TreeningID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TreeningTreeniregistrerimine'
CREATE INDEX [IX_FK_TreeningTreeniregistrerimine]
ON [dbo].[TreeniregistrerimineSet1]
    ([Treening_TreeningID]);
GO

-- Creating foreign key on [SpordiLiikme_LiikID] in table 'LiikmelisusePakettiSet'
ALTER TABLE [dbo].[LiikmelisusePakettiSet]
ADD CONSTRAINT [FK_SpordiLiikmeLiikmelisusePaketti]
    FOREIGN KEY ([SpordiLiikme_LiikID])
    REFERENCES [dbo].[SpordiLiikmeSet]
        ([LiikID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SpordiLiikmeLiikmelisusePaketti'
CREATE INDEX [IX_FK_SpordiLiikmeLiikmelisusePaketti]
ON [dbo].[LiikmelisusePakettiSet]
    ([SpordiLiikme_LiikID]);
GO

-- Creating foreign key on [SpordiLiikme1_LiikID] in table 'LiikvoistlusesSet'
ALTER TABLE [dbo].[LiikvoistlusesSet]
ADD CONSTRAINT [FK_SpordiLiikmeLiikvoistluses1]
    FOREIGN KEY ([SpordiLiikme1_LiikID])
    REFERENCES [dbo].[SpordiLiikmeSet]
        ([LiikID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SpordiLiikmeLiikvoistluses1'
CREATE INDEX [IX_FK_SpordiLiikmeLiikvoistluses1]
ON [dbo].[LiikvoistlusesSet]
    ([SpordiLiikme1_LiikID]);
GO

-- Creating foreign key on [Spordiala_SpordialaID] in table 'VoistlusSet'
ALTER TABLE [dbo].[VoistlusSet]
ADD CONSTRAINT [FK_SpordialaVoistlus]
    FOREIGN KEY ([Spordiala_SpordialaID])
    REFERENCES [dbo].[SpordialaSet]
        ([SpordialaID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SpordialaVoistlus'
CREATE INDEX [IX_FK_SpordialaVoistlus]
ON [dbo].[VoistlusSet]
    ([Spordiala_SpordialaID]);
GO

-- Creating foreign key on [Liikvoistluses_LiikvoistlusedID] in table 'OsalemineSet'
ALTER TABLE [dbo].[OsalemineSet]
ADD CONSTRAINT [FK_LiikvoistlusesOsalemine]
    FOREIGN KEY ([Liikvoistluses_LiikvoistlusedID])
    REFERENCES [dbo].[LiikvoistlusesSet]
        ([LiikvoistlusedID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LiikvoistlusesOsalemine'
CREATE INDEX [IX_FK_LiikvoistlusesOsalemine]
ON [dbo].[OsalemineSet]
    ([Liikvoistluses_LiikvoistlusedID]);
GO

-- Creating foreign key on [ToodeID1_ToodeId] in table 'OstSet'
ALTER TABLE [dbo].[OstSet]
ADD CONSTRAINT [FK_ToodeIDOst]
    FOREIGN KEY ([ToodeID1_ToodeId])
    REFERENCES [dbo].[ToodeIDSet]
        ([ToodeId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ToodeIDOst'
CREATE INDEX [IX_FK_ToodeIDOst]
ON [dbo].[OstSet]
    ([ToodeID1_ToodeId]);
GO

-- Creating foreign key on [Ost_OstID] in table 'OstuRidaSet'
ALTER TABLE [dbo].[OstuRidaSet]
ADD CONSTRAINT [FK_OstOstuRida]
    FOREIGN KEY ([Ost_OstID])
    REFERENCES [dbo].[OstSet]
        ([OstID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OstOstuRida'
CREATE INDEX [IX_FK_OstOstuRida]
ON [dbo].[OstuRidaSet]
    ([Ost_OstID]);
GO

-- Creating foreign key on [ToodeID1_ToodeId] in table 'OstuRidaSet'
ALTER TABLE [dbo].[OstuRidaSet]
ADD CONSTRAINT [FK_ToodeIDOstuRida]
    FOREIGN KEY ([ToodeID1_ToodeId])
    REFERENCES [dbo].[ToodeIDSet]
        ([ToodeId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ToodeIDOstuRida'
CREATE INDEX [IX_FK_ToodeIDOstuRida]
ON [dbo].[OstuRidaSet]
    ([ToodeID1_ToodeId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------