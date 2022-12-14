#!/bin/bash
docker run -d -p 8080:8080 -v "$PWD/dag_directory:/opt/airflow/dags/" \
--entrypoint=/bin/bash \
--name airflow apache/airflow:2.4.0-python3.8 \
-c '(airflow db init && \
    airflow users create --username air --password teste@123 --firstname Air --lastname Flow --role Admin --email admin@example.org
    ); \
airflow webserver & \
airflow scheduler \
'
