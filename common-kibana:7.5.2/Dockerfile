FROM guoyk/common-ubuntu:20.04

RUN curl -sSLo kibana.tar.gz https://artifacts.elastic.co/downloads/kibana/kibana-7.5.2-linux-x86_64.tar.gz && \
    mkdir -p /opt/kibana && \
    tar xf kibana.tar.gz -C /opt/kibana --strip-components 1 && \
    rm -rf kibana.tar.gz

WORKDIR /opt/kibana

ADD config config
ADD minit.d /etc/minit.d

ENV KIBANA_ELASTICSEARCH_HOSTS '["http://elasticsearch:9200"]'
ENV KIBANA_SERVER_HOST 0.0.0.0
ENV KIBANA_PATH_DATA /data
ENV KIBANA_I18N_LOCALE zh-CN
