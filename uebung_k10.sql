SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;



------------------ Übung 1 -------------------------
/* 
    Wechseln Sie zur Datenbank Bibliothek.
    Erstellen Sie eine einfache Verknüpfung der Tabellen t_leser und t_verleih, um für jeden
    Leser die ausgeliehenen Bücher zu ermitteln. Lassen Sie sich in der Abfrage die Vor- und
    Familiennamen der Leser und die ISBN-Nummer anzeigen.
    Verwenden Sie die gleiche Abfrage und ergänzen Sie diese um eine Sortierung nach
    Familiennamen und Vornamen der Leser.
    Erstellen Sie die gleiche Abfrage unter Verwendung eines Joins.
    Zeigen Sie nun zusätzlich die Namen der Bücher an, die in der Tabelle t_buecher abgelegt
    sind. Erweitern Sie dazu die SELECT-Anweisung um eine Verknüpfung zu dieser Tabelle.
*/
USE bibliothek;

SELECT t_leser.vname, t_leser.name, t_verleih.isbn FROM t_leser, t_verleih 
WHERE t_leser.nr = t_verleih.leser;

SELECT t_leser.vname, t_leser.name, t_verleih.isbn FROM t_leser, t_verleih 
WHERE t_leser.nr = t_verleih.leser ORDER BY t_leser.name,t_leser.vname;

SELECT t_leser.vname, t_leser.name, t_verleih.isbn FROM t_leser 
INNER JOIN t_verleih ON t_leser.nr = t_verleih.leser 
ORDER BY t_leser.name,t_leser.vname;

SELECT t_leser.vname, t_leser.name, t_verleih.isbn, t_buecher.titel FROM t_leser 
INNER JOIN t_verleih ON t_leser.nr = t_verleih.leser 
INNER JOIN t_buecher ON t_verleih.isbn = t_buecher.isbn
ORDER BY t_leser.name,t_leser.vname;



------------------ Übung 2 -------------------------
/* 
    Wechseln Sie zur Datenbank Uebungen.
    Erstellen Sie eine Abfrage über die Tabellen t_lager und t_artikel, um alle am Lager vorrätigen
    Artikel aufzulisten. Verwenden Sie für die Tabellen passende Ersatznamen und lassen
    Sie sich die Artikelnummer, den Artikelnamen, den Lieferanten und die Stückzahl anzeigen.
    Wandeln Sie die Abfrage so um, dass Sie alle Artikel erhalten, egal ob Sie am Lager sind oder
    nicht. Falls vorhanden, sollen neben der Artikelnummer, dem Artikelnamen und der Lieferantennummer
    auch die Stückzahl und der Preis angezeigt werden.
    Erweitern Sie die Abfrage so, dass zusätzlich zu den bisherigen Feldern noch der Name der
    Lieferanten zurückgeliefert wird. Dabei sollen nur die Artikel berücksichtigt werden, die am
    Lager sind. Sortieren Sie die Ausgabe nach den Artikelnamen.
*/
USE uebungen;
SELECT a.id, a.name, a.lieferant, l.stueck FROM t_artikel a 
   INNER JOIN t_lager l ON l.id = a.id;

SELECT a.id, a.name, a.lieferant, l.stueck, l.preis FROM t_artikel a 
   LEFT OUTER JOIN t_lager l ON l.id = a.id;

SELECT a.id, a.name, a.lieferant, l.stueck, l.preis, li.name FROM t_artikel a 
   INNER JOIN t_lager l ON l.id = a.id
   INNER JOIN t_liefer li ON a.lieferant = li.id
   ORDER BY a.name;
