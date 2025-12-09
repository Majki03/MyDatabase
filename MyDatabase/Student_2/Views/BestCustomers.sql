
CREATE VIEW Student_2.BestCustomers AS
SELECT TOP 10
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.CompanyName,
    COUNT(soh.SalesOrderID) AS LiczbaZamowien,
    SUM(soh.TotalDue) AS SumaWydatkow
FROM
    [234182].Customer AS c
JOIN
    SalesLT.SalesOrderHeader AS soh ON c.CustomerID = soh.CustomerID
GROUP BY
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.CompanyName
ORDER BY
    SumaWydatkow DESC;
GO

