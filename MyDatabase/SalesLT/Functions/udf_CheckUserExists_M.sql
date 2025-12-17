
-- =============================================
-- Zadanie 4
-- =============================================

CREATE   FUNCTION SalesLT.udf_CheckUserExists_M
(
    @EmailAddress NVARCHAR(50),
    @Phone NVARCHAR(25)
)
RETURNS BIT
AS
BEGIN
    DECLARE @Exists BIT = 0;

    IF EXISTS (
        SELECT 1
        FROM [234182].Customer
        WHERE EmailAddress = @EmailAddress OR Phone = @Phone
    )
    BEGIN
        SET @Exists = 1;
    END

    RETURN @Exists;
END;
GO

