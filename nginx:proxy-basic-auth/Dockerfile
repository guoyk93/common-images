FROM guoyk/common-nginx:proxy

RUN apk add --no-cache apache2-utils

ADD 01-basic-auth.conf /etc/nginx/default.root.conf.d
ADD minit.d /etc/minit.d
