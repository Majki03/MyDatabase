
-- =============================================
-- Zadanie 2
-- =============================================

CREATE   PROCEDURE SalesLT.usp_GetCustomers_M
    @FirstName NVARCHAR(50) = NULL,
    @LastName Student_2.M2_surname = NULL,
    @CustomerID INT = NULL,
    @EmailAddress NVARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        CustomerID,
        FirstName,
        LastName,
        EmailAddress,
        Phone,
        CompanyName,
        ModifiedDate
    FROM [234182].Customer
    WHERE
        (@CustomerID IS NULL OR CustomerID = @CustomerID)
        AND (@FirstName IS NULL OR FirstName = @FirstName) 
        AND (@LastName IS NULL OR LastName = @LastName)
        AND (@EmailAddress IS NULL OR EmailAddress = @EmailAddress);
END;
GO

