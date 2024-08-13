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



INSERT INTO t_person (vname, name, strasse, hnr, plz, ort) 
VALUES 
('John', 'Doe', 'Main Street', '15', '654321', 'Sample City'),
('Anna', 'Smith', 'Oak Street', '20', '654322', 'Example Town'),
('David', 'Johnson', 'Maple Avenue', '30', '654323', 'Demo City'),
('Emma', 'Williams', 'Pine Street', '25', '654324', 'Test Town'),
('Michael', 'Brown', 'Cedar Street', '10', '654325', 'Sampleville'),
('Sophia', 'Jones', 'Birch Avenue', '35', '654326', 'Demo Town'),
('Oliver', 'Miller', 'Elm Street', '40', '654327', 'Example City'),
('Emily', 'Davis', 'Spruce Avenue', '50', '654328', 'Testville'),
('James', 'Wilson', 'Chestnut Street', '55', '654329', 'Model City'),
('Mia', 'Moore', 'Beech Street', '60', '654330', 'Sample Town'),
('Alexander', 'Taylor', 'Poplar Avenue', '65', '654331', 'Demo Village'),
('Isabella', 'Anderson', 'Fir Street', '70', '654332', 'Exampleville'),
('Benjamin', 'Thomas', 'Aspen Street', '75', '654333', 'Test City'),
('Charlotte', 'Harris', 'Willow Avenue', '80', '654334', 'Model Town'),
('Lucas', 'Martinez', 'Pine Lane', '85', '654335', 'Sampleville');



SELECT * FROM t_person;



-- SHOW DATABASES; — показывает все базы данных.
-- USE имя_базы; — переключает на указанную базу данных.
-- SHOW TABLES; — показывает все таблицы в текущей базе данных.
-- DESCRIBE имя_таблицы; — показывает структуру таблицы.
-- SELECT * FROM имя_таблицы; — выводит все данные из таблицы.