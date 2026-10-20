-- Student Number: 22603770
-- Name: Lucas Zhan
-- Class: LCD
-- Date: 2026-10-20

USE Bikestores;
GO

-- A1

SELECT
    p.product_id,
    p.product_name,
    b.brand_name
FROM production.products AS p
INNER JOIN production.brands AS b
    ON p.brand_id = b.brand_id
WHERE p.product_id BETWEEN 1 AND 10
ORDER BY p.product_id;

-- A2

SELECT
    c.product_id AS candidate_id,
    r.product_id AS reference_id,
    c.list_price AS candidate_price,
    r.list_price AS reference_price
FROM production.products AS c
CROSS JOIN production.products AS r
WHERE c.product_id BETWEEN 1 AND 20
  AND r.product_id BETWEEN 1 AND 3
  AND c.list_price > r.list_price
ORDER BY c.product_id, r.product_id;

-- A3

SELECT
    c.customer_id,
    COUNT(o.order_id) AS order_count
FROM sales.customers AS c
LEFT JOIN sales.orders AS o
    ON c.customer_id = o.customer_id
WHERE c.customer_id BETWEEN 1 AND 20
GROUP BY c.customer_id
ORDER BY c.customer_id;

-- A4

SELECT
    s.staff_id,
    CONCAT(s.first_name, ' ', s.last_name) AS staff_name,
    st.store_name,
    CONCAT(m.first_name, ' ', m.last_name) AS manager_name
FROM sales.staffs AS s
INNER JOIN sales.stores AS st
    ON s.store_id = st.store_id
LEFT JOIN sales.staffs AS m
    ON s.manager_id = m.staff_id
WHERE s.active = 1
ORDER BY s.store_id, s.staff_id;

-- A5

SELECT
    oi.item_id,
    p.product_name,
    c.category_name,
    oi.quantity,
    oi.quantity * oi.list_price * (1 - oi.discount) AS line_amount
FROM sales.order_items AS oi
INNER JOIN production.products AS p
    ON oi.product_id = p.product_id
INNER JOIN production.categories AS c
    ON p.category_id = c.category_id
WHERE oi.order_id = 1
ORDER BY oi.item_id;