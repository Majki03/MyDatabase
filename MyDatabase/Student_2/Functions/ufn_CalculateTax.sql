
/*
Dział księgowości potrzebuje na szybko wyliczyć kwote podatku.
*/

CREATE   FUNCTION Student_2.ufn_CalculateTax (@GrossAmount DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @GrossAmount * 0.19;
END;
GO

