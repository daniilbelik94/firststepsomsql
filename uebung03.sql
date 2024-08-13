-- Zur Datenbank Uebungen wechseln
USE Uebungen;

-- Tabelle t_person löschen (falls sie existiert)
DROP TABLE IF EXISTS t_person;

-- Tabelle t_person mit den geforderten Feldern erstellen
CREATE TABLE t_person (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vname VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    strasse VARCHAR(255) NOT NULL,
    hnr VARCHAR(10) NOT NULL,
    plz VARCHAR(10) NOT NULL,
    ort VARCHAR(255) NOT NULL
);

 DESCRIBE t_person;

INSERT INTO t_person (vname, name, strasse, hnr, plz, ort) 
VALUES ('Peter', 'Biber', 'Musterstraße', '10', '123456', 'Musterstadt');


SELECT * FROM t_person;



-- SHOW DATABASES; — показывает все базы данных.
-- USE имя_базы; — переключает на указанную базу данных.
-- SHOW TABLES; — показывает все таблицы в текущей базе данных.
-- DESCRIBE имя_таблицы; — показывает структуру таблицы.
-- SELECT * FROM имя_таблицы; — выводит все данные из таблицы.