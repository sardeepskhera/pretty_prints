CREATE VIEW Under_100 AS
SELECT i.item_id, i.title, i.artist, i.unit_price, ol.order_qty
FROM items AS i, orderline AS ol
WHERE i.item_id = ol.item_id AND unit_price < 100;

CREATE VIEW Allen AS
SELECT c.customer_id, c.customer_name, c.customer_phone, i.title, i.artist
FROM customers AS c, items AS i, orders AS o, orderline AS ol
WHERE c.customer_id = o.customer_id AND o.order_id = ol.order_id AND ol.item_id = i.item_id;

CREATE VIEW orders AS
SELECT i.item_id, i.title, i.artist, i.unit_price, ol.order_qty
FROM items AS i, orders AS o, orderline AS ol
WHERE i.item_id = ol.item_id AND ol.order_id = o.order_id
AND order_date BETWEEN '2014-01-01' AND '2014-02-28';

CREATE VIEW zip_27 AS
SELECT c.customer_name, c.customer_phone, i.title, i.artist, o.ship_date
FROM customers AS c, items AS i, orders AS o, orderline AS ol
WHERE c.customer_id = o.customer_id AND o.order_id = ol.order_id AND ol.item_id = i.item_id
AND c.customer_zip LIKE '%27';

CREATE INDEX customer_id
ON customers (customer_id);
CREATE INDEX name
ON customers (customer_name);
CREATE INDEX shipped
ON orders (customer_id, ship_date);

DROP INDEX name ON customers;

ALTER TABLE items
ADD CHECK (unit_price > 35);

/* A - customer_id is a foreign key in the orders table. */
ALTER TABLE items;

/* B - Item_id is a foreign key in the orderline table. */
ALTER TABLE items;

ALTER TABLE items
ADD TYPE CHARACTER(1);

UPDATE items
SET TYPE='M'
WHERE title = 'Skies Above';

ALTER TABLE items
CHANGE COLUMN artist TO CHARACTER(30);

DROP TABLE orders;