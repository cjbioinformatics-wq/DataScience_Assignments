## Create Tables

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    amount DECIMAL(10,2)
);


## Insert Data

INSERT INTO orders VALUES
(1, 101, '2024-01-10', 5000.00),
(2, 102, '2024-01-12', 3000.00),
(3, 103, '2024-01-15', 7000.00),
(4, 104, '2024-01-18', 4000.00),
(5, 105, '2024-01-20', 6000.00);

INSERT INTO payments VALUES
(201, 1, '2024-01-11', 5000.00),
(202, 2, '2024-01-13', 3000.00),
(203, 3, '2024-01-16', 4000.00),
(204, 3, '2024-01-17', 3000.00),
(205, 5, '2024-01-21', 6000.00);


## WHERE Clause

SELECT * FROM orders
WHERE total_amount > 4000;


## Logical Operators (AND, OR, NOT)

SELECT * FROM orders
WHERE total_amount > 4000 AND order_date > '2024-01-12';

SELECT * FROM orders
WHERE customer_id = 101 OR customer_id = 105;

SELECT * FROM orders
WHERE NOT total_amount > 5000;

## Aggregate Functions (SUM, AVG, COUNT)

SELECT SUM(total_amount) AS total_sales FROM orders;

SELECT AVG(total_amount) AS avg_order_value FROM orders;

SELECT COUNT(order_id) AS total_orders FROM orders;


## ORDER BY

SELECT * FROM orders
ORDER BY total_amount ASC;

SELECT * FROM payments
ORDER BY payment_date DESC;

## BETWEEN

SELECT * FROM orders
WHERE total_amount BETWEEN 4000 AND 6000;


## IN / NOT IN

SELECT * FROM orders
WHERE customer_id IN (101, 103, 105);

SELECT * FROM orders
WHERE customer_id NOT IN (102, 104);


## GROUP BY & HAVING

SELECT order_id, SUM(amount) AS total_paid
FROM payments
GROUP BY order_id;

SELECT order_id, SUM(amount) AS total_paid
FROM payments
GROUP BY order_id
HAVING SUM(amount) < 5000;


## JOINS

### INNER JOIN

SELECT o.order_id, o.total_amount, p.amount
FROM orders o
INNER JOIN payments p
ON o.order_id = p.order_id;


### LEFT JOIN

SELECT o.order_id, p.amount
FROM orders o
LEFT JOIN payments p
ON o.order_id = p.order_id;

### RIGHT JOIN

SELECT o.order_id, p.amount
FROM orders o
RIGHT JOIN payments p
ON o.order_id = p.order_id;


### FULL OUTER JOIN 

SELECT o.order_id, p.amount
FROM orders o
LEFT JOIN payments p
ON o.order_id = p.order_id

UNION

SELECT o.order_id, p.amount
FROM orders o
RIGHT JOIN payments p
ON o.order_id = p.order_id;


## SUBQUERIES

### Orders above average value

SELECT * FROM orders
WHERE total_amount > (
    SELECT AVG(total_amount) FROM orders
);


### Orders with full payment

SELECT * FROM orders
WHERE order_id IN (
    SELECT order_id FROM payments
    GROUP BY order_id
    HAVING SUM(amount) = (
        SELECT total_amount FROM orders WHERE orders.order_id = payments.order_id
    )
);

## CASE Statement

SELECT order_id, total_amount,
CASE
    WHEN total_amount >= 6000 THEN 'High Value'
    WHEN total_amount BETWEEN 4000 AND 5999 THEN 'Medium Value'
    ELSE 'Low Value'
END AS order_category
FROM orders;


## VIEW

CREATE VIEW order_payment_view AS
SELECT o.order_id, o.customer_id, o.total_amount,
       p.payment_date, p.amount
FROM orders o
LEFT JOIN payments p
ON o.order_id = p.order_id;

SELECT * FROM order_payment_view;

