FROM guoyk/common-nginx:proxy

RUN apt-get update && \
    apt-get install apache2-utils && \
    rm -rf /var/lib/apt/lists/* 

ADD 01-basic-auth.conf /etc/nginx/default.root.conf.d
ADD minit.d /etc/minit.d
