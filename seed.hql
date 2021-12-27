
#!/bin/hql


INSERT INTO TABLE work_dataeng.generation_tatielle VALUES
 (1,"1996-02-27"),
 (2,"1999-11-21"),
 (3,"2002-11-21"),
 (4,"2006-09-28"),
 (5,"2010-09-18"),
 (6,"2010-12-13"),
 (7,"2016-11-18");

 SELECT * FROM work_dataeng.generation_tatielle;


 CREATE EXTERNAL TABLE work_dataeng.pokemon_tatielle_ext (
    idnum int,
	name string, 
	hp int,
	speed int,
	attack int,
	special_attack int,
	defense int,
	special_defense int,
	generation int
)ROW FORMAT DELIMITEDFIELDS TERMINATED BY ','
STORED AS TEXTFILE TBLPROPERTIES ('skip.header.line.count'='1')

LOAD DATA INPATH '/ user/ hive/ pokemon.csv' INSERT TABLE pokemon_tatielle_ext;

/*POPULAR TABELA*/
INSERT INTO TABLE work_dataeng.pokemon_tatielle SELECT * FROM pokemon_tatielle_ext

/*limitanto o numero de view da tabela */
SELECT * FROM work_dataeng.pokemon_tatielle LIMIT 50;


/*Comparando tempo de execução de HIVE( Criando join nas tabelas) */

select * from work_dataeng.pokemon_tatielle as  P
		join work_dataeng.generation_tatielle as G 
		on P.generation = G.generation;


/*Comparando tempo de execução Impala*/

select G.generation, P.* from work_dataeng.generation_tatielle G
		join work_dataeng.pokemon_tatielle P  
		on G.generation = P.generation;







