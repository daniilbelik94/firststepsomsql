SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;

USE uebungen;

exit

SELECT * FROM t_ma; -- Selektiert alle Datensätze der Tabelle t_ma
SELECT vname, name FROM t_ma; -- Selektiert alle vname und name aller Datensätze der Tabelle t_ma

/* 
    Mit der folgenden Anweisung werden nur die Datenfelder name, vname, plz und ort aus der
    Tabelle t_ma ausgelesen. Gleichzeitig wird die Abfrage auf alle Datensätze begrenzt, bei
    denen der Wert im Feld plz mit der Ziffer 6 beginnt und bei denen der Wert im Feld gebdat ein
    Datum nach dem 01.01.1972 beinhaltet. Die Datensätze werden bei der Anzeige absteigend
    nach der Postleitzahl sortiert.
*/
SELECT name, vname, plz, ort, gebdat FROM t_ma
    WHERE plz LIKE '6%' -- Nur Datensätze bei denen die plz mit 6 beginnt
    AND gebdat > '1972-01-01' -- und das gebdat größer als 01.01.1972 ist
    ORDER BY plz -- Sortiert nach plz
    DESC -- Absteigend sortiert (ASC = aufsteigend und default)
;

/* 
Es wird eine Abfrage ausgewählter Datensätze und Datenfelder mit neuen aussagekräftigen Feldnamen erzeugt. Die Festlegung eines anderen Spaltennamens entspricht der Operation Umbenennen der Relationenalgebra.
*/
SELECT name AS 'Familienname', vname AS Vorname, plz AS Postleitzahl, gebdat AS Geburtsdatum 
    FROM t_ma
    WHERE
    name NOT LIKE 'B%'
    AND name NOT LIKE 'S%'
    ORDER BY name DESC
;

SELECT 'Mitarbeiter' AS 'angestellt als', vname, name FROM t_ma WHERE id < 10;

SELECT id, vname, name FROM t_ma LIMIT 10; -- Begrenzt die Ausgabe auf 10 Datensätze
SELECT id, vname, name FROM t_ma LIMIT 5, 10; -- Begrenzt die Ausgabe auf 10 Datensätze ab dem 6. Datensatz

SELECT plz, ort FROM t_ma LIMIT 10;
SELECT DISTINCT plz, ort FROM t_ma LIMIT 10; -- Vermeidet doppelte Datensätze

SELECT ort FROM t_ma LIMIT 10;
SELECT DISTINCT ort FROM t_ma LIMIT 10; -- Vermeidet doppelte Datensätze

SELECT 2 * 3;
SELECT 1 + 2 * 3;
SELECT 2025 % 4;  -- Modulo Berechnung (Restwert)

SELECT id, preis, stueck, preis*stueck AS Lagerwert FROM t_lager; -- Multipliziert preis mit stueck
SELECT id, preis, stueck, ROUND(preis*stueck, 2) AS Lagerwert FROM t_lager; -- Rundet das Ergebnis bis auf 2 Stellen nach dem Komma

SELECT *, UPPER(ort) FROM t_ma WHERE UPPER(ort) = 'HAMBURG'; -- Mit der Funktion UPPER wird der Wert des Datenfeldes ort vor dem Vergleich in Großbuchstaben gewandelt.
SELECT *, LOWER(ort) FROM t_ma WHERE ort = 'HAMBURG';
SELECT UPPER('max mustermann');
SELECT LOWER('CBW');

SELECT * FROM t_lager WHERE preis < 2; -- Selektiert alle Datensätze bei denen der Preis kleiner 2 ist
SELECT * FROM t_ma WHERE ort = 'Hamburg'; -- Selektiert alle Datensätze bei denen der Ort Hamburg ist
SELECT * FROM t_ma WHERE ort <> 'Hamburg'; -- Selektiert alle Datensätze bei denen der Ort nicht Hamburg ist
SELECT * FROM t_ma WHERE ort != 'Hamburg'; -- Selektiert alle Datensätze bei denen der Ort nicht Hamburg ist

SELECT * FROM t_lager WHERE preis >= 2 AND preis <= 3; -- Bei dieser Bedingung wird mit zwei Vergleichen geprüft, ob der Preis größer oder gleich 2 und gleichzeitig kleiner oder gleich 3 ist.
SELECT * FROM t_lager WHERE preis BETWEEN 2 AND 3; -- Der BETWEEN-Operator vereinfacht den Ausdruck
SELECT * FROM t_ma WHERE name BETWEEN 'Be' AND 'Bo'; -- Sucht alle Einträge bei denen der Name zwischen Be und Bo sind

