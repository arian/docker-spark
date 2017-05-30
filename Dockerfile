FROM ubuntu:16.04

MAINTAINER Arian Stolwijk
LABEL version="spark_2.1_hadoop_2.7"

RUN apt-get update \
  && apt-get install -y wget default-jre mysql-client libmysql-java \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ENV SPARK_FILE spark-2.1.1-bin-hadoop2.7.tgz
RUN \
  wget -q https://d3kbcqa49mib13.cloudfront.net/$SPARK_FILE \
  && tar -xzf "$SPARK_FILE" \
  && mv spark-2.1.1-bin-hadoop2.7 /spark \
  && rm -rf $SPARK_FILE

ENV SPARK_HOME /spark

expose 4040

CMD ["/spark/bin/spark-shell"]
