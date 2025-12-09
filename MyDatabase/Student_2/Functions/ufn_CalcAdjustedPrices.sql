
CREATE FUNCTION Student_2.ufn_CalcAdjustedPrices
(
    @ListPrice MONEY
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        @ListPrice - (@ListPrice * 0.02) AS AdjustedPrice
);
GO

