USE sql_invoicing;
/**
  DELETE QUERY ROW
 */
DELETE FROM invoices
WHERE client_id
          IN
            (SELECT client_id
            FROM clients
            WHERE name = 'Myworks')