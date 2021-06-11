# 前端运行环境

## 简述

- 一切公司项目，都依托的环境
- Windows 电脑环境的统一
- 这并不是一个项目，是一个环境

## 快速开始 (Mac 环境)

- 进入 `fe_docker/` 目录，运行 `./run-mac.sh`
- 进入 `fe_docker/www` 目录，拷贝项目

## 手动操作

- 复制 **.env.sample** ，然后重命名为 **.env**

|系统|命令|
|----|----|
|mac| `cp .env.sample .env`|
|windows|`copy .env.sample .env`|

- 复制 **docker-compose.sample.yml** 配置文件，然后重命名为 **docker-compose.yml**。

|系统|命令|
|----|----|
|mac| `cp docker-compose.sample.yml docker-compose.yml`|
|windows|`copy docker-compose.sample.yml docker-compose.yml`|

- 打包 node 环境 `docker-compose build node`

- 启动 node 环境 `docker-compose up -d node`

- 进入 `fe_docker/www` 目录，拷贝项目

## 功能

- nginx 配置
- openresty 配置
- node 配置
- 支持 yarn 版本配置
- 支持 node 版本配置
- 内置 zsh

## 参考

- [docker 中的 node 版本](https://hub.docker.com/_/node)
- [安装 docker](https://yeasy.gitbook.io/docker_practice/install)
