FROM guoyk/common-jdk:11

RUN curl -sSL -o zookeeper.tar.gz https://downloads.apache.org/zookeeper/zookeeper-3.5.8/apache-zookeeper-3.5.8-bin.tar.gz && \
    mkdir -p /opt/zookeeper && \
    tar -C /opt/zookeeper --strip-components 1 -xf zookeeper.tar.gz && \
    rm -rf zookeeper.tar.gz

WORKDIR /opt/zookeeper

ADD conf conf

ADD scripts /opt/bin
ADD minit.d /etc/minit.d

ENV ZOOCFG_tickTime 2000
ENV ZOOCFG_initLimit 10
ENV ZOOCFG_syncLimit 5
ENV ZOOCFG_dataDir /data
ENV ZOOCFG_clientPort 2181
ENV ZOOCFG_maxClientCnxns 99999
ENV ZOOCFG_autopurge__snapRentainCount 3
ENV ZOOCFG_autopurge__purgeInterval 1

ENV ZOO_MYID 1