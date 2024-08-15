SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;



drop database if exists bibliothek;

create database bibliothek;

use bibliothek;

source datenbank_bibliothek.sql;


create table if not exists t_buecher_d (
    id varchar(13),
    isbn  varchar(13) primary key,
    titel varchar(100),
    autor varchar(100),
    auflage int(11),
    preis decimal(10,2)
);


create table if not exists t_leser_d (  
    nr int(11) primary key,
    name varchar(30),
    vname varchar(30),
    gebdat date,
    adr text
    );


create table if not exists t_verleih_d (    
    isbn varchar(13),
    leser int(11),
    datum date,
    primary key(isbn,leser,datum),
    foreign key(isbn) references t_buecher(isbn) on delete cascade,
    foreign key(leser) references t_leser(nr) on delete cascade
)
default charset=latin1;


SELECT * FROM t_verleih;
SELECT * FROM t_buecher;
SELECT * FROM t_leser;
