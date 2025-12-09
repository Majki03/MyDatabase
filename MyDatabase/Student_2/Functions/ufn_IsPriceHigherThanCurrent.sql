
CREATE FUNCTION Student_2.ufn_IsPriceHigherThanCurrent
(
    @JsonData NVARCHAR(MAX)
)
RETURNS BIT
AS
BEGIN
    DECLARE @ProductID INT;
    DECLARE @JsonPrice MONEY;
    DECLARE @CurrentPrice MONEY;
    DECLARE @Result BIT;

    SET @ProductID = CAST(JSON_VALUE(@JsonData, '$.ProductID') AS INT);
    SET @JsonPrice = CAST(JSON_VALUE(@JsonData, '$.Price') AS MONEY);

    SELECT @CurrentPrice = ListPrice
    FROM SalesLT.Product
    WHERE ProductID = @ProductID;

    IF @JsonPrice > @CurrentPrice
        SET @Result = 1;
    ELSE
        SET @Result = 0;

    RETURN @Result;
END;
GO

