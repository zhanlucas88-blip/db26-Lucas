-- Student Number: 22603770
-- Name: Lucas Zhan
-- Class: LCD
-- Date: 2026-09-22

USE ULHT_DB26;
GO

SELECT TOP (5) EMPLOYEE_ID, SALARY,
       SALARY * 12 AS annual_salary,
       SQL_VARIANT_PROPERTY(SALARY * 12, 'BaseType') AS result_type
FROM HR.EMPLOYEES
ORDER BY EMPLOYEE_ID;

SELECT e.EMPLOYEE_ID, e.COMMISSION_PCT, e.SALARY * (1+ ISNULL(e.COMMISSION_PCT,0)) AS 'total'
FROM HR.EMPLOYEES e;

DECLARE @d AS DATE = GETDATE();

SELECT FORMAT(@d, 'dd/MM/yyyy', 'en-US') AS 'Date',
       FORMAT(87654320, '###-##-####') AS 'Custom Number',
       FORMAT(87654320, '000-##-####') AS 'padding';
