drop DATABASE IF EXISTS uebungen;

CREATE DATABASE uebungen;

USE uebungen;

drop TABLE IF EXISTS t_person;

CREATE TABLE t_person (
    id int NOT NULL AUTO_INCREMENT,
    vorname varchar(255) NOT NULL,
    nachname varchar(255) NOT NULL,
    PRIMARY KEY (id)
)

