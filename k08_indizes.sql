SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;

USE cbw;

DROP TABLE IF EXISTS t_ma_proj;
DROP TABLE IF EXISTS t_artikel;
DROP TABLE IF EXISTS t_proj;
DROP TABLE IF EXISTS t_ma;

CREATE TABLE t_ma (
    id int(11) NOT NULL AUTO_INCREMENT,
    name varchar(50) DEFAULT NULL,
    vname varchar(50) DEFAULT NULL,
    str varchar(150) DEFAULT NULL,
    plz varchar(5) DEFAULT NULL,
    ort varchar(50) DEFAULT NULL,
    abtnr int(11) DEFAULT NULL,
    hnr varchar(5) DEFAULT NULL,
    gebdat date DEFAULT NULL,
    land varchar(4) DEFAULT 'D',
    PRIMARY KEY (id)
);

INSERT INTO t_ma VALUES 
    (1,'Fuchs','Peter','Martinplatz','22397','Hamburg',3,'70','1969-08-11','D'),
    (2,'Baumann','Lilly','Tannenstr.','21029','Hamburg',6,'49','1993-02-07','D'),
    (3,'Dorff','Norbert','Turmstr.','1060','Wien',4,'23','1968-12-23','AT'),
    (5,'Bayerle','Saskia','Buchenweg','8000','Zürich',7,'48','1976-06-05','CH'),
    (6,'Berger','Sebastian','Zentralplatz','60323','Frankfurt',1,'43','1986-05-15','D'),
    (7,'Kirsch','Karin','Albert-Schweitzer-Str.','1080','Wien',4,'47','1988-05-24','AT'),
    (8,'Bergstein','Roland','Waldstr.','21029','Hamburg',3,'16','1988-09-07','D'),
    (11,'Schwönsdorf','Lisa','Bahnhofstr.','1210','Wien',4,'1','1981-11-15','AT'),
    (12,'Luxemburg','Johann','Brunnenweg','22159','Hamburg',3,'78','1985-02-03','D'),
    (13,'Ülkü','Dilara','Lessingstr.','10179','Berlin',5,'12','1995-04-15','D'),
    (14,'Mannschatz','Annabell','Bahnhofstr.','60388','Frankfurt',1,'12','1967-07-06','D'),
    (15,'Nöller','Erwin','Industriestr.','21129','Hamburg',3,'4','1980-05-04','D'),
    (16,'Brio','Constantin','Hauptstr.','3005','Bern',6,'54','1977-04-21','CH'),
    (17,'Eppel','Andreas','Schillerstr.','1060','Wien',4,'9','1979-02-06','AT'),
    (18,'Classmann','Andrea','Buchenweg','8000','Zürich',7,'1','1985-02-02','CH'),
    (19,'Glahn','Stefanie','Ratsstr.','1080','Wien',4,'1','1978-05-02','AT'),
    (20,'Fiedler','Klaus','Schillerstr.','60388','Frankfurt',6,'3','1968-03-01','D'),
    (21,'Döring','Laura','Hafenweg','22111','Hamburg',3,'87','1969-03-01','D'),
    (22,'Margolin','Peter','Goethestr.','22159','Hamburg',3,'9','1973-04-21','D'),
    (23,'Seeau','Andrea','Goethestr.','10247','Berlin',2,'125','1976-11-16','D'),
    (24,'Klotz','Siglinde','Mittelstr.','1120','Wien',4,'75','1971-01-01','AT'),
    (25,'Stern','Hanna','Leibnizstr.','10247','Berlin',2,'23','1973-03-17','D'),
    (26,'Meier','Kerstin','Nordstr.','1120','Wien',4,'6','1966-12-27','AT'),
    (27,'Wolff','Gudrun','Hauptstr.','8038','Zürich',7,'32','1982-08-16','CH'),
    (28,'Ahrens','Enzo','Neugasse','1060','Wien',4,'62','1974-05-05','AT'),
    (29,'Schuster','Gabriele','Maienweg','22297','Hamburg',3,'89','1969-01-14','D'),
    (30,'Bläuel','Stefan','Rathausplatz','10119','Berlin',5,'1','1977-07-05','D'),
    (31,'Ebert','Jan','Wasserturmstr.','10119','Berlin',5,'44','1989-09-02','D'),
    (32,'Hallenbacher','Irmgart','Schillerstr.','22397','Hamburg',3,'29','1990-05-02','D'),
    (33,'Holzhäußer','Björn','Schillerstr.','8039','Zürich',2,'47 ','1976-03-24','CH'),
    (34,'Meyer','Matthias','Schulstr.','8038','Zürich',6,'6','1972-05-23','CH'),
    (35,'Walther','Steve','Siedlungsweg','3005','Bern',6,'12','1986-03-24','CH'),
    (36,'Meyer','Peter','Am Ring','60594','Frankfurt',1,'6','1974-08-13','D'),
    (37,'Bäumer','Paul','Keplerstr.','10115','Berlin',5,'49','1988-04-30','D'),
    (38,'Möller','Jochen','Am Kirchhof','22111','Hamburg',3,'23','1978-09-19','D'),
    (39,'Bonkowski','Hubert','Albert-Schweitzer-Str.','22111','Hamburg',3,'92','1974-03-14','D'),
    (40,'Eichenau','Maria','Alte Dorfstr.','10119','Berlin',2,'65','1987-05-15','D'),
    (41,'Guth','Stephan','Zentralplatz','10179','Berlin',2,'67','1975-12-06','D'),
    (42,'Berger','Sonja','Hauptstr.','21029','Hamburg',3,'37','1967-09-08','D'),
    (43,'Conolly','Sean','Goethestr.','8008','Zürich',7,'21','1976-04-26','CH'),
    (44,'Klapp','Frank','Buchenweg','22159','Hamburg',3,'46','1978-06-12','D'),
    (45,'Murnau','Anna','Goethestr.','1120','Wien',4,'78','1990-02-06','AT'),
    (46,'Untergärtner','Tobias','Ringstr.','21129','Hamburg',3,'26','1973-02-06','D'),
    (47,'Beyersdörfer','Ute','Ringstr.','10115','Berlin',5,'87','1985-08-12','D'),
    (48,'Elser','Stefano','Bahnhofstr.','22111','Hamburg',3,'20','1982-06-23','D'),
    (49,'Dröger','Maria','Ringstr.','1060','Wien',4,'53','1981-06-27','AT'),
    (50,'Kron-Köppers','Tina','Schillerstr.','10179','Berlin',2,'53','1975-11-06','D'),
    (51,'Stifter','Ansgar','Alte Gasse','1210','Wien',3,'21','1980-05-05','AT'),
    (52,'Mahn','Detlev','Goethestr.','1120','Wien',4,'27','1973-06-12','AT'),
    (53,'Zielecki','Norbert','Kleiststr.','21129','Hamburg',3,'32','1972-07-23','D'),
    (54,'Blücher','Barbara','Tannenstr.','8000','Zürich',3,'45','1995-01-26','CH'),
    (55,'Färber','Liane','Goethestr.','8008','Zürich',7,'23','1968-01-14','CH'),
    (56,'Holt','Sören','Eisenbahnstr.','1080','Wien',4,'23','1980-12-23','AT'),
    (57,'Loster-Schneider','Elena','Schulstr.','22159','Hamburg',3,'57','1976-12-21','D'),
    (58,'Maier','Frank','Mittelstr.','60320','Frankfurt',1,'37','1978-01-12','D'),
    (59,'Manz','Fridolin','Hauptstr.','1120','Wien',4,'89','1988-02-03','AT'),
    (60,'Otterstädter','Charlotte','Baumschulenweg','1210','Wien',4,'7','1978-08-12','AT'),
    (61,'Seiler','Jacqueline','Kantonsstr.','3001','Bern',5,'14','1987-03-04','CH'),
    (62,'Schmadtke','Chris','Friedensplatz','60388','Frankfurt',1,'99','1973-07-08','D'),
    (63,'Segebrecht','Annemarie','Taunusweg','60594','Frankfurt',1,'5','1971-07-11','D'),
    (64,'Trieschmann','Lars','Eisenbahnstr..','8038','Zürich',3,'58','1977-04-06','CH'),
    (65,'Unterwegner','Daniel','Zentralplatz','1210','Wien',4,'45','1991-09-05','AT'),
    (66,'Brauer','Sophie','Albert-Schweitzer-Str.','60320','Frankfurt',1,'48','1981-06-13','D'),
    (67,'Carstedt','Sabine','Goethestr.','60323','Frankfurt',1,'46','1969-08-12','D'),
    (68,'Eberspächer','Gerlinde','Bahnhofstr.','8008','Zürich',7,'45','1994-03-23','CH'),
    (69,'Frawley','Lutz','Schwedenstr.','22397','Hamburg',3,'21','1979-09-09','D')
