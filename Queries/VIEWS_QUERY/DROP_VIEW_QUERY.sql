/**
  DROP VIEW
 */
USE sql_invoicing;

#Methode 1
DROP VIEW sales_by_client;

#Methode 2
CREATE OR REPLACE VIEW sales_by_client AS
SELECT
       c.client_id,
       c.name,
       SUM(i.invoice_total) AS total_sales
FROM clients c
JOIN invoices i USING (client_id)
GROUP BY c.client_id, c.name
ORDER BY total_sales DESC

