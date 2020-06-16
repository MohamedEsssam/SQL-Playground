SELECT
       order_id,
       CASE
           WHEN YEAR(order_date) = YEAR('2019-01-01') THEN 'Active'
           WHEN YEAR(order_date) = YEAR('2019-01-01') - 1 THEN 'Last year'
           ELSE 'Future'
       END AS category
FROM orders;

SELECT
       CONCAT(first_name, ' ', last_name) AS name,
       CASE
           WHEN points > 3000 THEN 'GOLD'
           WHEN points >= 2000 THEN 'silver'
           ELSE 'BRONZE'
       END AS category
FROM customers;