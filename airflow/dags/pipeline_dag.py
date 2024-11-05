from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.python import PythonOperator
from datetime import datetime, timedelta
import subprocess

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

with DAG(
    'mssql_to_postgres_dbt_pipeline',
    default_args=default_args,
    description='ETL pipeline from MS SQL Server to PostgreSQL with dbt transformations',
    schedule_interval=timedelta(days=1),
    start_date=datetime(2024, 4, 1),
    catchup=False,
) as dag:

    # Task 1: Run pgLoader to Extract and Load Data
    started_task = BashOperator(
        task_id='started_task',
        #bash_command='pgloader /usr/local/airflow/dags/scripts/mssql_to_postgres.load',
        bash_command='echo hello!',
    )

    # task 1: todo: generate random data
    generate_random_data = BashOperator(
        task_id='generate_random_data',\
        bash_command='echo "hello!" '
        
    )

    # Task 2: Run dbt Transformations
    run_dbt = BashOperator(
        task_id='run_dbt',
        bash_command='cd /usr/local/airflow/dags/dbt_project_snowflake && dbt run',
    )

    # Task 3: Run dbt Tests
    test_dbt = BashOperator(
        task_id='test_dbt',
        bash_command='cd /usr/local/airflow/dags/dbt_project_snowflake && dbt test',
    )

    started_task >> generate_random_data >> run_dbt >> test_dbt