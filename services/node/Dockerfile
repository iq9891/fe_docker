ARG NODE_VERSION
FROM ${NODE_VERSION}

ARG TZ
ARG CONTAINER_PACKAGE_URL
ARG YARN_ENV

RUN rm -rf /usr/local/bin/yarn;\
    rm -rf /usr/local/bin/yarnpkg;\
    rm -rf /opt/yarn-v$YARN_VERSION/bin/yarn;\
    rm -rf /opt/yarn-v$YARN_VERSION/bin/yarnpkg;\
    npm config set registry https://registry.npm.taobao.org ;\
    npm install -g yarn;

RUN if [ "$YARN_ENV" = "1" ]; then yarn set version 1.22.10; else yarn set version berry ; fi

RUN if [ $CONTAINER_PACKAGE_URL ] ; then sed -i "s/dl-cdn.alpinelinux.org/${CONTAINER_PACKAGE_URL}/g" /etc/apk/repositories ; fi

RUN apk --no-cache add tzdata \
    && cp "/usr/share/zoneinfo/$TZ" /etc/localtime \
    && echo "$TZ" > /etc/timezone

RUN apk add --no-cache bash git openssh

WORKDIR /www
