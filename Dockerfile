FROM node:16.13.1-alpine3.13 as builder
LABEL Mr.Li <13810902078>
WORKDIR /
RUN apk add curl git zsh openssh gcc g++ autoconf make automake libtool libpng libpng-dev zlib vim nasm
RUN curl -f https://get.pnpm.io/v6.16.js | node - add --global pnpm
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
COPY /ssh ./root/.ssh
