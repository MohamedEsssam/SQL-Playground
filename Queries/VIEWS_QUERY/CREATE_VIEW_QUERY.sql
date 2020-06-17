/**
  CREATE VIEW
 */
 USE sql_invoicing;

CREATE VIEW sales_by_client AS
SELECT
       c.client_id,
       c.name,
       SUM(i.invoice_total) AS total_sales
FROM clients c
JOIN invoices i USING (client_id)
GROUP BY c.client_id, c.name;

/**
  USE view table
 */
SELECT *
FROM sales_by_client
ORDER BY total_sales;

CREATE VIEW clients_balance AS
SELECT
       client_id,
       name,
       (invoice_total - payment_total) AS balance
FROM clients c
JOIN invoices i USING (client_id);

SELECT *
FROM clients_balance;
