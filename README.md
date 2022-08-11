# 前端 docker 开发环境
本分支主要是前端人本地开发所用

## 如何使用

- 下载安装 [docker](https://www.docker.com/get-started)
- 把 dockerfile 中的 git 信息改下
- 把本机生成的多个 ssh 拷贝到 `./ssh` 文件夹中
- clone 本仓库到本地 的 www 目录
- 运行 `./build.sh`
- 允许 `./go.sh`

## VSCODE 开发

- 下载 [remote-containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) 插件
- 按着插件的说明使用即可

## 命令

- 构建容器 `./build.sh`
- 启动容器 `./go.sh`
- 进入容器 `./exec.sh`
