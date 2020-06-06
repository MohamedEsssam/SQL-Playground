USE  sql_store;
/**
  BASIC INSERT QUERY
 */
INSERT INTO customers ( first_name, last_name, birth_date, address, city, state)
VALUES ( 'john', 'smith', '1990-01-01', 'address', 'city', 'CA');

SELECT *
FROM customers;
/**
  INSERT MULTIPLE ROWS
 */
INSERT INTO shippers (name)
values ('shipper1'),
       ('shipper2');

SELECT *
FROM shippers;

INSERT INTO products (name, quantity_in_stock, unit_price)
VALUES ('product1', 50, 1.08),
       ('product2', 40, 2.76),
       ('product3', 60, 7.7);

SELECT *
FROM products;

/**
  INSERT HIERARCHICAL
 */
INSERT INTO orders(customer_id, order_date, status)
VALUES (1, '2019-01-02', 1);
INSERT INTO order_items(order_id, product_id, quantity, unit_price)
VALUES (LAST_INSERT_ID(), '1', 1, 2.95),
       (LAST_INSERT_ID(), '2', 1, 3.95);
SELECT *
FROM orders;
SELECT *
FROM order_items;

/**
  CREATE a COPY OF TABLE
 */
CREATE TABLE order_archived AS
    SELECT * FROM orders;

INSERT INTO order_archived
SELECT *
FROM orders
WHERE order_date < '2019-01-01';

CREATE TABLE invoices_archive AS
    SELECT i.invoice_id, i.number, c.name, i.invoice_total,
           i.payment_total, i.invoice_date, i.payment_date,
           i.due_date
    FROM invoices i
    JOIN clients c USING (client_id)
    WHERE payment_date IS NOT NULL;
