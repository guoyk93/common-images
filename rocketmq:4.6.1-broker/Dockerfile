FROM guoyk/common-rocketmq:4.6.1

RUN ln -sf /data/store /root/store && \
    ln -sf /data/logs /root/logs

ADD conf conf
ADD minit.d /etc/minit.d

ENV RMQCFG_brokerClusterName DefaultCluster
ENV RMQCFG_brokerName broker-a
ENV RMQCFG_brokerId 0
ENV RMQCFG_deleteWhen 04
ENV RMQCFG_fileReservedTime 48
ENV RMQCFG_brokerRole ASYNC_MASTER
ENV RMQCFG_flushDiskType ASYNC_FLUSH
