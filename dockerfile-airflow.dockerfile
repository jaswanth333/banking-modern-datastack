# Dockerfile-airflow
FROM apache/airflow:2.9.3

# Switch to airflow user first
USER airflow

# Install dbt packages
RUN pip install --no-cache-dir dbt-core dbt-snowflake

RUN dbt clean && dbt compile --project-dir /opt/airflow/banking_dbt --profiles-dir /home/airflow/.dbt
