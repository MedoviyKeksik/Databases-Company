CREATE TABLE [Career] (
    [Id]            INT      IDENTITY (1, 1) NOT NULL,
    [JobId]         INT      NOT NULL,
    [EmployeeId]    INT      NOT NULL,
    [DepartmentId]  INT      NULL,
    [DateHired]     DATETIME NULL,
    [DateDismissed] DATETIME NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Career_ToDepartment] FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Department] ([Id]),
    CONSTRAINT [FK_Career_ToEmployee] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([Id]),
    CONSTRAINT [FK_Career_ToJob] FOREIGN KEY ([JobId]) REFERENCES [dbo].[Job] ([Id])
);

