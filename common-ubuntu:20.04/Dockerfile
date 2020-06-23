FROM guoyk/minit:1.1.1 AS minit

FROM ubuntu:20.04

COPY --from=minit /minit /opt/bin/minit

ENV PATH "/opt/bin:${PATH}"
ENV LANG=zh_CN.UTF-8
ENV TZ=Asia/Shanghai

CMD ["/opt/bin/minit"]

RUN apt-get update && \
        apt-get install -y language-pack-zh-hans && \
        apt-get upgrade -y && \
        apt-get install -y tzdata ca-certificates vim curl procps net-tools unzip netcat telnet && \
        rm -rf /var/lib/apt/lists/* && \
        ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ADD scripts /opt/bin
