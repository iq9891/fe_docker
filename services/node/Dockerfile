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

RUN apk add --update python make g++ zsh git openssh bash gcc autoconf automake libtool libpng libpng-dev zlib vim nasm\
   && rm -rf /var/cache/apk/*

RUN apk --no-cache add tzdata \
    && cp "/usr/share/zoneinfo/$TZ" /etc/localtime \
    && echo "$TZ" > /etc/timezone

# 安装 zsh
RUN git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh \
    && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc 

WORKDIR /www
