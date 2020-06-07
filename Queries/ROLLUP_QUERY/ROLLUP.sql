USE sql_invoicing;
/**
  WITH ROLLUP for GROUP BY and aggregate function
 */
SELECT
       state,
       city,
       SUM(invoice_total) AS total_sales
FROM invoices
JOIN clients c USING (client_id)
GROUP BY state, city WITH ROLLUP;

SELECT
       pm.name AS payment_method,
       SUM(amount) AS total
FROM payments p
JOIN payment_methods pm
    ON p.payment_method = pm.payment_method_id
GROUP BY pm.name WITH ROLLUP;
