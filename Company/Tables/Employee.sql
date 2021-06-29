CREATE TABLE [Employee] (
    [Id]          INT         IDENTITY (1, 1) NOT NULL,
    [Surname]     NCHAR (100) NULL,
    [Name]        NCHAR (100) NULL,
    [DateOfBirth] DATETIME    NULL,
    CONSTRAINT PK_EmployeeID PRIMARY KEY CLUSTERED ([Id] ASC)
);

