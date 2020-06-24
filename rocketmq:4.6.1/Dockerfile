FROM guoyk/common-jdk:11

RUN curl -sSLo rocketmq.tar.gz https://mirrors.landzero.net/archive.apache.org/dist/rocketmq/4.5.2/rocketmq-all-4.6.1-bin-release.tar.gz && \
    mkdir -p /opt/rocketmq && \
    tar --strip-components 1 -C /opt/rocketmq -xf rocketmq.tar.gz && \
    rm -rf rocketmq.tar.gz

WORKDIR /opt/rocketmq
