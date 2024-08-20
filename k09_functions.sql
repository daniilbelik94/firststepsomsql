SET @saved_cs_client     = @@character_set_client; 
SET character_set_client = utf8mb4;

use uebungen;

/* Aggregatfunktionen */
SELECT COUNT(id) AS Anzahl, AVG(preis) AS "Preis Durchschnitt", MIN(preis) AS "Preis Minimum", MAX(preis) AS "Preis Maximum", SUM(preis) AS Summe FROM t_lager;


/* Grupierte Ausgabe mit Aggregatfunktion */
SELECT * FROM t_ma_proj;
SELECT COUNT(ma_id) FROM t_ma_proj;
SELECT proj_id, COUNT(ma_id) FROM t_ma_proj GROUP BY proj_id;
SELECT proj_id, COUNT(ma_id) FROM t_ma_proj GROUP BY proj_id HAVING COUNT(ma_id) > 2; -- Langsame Abfrage
 
/* Filter */
SELECT COUNT(id) AS Anzahl FROM t_lager;
SELECT COUNT(id) AS Anzahl FROM t_lager WHERE stueck > 200;
-- SELECT COUNT(id) AS Anzahl, COUNT(id) FILTER (WHERE stueck > 200) AS Ueber200 FROM t_lager; -- Nur in PostgreSQL Datenbanken


/* Nicht standardisierte */
SELECT ROUND(SUM(preis), 2) AS Summe FROM t_lager; -- Rundet die Summe auf zwei Stellen nach dem Komma

SELECT ABS(-4.5); -- Gibt den absoluten Wert einer Zahl wieder, d. h. den Wert ohne Vorzeichen
SELECT CEILING(100.6); -- Rundet den angegebenen Wert auf die nächste größere ganze Zahl
SELECT FLOOR(100.6); -- Rundet den angegebenen Wert auf die nächste kleinere ganze Zahl
SELECT ROUND(3.45); -- Rundet die angegebene Dezimalzahl nach den üblichen mathematischen Regeln auf eine ganze Zahl
SELECT ROUND(3.554, 2); -- Rundet die angegebene Dezimalzahl nach den üblichen mathematischen Regeln auf die angegebene Anzahl Dezimalstellen.
SELECT MOD(20, 6); -- Liefert den Rest der Ganzzahldivision von zahl1 durch zahl2
SELECT PI(); -- Liefert den Wert von PI
SELECT RAND(); -- Liefert eine zufällige Zahl im Bereich 0 bis 1
SELECT ROUND( rand() * 37 ); -- Liefert eine Ganzzahl zwischen 0 und 37
SELECT SIGN(-23.5); -- Ermittelt das Vorzeichen einer Zahl und liefert daraufhin den Wert -1 bzw. 0 oder 1
SELECT SQRT(16); -- Ermittelt die Quadratwurzel für die übergebene Zahl

/* Funktionen für Zeichenketten */
SELECT ASCII("T"); -- Liefert den ASCII-Wert des ersten Zeichens der Zeichenkette
SELECT CHAR(84); -- Wandelt den angegebenen ASCII-Wert in das entsprechende Zeichen um
SELECT LENGTH("Guten Tag"); -- Ermittelt die Länge der Zeichenkette
SELECT LOWER("Guten Tag"); -- Wandelt die angegebene Zeichenkette in Kleinbuchstaben um
SELECT UPPER("Guten Tag"); -- Wandelt die angegebene Zeichenkette in Großbuchstaben um
SELECT LTRIM("    Guten Tag"); -- Entfernt alle führenden Leerzeichen in der Zeichenkette
SELECT RTRIM("Guten Tag     "); -- Entfernt alle abschließenden Leerzeichen in der Zeichenkette
SELECT SUBSTRING("Einen guten Tag", 7, 3); -- Liefert ein Teilstück der angegebenen Zeichenkette, definiert durch Anfangsposition und Länge bzw. Endposition
SELECT SUBSTRING("Einen guten Tag", 7); -- Liefert ein Teilstück der angegebenen Zeichenkette, definiert durch Anfangsposition bis zum Ende
SELECT SUBSTRING("Einen guten Tag", -9); -- Liefert ein Teilstück der angegebenen Zeichenkette ab der Position vom Ende gezählt
SELECT SUBSTR("Einen guten Tag", 7, 3); -- Identisch wie SUBSTRING("Einen guten Tag", 7, 3);

