/**
  USE to chose DB
 */
USE sql_store;

/**
  basic SELECT statement
  FROM to chose table
  WHERE for write a condition
  ORDER BY to sort data based on chosen column
 */
SELECT *
FROM customers
WHERE customer_id = 1
ORDER BY last_name;

/**
  SELECT Clause
  AS Alias to rename output column
  we can perform Arithmetic Operation
 */
SELECT first_name, last_name, points + 10  AS 'discount factor'
FROM customers;

/**
  SELECT unique values using DISTINCT key
 */
SELECT DISTINCT state
FROM customers;

/**
  Conditional SELECT  <, >, <=, >=, !=, <>
 */
SELECT *
FROM customers
WHERE state <>'ma';

/**
    OR, AND, NOT operators
 */
SELECT *
FROM customers
# WHERE points > 5000 AND state <>'va'
# WHERE points > 5000 OR state <>'va'
WHERE NOT (points > 5000 OR state <>'va');

/**
  IN operator
 */
SELECT *
FROM customers
WHERE state IN ('VA', 'FL', 'GA'); # equivalent state = 'VA' OR state = 'GA' OR state = 'FL';

/**
  BETWEEN operator
 */
SELECT *
FROM customers
WHERE points BETWEEN 1000 AND 3000;  #points >= 1000 AND points <= 3000

/**
  LIKE operator
 */
SELECT *
FROM customers
# WHERE last_name LIKE 'brush%'
# WHERE last_name LIKE '%b%'
# WHERE last_name LIKE '%b'
# WHERE last_name LIKE '_y'
WHERE last_name LIKE 'b____y';

/**
  REGEXP operator
 */
SELECT *
FROM customers
WHERE last_name REGEXP 'field'; #take regex

/**
  NULL operator
 */
SELECT *
FROM customers
#WHERE phone IS NOT NULL;
WHERE phone IS NULL;

/**
  ORDER BY operator
 */
SELECT *
FROM customers
ORDER BY state, first_name;

/**
  LIMIT operator
 */
SELECT *
FROM customers
LIMIT 3;

/**
  Exercises
 */
SELECT *
FROM products
WHERE quantity_in_stock IN (49, 38, 72);

SELECT *
FROM order_items
WHERE order_id = 6 AND unit_price * quantity > 30;

SELECT *
FROM customers
WHERE address LIKE '%TRAIL%'
   OR address LIKE '%AVENUE%'
   OR phone LIKE '%9';

SELECT *
FROM customers
WHERE first_name IN ('ElKA', 'AMBUR');

SELECT *
FROM customers
WHERE last_name REGEXP ('EY$|ON$');

SELECT *
FROM customers
WHERE last_name REGEXP ('^MY|SE');

SELECT *
FROM customers
WHERE last_name REGEXP ('B[RU]');

SELECT *
FROM orders
WHERE shipped_date IS NULL;

SELECT *, quantity * unit_price AS 'total price'
FROM order_items
WHERE order_id = 2
ORDER BY `total price` DESC ;

SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3;

