USE sql_invoicing;
/**
  BASIC UPDATE QUERY
 */
UPDATE invoices
SET
    payment_total = 10 ,
    payment_date = '2019-03-01'
WHERE invoice_id = 1;

/**
  UPDATE MULTIPLE ROW
 */
UPDATE invoices
SET
    payment_total = invoice_total * 0.5,
    payment_date = due_date
WHERE client_id IN (3, 4);

/**
  SUB_QUERIES UPDATE
 */
UPDATE invoices
SET
    payment_total = invoice_total * 0.5,
    payment_date = due_date
WHERE client_id IN
                (SELECT client_id
                 FROM clients
                 WHERE state IN ('CA', 'NY'));

SELECT client_id
                 FROM clients
                 WHERE name = 'Myworks';

USE sql_store;
UPDATE customers
SET
    points = points + 50
WHERE birth_date < '1990-01-01';

UPDATE orders
SET comments = 'Gold customer'
WHERE customer_id
          IN
             (SELECT customer_id
              FROM customers
              WHERE points > 3000);
