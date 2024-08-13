-- Zur Datenbank Uebungen wechseln
USE Uebungen;

-- Tabelle t_person erstellen
CREATE TABLE t_person (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vname VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL
);

-- Datenfeld beschaeftigt_seit hinzufügen
ALTER TABLE t_person
ADD COLUMN beschaeftigt_seit DATE;

-- Datenfeld beschaeftigt_seit wieder löschen
ALTER TABLE t_person
DROP COLUMN beschaeftigt_seit;


-- SHOW DATABASES; — показывает все базы данных.
-- USE имя_базы; — переключает на указанную базу данных.
-- SHOW TABLES; — показывает все таблицы в текущей базе данных.
-- DESCRIBE имя_таблицы; — показывает структуру таблицы.
-- SELECT * FROM имя_таблицы; — выводит все данные из таблицы.