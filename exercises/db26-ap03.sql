/* Lesson 05 - DDL base syntax and objects  #Ulht#db26!Class
  Student: Lucas Zhan
  Class:
  Date: 06/10/2026
*/
USE ULHT_DB26;
GO

CREATE TABLE HR.employee_training (
    employee_id INT NOT NULL,
    course_code VARCHAR(12) NOT NULL,
    completed_on DATE NULL,
    score DECIMAL(5, 2) NULL
);

-- Verify TABLE 'employee_training' was created.
SELECT * FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'HR' AND TABLE_NAME = 'employee_training';
-- Verify all columns were created on TABLE 'employee_training'.
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'HR' AND TABLE_NAME = 'employee_training';

SELECT OBJECT_ID('HR.employee_training', 'U')