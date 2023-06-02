# 部署说明

## 前提说明
该部署脚本提供在3台机器上单独部署每一个节点，3台机器需要有内网IP，可以访问公网

## 部署步骤

1. 安装docker和docker-compose（在3台机器上都执行）

```shell

# 下载docker和docker-compose安装包
wget https://primihub.oss-cn-beijing.aliyuncs.com/dev/docker20.10.tar.gz

# 解压
tar zxf docker20.10.tar.gz

# 安装
cd docker20.10
bash install_docker.sh

# 验证
docker version
docker-compose version

# 有如下输出则安装正常
# docker version
Client:
 Version:           20.10.10
···
# docker-compose version
Docker Compose version v2.6.0
```

<!-- 2. 加载docker镜像 （在三台机器上都执行）

```shell
# 下载镜像包
wget https://primihub.oss-cn-beijing.aliyuncs.com/dev/

# 解压
tar zxf docker-images.tar.gz

# 加载镜像
cd docker-images
for i in ./*.tar.gz ; do docker load -i $i; done

# 验证 
docker images 
``` -->

2. 部署平台 
```shell
# 下载安装包 （在三台机器上都执行）
wget https://primihub.oss-cn-beijing.aliyuncs.com/dev/docker-one-in-one-latest.tar.gz

# 解压 
tar xf docker-one-in-one-latest.tar.gz

在第一台机器上，执行
cd docker-one-in-one
bash deploy.sh

在第二台机器上，执行
cd docker-one-in-one
sed -i "s/node0/node1/g" docker-compose.yaml
bash deploy.sh

在第三台机器上，执行
cd docker-one-in-one
sed -i "s/node0/node2/g" docker-compose.yaml
bash deploy.sh
```

### 查看部署结果
```
docker-compose ps -a
```

3. 安装loki插件（可选，如果需要开启在页面上显示日志的功能则安装）(3台机器上都需要执行)
使用 `Loki` 来收集容器日志时，需要先安装 `loki` 的 `docker plugin`

```shell
docker plugin install grafana/loki-docker-driver:latest --alias loki --grant-all-permissions
```

配置收集所有docker容器的日志
```shell
# vim /etc/docker/daemon.json  添加以下内容
{
  "log-driver": "loki",
  "log-opts": {
    "loki-url": "http://127.0.0.1:3100/loki/api/v1/push",
    "max-size": "50m",
    "max-file": "10"
  }
}
```

配置好之后重启docker服务
```
systemctl restart docker
```


### 访问页面

3台机器都启动完成后，在浏览器分别访问

http://第一台机器的IP:30080

http://第二台机器的IP:30080

http://第三台机器的IP:30080

默认用户密码都是 admin / 123456

第一次登录后需要新建机构和加入群组，具体操作步骤请看 新建机构和设置中心节点说明文档。


### 停止服务

在3台机器上都执行
```shell
docker-compose down
```