;

-- PrimaerschluesselErstellen.sql
CREATE TABLE t_proj (
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    beginn DATE,
    ende DATE,
    PRIMARY KEY(id)
);
INSERT INTO t_proj VALUES 
    (1,'Buchprojekt','2020-11-01','2021-08-20'),
    (2,'Renovierung des Pausenraumes','2021-02-01','2021-09-28'),
    (3,'Anlegen eines Pflichtenheftes','2021-02-10','2021-07-21'),
    (4,'Kundenumfrage','2021-03-01','2021-11-30')
;











-- SekundaerschluesselErstellen.sql 
CREATE TABLE t_artikel (
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL, 
    code VARCHAR(30) NOT NULL,
    lieferant INTEGER, 
    bemerkung VARCHAR(100),
    PRIMARY KEY(id),
    UNIQUE namecodeindex (name, code)
);
INSERT INTO t_artikel VALUES 
    (22,'Bleistift','3423',1,NULL),
    (23,'Bleistift','3123',1,NULL),
    (33,'Füllhalter P1','4346',1,NULL),
    (35,'Füllhalter P','4344',2,NULL),
    (38,'Füllhalter P2 Rechtshänder','4322',1,NULL),
    (43,'Kugelschreiber','5232',2,NULL),
    (44,'Kugelschreiber','5223',2,NULL),
    (45,'Bleistift HB (10 Stück)','4342',1,NULL),
    (46,'Füllhalter P2 Linkshänder','4323',1,NULL),
    (47,'Füllhalter','4333',2,NULL),
    (48,'Kugelschreiber','5222',2,NULL),
    (49,'Kugelschreiber','5233',3,NULL),
    (50,'Fineliner (10 Stück)','4444',2,NULL)
