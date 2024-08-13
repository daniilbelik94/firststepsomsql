-- Datenbank erstellen
CREATE DATABASE testdb;

-- Zur neuen Datenbank wechseln
USE testdb;

-- Tabelle t_artikel erstellen
CREATE TABLE t_artikel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    preis DECIMAL(10, 2) NOT NULL
);

-- Tabelle t_artikel löschen
DROP TABLE t_artikel;

-- Datenbank testdb löschen
DROP DATABASE testdb;
