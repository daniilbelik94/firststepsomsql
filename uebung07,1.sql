-- Wechseln Sie zur Datenbank Uebungen. 
-- Erstellen Sie eine Datenabfrage für die Tabelle t_ma, um die Vornamen und Familiennamen 
-- aller Mitarbeiter zu ermitteln. Begrenzen Sie das Abfrageergebnis auf 15 Datensätze. 
-- Erweitern Sie die Abfrage, damit Sie zusätzlich die Postleitzahl und den Ort der Mitarbeiter 
-- erhalten. 
-- Definieren Sie für alle Felder der Abfrage sinnvolle Ersatznamen. 
-- Ändern Sie die Abfrage, sodass Sie nur Mitarbeiter aus Hamburg und Berlin erhalten. 
-- Verwenden Sie dazu die IN-Anweisung. Zusätzlich sollen die Mitarbeiter vor dem Jahr 1980 
-- geboren sein. Lassen Sie sich die Ergebnisse der Abfrage nach Familiennamen der Mitarbeiter sortieren.

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;

drop DATABASE if exists Uebungen;

CREATE DATABASE Uebungen;

USE Uebungen;

CREATE TABLE t_ma (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vname VARCHAR(100) NOT NULL,
    nachname VARCHAR(100) NOT NULL,
    plz VARCHAR(5) NOT NULL,
    ort VARCHAR(100) NOT NULL,
    gbr DATE
);

INSERT INTO t_ma (vname, nachname, plz, ort, gbr)
VALUES
    ('Anna', 'Müller', '20095', 'Hamburg', '1975-03-15'),
    ('Bernd', 'Schmidt', '20097', 'Hamburg', '1969-07-22'),
    ('Claudia', 'Fischer', '10115', 'Berlin', '1978-11-30'),
    ('Daniel', 'Meier', '10117', 'Berlin', '1976-02-18'),
    ('Eva', 'Schneider', '20099', 'Hamburg', '1980-05-12'),
    ('Frank', 'Schulz', '10243', 'Berlin', '1974-09-08'),
    ('Gabriele', 'Zimmermann', '20354', 'Hamburg', '1965-01-25'),
    ('Hermann', 'Klein', '10365', 'Berlin', '1979-04-16'),
    ('Ingrid', 'Richter', '20457', 'Hamburg', '1968-10-09'),
    ('Juergen', 'Krause', '10437', 'Berlin', '1977-06-29'),
    ('Katrin', 'Weber', '20537', 'Hamburg', '1971-12-11'),
    ('Lutz', 'Hartmann', '10557', 'Berlin', '1967-08-14'),
    ('Mona', 'Jung', '21073', 'Hamburg', '1964-03-19'),
    ('Nico', 'Koch', '10623', 'Berlin', '1973-07-03'),
    ('Olga', 'Lange', '21107', 'Hamburg', '1972-11-26');

SELECT
id as Mitarbeiter,
vname as Vorname,
nachname as Nachname,
plz as PLZ,
ort as Ort
FROM t_ma
WHERE ort in ('Hamburg', 'Berlin')
And
gbr < '1980-01-01'
ORDER BY Nachname asc;
limit 15;