;

-- FremdschluesselErstellen.sql
CREATE TABLE t_ma_proj (
    ma_id INTEGER NOT NULL,
    proj_id INTEGER NOT NULL,
    FOREIGN KEY (ma_id) REFERENCES t_ma (id),
    FOREIGN KEY (proj_id) REFERENCES t_proj (id)
);
INSERT INTO t_ma_proj VALUES (2,1),(5,1),(8,1),(11,1),(36,4),(48,4);




-- FremdschluesselDatensatzLoeschen.sql
DROP TABLE IF EXISTS t_ma_proj;
CREATE TABLE t_ma_proj (
    ma_id INTEGER NOT NULL, 
    proj_id INTEGER NOT NULL,
    FOREIGN KEY (ma_id) REFERENCES t_ma (id) ON DELETE CASCADE,
    FOREIGN KEY (proj_id) REFERENCES t_proj (id) ON DELETE CASCADE
);

INSERT INTO t_ma_proj (ma_id, proj_id) VALUES(2, 1);
INSERT INTO t_ma_proj (ma_id, proj_id) VALUES(5, 1);
INSERT INTO t_ma_proj (ma_id, proj_id) VALUES(8, 1);
INSERT INTO t_ma_proj (ma_id, proj_id) VALUES(11, 1);
INSERT INTO t_ma_proj (ma_id, proj_id) VALUES(14, 4);
INSERT INTO t_ma_proj (ma_id, proj_id) VALUES(18, 4);


/* 

DELETE FROM t_proj WHERE id = 4;


DELETE FROM t_ma WHERE id = 5; 
*/