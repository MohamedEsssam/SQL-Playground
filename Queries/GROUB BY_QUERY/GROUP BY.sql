USE sql_invoicing;
/**
   GROUP BY for aggregate function  
 */
SELECT
       state,
       city,
       SUM(invoice_total) AS total_sales
FROM invoices i
JOIN clients c USING (client_id)
GROUP BY state, city
ORDER BY total_sales DESC;

SELECT
       date,
       pm.name AS payment_methode,
       SUM(amount) AS total_payment
FROM payments
JOIN payment_methods pm
    ON payments.payment_method = pm.payment_method_id
GROUP BY pm.name, date
ORDER BY date

