
from pyspark.sql import SparkSession
spark = SparkSession.builder.getOrCreate()

#exportando arquivo csv pokemon
df_pk = spark.table("work_dataeng.pokemon_tatielle_ext");

#exportando arquivo csv generation
df_gene = spark.table("work_dataeng.generation_tatielle")

#filtrando as tabelas
df_gene = df_gene.filter(df_gene["date_introduced"] < "2002-11-21")

#colocando em cache
df_gene = df_gene.cache

#fazendo join
df_gen_pok = df_pk.join(df_gene, 'generation', how='inner')

df_gen_pok.write.mode('overwrite').format('orc') \
        .saveAsTable('work_dataeng.pokemons_oldschool_tatielle')


     

