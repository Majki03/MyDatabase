
/*
Prezes chce wygenerować raport "Proponowana Premia".:
- Staż < 2 lata: Brak premii
- Staż 2-4 lat: 10% pensji
- Staż > 4 lata: 20% pensji + status "Weteran"
*/

CREATE   FUNCTION Student_2.ufn_GenerateBonusReport ()
RETURNS @BonusTable TABLE (
    EmpName NVARCHAR(100),
    BonusAmount DECIMAL(10,2),
    EmpStatus NVARCHAR(20)
)
AS
BEGIN
    INSERT INTO @BonusTable (EmpName, BonusAmount, EmpStatus)
    SELECT
        LastName + ' ' + FirstName,
        CASE
            WHEN DATEDIFF(YEAR, HireDate, GETDATE()) < 2 THEN 0
            WHEN DATEDIFF(YEAR, HireDate, GETDATE()) BETWEEN 2 AND 4 THEN Salary * 0.10
            ELSE Salary * 0.20
        END,
        CASE
            WHEN DATEDIFF(YEAR, HireDate, GETDATE()) > 4 THEN 'Weteran'
            ELSE 'Standard'
        END
    FROM
        Student_2.Employees;

    RETURN;
END;
GO

