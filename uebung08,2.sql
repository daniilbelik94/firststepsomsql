USE bibliothek;

source datenbank_bibliothek.sql;

create index idx_autor on t_buecher(autor);

SELECT * FROM t_buecher where autor = 'Gerd Baumann';

create index idx_titel on t_buecher(titel);

select * from t_buecher where titel = 'Der Baum';

create index idx_isbn on t_verleih(isbn, leser);

select * from t_verleih where isbn = '978-3-16-148410-0' and leser = 1;

create index idx_name on t_leser(name);

SHOW INDEX FROM t_leser;
show INDEX from t_buecher;
show INDEX from t_verleih;

DROP INDEX idx_name ON t_leser;
