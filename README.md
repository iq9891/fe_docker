# 前端运行环境

## 简述

- 一切公司项目，都依托的环境
- Windows 电脑环境的统一
- 这并不是一个项目，是一个环境

## 功能

- nginx 配置
- openresty 配置
- node 配置
- 支持 yarn 版本配置
- 支持 node 版本配置

## 目录结构

```
├── services                    服务构建文件和配置文件目录
│   ├── nginx                   1.19.1-alpine 配置目录(可自己任意更改需要的版本号 .env中)
│   └── node                    15.7.0-alpine 配置目录（也可切换版本 .env中）
├── logs                        日志目录
│   ├── nginx                   nginx 日志（如错误日志，慢日志等）
├── docker-compose.sample.yml   docker 服务配置示例文件
├── env.smaple                  环境配置示例文件
└── www                         具体代码代码目录（前端）
```

## 快速开始 (Mac 环境)

- 进入 `fe_docker/` 目录，运行 `./run-mac.sh`
- 进入 `fe_docker/www` 目录，拷贝项目

## 手动操作

- 复制 **.env.sample** ，然后重命名为 **.env**

|系统|命令|
|----|----|
|mac| `cp .env.sample .env`|
|windows|`copy .env.sample .env`|

- 复制 **docker-compose.sample.yml** 配置文件，然后重命名为 **docker-compose.yml** 。

|系统|命令|
|----|----|
|mac| `cp docker-compose.sample.yml docker-compose.yml`|
|windows|`copy docker-compose.sample.yml docker-compose.yml`|

- 打包 node 环境 `docker-compose build node`

- 启动 node 环境 `docker-compose up -d node`

- 进入 `fe_docker/www` 目录，拷贝项目

**特别注意**

Windows 安装完 docker 需要做一下操作

① 开启 Hyper-v 虚拟化服务
```
控制面板->程序->启用或关闭 Windows 功能
在 Hyper-v 选项前打上勾然后重启电脑
```
② docker desktop 关闭 WSL 2 虚拟化服务
```
右键docker desktop图标 打开 setting -> General
把 use the WSL 2 based engine 前边的勾去掉 重启 docker desktop
```
③ Windows 需要映射目录，否则创建容器时会报找不到映射目录
```
最好的方式是把 fe_docker 这个目录直接映射给 docker
操作方法
右键docker desktop -> settings -> resourse -> file sharing
如 fe_docker 的目录在 c:\User\admin\fe_docker
则把这个目录加到 file sharing 中去 然后应用就OK了
```

 **注意： Windows 一定要在做以上三个步骤之后再去构建镜像和启动容器，否则会报错**

## 端口的修改

在实际开发中，不同项目需要用到不同的端口

```
# docker-compose.yml 配置文件中 ports 处
ports:
    - "9800:9800"
    - "9805:9805"
```
规则 - "宿主机端口:容器端口"

上列配置代表容器的 9800 和 9805 端口映射到宿主机(简单理解为自己电脑) 9800 和 9805 端口 http://localhost:9800 即可访问服务

## 参考

- [docker 中的 node 版本](https://hub.docker.com/_/node)
- [安装 docker](https://yeasy.gitbook.io/docker_practice/install)
- [docker-compose.yml配置官方文档](https://docs.docker.com/compose/compose-file/compose-file-v3/)
