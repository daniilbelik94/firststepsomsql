SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;



-- Die Übung 1 wurde bereits im Begleitmaterial des Buches ausgeliefert




----------- Übung 1 ---------------
/* 
    Erstellen Sie eine neue Datenbank Bibliothek.
    Wechseln Sie in diese Datenbank.
    Erstellen Sie die Tabelle t_buecher mit folgenden Datenfeldern:
    isbn, Text mit maximal 13 Zeichen
    titel, autor, Text mit maximal 100 Zeichen
    auflage, preis.
    Wählen Sie geeignete Datentypen.
    Definieren Sie das Feld isbn als Primärschlüssel.
    Erstellen Sie die Tabelle t_leser mit folgenden Datenfeldern:
    nr, name, vname, gebdat und adr.
    Wählen Sie geeignete Datentypen.
    Definieren Sie das Feld nr als Primärschlüssel.

    Erstellen Sie eine weitere Tabelle t_verleih, die eine Verbindung zwischen den Lesern und
    den Büchern herstellt. Sie soll folgende Datenfelder enthalten:
    isbn, leser, datum.
    Wählen Sie geeignete Datentypen.
    
    Erstellen Sie eine geeignete Fremdschlüsselbeziehung zu den anderen beiden Tabellen.
    Beim Löschen eines Buches oder eines Lesers sollen auch alle zugehörigen
    Datensätze dieser Tabelle gelöscht werden.
*/




DROP DATABASE IF EXISTS bibliothek;
CREATE DATABASE bibliothek;
USE bibliothek;

CREATE TABLE t_buecher 
   (isbn VARCHAR(13) NOT NULL,
   titel VARCHAR(100),
   autor VARCHAR(100),
   auflage INTEGER,
   preis FLOAT,
   PRIMARY KEY(isbn));

CREATE TABLE t_leser
   (nr INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(30),
    vname VARCHAR(30),
    gebdat DATE,
    adr VARCHAR(100),
    PRIMARY KEY(nr));

CREATE TABLE t_verleih
   (isbn VARCHAR(13) NOT NULL,
    leser INTEGER NOT NULL,
    datum DATE,
    FOREIGN KEY(isbn) REFERENCES t_buecher(isbn) ON DELETE CASCADE,
    FOREIGN KEY(leser) REFERENCES t_leser(nr) ON DELETE CASCADE);

INSERT INTO t_buecher (isbn, titel, autor, auflage, preis) VALUES ('1-254-56649-0', 'Mein Gartenbuch', 'Bernd Blume', 2, 19.95);
INSERT INTO t_buecher (isbn, titel, autor, auflage, preis) VALUES ('1-234-56789-0', 'Der Baum', 'Gerd Baumann', 1, 29.95);
INSERT INTO t_buecher (isbn, titel, autor, auflage, preis) VALUES ('1-285-54709-0', 'Fit for Fun', 'Brigitte Schöne', 3, 21.55);

INSERT INTO t_leser (name, vname, gebdat, adr) VALUES ('Schulz', 'Marko', '1987-04-17', 'Waldweg 4, 10119 Berlin');
INSERT INTO t_leser (name, vname, gebdat, adr) VALUES ('Kramer', 'Janette', '1986-12-23', 'Steinstr. 4, 10121 Berlin');
INSERT INTO t_leser (name, vname, gebdat, adr) VALUES ('Baumann', 'Bernd', '1961-06-29', 'Bergstr. 4, 90401 Nürnberg');

INSERT INTO t_verleih (isbn, leser, datum) VALUES ('1-254-56649-0', 1, '25.11.09'); 
INSERT INTO t_verleih (isbn, leser, datum) VALUES ('1-234-56789-0', 1, '25.11.09');
INSERT INTO t_verleih (isbn, leser, datum) VALUES ('1-285-54709-0', 2, '27.10.09');
INSERT INTO t_verleih (isbn, leser, datum) VALUES ('1-285-54709-0', 3, '29.11.09');







----------- Übung 2 ---------------
/* 
    Wechseln Sie zur Datenbank Bibliothek.
    Definieren Sie einen Index für das Datenfeld autor der Tabelle t_buecher.
    Erstellen Sie eine geeignete Abfrage, die den Index verwendet.
    Definieren Sie einen weiteren Index für das Datenfeld titel der Tabelle t_buecher.
    Nennen Sie eine Abfrage, bei der dieser Index verwendet wird.
    Definieren Sie einen kombinierten Index für die Datenfelder isbn und leser der Tabelle
    t_ verleih.
    Wie lautet eine Abfrage, bei der der Index verwendet wird?
    Erstellen Sie einen Index für die Suche im Feld name der Tabelle t_leser.
    Lassen Sie sich alle Indizes anzeigen.
    Löschen Sie den Index für die Suche im Feld name der Tabelle t_leser.
 */

 
USE Bibliothek;

CREATE INDEX i_autor ON t_buecher (autor);

SELECT * FROM t_buecher WHERE autor LIKE 'B%';

CREATE INDEX i_titel ON t_buecher (titel);

SELECT * FROM t_buecher ORDER BY titel;

CREATE INDEX i_verleih ON t_verleih (isbn, leser);

SELECT * FROM t_verleih ORDER BY isbn, leser;



CREATE INDEX i_leser_ab ON t_leser (name DESC); -- absteigender Index ist in MySQL nicht möglich, Schlüsselwort wird vom System ignoriert

SHOW INDEX FROM t_leser;                                       

DROP INDEX i_leser_ab ON t_leser;                            
                                                  

