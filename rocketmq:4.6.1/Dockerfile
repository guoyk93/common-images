FROM guoyk/common-jdk:11

RUN curl -sSLo rocketmq.tar.gz https://archive.apache.org/dist/rocketmq/4.6.1/rocketmq-all-4.6.1-bin-release.zip && \
    mkdir -p /opt/rocketmq && \
    tar --strip-components 1 -C /opt/rocketmq -xf rocketmq.tar.gz && \
    rm -rf rocketmq.tar.gz

WORKDIR /opt/rocketmq
