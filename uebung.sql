-- uebung.sql
DROP DATABASE IF EXISTS uebungen;
CREATE DATABASE uebungen;
CREATE DATABASE testdb;
USE testdb;

CREATE TABLE testdb (       
    vname VARCHAR(20),
    mail VARCHAR(255),
    PRIMARY KEY (vname)
);
 show TABLES;
 show COLUMNS FROM testdb;
 DROP DATABASE testdb;
