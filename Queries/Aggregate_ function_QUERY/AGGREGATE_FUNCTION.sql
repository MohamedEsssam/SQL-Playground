USE sql_invoicing;
/**
  Aggregate function this function
  can't deal with null value
  you should take care of that
 */
SELECT
       MAX(invoice_total) AS max,
       MIN(invoice_total) AS min,
       AVG(invoice_total) AS AVG,
       MAX(payment_date)  AS last_day,
       SUM(invoice_total) AS sum,
       COUNT(invoice_total) AS number_of_invoices,
       COUNT(payment_date) AS count_payment, # count all date without null values so that's wrong,
       COUNT(DISTINCT client_id) AS total_recors
FROM invoices
WHERE invoice_date > '2019-07-01';

SELECT
       'first half of 2019' AS date_range,
       SUM(invoice_total) AS total_sales,
       SUM(payment_total) AS total_payment,
       SUM(invoice_total - payment_total) AS what_we_expect
FROM invoices
WHERE invoice_date
    BETWEEN '2019-01-01' AND '2019-06-30'
UNION
SELECT
       'second half of 2019' AS date_range,
       SUM(invoice_total) AS total_sales,
       SUM(payment_total) AS total_payment,
       SUM(invoice_total - payment_total) AS what_we_expect
FROM invoices
WHERE invoice_date
    BETWEEN '2019-07-01' AND '2019-12-31'
UNION
SELECT
       'total' AS date_range,
       SUM(invoice_total) AS total_sales,
       SUM(payment_total) AS total_payment,
       SUM(invoice_total - payment_total) AS what_we_expect
FROM invoices
WHERE invoice_date
    BETWEEN '2019-01-01' AND '2019-12-31';
