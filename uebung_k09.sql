SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;


-- ---------------- Übung 1 -------------------------
/* 
    Wechseln Sie zur Datenbank Bibliothek.
    Erstellen Sie jeweils eine Abfrage, um die Anzahl der Datensätze in der Tabelle t_buecher und der Tabelle t_leser zu ermitteln.
    Gruppieren Sie eine Abfrage über die Tabelle t_verleih so, dass ihnen angezeigt wird, wie viele Bücher die einzelnen Leser ausgeliehen haben. Lassen Sie die Lesernummer und die Anzahl der Bücher ausgeben.
    Sortieren Sie die Ausgabe absteigend nach der Lesernummer.
    Beschränken Sie die Abfrage auf die Leser, die mehr als ein Buch ausgeliehen haben.
    Lassen Sie sich die Namen der Leser und die Anzahl der Zeichen der Namen ausgeben.
    Ermitteln Sie die ISBN-Nummern und den aufgerundeten Preis der vorhandenen Bücher.
*/
USE bibliothek;
SELECT COUNT(isbn) FROM t_buecher;
SELECT COUNT(nr) FROM t_leser;

SELECT leser, COUNT(isbn) FROM t_verleih GROUP BY leser;

SELECT leser, COUNT(isbn) FROM t_verleih GROUP BY leser ORDER BY leser DESC;

SELECT leser, COUNT(isbn) FROM t_verleih GROUP BY leser HAVING COUNT(isbn)>1 ORDER BY leser DESC;

SELECT name, length(name) As Laenge FROM t_leser;

SELECT isbn, ceiling(preis) FROM t_buecher; 




-- ---------------- Übung 2 -------------------------
/* 
    Erzeugen Sie eine neue Tabelle t_mess, in der Messwerte erfasst werden sollen.
    Die Tabelle soll die Felder nr und wert haben. Das Feld nr soll ein Selbstzählfeld sein.
    Füllen Sie die Tabelle mit 11 Datensätzen. Für die Messwerte (Spalte wert) sind dabei
    Zufallszahlen zwischen 1 und 1000 zu generieren.
    Erstellen Sie eine Abfrage, die folgende statistische Berechnungen über die Spalte wert
    durchführt: Anzahl, nach mathematischen Regeln gerundeter Durchschnittswert, Minimum
    und Maximum.
    Legen Sie aussagekräftige Spaltenüberschriften fest.
*/


DROP TABLE IF EXISTS t_mess;
CREATE TABLE t_mess (
    nr integer NOT NULL AUTO_INCREMENT, 
    wert integer, 
    PRIMARY KEY(nr)
); 

INSERT INTO t_mess (wert) VALUES (round(rand() * 1000) +1);
INSERT INTO t_mess (wert) VALUES (round(rand() * 1000) +1);
INSERT INTO t_mess (wert) VALUES (round(rand() * 1000) +1);
INSERT INTO t_mess (wert) VALUES (round(rand() * 1000) +1);
INSERT INTO t_mess (wert) VALUES (round(rand() * 1000) +1);
INSERT INTO t_mess (wert) VALUES (round(rand() * 1000) +1);
INSERT INTO t_mess (wert) VALUES (round(rand() * 1000) +1);
INSERT INTO t_mess (wert) VALUES (round(rand() * 1000) +1);
INSERT INTO t_mess (wert) VALUES (round(rand() * 1000) +1);
INSERT INTO t_mess (wert) VALUES (round(rand() * 1000) +1);
INSERT INTO t_mess (wert) VALUES (round(rand() * 1000) +1);

SELECT COUNT(*) AS Anzahl, ROUND(AVG(wert)) AS Durchschnitt,
       MIN(wert) AS Minimum, MAX(wert) AS Maximum FROM t_mess; 

