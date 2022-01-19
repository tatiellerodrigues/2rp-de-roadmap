#Importa Pacotes
from airflow import DAG
from airflow.operators.dummy_operator import DummyOperator
from airflow.operators.bash_operator import BashOperator
from custom_operators.tworp_spark_submit_operator import TwoRPSparkSubmitOperator
from datetime import datetime

usuario = "2rp-tatielle"
default_args={
    "owner":usuario,
    "start_date": datetime(2022,1,18),
    "depend_on_past": False,
    "retries": 3,
    "run_as_user": usuario,
    "proxy_user": usuario
 }


with DAG(dag_id='de_tatielle_dev', schedule_interval=None, default_args = default_args, catchup=False) as dag:

        t_dummy = DummyOperator(
                task_id='t_dummy',
        )

       
        t_kinit = BashOperator(
                task_id='t_kinit',
                bash_command=f'kinit -kt /home/{usuario}/{usuario}.keytab {usuario}'
        )

        
        t_executar = BashOperator(
                task_id='t_executar',
        bash_command='sh /home/2rp-tatielle/Shell-script/executar.sh /home/2rp-tatielle/teste-shell mensagem_task'
         
        )       

      
        t_pok = TwoRPSparkSubmitOperator(
                task_id='pokemon_task',
                name='pokemon_task',
                conn_id='spark_conn',
                application=f'/home/{usuario}/pokemons_oldschool.py',
                keytab=f'/home/{usuario}/{usuario}.keytab',
                principal=usuario,
                proxy_user=None,
                verbose=True
        )


        t_dummy >> t_kinit >> t_executar >>  t_pok


