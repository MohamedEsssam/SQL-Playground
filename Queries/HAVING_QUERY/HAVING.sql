USE sql_invoicing;
/**
  HAVING QUERY used same WHERE but
  after GROUP BY as if we use WHERE
  for total_sales it will give us
  undefined
  ****** used to check result output
  ****** from Aggregate function
  ******and columns in condition should be
  ******part in SELECT class.
 */
SELECT
       client_id,
       SUM(invoice_total) AS total_sales,
       COUNT(*) AS number_of_invoices
FROM invoices
GROUP BY client_id
HAVING total_sales > 500 AND number_of_invoices > 5
ORDER BY total_sales;

USE sql_store;

SELECT
       customer_id,
       first_name,
       last_name,
       SUM(oi.quantity * oi.unit_price) AS total_sales
FROM customers
JOIN orders o
    USING (customer_id)
JOIN order_items oi
    USING (order_id)
WHERE state IN ('VA')
GROUP BY customer_id,
         first_name,
         last_name
HAVING total_sales > 100
