FROM node:16.13.1-alpine3.13 as builder
LABEL Mr.Li <13810902078>
WORKDIR /
RUN apk add curl git zsh openssh gcc g++ autoconf make automake libtool libpng libpng-dev zlib vim nasm tig
RUN curl -f https://get.pnpm.io/v6.16.js | node - add --global pnpm
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
COPY /ssh ./root/.ssh

# 安装 cz-cli 可用 git cz 提交 git
RUN npm config set registry https://registry.npmmirror.com
# TODO 用 pnpm 报错只能 npm 将就一下，有时间解决
# 4.2.5 以上 scope 不能定义了
RUN npm add -g commitizen@4.2.4
# 全局安装 node server
RUN npm add -g http-server

# 配置 git 用户名
RUN git config --global user.email "649076408@qq.com"
RUN git config --global user.name "李梦龙"
