SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;

USE uebungen;

DROP TABLE IF EXISTS t_ma_dt;

CREATE TABLE t_ma_dt (
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(50), 
    vname VARCHAR(50), 
    str VARCHAR(150), 
    hnr VARCHAR(5),
    plz VARCHAR(5), 
    ort VARCHAR(50), 
    gebdat DATE, 
    land VARCHAR(4),
    PRIMARY KEY(id)
);


INSERT INTO t_ma_dt (name, vname, str, hnr, plz, ort, gebdat, land)
    VALUES ("Illner", "Markus", "Götheweg", "55", "70173", "Stuttgart", "1976-12-23", "D");

INSERT INTO t_ma_dt (name, vname, str, hnr, plz, ort, gebdat, land)
    VALUES ('Schubert', 'Steve', 'Albert-Schweitzer-Str.', '10', '70174', 'Stuttgart', '1982-02-15', 'D');

INSERT INTO t_ma_dt (id, name, vname, str, hnr, plz, ort, gebdat, land)
    VALUES (10, 'Schubert', 'Steve', 'Albert-Schweitzer-Str.', '10', '70174', 'Stuttgart', '1982-02-15', 'D');

INSERT INTO t_ma_dt (name, vname, str, hnr, plz, ort, gebdat, land) VALUES 
("Meier", "Susann", "Hauptweg", "4", "60385", "Frankfurt", "1972-04-21", "D"),
("Brauer", "Claudia", "Bahnhofstr.", "156", "60386", "Frankfurt", "1971-04-28", "D"),
("Yildiz", "Umit", "Universitätsstr.", "24", "60322", "Frankfurt", "1974-08-29", "D"),
("Becker", "Sebastian", "Heidestr.", "150", "60385", "Frankfurt", "1994-08-14", "D");

# SELECT * FROM t_ma_dt;




DROP TABLE IF EXISTS t_ma_frankfurt;
CREATE TABLE t_ma_frankfurt (
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(50), 
    vname VARCHAR(50), 
    str VARCHAR(150), 
    hnr VARCHAR(5),
    plz VARCHAR(5), 
    ort VARCHAR(50), 
    gebdat DATE, 
    land VARCHAR(4),
    PRIMARY KEY(id)
);


INSERT INTO t_ma_frankfurt (name, vname, str, hnr, plz, ort, gebdat, land)
    SELECT name, vname, str, hnr, plz, ort, gebdat, land FROM t_ma_dt WHERE ort = 'Frankfurt';


UPDATE t_ma_dt SET str = 'Hauptstr.', hnr = '17' WHERE name = 'Meier' AND vname = 'Susann';

# UPDATE t_ma_frankfurt SET ort = "Frankfurt/Main";

UPDATE t_ma_frankfurt, t_ma_dt 
SET t_ma_dt.ort = "Frankfurt/Main", t_ma_frankfurt.ort = 'Frankfurt/Main' 
WHERE t_ma_dt.ort = 'Frankfurt' AND t_ma_frankfurt.ort = 'Frankfurt';

UPDATE t_lager SET stueck = stueck + 100 WHERE stueck < 100;

SELECT * FROM t_ma_dt;
SELECT * FROM t_ma_frankfurt;


exit

DELETE FROM t_lager WHERE stueck = 0;
DELETE FROM t_ma_dt WHERE ort = 'Frankfurt/Main';
DELETE FROM t_ma_frankfurt;


