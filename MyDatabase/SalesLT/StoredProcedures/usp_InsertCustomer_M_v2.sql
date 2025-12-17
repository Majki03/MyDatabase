
CREATE   PROCEDURE SalesLT.usp_InsertCustomer_M_v2
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

        DECLARE @UserExists BIT;
        SET @UserExists = SalesLT.udf_CheckUserExists_M(@EmailAddress, @Phone);

        IF @UserExists = 1
        BEGIN
            THROW 50005, 'Użytkownik o podanym adresie e-mail lub numerze telefonu już istnieje.', 1;
        END

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

