-- testddb.sql

DROP DATABASE IF EXISTS testddb;

CREATE DATABASE testddb;

USE testddb;

CREATE TABLE t_artikel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    preis DECIMAL(10, 2) NOT NULL
);

INSERT INTO t_artikel (id, name, preis) 
VALUES
(1, 'Laptop', 999.99),
(2, 'Smartphone', 499.95),
(3, 'Tablet', 299.99),
(4, 'Monitor', 199.50),
(5, 'Maus', 19.99),
(6, 'Tastatur', 49.95),
(7, 'Drucker', 149.00),
(8, 'Webcam', 89.99),
(9, 'Headset', 39.90),
(10, 'USB-Stick', 9.99);

SELECT * FROM t_artikel;

DROP TABLE t_artikel;

DROP DATABASE testddb;


-- SHOW DATABASES; — показывает все базы данных.
-- USE имя_базы; — переключает на указанную базу данных.
-- SHOW TABLES; — показывает все таблицы в текущей базе данных.
-- DESCRIBE имя_таблицы; — показывает структуру таблицы.
-- SELECT * FROM имя_таблицы; — выводит все данные из таблицы.
