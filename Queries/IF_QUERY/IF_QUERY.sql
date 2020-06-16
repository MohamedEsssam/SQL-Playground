USE sql_store;
/**
  TO substitute null value
 */
SELECT
       order_id,
       IFNULL(shipper_id, 'Not assigned') AS shipper
FROM orders;
### === ### equivalent
### but COALESCE can replace null
# value with anther columns value
SELECT
       order_id,
       COALESCE(shipper_id, comments, 'Not assigned') AS shipper
FROM orders;

SELECT
       CONCAT(first_name,' ',last_name),
       COALESCE(phone, 'Unknown')
FROM customers;

SELECT
       order_id,
       order_date,
       IF(YEAR(order_date)=YEAR('2019-01-01'),
           'Active',
           'Archive') AS status
FROM orders;

SELECT
       product_id,
       name,
       COUNT(oi.order_id) AS orders,
       IF(COUNT(oi.order_id) > 1,
           'Many times',
           'Once') AS freq
FROM products
JOIN order_items oi
    USING (product_id)
GROUP BY product_id, name
;