----------- Übung 1 ---------------
/* 
    Wechseln Sie zur Datenbank Uebungen.
    Erstellen Sie eine Datenabfrage für die Tabelle t_ma, um die Vornamen und Familiennamen
    aller Mitarbeiter zu ermitteln. Begrenzen Sie das Abfrageergebnis auf 15 Datensätze.
    Erweitern Sie die Abfrage, damit Sie zusätzlich die Postleitzahl und den Ort der Mitarbeiter
    erhalten.
    Definieren Sie für alle Felder der Abfrage sinnvolle Ersatznamen.
    Ändern Sie die Abfrage, sodass Sie nur Mitarbeiter aus Hamburg und Berlin erhalten.
    Verwenden Sie dazu die IN-Anweisung. Zusätzlich sollen die Mitarbeiter vor dem Jahr 1980
    geboren sein. Lassen Sie sich die Ergebnisse der Abfrage nach Familiennamen der Mitarbeiter
    sortieren.
*/

USE Uebungen;

SELECT vname, name FROM t_ma LIMIT 15;

SELECT vname, name, plz, ort FROM t_ma LIMIT 15;

SELECT vname AS Vorname, name AS Familienname, plz AS Postleitzahl, ort As Wohnort 
   FROM t_ma LIMIT 15;

SELECT vname AS Vorname, name AS Familienname, plz AS Postleitzahl, ort As Wohnort 
   FROM t_ma 
   WHERE ort IN ('Hamburg','Berlin') AND gebdat < "1980-01-01"  
   ORDER BY name 
   LIMIT 15;


----------- Übung 2 ---------------
/*
    Wechseln Sie zur Datenbank Uebungen.
    Ermitteln Sie aus der Tabelle t_lager für jeden Artikel den Bruttopreis, indem Sie zu dem
    in der Tabelle gespeicherten Preis 19 % Mehrwertsteuer hinzufügen.
    Gruppieren Sie die Tabelle anhand der Stückzahl und ermitteln Sie in einer Abfrage die
    Anzahl der Artikel, die mit einer bestimmten Stückzahl vorhanden sind.
    Schränken Sie die Abfrage auf Stückzahlen mit weniger als 10 Artikeln ein.
    Sortieren Sie das Abfrageergebnis wenn möglich absteigend nach der Stückzahl.
*/

USE Uebungen;

SELECT id, stueck, preis, preis*1.19 AS Bruttopreis FROM t_lager;

SELECT stueck, COUNT(id) FROM t_lager GROUP BY stueck;

SELECT stueck, COUNT(id) FROM t_lager WHERE stueck<100 GROUP BY stueck;

SELECT stueck, COUNT(id) FROM t_lager WHERE stueck<100 GROUP BY stueck ORDER BY stueck DESC;
 