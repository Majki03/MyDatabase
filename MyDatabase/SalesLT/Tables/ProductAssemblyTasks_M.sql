CREATE TABLE [SalesLT].[ProductAssemblyTasks_M] (
    [TaskID]           INT            IDENTITY (1, 1) NOT NULL,
    [ProductID]        INT            NOT NULL,
    [ParentTaskID]     INT            NULL,
    [TaskName]         NVARCHAR (100) NOT NULL,
    [EstimatedMinutes] INT            DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([TaskID] ASC)
);
GO

ALTER TABLE [SalesLT].[ProductAssemblyTasks_M]
    ADD CONSTRAINT [FK_Assembly_Parent] FOREIGN KEY ([ParentTaskID]) REFERENCES [SalesLT].[ProductAssemblyTasks_M] ([TaskID]);
GO

ALTER TABLE [SalesLT].[ProductAssemblyTasks_M]
    ADD CONSTRAINT [FK_Assembly_Product] FOREIGN KEY ([ProductID]) REFERENCES [SalesLT].[Product] ([ProductID]);
GO

