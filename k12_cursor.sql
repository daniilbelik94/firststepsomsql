SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;

DROP DATABASE IF EXISTS cursor_db;
CREATE DATABASE cursor_db
USE cursor_db;

exit

DROP TABLE IF EXISTS tutorials;
CREATE TABLE tutorials (
    id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(40),
    date VARCHAR(40)
);

INSERT INTO tutorials VALUES(1, 'Java', 'Krishna', '2019-09-01');
INSERT INTO tutorials VALUES(2, 'JFreeCharts', 'Satish', '2019-05-01');
INSERT INTO tutorials VALUES(3, 'JavaSprings', 'Amit', '2019-05-01');
INSERT INTO tutorials VALUES(4, 'Android', 'Ram', '2019-03-01');
INSERT INTO tutorials VALUES(5, 'Cassandra', 'Pruthvi', '2019-04-06');

DROP TABLE IF EXISTS backup;
CREATE TABLE backup (
    id INT,
    title VARCHAR(100),
    author VARCHAR(40),
    date VARCHAR(40)
);


DROP PROCEDURE IF EXISTS ExampleProc;

DELIMITER //
CREATE PROCEDURE ExampleProc()
    BEGIN
        DECLARE done INT DEFAULT false; -- Setzt eine Variable auf den Wert false
        DECLARE tutorialID INTEGER; -- Setzt eine leere Variable als Integer Wert
        DECLARE tutorialTitle, tutorialAuthor, tutorialDate VARCHAR(20); -- Setzt leere Variablen als Varchar Wert
        
        DECLARE cur CURSOR FOR SELECT * FROM tutorials; -- Deklariert einen Cursor auf eine bestimmte Tabelle
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = true; -- Setzt die Variable done auf true wenn das Ende der Datensätze erreicht wurde.
        OPEN cur; -- Öffnet den Cursor
            -- Erstelle eine loop-Schleife
            label: LOOP 
                FETCH cur INTO tutorialID, tutorialTitle, tutorialAuthor, tutorialDate; -- Holt den Datensatz auf dem der Zeiger sitzt und setzt ihn auf den nächsten Datensatz
                IF done THEN 
                    LEAVE label;
                ELSE
                    INSERT INTO backup VALUES(tutorialID, tutorialTitle, tutorialAuthor, tutorialDate); -- Schreibt den mit FETCH ausgelesenen Datensatz in die Tabelle backup
                END IF;
            END LOOP;
        CLOSE cur; -- Schließt den Cursor
    END //
DELIMITER ;

SELECT * FROM backup;

CALL ExampleProc;

SELECT * FROM backup;