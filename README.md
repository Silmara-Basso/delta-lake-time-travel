# delta-lake-time-travel
Uso de Apache Spark e Delta Lake para implementar um Data Lakehouse, com funcionalidades de time travel que permitem acessar e gerenciar versões históricas de tabelas de dados, assegurando consistência transacional e suporte a análises avançadas.


# Data Lakehouse Time Travel com Apache Spark e Delta Lake

# Abra o terminal ou prompt de comando, navegue até a pasta onde estão os arquivos e execute:

`docker compose up -d`

docker-compose build
docker-compose up -d

docker build -t delta-lake-sil .
docker run --privileged -it delta-lake-sil /bin/bash

 spark-submit --version

 SPARK_SUBMIT_OPTS="-Djdk.internal.platform.cgroupv2.enable=false" spark-submit --version

# Acesse o Jupyter Notebook pelo docker