/*
  Lesson 01 - Metadata,Read, add, and remove rows
  Student: 22603770 - Lucas Zhan
  Date: 15/09/2026
*/

USE ULHT_DB26;
GO

-- list databases in the current SQL Server instance
SELECT
    name,
    database_id,
    state_desc,
    recovery_model_desc
FROM sys.databases
ORDER BY name;

SELECT TOP 1 * FROM Scott.emp ORDER BY sal DESC;
SELECT 1+1
SELECT GETDATE();

SELECT * FROM Scott.EMP WHERE sal > 2000

SELECT * FROM INFORMATION_SCHEMA.COLUMNS as c
  WHERE c.TABLE_NAME = 'emp';

INSERT INTO Scott.EMP
    (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES
    (3770, 'Lucas', NULL, NULL, GETDATE(), 1000, NULL, NULL);

SELECT * FROM Scott.EMP WHERE EMPNO = 3770;

DELETE from Scott.EMP WHERE EMPNO = 3770;