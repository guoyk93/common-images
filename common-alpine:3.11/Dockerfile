FROM guoyk/minit:1.1.1 AS minit

FROM alpine:3.11

COPY --from=minit /minit /opt/bin/minit

ENV PATH "/opt/bin:${PATH}"
ENV LANG zh_CN.UTF-8
ENV TZ Asia/Shanghai

CMD ["/opt/bin/minit"]

RUN apk upgrade --no-cache && \
    apk add --no-cache vim tzdata ca-certificates curl && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    echo $TZ > /etc/TZ

ADD scripts /opt/bin
