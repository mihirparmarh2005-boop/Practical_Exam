CREATE DATABASE ecommerce_db;
USE ecommerce_db;


CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    category_id INT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    added_date DATE,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    email VARCHAR(150),
    phone_number VARCHAR(20),
    address TEXT,
    registration_date DATE
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    status VARCHAR(50), -- Values: Pending, Shipped, Delivered, Cancelled
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    subtotal DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(50), -- Values: Credit Card, PayPal, UPI
    payment_status VARCHAR(50), -- Values: Paid, Pending, Failed
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);


CREATE TABLE Shipping (
    shipping_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    shipping_date DATE,
    delivery_date DATE,
    shipping_status VARCHAR(50), -- Values: Dispatched, In Transit, Delivered
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

INSERT INTO Categories (category_name) VALUES ('Electronics'), ('Clothing');

INSERT INTO Products (name, category_id, price, stock_quantity, added_date) 
VALUES ('  smartphone  ', 1, 45000.00, 150, '2023-01-10'),
       ('laptop', 1, 75000.00, 50, '2022-05-15'),
       ('t-shirt', 2, 1200.00, 600, '2024-02-01');

INSERT INTO Customers (name, email, phone_number, address, registration_date) 
VALUES ('Rahul Sharma', 'rahul@example.com', '9876543210', 'Delhi', '2022-11-20'),
       ('Priya Patel', NULL, '9123456789', 'Mumbai', '2023-03-10');

INSERT INTO Orders (customer_id, order_date, total_amount, status) 
VALUES (1, '2026-03-01', 45000.00, 'Pending'),
       (2, '2025-10-12', 1200.00, 'Shipped');


UPDATE Products 
SET stock_quantity = stock_quantity - 1 
WHERE product_id = 1;


DELETE FROM Orders 
WHERE status = 'Cancelled' AND order_date < (CURRENT_DATE - INTERVAL 30 DAY);

SELECT * FROM Orders 
WHERE order_date >= (CURRENT_DATE - INTERVAL 6 MONTH);


SELECT * FROM Products 
ORDER BY price DESC 
LIMIT 5;


SELECT customer_id, COUNT(order_id) AS total_orders 
FROM Orders 
GROUP BY customer_id 
HAVING COUNT(order_id) > 3;


SELECT o.* FROM Orders o
JOIN Payments p ON o.order_id = p.order_id
WHERE o.status = 'Pending' AND p.payment_status = 'Paid';


SELECT * FROM Products 
WHERE NOT stock_quantity = 0;


SELECT DISTINCT c.* FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE c.registration_date > '2022-12-31' OR o.total_amount > 10000;



SELECT * FROM Products 
ORDER BY price DESC;


SELECT customer_id, COUNT(order_id) AS order_count 
FROM Orders 
GROUP BY customer_id;


SELECT c.category_name, SUM(oi.subtotal) AS total_revenue
FROM Categories c
JOIN Products p ON c.category_id = p.category_id
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY c.category_name;



SELECT SUM(total_amount) AS store_revenue FROM Orders;


SELECT product_id, SUM(quantity) AS total_sold 
FROM Order_Items 
GROUP BY product_id 
ORDER BY total_sold DESC 
LIMIT 1;


SELECT AVG(total_amount) AS average_order_value FROM Orders;



SELECT p.name AS product_name, c.category_name, p.price
FROM Products p
INNER JOIN Categories c ON p.category_id = c.category_id;


SELECT o.order_id, o.order_date, c.name, c.email
FROM Orders o
LEFT JOIN Customers c ON o.customer_id = c.customer_id;


SELECT o.order_id, s.shipping_status
FROM Shipping s
RIGHT JOIN Orders o ON s.order_id = o.order_id
WHERE s.shipping_id IS NULL OR s.shipping_status != 'Delivered';


SELECT c.customer_id, c.name, o.order_id
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL
UNION
SELECT c.customer_id, c.name, o.order_id
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;



SELECT * FROM Orders 
WHERE customer_id IN (
    SELECT customer_id FROM Customers WHERE registration_date > '2022-12-31'
);


SELECT customer_id, name FROM Customers 
WHERE customer_id = (
    SELECT customer_id FROM Orders GROUP BY customer_id ORDER BY SUM(total_amount) DESC LIMIT 1
);


SELECT * FROM Products 
WHERE product_id NOT IN (
    SELECT DISTINCT product_id FROM Order_Items
);



SELECT MONTH(order_date) AS order_month, COUNT(*) AS total_orders 
FROM Orders 
GROUP BY MONTH(order_date);


SELECT shipping_id, DATEDIFF(delivery_date, shipping_date) AS delivery_days 
FROM Shipping;


SELECT order_id, DATE_FORMAT(order_date, '%d-%m-%Y') AS formatted_date 
FROM Orders;



SELECT UPPER(name) AS uppercase_product_name FROM Products;


SELECT TRIM(name) AS trimmed_customer_name FROM Customers;


SELECT COALESCE(email, 'Not Provided') AS customer_email FROM Customers;



SELECT customer_id, SUM(total_amount) AS total_spent,
       RANK() OVER (ORDER BY SUM(total_amount) DESC) AS customer_rank
FROM Orders
GROUP BY customer_id;


SELECT DATE_FORMAT(order_date, '%Y-%m') AS order_month,
       SUM(total_amount) AS monthly_revenue,
       SUM(SUM(total_amount)) OVER (ORDER BY DATE_FORMAT(order_date, '%Y-%m')) AS cumulative_revenue
FROM Orders
GROUP BY order_month;


SELECT order_id, order_date,
       COUNT(order_id) OVER (ORDER BY order_date, order_id) AS running_total_orders
FROM Orders;





SELECT customer_id, SUM(total_amount) AS total_spent,
       CASE 
           WHEN SUM(total_amount) > 50000 THEN 'Gold'
           WHEN SUM(total_amount) BETWEEN 20000 AND 50000 THEN 'Silver'
           ELSE 'Bronze'
       END AS Loyalty_Status
FROM Orders
GROUP BY customer_id;


SELECT p.product_id, p.name, COALESCE(SUM(oi.quantity), 0) AS total_sold,
       CASE 
           WHEN COALESCE(SUM(oi.quantity), 0) > 500 THEN 'Best Seller'
           WHEN COALESCE(SUM(oi.quantity), 0) BETWEEN 200 AND 500 THEN 'Popular'
           ELSE 'Regular'
       END AS Product_Category
FROM Products p
LEFT JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.name;