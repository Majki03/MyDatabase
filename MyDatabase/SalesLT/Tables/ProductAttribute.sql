CREATE TABLE [SalesLT].[ProductAttribute] (
    [ProductAttributeID] INT                                             IDENTITY (1, 1) NOT NULL,
    [ProductID]          INT                                             NOT NULL,
    [Atrybuty]           XML(CONTENT [SalesLT].[ProductAttributeSchema]) NULL,
    PRIMARY KEY CLUSTERED ([ProductAttributeID] ASC)
);
GO

ALTER TABLE [SalesLT].[ProductAttribute]
    ADD CONSTRAINT [FK_ProductAttribute_Product] FOREIGN KEY ([ProductID]) REFERENCES [SalesLT].[Product] ([ProductID]);
GO

