FROM guoyk/minit:1.1.1 AS minit

FROM ubuntu:20.04

COPY --from=minit /minit /minit

ENV LANG=zh_CN.UTF-8
ENV TZ=Asia/Shanghai

RUN  sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list && \
        sed -i "s/security.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list && \
        apt-get update && \
        apt-get install -y language-pack-zh-hans && \
        apt-get upgrade -y && \
        apt-get install -y tzdata ca-certificates vim curl procps net-tools unzip netcat telnet && \
        rm -rf /var/lib/apt/lists/* && \
        ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

CMD ["/minit"]
