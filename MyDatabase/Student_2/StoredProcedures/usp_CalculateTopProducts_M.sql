
CREATE   PROCEDURE Student_2.usp_CalculateTopProducts_M
AS
BEGIN
    SET NOCOUNT ON;

    IF OBJECT_ID('tempdb..#TopProducts') IS NULL
    BEGIN
        THROW 50009, 'Tymczasowa tabela #TopProducts nie istnieje.', 1;
    END

    SELECT 
        ProductID,
        Name,
        ListPrice AS OldPrice,
        (ListPrice - (ListPrice * 0.02)) AS ModifiedPrice
    FROM #TopProducts;
END;
GO

