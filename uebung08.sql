drop Database if exists uebungen;

CREATE Database uebungen;

use uebungen;

CREATE table t_ma_dt (
    id int  not null auto_increment primary key,
    Name varchar(100) not null,
    Strasse varchar(255) not null,
    Vorname varchar(100) not null,
    Hausnummer varchar(255) not null,
    PLZ varchar(20) not null,
    Ort varchar(255) not null,
    Geburtsdatum date not null,
    Land char(2) not null
);

INSERT INTO t_ma_dt (Name, Vorname, Strasse, Hausnummer, PLZ, Ort, Geburtsdatum, Land)
VALUES
    ('Haas', 'Martina', 'Blumenweg', '23', '63065', 'Offenbach', '1972-06-01', 'D'),
    ('Richter', 'Carsten', 'Frankfurter Str.', '16', '63067', 'Offenbach', '1982-10-18', 'D'),
    ('Seiler', 'Janine', 'Goethestr.', '61', '63067', 'Offenbach', '1990-11-11', 'D'),
    ('Hartmann', 'Jochen', 'Berliner Str.', '23', '60528', 'Frankfurt', '1979-03-25', 'D'),
    ('Goldbach', 'Martin', 'Frankfurter Str.', '6', '60529', 'Frankfurt', '1981-07-06', 'D'),
    ('Naumann', 'Norbert', 'Goethestr.', '161', '60594', 'Frankfurt', '1972-11-06', 'D');


SELECT * FROM t_ma_dt;

CREATE TABLE t_ma_frankfurt (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    vorname VARCHAR(255) NOT NULL,
    strasse VARCHAR(255) NOT NULL,
    hausnummer VARCHAR(10) NOT NULL,
    plz VARCHAR(10) NOT NULL,
    ort VARCHAR(255) NOT NULL,
    geburtsdatum DATE NOT NULL,
    land CHAR(2) NOT NULL,
    PRIMARY KEY (id)
);


INSERT INTO t_ma_frankfurt (name, vorname, strasse, hausnummer, plz, ort, geburtsdatum, land)
SELECT name, vorname, strasse, hausnummer, plz, ort, geburtsdatum, land
FROM t_ma_dt
WHERE ort = 'Frankfurt' OR ort = 'Offenbach';


SELECT * FROM t_ma_frankfurt;


UPDATE t_ma_frankfurt
SET ort = 'Frankfurt/Main'
WHERE ort = 'Frankfurt';


SELECT * FROM t_ma_frankfurt;

