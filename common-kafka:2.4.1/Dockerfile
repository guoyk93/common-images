FROM guoyk/common-jdk:11

RUN curl -sSLo kafka.tar.gz https://downloads.apache.org/kafka/2.4.1/kafka_2.12-2.4.1.tgz && \
    mkdir -p /opt/kafka && \
    tar --strip-components 1 -C /opt/kafka -xf kafka.tar.gz && \
    rm -rf kafka.tar.gz

WORKDIR /opt/kafka

ADD config config
ADD scripts /bin/scripts

ADD minit.d /etc/minit.d

ENV KAFKACFG_broker__id 0
ENV KAFKACFG_num__network__threads 3
ENV KAFKACFG_num__io__threads 8
ENV KAFKACFG_socket__send__buffer__bytes 102400
ENV KAFKACFG_socket__receive__buffer__bytes 102400
ENV KAFKACFG_request__max__bytes 104857600
ENV KAFKACFG_log__dirs /data
ENV KAFKACFG_num__partitions 1
ENV KAFKACFG_num__recovery__threads__per__data__dir 1
ENV KAFKACFG_offsets__topic__replication__factor 1
ENV KAFKACFG_transaction__state__log__replication__factor 1
ENV KAFKACFG_transaction__state__log__min__isr 1
ENV KAFKACFG_log__rentation__hours 168
ENV KAFKACFG_log__segment__bytes 1073741824
ENV KAFKACFG_log__rentation__check__interval__ms 300000
ENV KAFKACFG_zookeeper__connect localhost:2181
ENV KAFKACFG_zookeeper__connection__timeout__ms 6000
ENV KAFKACFG_group__initial__rebalance__delay__ms 0