


----------- Übung 1 ---------------

USE uebungen;

DROP TABLE IF EXISTS t_lager;
CREATE TABLE t_lager (
  id int(11) NOT NULL AUTO_INCREMENT,
  stueck int(11) DEFAULT NULL,
  preis float DEFAULT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE t_lager ADD name VARCHAR(100);

INSERT INTO t_lager (id, name,stueck,preis) VALUES (1, "Kugelschreiber",200,2.99);
INSERT INTO t_lager (id, name,stueck,preis) VALUES (2, "Ordner",123,2.50);
INSERT INTO t_lager (id, name,stueck,preis) VALUES (3, "Heftklammern",423,0.99);
INSERT INTO t_lager (id, name,stueck,preis) VALUES (4, "Bleistift",170,0.99);
INSERT INTO t_lager (id, name,stueck,preis) VALUES (5, "Umschläge B6",230,0.80);
INSERT INTO t_lager (id, name,preis) VALUES (6, "Schreibblock A4",1.99);

# SELECT * FROM t_lager;

UPDATE t_lager SET stueck = 270 WHERE name="Bleistift";

UPDATE t_lager SET preis = 2.80 WHERE name = "Ordner";

DELETE FROM t_lager WHERE name = "Schreibblock A4";

SELECT * FROM t_lager;


----------- Übung 2 ---------------

USE uebungen;

DROP TABLE IF EXISTS t_ma_frankfurt;
CREATE TABLE t_ma_frankfurt (
    id int(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(50), 
    vname VARCHAR(50), 
    str VARCHAR(150),
    hnr VARCHAR(5), 
    plz VARCHAR(5), 
    ort VARCHAR(50), 
    gebdat DATETIME,
    land varchar(4), 
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS t_ma_dt;
CREATE TABLE t_ma_dt (
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(50), 
    vname VARCHAR(50), 
    str VARCHAR(150),
    hnr VARCHAR(5), 
    plz VARCHAR(5), 
    ort VARCHAR(50), 
    gebdat DATETIME,
    land varchar(4), 
    PRIMARY KEY(id)
);

INSERT INTO t_ma_dt (name, vname, str, hnr, plz, ort, gebdat, land) 
    VALUES ("Illner", "Markus", "Goetheweg Str.", "55", "70173", "Stuttgart", '2024:01:17 12:01:30', "D");
INSERT INTO t_ma_dt (name, vname, str, hnr, plz, ort, gebdat, land) 
    VALUES ('Schubert', 'Steve', 'Albert-Schweitzer-Str.', '10', '70174', 'Stuttgart', '1982-02-15', 'D');
INSERT INTO t_ma_dt (name, vname) VALUES ("Sattke", "Beatrice");

INSERT INTO t_ma_dt (name,vname,str,hnr,plz,ort,gebdat,land)
   VALUES('Haas','Martina','Blumenweg Str.', '23','63065','Offenbach',"1972-06-01", "D");
INSERT INTO t_ma_dt (name,vname,str,hnr,plz,ort,gebdat,land)
   VALUES('Richter','Carsten','Frankfurter Str.', '16','63065','Offenbach',"1982-10-18", "D");
INSERT INTO t_ma_dt (name,vname,str,hnr,plz,ort,gebdat,land)
   VALUES('Seiler','Janine','Goethestr.', '61','63067','Offenbach',"1990-11-11", "D");
INSERT INTO t_ma_dt (name,vname,str,hnr,plz,ort,gebdat,land)
   VALUES('Hartmann','Jochen','Berliner Str.', '23','60528','Frankfurt',"1979-03-25", "D");
INSERT INTO t_ma_dt (name,vname,str,hnr,plz,ort,gebdat,land)
   VALUES('Goldbach','Martin','Frankfurter Str.', '6','60529','Frankfurt',"1981-07-06", "D");
INSERT INTO t_ma_dt (name,vname,str,hnr,plz,ort,gebdat,land)
   VALUES('Naumann','Norbert','Goethestr.', '161','60594','Frankfurt',"1972-11-06", "D");


INSERT INTO t_ma_frankfurt (name,vname,str,hnr,plz,ort,gebdat,land) 
   SELECT name,vname,str,hnr,plz,ort,gebdat,land FROM t_ma_dt WHERE ort='Frankfurt' OR ort='Offenbach';

# SELECT * FROM t_ma_frankfurt;

UPDATE t_ma_frankfurt SET ort='Frankfurt/Main' WHERE ort='Frankfurt';

SELECT id,name,vname,str,hnr,plz,ort,DATE_FORMAT(gebdat, '%d.%m.%Y') AS 'Datum',land FROM t_ma_frankfurt;

