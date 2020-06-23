FROM guoyk/common-jdk:11

ENV JAVA_XMS 1g
ENV JAVA_XMX 1g
ENV JAVA_OPTS ""

RUN curl -sSLo elasticsearch.tar.gz https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.5.2-no-jdk-linux-x86_64.tar.gz && \
    mkdir -p /opt/elasticsearch && \
    tar -C /opt/elasticsearch --strip-components 1 -xf elasticsearch.tar.gz && \
    rm -f elasticsearch.tar.gz && \
    curl -sSLo /opt/elasticsearch-tune-1.0.jar https://github.com/guoyk93/elasticsearch-tune/releases/download/v1.0/elasticsearch-tune-1.0.jar && \
    /opt/elasticsearch/bin/elasticsearch-plugin install -b https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.5.2/elasticsearch-analysis-ik-7.5.2.zip && \
    mv /opt/elasticsearch/config/analysis-ik /opt/elasticsearch/config/analysis-ik.origin

WORKDIR /opt/elasticsearch

ADD config config
ADD minit.d /etc/minit.d

ENV ES_PATH_DATA '/data'
ENV ES_PATH_LOGS '/data/logs'
ENV ES_NETWORK_HOST '0.0.0.0'
ENV ES_HTTP_PORT 9200
ENV ES_DISCOVERY_TYPE 'single-node'
