# 前端运行环境

- [安装 docker](https://yeasy.gitbook.io/docker_practice/install)
- 进入 `fe_docker/www` 目录，拷贝项目
- 回到 `fe_docker` 目录
- 复制环境变量文件

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
- 进入容器安装 php 依赖
  - `docker exec -it php bash`
  - `cd be-api`
  - `yarn install`
  - `npm start`