SELECT * FROM t_ma WHERE ort = 'Hamburg' AND gebdat BETWEEN '1974-12-31' AND '1980-01-01';

SELECT * FROM t_ma WHERE ort = 'Berlin' OR ort = 'Wien' OR ort = 'Hamburg'; -- Hier wird durch drei jeweils durch OR-Verknüpfungen miteinander verbundene Vergleiche geprüft, ob der Wert des Datenfeldes ort gleich Berlin, Wien oder Hamburg ist.
SELECT * FROM t_ma WHERE ort IN ('Berlin', 'Wien', 'Hamburg'); -- Übersichtlicher wird die gleiche Bedingung mit dem IN-Operator formuliert. Die Liste enthält die drei gewünschten Orte.

SELECT * FROM t_ma WHERE name LIKE 'Me%'; -- Die Abfrage liefert alle Mitarbeiter, deren Name mit Me beginnt.
SELECT * FROM t_ma WHERE name LIKE 'M%er'; -- Die Abfrage liefert alle Mitarbeiter, deren Name mit M beginnt und auf er endet.

SELECT * FROM t_abt WHERE name LIKE "Abt\ _%" ESCAPE "\ "; -- Mithilfe von ESCAPE wird das Zeichen \ als Fluchtzeichen definiert. Im Muster wird durch das Voranstellen dieses Zeichens festgelegt, dass der Unterstrich in diesem Fall nicht als Platzhalter zu sehen ist. Das folgende Prozent-Zeichen arbeitet jedoch ganz normal als Platzhalterzeichen.

SELECT * FROM t_ma WHERE name LIKE 'M%' AND ort <> 'Berlin'; -- Die Abfrage liefert alle Mitarbeiter, deren Name mit M beginnt und die nicht in Berlin wohnen.
SELECT * FROM t_ma WHERE name LIKE 'M%' AND (ort = 'Frankfurt' OR ort = 'Hamburg'); -- Mit dieser Abfrage werden alle Mitarbeiter ermittelt, deren Name mit M beginnt und die in Frankfurt oder Hamburg wohnen.
SELECT * FROM t_ma WHERE NOT (name LIKE 'M%'); -- Hier werden alle Mitarbeiter gesucht, deren Name nicht mit M beginnt.

SELECT ort AS Wohnort, COUNT(name) FROM t_ma GROUP BY ort; -- Die Datensätze der Tabelle werden mithilfe der Anweisung GROUP BY nach dem Ort gruppiert. Für jede Gruppe wird mit der Aggregatfunktion COUNT die Anzahl der Mitarbeiter ermittelt, die in diesem Ort wohnen. Der Name des Feldes, auf welches die Aggregatfunktion angewendet werden soll, folgt dem Funktionsnamen in runden Klammern.

SELECT ort AS Wohnort, COUNT(name) FROM t_ma GROUP BY ort HAVING count(name) > 10; -- Mithilfe der HAVING-Klausel wird festgelegt, dass nur die Orte ausgegeben werden, aus denen zehn oder mehr Mitarbeiter kommen.

SELECT name, COUNT(name) FROM t_ma GROUP BY name HAVING count(name) > 1; -- Diese Anweisung gibt alle Namen zurück, die mehr als einmal in der Tabelle t_ma enthalten sind.

SELECT vname, name, plz, ort FROM t_ma ORDER BY name, vname; -- In dieser Anweisung wird zuerst nach dem Familiennamen und dann nach dem Vornamen der Mitarbeiter sortiert.

SELECT id, stueck, preis FROM t_lager ORDER BY preis DESC LIMIT 15; -- Mit dem Schlüsselwort DESC wird eine absteigende Sortierung erreicht. Alle Datensätze der Tabelle t_lager werden ausgewählt und nach dem Preis in absteigender Reihenfolge sortiert. Die Anzeige wird auf 15 Datensätze beschränkt.

SELECT ort AS Wohnort, COUNT(name) AS "Anzahl Mitarbeiter" FROM t_ma GROUP BY ort ORDER BY ort DESC;
 -- Die Sortieranweisung lässt sich auch bei gruppierten Daten anwenden. Hier wird die Ausgabeliste absteigend nach dem Ort sortiert.
