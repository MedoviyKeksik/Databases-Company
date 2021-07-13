CREATE TABLE [Salary] (
    [Id]         INT   IDENTITY (1, 1) NOT NULL,
    [EmployeeId] INT   NULL,
    [Month]      INT   NULL,
    [Year]       INT   NULL,
    [Amount]     MONEY NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Salary_ToEmployee] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([Id]), 
    CONSTRAINT [CK_Salary_Year] CHECK (2002 < Year AND Year < 2016),  
    CONSTRAINT [CK_Salary_Month] CHECK (0 < Month AND Month < 13)
);

