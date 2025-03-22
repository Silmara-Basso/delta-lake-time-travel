# Data Lakehouse Time Travel com Apache Spark e Delta Lake

# Base de uma distribuição mínima com suporte ao Java
FROM openjdk:8-jre-slim

ENV SPARK_VERSION=3.5.3
ENV HADOOP_VERSION=3
ENV DELTA_VERSION=3.2.1
ENV SPARK_HOME=/opt/spark
ENV PATH="$SPARK_HOME/bin:$PATH"

# Evitar problemas com CgroupV2
ENV SPARK_SUBMIT_OPTS="-Djdk.internal.platform.cgroupv2.enable=false -Dlog4j2.disable.jmx=true"
ENV JAVA_TOOL_OPTIONS="-Djdk.internal.platform.cgroupv2.enable=false"

# Baixar e Instalar o Apache Spark e pacotes do SO
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl python3 python3-pip python3-setuptools procps \
    && curl -L "https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz" | tar -xz -C /opt/ \
    && mv /opt/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} /opt/spark \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

    
# Instalar Dependências Python e Delta Lake
RUN pip3 install --no-cache-dir pyspark==${SPARK_VERSION} delta-spark==${DELTA_VERSION} notebook    

# Configurações Adicionais
WORKDIR /repositorio
COPY delta /repositorio

# Configurar Jupyter Notebook como Entrada Principal
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
