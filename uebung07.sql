drop DATABASE if exists uebungen;

CREATE DATABASE uebungen;

USE uebungen;


CREATE TABLE t_lager (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    stueckzahl varchar(255) NOT NULL,
    preis DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO t_lager (name, stueckzahl, preis)
VALUES
    ('Kugelschreiber', '270', '2.99'),
    ('Ordner', '250', '2.80'),
    ('Heftklammern', '430', '0.99'),
    ('Bleistift', '410', '0.99'),
    ('UImschleage B6', '250', '0.80'),
    ('Schreibblock', '2260', '0.80'),
    ('Drucker', '70', '149.00'),
    ('Webcam', '80', '89.99'),
    ('Headset', '90', '39.90'),
    ('USB-Stick', '100', '9.99');

SELECT * FROM t_lager;

-- SHOW DATABASES; — показывает все базы данных.
-- USE имя_базы; — переключает на указанную базу данных.
-- SHOW TABLES; — показывает все таблицы в текущей базе данных.
-- DESCRIBE имя_таблицы; — показывает структуру таблицы.
-- SELECT * FROM имя_таблицы; — выводит все данные из таблицы.


