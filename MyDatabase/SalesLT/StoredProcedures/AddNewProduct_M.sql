
-- =============================================
-- Zadanie 6
-- =============================================

CREATE   PROCEDURE SalesLT.AddNewProduct_M
    @Name NVARCHAR(50),
    @CategoryID INT,
    @ListPrice MONEY,
    @Quantity INT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    IF @ListPrice <= 0
        THROW 50007, 'Cena produktu musi być większa niż zero.', 1;

    IF @Quantity < 0
        THROW 50008, 'Ilość produktu nie może być ujemna.', 1;

    BEGIN TRY
        BEGIN TRAN;

        INSERT INTO SalesLT.Product (
            Name,
            ProductNumber,
            Color,
            StandardCost,
            ListPrice,
            Size,
            Weight,
            ProductCategoryID,
            ProductModelID,
            SellStartDate,
            ModifiedDate
        )
        VALUES (
            @Name,
            'PROD-' + LEFT(NEWID(), 8),
            NULL,
            0.00,
            @ListPrice,
            NULL,
            NULL,
            @CategoryID,
            NULL,
            GETDATE(),
            GETDATE()
        );

        DECLARE @NewProductID INT = SCOPE_IDENTITY();

        INSERT INTO SalesLT.ProductInventory (
            ProductID,
            Quantity,
            ModifiedDate
        )
        VALUES (
            @NewProductID,
            @Quantity,
            GETDATE()
        );

        COMMIT TRAN;
    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0
            ROLLBACK TRAN;

        DECLARE @ErrorMsg NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorNum INT = ERROR_NUMBER();
        THROW @ErrorNum, @ErrorMsg, 1;
    END CATCH;
END;
GO

