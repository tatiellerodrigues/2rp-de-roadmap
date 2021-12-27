
#!/bin/hql

#criando script  cria-tabelas.sql
 com os comandos necessários para criar duas tabelas
no formato ORC de acordo com a especificação abaixo:

Create database work_dataeng


create table  work_dataeng.generation_Tatielle(
generation int,
date_introduced date

)

 stored as orc;

create table work_dataeng.pokemon_tatiele(
	idnum   int, 
	name string, 
	hp  int,
	speed   int,
	attack  int,
	special_attack  int, 
	defense int, 
	special_defense int, 
	generation  int
)
stored as orc;