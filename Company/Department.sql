CREATE TABLE [dbo].[Department] (
    [Id]      INT           IDENTITY (1, 1) NOT NULL,
    [Title]   NCHAR (100)   NULL,
    [Address] VARCHAR (300) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

