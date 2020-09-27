ARG NODE_VERSION
FROM ${NODE_VERSION}

ARG TZ
ARG CONTAINER_PACKAGE_URL

RUN yarn --version
RUN yarn config set registry https://registry.npm.taobao.org/

RUN if [ $CONTAINER_PACKAGE_URL ] ; then sed -i "s/dl-cdn.alpinelinux.org/${CONTAINER_PACKAGE_URL}/g" /etc/apk/repositories ; fi

RUN apk --no-cache add tzdata \
    && cp "/usr/share/zoneinfo/$TZ" /etc/localtime \
    && echo "$TZ" > /etc/timezone

RUN apk add --no-cache bash git openssh

WORKDIR /www
