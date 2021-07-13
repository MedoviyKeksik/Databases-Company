CREATE TABLE [Employee] (
    [Id]          INT         IDENTITY (1, 1) NOT NULL,
    [Surname]     NCHAR (100) NULL,
    [Name]        NCHAR (100) NULL,
    [DateOfBirth] DATETIME    NULL,
    [Email] NCHAR(255) NULL, 
    CONSTRAINT PK_EmployeeID PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

CREATE INDEX [IX_Employee_NameSurname] ON [dbo].[Employee] ([Name], [Surname])

GO

CREATE UNIQUE INDEX [IX_Employee_Email] ON [dbo].[Employee] ([Email])
