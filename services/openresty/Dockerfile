ARG OPENRESTY_VERSION
FROM ${OPENRESTY_VERSION}

ARG TZ
ARG CONTAINER_PACKAGE_URL

RUN if [ $CONTAINER_PACKAGE_URL ] ; then sed -i "s/dl-cdn.alpinelinux.org/${CONTAINER_PACKAGE_URL}/g" /etc/apk/repositories ; fi

ENV LIBRARY_PATH=/lib:/usr/lib/

COPY ./logrotate-nginx /etc/logrotate.d/nginx

# 如果/etc/logrotate.d下的配置文件非644权限，则配置文件不会被读取 https://blog.csdn.net/tjcwt2011/article/details/80154814
RUN chmod 644 /etc/logrotate.d/nginx

RUN apk --no-cache add shadow && useradd www-data && usermod -u 1000 www-data && groupmod -g 1000 www-data

RUN apk --no-cache add tzdata logrotate \
    && cp "/usr/share/zoneinfo/$TZ" /etc/localtime \
    && echo "$TZ" > /etc/timezone \
    && rm -rf /tmp/* /var/cache/apk/* \
    && echo "1 0 * * * /usr/sbin/logrotate -f /etc/logrotate.d/nginx >/dev/null 2>&1" >> /var/spool/cron/crontabs/root

# lua ip限制模板所需文件
COPY ./lua-resty-template/template.lua /usr/local/openresty/lualib/resty/
COPY ./lua-resty-template/template /usr/local/openresty/lualib/resty/


WORKDIR /www