DROP DATABASE IF EXISTS uebungen01;

CREATE DATABASE uebungen01;

USE uebungen01;

DROP TABLE IF EXISTS t_person;

CREATE TABLE t_person (
    id int NOT NULL AUTO_INCREMENT,
    vorname varchar(255) NOT NULL,
    nachname varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO t_person (vorname, nachname)
VALUES
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

SELECT * FROM t_person;


-- SHOW DATABASES; — показывает все базы данных.
-- USE имя_базы; — переключает на указанную базу данных.
-- SHOW TABLES; — показывает все таблицы в текущей базе данных.
-- DESCRIBE имя_таблицы; — показывает структуру таблицы.
-- SELECT * FROM имя_таблицы; — выводит все данные из таблицы.