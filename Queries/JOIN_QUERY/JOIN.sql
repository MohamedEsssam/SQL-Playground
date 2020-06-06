USE sql_store;
/**
  Basic JOIN QUERY
 */
SELECT order_id, o.customer_id, first_name, last_name
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id;

SELECT order_id, pi.product_id, quantity, oi.unit_price
FROM order_items oi
JOIN products pi
    ON oi.product_id = pi.product_id;

/**
  JOIN across database
 */
SELECT *
FROM order_items oi
JOIN sql_inventory.products p
    ON oi.product_id = p.product_id;

USE sql_hr;
/**
  SELF JOIN "join in the same table"
 */
SELECT e.employee_id, e.first_name, m.first_name AS manger
FROM employees e
JOIN employees m
    ON e.reports_to = m.employee_id;

/**
  Multiple JOIN
 */
SELECT o.order_id, o.order_date,c.first_name,c.last_name,os.name AS status
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN order_statuses os
    ON o.status = os.order_status_id;

USE sql_invoicing;
SELECT p.date, p.invoice_id,p.amount,c.name,pm.name
FROM clients c
JOIN payments p
    ON c.client_id = p.client_id
JOIN payment_methods pm
    ON p.payment_method = pm.payment_method_id;

/**
  Compound JOIN
 */
SELECT *
FROM order_items oi
JOIN order_item_notes oin
    ON oi.order_id = oin.order_Id
           AND oi.product_id = oin.product_id;

/**
  IMPLICIT JOIN but this not recommended
  as if you forget WHERE cONditiON every
  row in first table will join with
  all with other table.
 */
SELECT order_id, o.customer_id, first_name, last_name # equivalent to SELECT order_id, o.customer_id, first_name, last_name
FROM orders o,customers c                             #FROM orders o
WHERE o.customer_id = c.customer_id;                  #JOIN customers c
                                                        #   ON o.customer_id = c.customer_id;

/**
  OUTER JOIN
 */
SELECT c.customer_id, c.first_name,o.order_id
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

SELECT p.product_id, p.name, oi.quantity
FROM products p
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id;

/**
  OUTER JOIN between multiple table
 */
SELECT c.customer_id, c.first_name, o.order_id, sh.name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
JOIN shippers sh
    ON o.shipper_id = sh.shipper_id
ORDER BY c.customer_id;

SELECT o.order_id, o.order_date, c.first_name, s.name AS shipper, os.name AS status
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
LEFT JOIN shippers s
    ON o.shipper_id = s.shipper_id
JOIN order_statuses os
    ON o.status = os.order_status_id;

/**
  self OUTER JOIN
 */
USE sql_hr;
SELECT e.employee_id, e.first_name, m.first_name AS manger
FROM employees e
LEFT JOIN employees m ON e.reports_to = m.employee_id;

/**
  using clause
 */
SELECT o.order_id, c.first_name, sh.name AS shiper
FROM orders o
JOIN customers c
   USING (customer_id) #equivelant to ON o.customer_id = c.customer_id
LEFT JOIN shippers sh
    USING (shipper_id);

SELECT *
FROM order_items oi
JOIN order_item_notes oin
    USING (order_id,product_id); #equivelant to ON oi.product_id=oin.product_id AND oi.order_id = oin.order_Id

USE sql_invoicing;
SELECT p.date,c.name, p.amount, pm.name
FROM payments p
JOIN clients c
    USING (client_id)
JOIN payment_methods pm
    on p.payment_method = pm.payment_method_id;

/**
  Natural JOIN  not recommended to use
  because some time give unexpected result
  can't have control on as you make database
  engine guess join operation join table base
  on common column which have same name
 */
SELECT o.order_id, c.first_name
FROM orders o
NATURAL JOIN customers c;

/*
 Cross JOIN
 used to combine or join every record from first
 table with every record with second table
 */
SELECT c.first_name AS customer, p.name
FROM customers c #, products p equivalent to
CROSS JOIN products p
ORDER BY c.first_name;

SELECT s.name, p.name
FROM shippers s
CROSS JOIN products p
ORDER BY s.name;

########### JOIN use combine columns from multiple tables,
########### we can combine rows from multiple tables using UNION

/**
  UNION
  should return same number of returned columns
 */
SELECT order_id, order_date, 'Active' AS status
FROM orders
WHERE order_date >= '2019-01-01'
UNION
SELECT order_id, order_date, 'Archived' AS status
FROM orders
WHERE order_date < '2019-01-01';

SELECT first_name AS full_name
FROM customers
UNION
SELECT name
FROM shippers;

SELECT customer_id, first_name, points, 'Bronze' AS type
FROM customers
WHERE points < 2000
UNION
SELECT customer_id, first_name, points, 'Silver' AS type
FROM customers
WHERE points BETWEEN 2000 AND 3000
UNION
SELECT customer_id, first_name, points, 'Gold' AS type
FROM customers
WHERE points > 3000
ORDER BY first_name;
