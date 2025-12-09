
/*
Wszyscy pracownicy potrzebują dostępu do listy aby znaleć się na Teamsach.
*/

CREATE   VIEW Student_2.v_PublicDirectory AS
SELECT 
    FirstName,
    LastName,
    Department,
    DATEDIFF(YEAR, HireDate, GETDATE()) AS YearsInCompany
FROM 
    Student_2.Employees;
GO

