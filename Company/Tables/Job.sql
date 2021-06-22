CREATE TABLE [Job] (
    [Id]     INT         IDENTITY (1, 1) NOT NULL,
    [Title]  NCHAR (100) NULL,
    [Salary] MONEY       NOT NULL,
    CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED ([Id] ASC)
);

