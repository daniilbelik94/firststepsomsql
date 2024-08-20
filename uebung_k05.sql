
/* 

    1. Erstellen Sie eine Datenbank mit dem Namen testdb.
    Wechseln Sie zu dieser neuen Datenbank.
    Erstellen Sie eine neue Tabelle t_artikel mit den Datenfeldern id, name und preis.
    Verwenden Sie geeignete Datentypen.
    Löschen Sie die Tabelle und anschließend die Datenbank.

    2. Wechseln Sie zur Datenbank Uebungen.
    Erstellen Sie eine Tabelle t_person mit den Datenfeldern id, vname und name.
    Verwenden Sie dabei geeignete Datentypen.
    Für alle Datenfelder soll eine Eingabe erforderlich sein. Erweitern Sie die Definition der
    Datenfelder für diesen Zweck.
    Fügen Sie ein neues Datenfeld beschaeftigt_seit in die Tabelle ein. Es soll einen Datumswert speichern.
    Löschen Sie das Datenfeld wieder.
    
    3. Wechseln Sie zur Datenbank Uebungen.
    Löschen Sie die in Übung 2 erstellte Tabelle t_person.
    Erstellen Sie eine geeignete Domäne, die als Datentyp für die Speicherung von Vorname
    und Nachname verwendet werden soll. Es soll für das Datenfeld unbedingt eine Eingabe
    erforderlich sein. Nennen Sie die Domäne Namen.
    Erstellen Sie die Tabelle t_person mit folgenden Datenfeldern: id, vname, name, strasse, hnr, plz und ort. Verwenden Sie dabei geeignete Datentypen bzw. die neu definierte Domäne.

*/





----------- Übung 1 ---------------

DROP DATABASE IF EXISTS testdb;
CREATE DATABASE IF NOT EXISTS testdb;

USE testdb; 

CREATE TABLE IF NOT EXISTS t_artikel (
    id INTEGER,
    name VARCHAR(100),
    preis DOUBLE
);

DROP TABLE t_artikel;
DROP DATABASE testdb;


----------- Übung 2 ---------------

# DROP DATABASE IF EXISTS uebungen;
# CREATE DATABASE IF NOT EXISTS uebungen;

USE uebungen;

CREATE TABLE IF NOT EXISTS t_person (
    id INTEGER NOT NULL,
    vname VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL
);

ALTER TABLE t_person ADD beschaeftigt_seit DATE NOT NULL;
ALTER TABLE t_person DROP beschaeftigt_seit;

----------- Übung 3 ---------------

USE uebungen;
DROP TABLE t_person;
-- Domains sind in MariaDB nicht möglich!
-- Tabelle muss daher mit normalen Datentypen erstellt werden.
CREATE TABLE t_person  (
    id INTEGER NOT NULL,
    vname VARCHAR(150) NOT NULL,
    name VARCHAR(150) NOT NULL,
    strasse VARCHAR(150),
    hnr VARCHAR(5),
    plz VARCHAR(7),
    ort VARCHAR(150)
); 

