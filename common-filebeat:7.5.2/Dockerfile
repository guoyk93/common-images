FROM guoyk/common-ubuntu:20.04

RUN curl -sSLo filebeat.tar.gz https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.5.2-linux-x86_64.tar.gz && \
    mkdir -p /opt/filebeat && \
    tar --strip-components 1 -C /opt/filebeat -xf filebeat.tar.gz && \
    rm -rf filebeat.tar.gz && \
    ln -sf /data /opt/filebeat/data

WORKDIR /opt/filebeat

ADD minit.d /etc/minit.d
