-- Datenbank löschen, falls sie bereits existiert
DROP DATABASE IF EXISTS uebung;

-- Erstellen der neuen Datenbank
CREATE DATABASE uebung;

-- Wechseln zur neu erstellten Datenbank
USE uebung;

-- Erstellen der Tabelle
CREATE TABLE t_personal (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vname VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL
);

-- Einfügen von Daten in die Tabelle
INSERT INTO t_personal (vname, name) VALUES
('Anna', 'Mueller'),
('Bernd', 'Schmidt'),
('Claudia', 'Fischer'),
('Daniel', 'Meier'),
('Eva', 'Schneider'),
('Frank', 'Schulz'),
('Gabriele', 'Zimmermann'),
('Hermann', 'Klein'),
('Ingrid', 'Richter'),
('Juergen', 'Krause'),
('Katrin', 'Weber'),
('Lutz', 'Hartmann'),
('Mona', 'Jung'),
('Nico', 'Koch'),
('Olga', 'Lange'),
('Paul', 'Hoffmann'),
('Quirin', 'Mayer'),
('Rita', 'Friedrich'),
('Stefan', 'Zimmer'),
('Tina', 'Bauer');

-- Hinzufügen der neuen Spalte
ALTER TABLE t_personal
ADD COLUMN beschaeftigt_seit DATE;

-- Aktualisieren der Daten mit dem neuen Feld
UPDATE t_personal
SET beschaeftigt_seit = CASE id
    WHEN 1 THEN '2020-01-15'
    WHEN 2 THEN '2019-03-22'
    WHEN 3 THEN '2021-07-11'
    WHEN 4 THEN '2018-06-30'
    WHEN 5 THEN '2022-02-10'
    WHEN 6 THEN '2020-09-05'
    WHEN 7 THEN '2021-12-01'
    WHEN 8 THEN '2019-11-23'
    WHEN 9 THEN '2022-08-17'
    WHEN 10 THEN '2017-04-25'
    WHEN 11 THEN '2023-01-03'
    WHEN 12 THEN '2020-05-18'
    WHEN 13 THEN '2021-10-09'
    WHEN 14 THEN '2018-08-14'
    WHEN 15 THEN '2019-02-28'
    WHEN 16 THEN '2022-07-19'
    WHEN 17 THEN '2021-09-01'
    WHEN 18 THEN '2017-11-11'
    WHEN 19 THEN '2022-12-30'
    WHEN 20 THEN '2018-05-21'
    ELSE beschaeftigt_seit
END;

-- Abfragen der Tabelle, um die Ergebnisse zu überprüfen
SELECT * FROM t_personal;


-- SHOW DATABASES; — показывает все базы данных.
-- USE имя_базы; — переключает на указанную базу данных.
-- SHOW TABLES; — показывает все таблицы в текущей базе данных.
-- DESCRIBE имя_таблицы; — показывает структуру таблицы.
-- SELECT * FROM имя_таблицы; — выводит все данные из таблицы.