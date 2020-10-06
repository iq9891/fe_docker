# 前端运行环境

## 快速开始 (Mac 环境)

- 进入 `fe_docker/` 目录，运行 `./run-mac.sh`
- 进入 `fe_docker/www` 目录，拷贝项目

## 手动操作

- 重命名 **.env.sample** 为 **.env**

|系统|命令|
|----|----|
|mac| `cp .env.sample .env`|
|windows|`copy .env.sample .env`|

- 复制 docker-compose 配置文件。

|系统|命令|
|----|----|
|mac| `cp docker-compose.sample.yml docker-compose.yml`|
|windows|`copy docker-compose.sample.yml docker-compose.yml`|

- 启动 `docker-compose up -d`

- 进入 `fe_docker/www` 目录，拷贝项目

## 功能

- nginx 配置
- openresty 配置
- node 配置
- 支持 yarn 版本配置
- 支持 node 版本配置

## 参考

- [docker 中的 node 版本](https://hub.docker.com/_/node)
- [安装 docker](https://yeasy.gitbook.io/docker_practice/install)
