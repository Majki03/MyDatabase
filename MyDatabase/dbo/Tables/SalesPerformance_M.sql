CREATE TABLE [dbo].[SalesPerformance_M] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [SalesPerson] NVARCHAR (50) NULL,
    [MonthStr]    NVARCHAR (20) NULL,
    [SalesAmount] MONEY         NULL
);
GO

