
/*
Kierownik chce filtrować pracowników po dziale.
*/

CREATE   FUNCTION Student_2.ufn_GetEmployeesByDept (@DeptName NVARCHAR(50))
RETURNS TABLE
AS
RETURN
(
    SELECT
        EmpID, FirstName, LastName, HireDate
    FROM
        Student_2.Employees
    WHERE
        Department = @DeptName
);
GO

