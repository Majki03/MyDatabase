
CREATE FUNCTION Student_2.ufn_GetCheaperProducts
(
    @MaxPrice MONEY
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        p.ProductID,
        p.Name,
        p.ProductNumber,
        p.ListPrice
    FROM 
        SalesLT.Product AS p
    WHERE
        Student_2.ufn_IsPriceHigherThanCurrent(
            CONCAT(
                N'{"ProductID": ',
                CAST(p.ProductID AS NVARCHAR(20)),
                N', "Price": ',
                CAST(@MaxPrice AS NVARCHAR(20)),
                N'}'
            )
        ) = 1
);
GO

