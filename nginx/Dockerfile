FROM guoyk/common-alpine:3.11

RUN apk add --no-cache nginx && \
    rm -rf /etc/nginx/conf.d /etc/nginx/default.conf.d && \
    mkdir -p /etc/nginx/conf.d /etc/nginx/default.conf.d && \
    mkdir -p /etc/nginx/conf.d /etc/nginx/default.root.conf.d

WORKDIR /var/www/public

ADD nginx.conf      /etc/nginx/nginx.conf
ADD snippets        /etc/nginx/snippets
ADD default.conf    /etc/nginx/conf.d/default.conf
ADD index.html      /var/www/public/index.html

ADD minit.d /etc/minit.d
