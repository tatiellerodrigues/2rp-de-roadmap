
#export
# Exportando do Dados

--sqoop export 
--export-dir \
/user/hive/warehouse/work_dataeng.db/pokemon_tatielle \
--table pokemon_Leonardo_tatielle \
--columns idnum, name, hp, speed
