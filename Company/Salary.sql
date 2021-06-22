CREATE TABLE [dbo].[Salary] (
    [Id]         INT   IDENTITY (1, 1) NOT NULL,
    [EmployeeId] INT   NULL,
    [Month]      INT   NULL,
    [Year]       INT   NULL,
    [Amount]     MONEY NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Salary_ToEmployee] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([Id])
);

