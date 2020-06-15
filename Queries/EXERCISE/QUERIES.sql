USE sql_store;

SELECT  *
FROM products
WHERE unit_price >(
       SELECT unit_price
       FROM products
       WHERE product_id = 3
    );

SELECT *
FROM products
WHERE product_id  NOT IN(
        SELECT DISTINCT product_id
        FROM order_items
    );

SELECT *
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM order_items oi
    JOIN orders o USING (order_id)
    WHERE product_id = 3
    );
### === ### equivalent
SELECT *
FROM customers
JOIN orders o
    USING (customer_id)
JOIN order_items oi USING
    (order_id)
WHERE oi.product_id = 3;

SELECT *
FROM products p
WHERE NOT EXISTS(
    SELECT product_id
    FROM order_items oi
    WHERE oi.product_id = p.product_id
    );

#--------------------------------------------------------------------#
USE sql_hr;

SELECT *
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    );

#correlated subQueries
SELECT *
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE office_id = e.office_id
    )
;
#----------------------------------------------------------#
USE sql_invoicing;

SELECT *
FROM clients
WHERE client_id NOT IN (
        SELECT Distinct client_id
        FROM invoices
    );
### === ### equivalent
SELECT *
FROM clients c
LEFT JOIN invoices i
        USING (client_id)
WHERE i.client_id IS NULL;

SELECT *
FROM invoices
WHERE invoice_total > (
    SELECT MAX(invoice_total)
    FROM invoices
    WHERE client_id = 3
    );
### === ### equivalent
SELECT *
FROM invoices
WHERE invoice_total > ALL (
    SELECT invoice_total
    FROM invoices
    WHERE client_id = 3
    );

SELECT client_id
FROM clients
WHERE client_id IN (
    SELECT client_id
    FROM invoices
    GROUP BY client_id
    HAVING COUNT(invoice_id)
    );
### === ### equivalent
# ANY operator
SELECT client_id
FROM clients
WHERE client_id = ANY (
    SELECT client_id
    FROM invoices
    GROUP BY client_id
    HAVING COUNT(invoice_id)
    );

SELECT *
FROM invoices i
WHERE invoice_total > (
    SELECT AVG(invoice_total)
    FROM invoices
    WHERE client_id = i.client_id
    );

SELECT *
FROM clients
WHERE client_id IN (
    SELECT DISTINCT client_id
    FROM invoices
    );
### ==== ### equivalent
# EXISTS operator
SELECT *
FROM clients c
WHERE EXISTS (
    SELECT DISTINCT client_id
    FROM invoices
    WHERE client_id = c.client_id
    );

SELECT invoice_id,
       invoice_total,
       (SELECT AVG(invoice_total)
       FROM invoices) AS invoices_avg,
       invoice_total - (SELECT invoices_avg) AS diff
FROM invoices;

SELECT client_id,
       name,
       (SELECT SUM(invoice_total)
        FROM invoices i
        WHERE client_id = c.client_id) AS total_sales,
       (SELECT AVG(invoice_total)
        FROM invoices) AS avarage,
       (SELECT total_sales - avarage) AS diff
FROM clients c
GROUP BY client_id, name, diff
HAVING total_sales IS NOT NULL ;
### === ### equivalent
SELECT *
FROM (
         SELECT client_id,
                name,
                (SELECT SUM(invoice_total)
                 FROM invoices i
                 WHERE client_id = c.client_id) AS total_sales,
                (SELECT AVG(invoice_total)
                 FROM invoices)                 AS avarage,
                (SELECT total_sales - avarage)  AS diff
         FROM clients c
     ) AS sales_summary
WHERE total_sales IS NOT NULL ;
