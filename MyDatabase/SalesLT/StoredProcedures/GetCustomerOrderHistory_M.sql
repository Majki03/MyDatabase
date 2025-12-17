
-- =============================================
-- Zadanie 3
-- =============================================

/*
    T-SQL nie obsługuje parametróe OUTPUT typu TABLE.
*/

CREATE   PROCEDURE SalesLT.GetCustomerOrderHistory_M
    @CustomerID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @History TABLE (
        ProductName NVARCHAR(50),
        OrderDate DATETIME,
        Quantity INT,
        TotalPrice MONEY
    );

    INSERT INTO @History (ProductName, OrderDate, Quantity, TotalPrice)
    SELECT 
        p.Name AS ProductName,
        h.OrderDate,
        d.OrderQty,
        d.LineTotal
    FROM SalesLT.SalesOrderHeader h
    JOIN SalesLT.SalesOrderDetail d ON h.SalesOrderID = d.SalesOrderID
    JOIN SalesLT.Product p ON d.ProductID = p.ProductID
    WHERE h.CustomerID = @CustomerID;

    SELECT * FROM @History ORDER BY OrderDate DESC;
END;
GO

