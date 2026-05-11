-- Phần 1: Tạo CSDL và các bảng:
CREATE DATABASE ShopPhone;

USE ShopPhone;
-- 1)
CREATE TABLE customers (
customer_id VARCHAR(5) PRIMARY KEY,
full_name VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
phone VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE brands (
brand_id VARCHAR(5) PRIMARY KEY,
brand_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE products (
product_id VARCHAR(5) PRIMARY KEY,
product_name VARCHAR(100) NOT NULL UNIQUE,
brand_id VARCHAR(5), FOREIGN KEY (brand_id) REFERENCES brands (brand_id),
price DECIMAL(10,2) NOT NULL,
stock INT NOT NULL
);

CREATE TABLE orders (
order_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id VARCHAR(5), FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
product_id VARCHAR(5),FOREIGN KEY (product_id) REFERENCES products (product_id),
status VARCHAR(20) NOT NULL,
order_date DATE NOT NULL
);
-- 2)
INSERT INTO customers 
VALUES 
('C01','Nguyễn Văn An','an.nv@gmail.com','0911111111'),
('C02','Nguyễn Thị Mai','mai.nt@gmail.com','09222222222'),
('C03','Trần Quang Hải','hai.tq@gmail.com','0933333333'),
('C04','Phạm Bảo Ngọc','ngoc.pb@gmail.com','0944444444'),
('C05','Vũ Đức Đam','dam.vd@gmail.com','0955555555');

INSERT INTO brands
VALUES
('B01','Apple'),
('B02','Samsung'),
('B03','Sony'),
('B04','Dell');

INSERT INTO products
VALUES
('P01','Iphone 15 Pro Max','B01','30000000.00','10'),
('P02','MacBook Pro M3','B01','45000000.00','5'),
('P03','Galaxy S24 Ultra','B02','25000000.00','20'),
('P04','PlayStation 5','B03','15000000.00','8'),
('P05','Dell XPS 15','B04','35000000.00','15');

INSERT INTO orders
VALUES
(NULL,'C01','P01','Pending','2025-10-1'),
(NULL,'C02','P03','Completed','2025-10-2'),
(NULL,'C01','P02','Completed','2025-10-3'),
(NULL,'C04','P05','Cancelled','2025-10-4'),
(NULL,'C01','P01','Pending','2025-10-5');
-- 3)
UPDATE products
SET price = price * 1.05, stock = stock + 10
WHERE product_name = 'Dell XPS 15';
-- 4)
UPDATE customers
SET phone = '0999999999'
WHERE customer_id = 'C03';
-- 5)
SET SQL_SAFE_UPDATES = 0;

DELETE FROM orders
WHERE status = 'Completed' AND order_date < '2025-10-3';
-- Phần 2: Truy vấn dữ liệu cơ bản
-- 6)
SELECT product_id, product_name, price
FROM products
WHERE (price BETWEEN 15000000 AND 30000000) AND stock > 0;
-- 7)
SELECT full_name, email
FROM customers
WHERE full_name LIKE '%Nguyễn%';
-- 8)
SELECT order_id, customer_id, order_date
FROM orders
ORDER BY order_date DESC;
-- 9)
SELECT product_name, price
FROM products
ORDER BY price DESC
LIMIT 3;
-- 10)
SELECT product_name, stock
FROM products 
LIMIT 2, 2;
-- Phần 3 : Truy vấn dữ liệu nâng cao
-- 11)
SELECT o.order_id, c.full_name, p.product_name, o.order_date
FROM orders AS o, customers AS c, products AS p
JOIN c.full_name ON o.customer_id = c.customer_id
JOIN p.product_name ON o.product_id = p.product_id
WHERE o.status = 'Pending';
-- 12)
SELECT brand_name, product_name
-- 13)
SELECT Status
COUNT (*)
