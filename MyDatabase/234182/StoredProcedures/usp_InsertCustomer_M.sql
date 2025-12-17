-- =============================================
-- Michał
-- Cudzich
-- 234182
-- =============================================

-- =============================================
-- Zadanie 1
-- =============================================

CREATE   PROCEDURE [234182].usp_InsertCustomer_M
    @FirstName NVARCHAR(50),
    @LastName Student_2.M2_surname,
    @EmailAddress NVARCHAR(50),
    @Phone NVARCHAR(25),
    @PasswordHash VARCHAR(128),
    @PasswordSalt VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRY
        BEGIN TRAN;

        INSERT INTO [234182].Customer (
            FirstName,
            LastName,
            EmailAddress,
            Phone,
            PasswordHash,
            PasswordSalt,
            ModifiedDate,
            rowguid
        )
        VALUES (
            @FirstName,
            @LastName,
            @EmailAddress,
            @Phone,
            @PasswordHash,
            @PasswordSalt,
            GETDATE(),
            NEWID()
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

