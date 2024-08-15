-- aggregatfunktionen.sql


SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;


use bubliothek;



source	 datenbank_uebungen.sql;




SELECT COUNT(id) AS Anzahl, AVG(preis) AS "Preis  
  Durchschnitt", MIN(preis) AS "Preis Minimum",  
  MAX(preis) AS "Preis Maximum " FROM t_lager; 


SELECT COUNT(id) AS Anzahl, AVG(preis) AS "Preis Durchschnitt" 
  FROM t_lager WHERE stueck > 100;

-- Aggregatfunktionen mit GROUP BY

SELECT * FROM t_ma_proj; 
SELECT COUNT(ma_id) FROM t_ma_proj; 
SELECT proj_id, COUNT(ma_id) FROM t_ma_proj GROUP BY proj_id;


--  aggregatfunktionen mit HAVING

SELECT proj_id, COUNT(ma_id) FROM t_ma_proj 
   GROUP BY proj_id HAVING COUNT(ma_id)>2;


-- aggregatfunktionen mit FILTER

   SELECT COUNT(id) AS Anzahl FROM t_lager; 
SELECT COUNT(id) AS Anzahl FROM t_lager WHERE stueck > 200; 
SELECT COUNT(id) AS Anzahl, COUNT(id) FILTER (WHERE stueck > 200) AS AnzahlGroeßer200, COUNT(id) FILTER (WHERE stueck > 200) ;


