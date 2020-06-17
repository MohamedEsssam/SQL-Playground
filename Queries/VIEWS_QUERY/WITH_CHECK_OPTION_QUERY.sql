/**
  WITH CHECK OPTION VIEW
 */
USE sql_invoicing;

CREATE OR REPLACE VIEW invoices_with_balance AS
SELECT
       invoice_id,
       number,
       client_id,
       invoice_total,
       payment_total,
       invoice_total - payment_total AS balance,
       invoice_date,
       due_date,
       payment_date
FROM invoices
WHERE (invoice_total - payment_total) > 0
WITH CHECK OPTION ;  ### make view prevent update or delete statement from excluding rows from view

DELETE FROM invoices_with_balance
WHERE invoice_id = 1;

UPDATE invoices_with_balance
SET payment_total = invoice_total
WHERE invoice_id = 4; ## it will give error CHECK OPTION failed as the balance should be > 0