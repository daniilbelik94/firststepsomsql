
-- Löscht die Datenbank cbw wenn sie existiert
DROP DATABASE IF EXISTS cbw; -- Zeilenkommentar
/*  
    Block-Kommentar
*/


-- Kreiert die Datenbank cbw
CREATE DATABASE cbw;

-- Wechselt in die Datenbank cbw
USE cbw;

-- Zeigt alle Datenbanken im DBS
show DATABASES;

-- Erzeugt die Tabelle testtable mit zwei Spalten 
CREATE TABLE testtable (
    vname VARCHAR(20),
    mail VARCHAR(255),
);

-- Zeigt alle Tabellen in der benuzten Datenbank testtable
show TABLES;

show COLUMNS FROM testtable;

