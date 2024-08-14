-- Wechseln Sie zur Datenbank Uebungen. 
-- Ermitteln Sie aus der Tabelle t_lager für jeden Artikel den Bruttopreis, indem Sie zu dem 
-- in der Tabelle gespeicherten Preis 19 % Mehrwertsteuer hinzufügen. 
-- Gruppieren Sie die Tabelle anhand der Stückzahl und ermitteln Sie in einer Abfrage die 
-- Anzahl der Artikel, die mit einer bestimmten Stückzahl vorhanden sind. 
-- Schränken Sie die Abfrage auf Stückzahlen mit weniger als 10 Artikeln ein. 
-- Sortieren Sie das Abfrageergebnis wenn möglich absteigend nach der Stückzahl.

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4; 

drop DATABASE if exists Uebungen;

CREATE DATABASE Uebungen;

USE Uebungen;

CREATE TABLE t_lager (
    id INT AUTO_INCREMENT PRIMARY KEY,
    bezeichnung VARCHAR(100) NOT NULL,
    preis DECIMAL(10, 2) NOT NULL,
    stueckzahl INT NOT NULL
);

INSERT INTO t_lager (bezeichnung, preis, stueckzahl)
VALUES
    ('Homer Simpson', 10.00, 100),
    ('Marge Simpson', 15.00, 150),
    ('Bart Simpson', 20.00, 200),
    ('Lisa Simpson', 25.00, 250),
    ('Maggie Simpson', 30.00, 300),
    ('Ned Flanders', 35.00, 350),
    ('Mr. Burns', 40.00, 400),
    ('Smithers', 45.00, 450),
    ('Chief Wiggum', 50.00, 500),
    ('Apu Nahasapeemapetilon', 55.00, 550),
    ('Seymour Skinner', 60.00, 600),
    ('Edna Krabappel', 65.00, 650),
    ('Comic Book Guy', 70.00, 700),
    ('Krusty the Clown', 75.00, 750),
    ('Ralph Wiggum', 80.00, 800),
    ('Milhouse Van Houten', 85.00, 850),
    ('Otto Mann', 90.00, 900),
    ('Reverend Lovejoy', 95.00, 950),
    ('Patty Bouvier', 100.00, 1000),
    ('Selma Bouvier', 105.00, 1050),
    ('Jebediah Springfield', 110.00, 1100),
    ('Barney Gumble', 115.00, 1150),
    ('Hank Scorpio', 120.00, 1200),
    ('Lenny Leonard', 125.00, 1250),
    ('Carl Carson', 130.00, 1300),
    ('Dr. Hibbert', 135.00, 1350),
    ('Dr. Nick Riviera', 140.00, 1400),
    ('Sideshow Bob', 145.00, 1450),
    ('Waylon Smithers', 150.00, 1500),
    ('Luanne Van Houten', 155.00, 1550),
    ('Helen Lovejoy', 160.00, 1600),
    ('Abe Simpson', 165.00, 1650),
    ('Martin Prince', 170.00, 1700),
    ('Ruth Powers', 175.00, 1750),
    ('Gil Gunderson', 180.00, 1800),
    ('Kang', 185.00, 1850),
    ('Kodos', 190.00, 1900),
    ('Mayor Quimby', 195.00, 1950),
    ('Mayor Quimby', 200.00, 2000),
    ('Troy McClure', 205.00, 2050),
    ('Lionel Hutz', 210.00, 2100),
    ('Squeaky-Voiced Teen', 215.00, 2150),
    ('Jasper Beardly', 220.00, 2200),
    ('Snake Jailbird', 225.00, 2250),
    ('Moe Szyslak', 230.00, 2300),
    ('Abe Simpson', 235.00, 2350),
    ('Groundskeeper Willie', 240.00, 2400),
    ('Sideshow Mel', 245.00, 2450),
    ('Cletus Spuckler', 250.00, 2500),
    ('Duffman', 255.00, 2550);


SELECT id as Nummer, 
bezeichnung as Name,
 preis as Nettopreis,
 round(preis * 1.19, 2) as Bruttopreis,
  stueckzahl as Stueckzahl
   FROM t_lager;


where stueckzahl < 10;

group by stueckzahl
order by stueckzahl desc;



