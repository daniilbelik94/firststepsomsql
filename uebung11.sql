-- Wechseln Sie zur Datenbank Uebungen. 
-- Erstellen Sie basierend auf der Tabelle t_ma eine Sicht v_ma_berlin, die die ID-Nummer, den 
-- Familiennamen, den Vornamen, die Abteilung, die Straße, die Hausnummer, den Ort und die 
-- Postleitzahl aller Mitarbeiter aus Berlin enthält. 
-- Rufen Sie mit einer Abfrage alle Datensätze der Sicht ab. Sortieren Sie die Ausgabe einmal 
-- aufsteigend nach Familienname und Vorname sowie ein zweites Mal nach der Abteilungs-
-- nummer. 
-- Löschen Sie die Sicht. Eventuell müssen Sie vorher laufende Abfragen mit dem Befehl 
-- COMMIT bestätigen. 
-- Erstellen Sie die Sicht neu und verwenden Sie dabei die Option zur Datenüberprüfung. 
-- Erstellen Sie einen neuen Datensatz für die Mitarbeiterin Helene Weigelt, Südstr. 6a, 10114 
-- Berlin. Die Mitarbeiter-ID soll 140 lauten. 
-- Versuchen Sie, für den gerade eingefügten Datensatz den Ort von Berlin in Potsdam zu 
-- ändern. Was stellen Sie fest? 
-- 2. Wechseln Sie zur Datenbank Uebungen. 
-- Erstellen Sie eine Sicht, die für alle Mitarbeiter aus Berlin die Projektnummern anzeigt, an 
-- denen die Mitarbeiter beteiligt sind. Verknüpfen Sie dazu die Tabellen t_ma und t_ma_proj 
-- mit einem Join. 
-- Rufen Sie zuerst alle Datensätze der Sicht ab. Zeigen Sie danach nur die Datensätze an, 
-- für die die Projektnummer 2 ist. 
-- Erstellen Sie eine SELECT-Anweisung, um die Anzahl der Mitarbeiter aus Berlin, die am 
-- Projekt 2 beteiligt sind, zu ermitteln. 
-- Ermitteln Sie diesen Wert mithilfe einer Sicht und vergleichen Sie die Komplexität der 
-- Abfragen.




source datenbank_uebungen.sql;

use uebungen;


CREATE VIEW v_ma_berlin AS
SELECT 
    id, 
    name as Familienname, 
    vname as Vorname, 
    abtnr as Abteilung, 
    str as Strasse, 
    ort as Ort, 
    plz as PLZ
FROM 
    t_ma
WHERE 
    ort = 'Berlin'
WITH CHECK OPTION;


SELECT * 
FROM v_ma_berlin
ORDER BY Familienname, Vorname;


SELECT * 
FROM v_ma_berlin
ORDER BY Abteilung;

DROP VIEW v_ma_berlin;


CREATE VIEW v_ma_berlin AS
SELECT 
    id, 
    name, 
    vname, 
    abtnr, 
    str, 
    ort, 
    plz
FROM 
    t_ma
WHERE 
    ort = 'Berlin'
WITH CHECK OPTION;



INSERT INTO t_ma (id, name, vname, abtnr, str, ort, plz)
VALUES (140, 'Weigelt', 'Helene', 8, 'Südstr. 6a', 'Berlin', '10114');

UPDATE t_ma 
SET ort = 'Potsdam' 
WHERE id = 140;

CREATE VIEW v_ma_proj_berlin AS
SELECT 
    t_ma.id, 
    t_ma.name AS familienname, 
    t_ma.vname AS vorname, 
    t_ma_proj.proj_id AS projektnummer
FROM 
    t_ma
JOIN 
    t_ma_proj ON t_ma.id = t_ma_proj.ma_id
WHERE 
    t_ma.ort = 'Berlin';


-- Получение всех записей
SELECT * FROM v_ma_proj_berlin;

-- Фильтрация записей по проекту 2
SELECT * FROM v_ma_proj_berlin
WHERE projektnummer = 2;


-- Подсчет количества сотрудников через прямой запрос
SELECT COUNT(*) AS anzahl_mitarbeiter
FROM 
    v_ma_proj_berlin
WHERE 
    projektnummer = 2;

-- Подсчет количества сотрудников через создание временной или перманентной view
CREATE VIEW v_anzahl_berlin_proj2 AS
SELECT COUNT(*) AS anzahl_mitarbeiter
FROM 
    v_ma_proj_berlin
WHERE 
    projektnummer = 2;

-- Запрос из представления
SELECT * FROM v_anzahl_berlin_proj2;





