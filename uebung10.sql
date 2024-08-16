-- 1.  Wechseln Sie zur Datenbank Bibliothek. 
-- Erstellen Sie eine einfache Verknüpfung der Tabellen t_leser und t_verleih, um für jeden 
-- Leser die ausgeliehenen Bücher zu ermitteln. Lassen Sie sich in der Abfrage die Vor- und 
-- Familiennamen der Leser und die ISBN-Nummer anzeigen. 
-- Verwenden Sie die gleiche Abfrage und ergänzen Sie diese um eine Sortierung nach 
-- Familiennamen und Vornamen der Leser. 
-- Erstellen Sie die gleiche Abfrage unter Verwendung eines Joins. 
-- Zeigen Sie nun zusätzlich die Namen der Bücher an, die in der Tabelle t_buecher abgelegt 
-- sind. Erweitern Sie dazu die SELECT-Anweisung um eine Verknüpfung zu dieser Tabelle. 
-- 2. Wechseln Sie zur Datenbank Uebungen. 
-- Erstellen Sie eine Abfrage über die Tabellen t_lager und t_artikel, um alle am Lager vor-
-- rätigen Artikel aufzulisten. Verwenden Sie für die Tabellen passende Ersatznamen und lassen 
-- Sie sich die Artikelnummer, den Artikelnamen, den Lieferanten und die Stückzahl anzeigen. 
-- Wandeln Sie die Abfrage so um, dass Sie alle Artikel erhalten, egal ob Sie am Lager sind oder 
-- nicht. Falls vorhanden, sollen neben der Artikelnummer, dem Artikelnamen und der Liefe-
-- rantennummer auch die Stückzahl und der Preis angezeigt werden. 
-- Erweitern Sie die Abfrage so, dass zusätzlich zu den bisherigen Feldern noch der Name der 
-- Lieferanten zurückgeliefert wird. Dabei sollen nur die Artikel berücksichtigt werden, die am 
-- Lager sind. Sortieren Sie die Ausgabe nach den Artikelnamen. 



-- 1.  Wechseln Sie zur Datenbank Bibliothek. 


use bibliothek;

source datenbank_bibliothek.sql;

-- Erstellen Sie eine einfache Verknüpfung der Tabellen t_leser und t_verleih, um für jeden 
-- Leser die ausgeliehenen Bücher zu ermitteln. Lassen Sie sich in der Abfrage die Vor- und 
-- Familiennamen der Leser und die ISBN-Nummer anzeigen. 


select t_leser.vname as Vorname, 
t_leser.name as Nachname,
 t_verleih.isbn as ISBN
from t_leser
join t_verleih
on t_leser.nr = t_verleih.leser;


-- Verwenden Sie die gleiche Abfrage und ergänzen Sie diese um eine Sortierung nach 
-- Familiennamen und Vornamen der Leser. 


SELECT 
    t_leser.vname AS Vorname, 
    t_leser.name AS Nachname,
    t_verleih.isbn AS ISBN
FROM 
    t_leser
JOIN 
    t_verleih
ON 
    t_leser.nr = t_verleih.leser
ORDER BY 
    t_leser.name, 
    t_leser.vname;


-- Zeigen Sie nun zusätzlich die Namen der Bücher an, die in der Tabelle t_buecher abgelegt 
-- sind. Erweitern Sie dazu die SELECT-Anweisung um eine Verknüpfung zu dieser Tabelle. 

SELECT 
    t_leser.nr AS Lesernummer, 
    t_leser.name AS Nachname, 
    t_leser.vname AS Vorname, 
    t_verleih.isbn, 
    t_buecher.titel AS Buchtitel,
    t_verleih.datum
FROM 
    t_leser
JOIN 
    t_verleih 
ON 
    t_leser.nr = t_verleih.leser
JOIN 
    t_buecher
ON 
    t_verleih.isbn = t_buecher.isbn;



-- Wechseln Sie zur Datenbank Uebungen. 
-- Erstellen Sie eine Abfrage über die Tabellen t_lager und t_artikel, um alle am Lager vor-
-- rätigen Artikel aufzulisten. Verwenden Sie für die Tabellen passende Ersatznamen und lassen 
-- Sie sich die Artikelnummer, den Artikelnamen, den Lieferanten und die Stückzahl anzeigen. 


source datenbank_uebungen.sql;

use uebungen;

select t_lager.id as Artikelnummer,
t_artikel.name as Artikelname,
t_artikel.lieferant as Lieferant,
t_lager.stueck as Stueckzahl
from t_lager
join t_artikel   
ON t_lager.id = t_artikel.id;


-- Wandeln Sie die Abfrage so um, dass Sie alle Artikel erhalten, egal ob Sie am Lager sind oder 
-- nicht. Falls vorhanden, sollen neben der Artikelnummer, dem Artikelnamen und der Liefe-
-- rantennummer auch die Stückzahl und der Preis angezeigt werden. 



select t_artikel.id as Artikelnummer,
t_artikel.name as Artikelname,
t_artikel.lieferant as Lieferantennummer,
t_lager.stueck as Stueckzahl,
t_lager.preis as Preis
from t_artikel
left join t_lager
on t_artikel.id = t_lager.id

order by t_lager.stueck;


--Erweitern Sie die Abfrage so, dass zusätzlich zu den bisherigen Feldern noch der Name der 
-- Lieferanten zurückgeliefert wird. Dabei sollen nur die Artikel berücksichtigt werden, die am 
-- Lager sind. Sortieren Sie die Ausgabe nach den Artikelnamen. 


SELECT 
    t_artikel.id AS Artikelnummer,
    t_artikel.name AS Artikelname,
    t_liefer.name AS Lieferantenname,
    t_lager.stueck AS Stueckzahl,
    t_lager.preis AS Preis
FROM 
    t_artikel
JOIN 
    t_lager ON t_artikel.id = t_lager.id
JOIN 
    t_liefer ON t_artikel.lieferant = t_liefer.id
WHERE 
    t_lager.stueck > 0
ORDER BY 
    t_artikel.name;


