SELECT customer_name, customer_add, customer_city, customer_state, customer_zip
FROM customers;

SELECT customer_name, customer_phone
FROM customers
WHERE customer_state IN('GA');

SELECT customer_name, customer_zip
FROM customers
WHERE customer_state LIKE '%C';

SELECT title, artist, order_date, ship_date
FROM items, orders;

SELECT item_id, title, artist, unit_price, on_hand
FROM items
ORDER BY unit_price ASC;

SELECT item_id, title, artist, unit_price, on_hand
FROM items
WHERE unit_price > '100';

SELECT item_id, title, artist, unit_price, on_hand
FROM items
WHERE on_hand > '300';

SELECT title, unit_price, (unit_price*2) AS retail_price
FROM items;

SELECT customer_name, customer_phone, order_date
FROM customers, orders
WHERE customers.customer_id = orders.customer_id
AND order_date > '2014-01-01';

SELECT artist, COUNT(order_qty) AS total_sold_prints
FROM items, orderline
WHERE items.item_id = orderline.item_id
GROUP BY artist;

SELECT title, unit_price
FROM items
WHERE unit_price BETWEEN 40 AND 100;

SELECT customer_name, title, artist, order_qty
FROM customers, items, orders, orderline
WHERE customers.customer_id = orders.customer_id 
AND orders.order_id = orderline.order_id;

SELECT customer_name, (unit_price*2) AS total_revenue
FROM customers, items, orders, orderline
WHERE customers.customer_id = orders.customer_id 
AND orders.order_id = orderline.order_id;

SELECT customer_state, COUNT(customer_name) AS total_customers
FROM customers
GROUP BY customer_state;
