drop DATABASE if exists mitarbeiter;

create DATABASE mitarbeiter;

use mitarbeiter;

create table
    t_ma (
        id integer not null auto_increment primary key,
        vname varchar(100),
        nachname varchar(100),
        geburtstag date,
        email varchar(255),
        telefon varchar(20),
        adr text
    );

show tables;

show columns
from
    t_ma;