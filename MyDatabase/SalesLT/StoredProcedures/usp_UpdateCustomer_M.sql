
-- =============================================
-- Zadanie 5
-- =============================================

CREATE   PROCEDURE SalesLT.usp_UpdateCustomer_M
    @CustomerID INT,
    @FirstName NVARCHAR(50) = NULL,
    @LastName Student_2.M2_surname = NULL,
    @EmailAddress NVARCHAR(50) = NULL,
    @Phone NVARCHAR(25) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRY
        BEGIN TRAN;

        IF NOT EXISTS (SELECT 1 FROM [234182].Customer WHERE CustomerID = @CustomerID)
        BEGIN
            THROW 50006, 'Nie znaleziono klienta.', 1;
        END

        UPDATE [234182].Customer
        SET
            FirstName = ISNULL(@FirstName, FirstName),
            LastName = ISNULL(@LastName, LastName),
            EmailAddress = ISNULL(@EmailAddress, EmailAddress),
            Phone = ISNULL(@Phone, Phone),
            ModifiedDate = GETDATE()
        WHERE CustomerID = @CustomerID;

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

