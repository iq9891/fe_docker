ARG NODE_VERSION
FROM ${NODE_VERSION}

ARG TZ
ARG CONTAINER_PACKAGE_URL
ARG YARN_ENV

RUN if [ "$YARN_ENV" = "2" ]; then \
    rm -rf /usr/local/bin/yarn;\
    rm -rf /usr/local/bin/yarnpkg;\
    rm -rf /opt/yarn-v$YARN_VERSION/bin/yarn;\
    rm -rf /opt/yarn-v$YARN_VERSION/bin/yarnpkg;\
    npm config set registry https://registry.npm.taobao.org;\
    npm install -g yarn;\
    yarn set version berry;\
    fi

RUN if [ $CONTAINER_PACKAGE_URL ] ; then sed -i "s/dl-cdn.alpinelinux.org/${CONTAINER_PACKAGE_URL}/g" /etc/apk/repositories ; fi

RUN apk add --update python3 py3-pip make g++ git openssh bash gcc autoconf automake libtool libpng libpng-dev zlib vim nasm yasm\
   && rm -rf /var/cache/apk/*

RUN apk --no-cache add tzdata \
    && cp "/usr/share/zoneinfo/$TZ" /etc/localtime \
    && echo "$TZ" > /etc/timezone

RUN yarn config set disturl https://npm.taobao.org/dist -g \
    && yarn config set electron_mirror https://npm.taobao.org/mirrors/electron/ -g \
    && yarn config set sass_binary_site https://npm.taobao.org/mirrors/node-sass/ -g \
    && yarn config set phantomjs_cdnurl https://npm.taobao.org/mirrors/phantomjs/ -g \
    && yarn config set chromedriver_cdnurl https://cdn.npm.taobao.org/dist/chromedriver -g \
    && yarn config set operadriver_cdnurl https://cdn.npm.taobao.org/dist/operadriver -g \
    && yarn config set fse_binary_host_mirror https://npm.taobao.org/mirrors/fsevents -g \
    && yarn config set sqlite3_binary_host_mirror https://foxgis.oss-cn-shanghai.aliyuncs.com/ \
    && yarn config set profiler_binary_host_mirror https://npm.taobao.org/mirrors/node-inspector/

WORKDIR /www
