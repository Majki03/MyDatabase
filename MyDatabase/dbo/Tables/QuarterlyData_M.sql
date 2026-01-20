CREATE TABLE [dbo].[QuarterlyData_M] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [SalesPerson] NVARCHAR (50) NULL,
    [Quarter]     CHAR (2)      NULL,
    [Revenue]     MONEY         NULL
);
GO

