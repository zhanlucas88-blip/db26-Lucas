-- Student Number: 22603770
-- Name: Lucas Zhan
-- Class: LD01CIDA01
-- Date: 2026-10-13


USE BikeStores;
GO

-- A1

CREATE TABLE sales.warranty_claim (
    claim_id      INT         NOT NULL,
    customer_id   INT         NOT NULL,
    staff_id      INT         NULL,
    product_code  VARCHAR(20) NOT NULL,
    opened_on     DATE        NOT NULL,
    CONSTRAINT pk_warranty_claim PRIMARY KEY (claim_id)
);

-- A2

SELECT name, OBJECT_NAME(referenced_object_id) AS parent_table, is_disabled, is_not_trusted
FROM sys.foreign_keys
WHERE parent_object_id = OBJECT_ID('sales.warranty_claim');

SELECT OBJECT_NAME(constraint_object_id) AS fk_name, constraint_column_id,
       COL_NAME(parent_object_id, parent_column_id)         AS child_column,
       COL_NAME(referenced_object_id, referenced_column_id) AS parent_column
FROM sys.foreign_key_columns
WHERE parent_object_id = OBJECT_ID('sales.warranty_claim');

SELECT name, is_nullable FROM sys.columns
WHERE object_id = OBJECT_ID('sales.warranty_claim') AND name = 'staff_id';
GO


-- A3
   
INSERT INTO sales.warranty_claim (claim_id, customer_id, staff_id, product_code, opened_on)
VALUES (2,
        (SELECT MIN(customer_id) FROM sales.customers
          WHERE customer_id > (SELECT MIN(customer_id) FROM sales.customers)),
        NULL, 'BIKE-002', '2026-10-02');

SELECT * FROM sales.warranty_claim WHERE claim_id = 2;

UPDATE sales.warranty_claim
SET staff_id = (SELECT MIN(staff_id) FROM sales.staffs
                 WHERE staff_id > (SELECT MIN(staff_id) FROM sales.staffs))
WHERE claim_id = 2;
