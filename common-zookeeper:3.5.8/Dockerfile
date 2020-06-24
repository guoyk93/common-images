FROM guoyk/common-jdk:11

RUN curl -sSL -o zookeeper.tar.gz https://downloads.apache.org/zookeeper/zookeeper-3.5.8/apache-zookeeper-3.5.8-bin.tar.gz && \
    mkdir -p /opt/zookeeper && \
    tar -C /opt/zookeeper --strip-components 1 -xf zookeeper.tar.gz && \
    rm -rf zookeeper.tar.gz

WORKDIR /opt/zookeeper

ADD zoo.cfg conf/zoo.cfg
ADD scripts /opt/bin
ADD minit.d /etc/minit.d

ENV ZOO_MYID 1
ENV ZOO_TICK_TIME 2000
ENV ZOO_INIT_LIMIT 10
ENV ZOO_SYNC_LIMIT 5
ENV ZOO_MAX_CLIENT_CNXNS 99999
ENV ZOO_AUTOPURGE_SNAP_RENTAIN_COUNT 3
ENV ZOO_AUTOPURGE_PURGE_INTERVAL 1