SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;

use uebungen;


-- Einfache Abfrage über mehrere Tabellen
SELECT t_ma.vname, t_ma.name, t_ma.abtnr, t_abt.*
FROM t_ma, t_abt
WHERE t_ma.abtnr = t_abt.id LIMIT 15;

-- Einfache Abfrage über mehrere Tabellen
SELECT t_ma.vname, t_ma.name, t_ma.abtnr, t_abt.*
FROM t_ma, t_abt
WHERE t_ma.abtnr = t_abt.id AND t_abt.ort = 'Frankfurt';
-- Die Abfrage wird wie im vorigen Beispiel als Equi-Join mit zwei beteiligten Tabellen gebildet.



SELECT t_ma.vname, t_ma.name, t_ma.abtnr, t_proj.* FROM t_ma CROSS JOIN t_proj WHERE t_ma.ort = 'Bern';
-- CROSS JOIN Abfrage über zwei Tabellen

SELECT t_ma.vname, t_ma.name, t_ma.abtnr, t_proj.* FROM t_ma, t_proj WHERE t_ma.ort = 'Bern';
-- Selbe Abfrage wie CROSS JOIN aber als einfache Select-Anweisung


SELECT t_ma.name, t_ma.vname, t_ma.gebdat,
t_ma_dt.name, t_ma_dt.vname, t_ma_dt.gebdat
FROM t_ma INNER JOIN t_ma_dt
ON t_ma.gebdat < t_ma_dt.gebdat LIMIT 10; 
-- ThetaJoin Abfrage

SELECT t_ma.name, t_ma.vname, t_ma.gebdat,
t_ma_dt.name, t_ma_dt.vname, t_ma_dt.gebdat
FROM t_ma, t_ma_dt
WHERE t_ma.gebdat < t_ma_dt.gebdat LIMIT 10; 
-- Selbe Abfrage wie ThetaJoin aber als einfache Select-Anweisung


SELECT t_ma.vname, t_ma.name, t_ma.abtnr, t_abt.id, t_abt.name
FROM t_ma INNER JOIN t_abt
ON t_ma.abtnr = t_abt.id
WHERE t_ma.ort = 'Zürich';
-- INNER JOIN Abfrage

SELECT t_ma.vname, t_ma.name, t_ma.abtnr, t_abt.id, t_abt.name
FROM t_ma, t_abt
WHERE t_ma.abtnr = t_abt.id
AND t_ma.ort = 'Zürich';
-- Selbe Abfrage wie INNER JOIN aber als einfache Select-Anweisung


SELECT * FROM t_m_p INNER JOIN t_proj ON t_m_p.id = t_proj.id;
SELECT * FROM t_m_p NATURAL JOIN t_proj;
-- NATURAL JOIN

SELECT * FROM t_m_p, t_proj WHERE t_m_p.id = t_proj.id;
-- Selbe Abfrage wie NATURAL JOIN aber als einfache Select-Anweisung


SELECT m.vname, m.name, a.name
FROM t_ma AS m LEFT OUTER JOIN t_abt AS a
ON m.abtnr = a.id
ORDER BY m.name DESC LIMIT 15;
-- LEFT OUTER JOIN

SELECT m.vname, m.name, a.name
FROM t_ma AS m RIGHT OUTER JOIN t_abt AS a
ON m.abtnr = a.id
ORDER BY m.name DESC LIMIT 15;
-- RIGHT OUTER JOIN

SELECT m.vname, m.name, a.name
FROM t_ma AS m, t_abt AS a
WHERE m.abtnr = a.id
ORDER BY m.name DESC LIMIT 15;
-- Selbe Abfrage wie LEFT und RIGHT OUTER JOIN aber als einfache Select-Anweisung 


-- Full-Outer-Join = Full-Join
SELECT t_ma.vname, t_ma.name, t_abt.name FROM t_ma LEFT JOIN t_abt
ON t_ma.abtnr = t_abt.id
UNION
SELECT t_ma.vname, t_ma.name, t_abt.name
FROM t_ma RIGHT JOIN t_abt
ON  t_ma.abtnr = t_abt.id;


-- SEMI Join
SELECT * FROM t_ma WHERE abtnr IN (SELECT id FROM t_abt); 


-- SELF JOIN
SELECT a1.name, a2.name, a1.ort 
FROM t_abt AS a1
INNER JOIN t_abt AS a2
ON a1.ort = a2.ort
WHERE a1.id <> a2.id;

-- Selbe Abfrage wie SELF JOIN aber als einfache Select-Anweisung 
SELECT a1.name, a2.name, a1.ort 
FROM t_abt AS a1, t_abt AS a2
WHERE a1.ort = a2.ort
AND a1.id <> a2.id;



-- INNER JOIN Abfrage über mehr als zwei Tabellen
SELECT m.vname, m.name, p.name, p.ende
FROM t_ma_proj AS mp 
INNER JOIN t_ma AS m
ON mp.ma_id = m.id
INNER JOIN t_proj AS p 
ON mp.proj_id = p.id
ORDER BY p.name;


-- Zwei SELECT Anweisungen über das Schlüsselwort UNION miteinander verbinden
SELECT name, ort
FROM t_ma WHERE ort = 'Bern'
UNION SELECT name, ort FROM t_ma_dt;


-- Unterabfragen
SELECT vname, name, ort FROM t_ma WHERE abtnr = (SELECT id FROM t_abt WHERE name = 'Controlling');
-- Die SELECT-Anweisung ermittelt die Felder vname, name und ort aus der Tabelle t_ma wenn die abtnr aus der Unterabfrage mit der id der Abteilungen identisch ist

SELECT name FROM t_abt WHERE EXISTS (SELECT * FROM t_ma WHERE t_ma.abtnr = t_abt.id);
-- Mittels des Schlüsselworts EXISTS für die Unterabfrage kann getestet werden, ob bestimmte Daten in einer zweiten Tabelle vorhanden sind


