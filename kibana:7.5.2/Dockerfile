FROM guoyk/common-ubuntu:20.04

RUN curl -sSLo kibana.tar.gz https://artifacts.elastic.co/downloads/kibana/kibana-7.5.2-linux-x86_64.tar.gz && \
    mkdir -p /opt/kibana && \
    tar xf kibana.tar.gz -C /opt/kibana --strip-components 1 && \
    rm -rf kibana.tar.gz

WORKDIR /opt/kibana

ADD config config
ADD minit.d /etc/minit.d

ENV KIBANACFG_elasticsearch__hosts '["http://elasticsearch:9200"]'
ENV KIBANACFG_server__host 0.0.0.0
ENV KIBANACFG_path__data /data
ENV KIBANACFG_i18n__locale zh-CN
