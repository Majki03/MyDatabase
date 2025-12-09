CREATE TABLE [Student_2].[Employees] (
    [EmpID]      INT             IDENTITY (1, 1) NOT NULL,
    [FirstName]  NVARCHAR (50)   NULL,
    [LastName]   NVARCHAR (50)   NULL,
    [Salary]     DECIMAL (10, 2) NULL,
    [HireDate]   DATE            NULL,
    [Department] NVARCHAR (50)   NULL,
    PRIMARY KEY CLUSTERED ([EmpID] ASC)
);
GO

