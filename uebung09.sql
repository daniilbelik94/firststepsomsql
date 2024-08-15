-- 1. Wechseln Sie zur Datenbank Bibliothek. 
-- Erstellen Sie jeweils eine Abfrage, um die Anzahl der Datensätze in der Tabelle t_buecher 
-- und der Tabelle t_leser zu ermitteln. 
-- Gruppieren Sie eine Abfrage über die Tabelle t_verleih so, dass ihnen angezeigt wird, wie 
-- viele Bücher die einzelnen Leser ausgeliehen haben. Lassen Sie die Lesernummer und die 
-- Anzahl der Bücher ausgeben. 
-- Sortieren Sie die Ausgabe absteigend nach der Lesernummer. 
-- Beschränken Sie die Abfrage auf die Leser, die mehr als ein Buch ausgeliehen haben. 
-- Lassen Sie sich die Namen der Leser und die Anzahl der Zeichen der Namen ausgeben. 
-- Ermitteln Sie die ISBN-Nummern und den aufgerundeten Preis der vorhandenen Bücher.  
-- 2. Erzeugen Sie eine neue Tabelle t_mess, in der Messwerte erfasst werden sollen.  
-- Die Tabelle soll die Felder nr und wert haben. Das Feld nr soll ein Selbstzählfeld sein. 
-- Füllen Sie die Tabelle mit 11 Datensätzen. Für die Messwerte (Spalte wert) sind dabei 
-- Zufallszahlen zwischen 1 und 1000 zu generieren. 
-- Erstellen Sie eine Abfrage, die folgende statistische Berechnungen über die Spalte wert 
-- durchführt: Anzahl, nach mathematischen Regeln gerundeter Durchschnittswert, Minimum 
-- und Maximum.  
-- Legen Sie aussagekräftige Spaltenüberschriften fest. 



SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;



use bibliothek;

source datenbank_bibliothek.sql;



--  Erstellen Sie jeweils eine Abfrage, um die Anzahl der Datensätze in der Tabelle t_buecher 
-- und der Tabelle t_leser zu ermitteln.  

select count(*) as Buecheranzahl from t_buecher;

select count(*) as Leseranzahl from t_leser;



-- Gruppieren Sie eine Abfrage über die Tabelle t_verleih so, dass ihnen angezeigt wird, wie 
-- viele Bücher die einzelnen Leser ausgeliehen haben. Lassen Sie die Lesernummer und die 
-- Anzahl der Bücher ausgeben. 


select 'leser' as 'Lesernummer', count('isbn') as 'Anzahlbuecher' from t_verleih	


-- Sortieren Sie die Ausgabe absteigend nach der Lesernummer. 
-- Beschränken Sie die Abfrage auf die Leser, die mehr als ein Buch ausgeliehen haben. 
GROUP BY leser having count(isbn) > 1
order by leser desc;


-- Lassen Sie sich die Namen der Leser und die Anzahlder Zeichen der Namen ausgeben. 
-- Ermitteln Sie die ISBN-Nummern und den aufgerundeten Preis der vorhandenen Bücher.

select name as Name, length(name) as Zeichenanzahl 
from t_leser;


select isbn as ISBN, CEIL(preis) as Aufgerundeterpreis
from t_buecher;


-- 2. Erzeugen Sie eine neue Tabelle t_mess, in der Messwerte erfasst werden sollen.  
-- Die Tabelle soll die Felder nr und wert haben. Das Feld nr soll ein Selbstzählfeld sein.

-- создаем таблицу если ее не существует и добавляем в нее столбцы номмер имеет инкремент и главный ключ
create table if not exists t_mess 
(nr int AUTO_INCREMENT PRIMARY KEY, 
wert int);

 
-- Füllen Sie die Tabelle mit 11 Datensätzen. Für die Messwerte (Spalte wert) sind dabei 
-- Zufallszahlen zwischen 1 und 1000 zu generieren. 


INSERT into t_mess (wert) 
values
 (floor(1 + rand() * 1000)),
 (floor(1 + rand() * 1000)),
 (floor(1 + rand() * 1000)),
 (floor(1 + rand() * 1000)),
 (floor(1 + rand() * 1000)),
 (floor(1 + rand() * 1000)),
 (floor(1 + rand() * 1000)),
 (floor(1 + rand() * 1000)),
 (floor(1 + rand() * 1000)),
 (floor(1 + rand() * 1000)),
 (floor(1 + rand() * 1000));


 -- Erstellen Sie eine Abfrage, die folgende statistische Berechnungen über die Spalte wert 
-- durchführt: Anzahl, nach mathematischen Regeln gerundeter Durchschnittswert, Minimum 
-- und Maximum.  
-- Legen Sie aussagekräftige Spaltenüberschriften fest. 


select count(*) as Anzahlwert, avg(wert) as Durchschnittswert, min(wert) as Minimumwert, max(wert) as Maximumwert
from t_mess;



