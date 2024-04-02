# 部署说明

## docker-compose多机/异地部署
### 部署要求

* 机器配置最低8核16G，磁盘40G，支持`avx`指令集，可通过`lscpu | grep avx`验证
* 系统支持`CentOS 7`和`Ubuntu 18.04+` (推荐使用`Ubuntu`)
* `docker-compose` 版本大于2.2
* 3台机器需要网络互通或开放`9099，30080，50050`端口让另外两个节点可访问

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
docker -v
docker-compose version
```

2. 部署平台 
```shell
# 下载代码 （在三台机器上都执行）
git clone https://github.com/primihub/primihub-deploy.git
cd primihub-deploy

# 在第一台机器上，执行
cd docker-one-in-one
bash deploy.sh

# 在第二台机器上，执行
cd docker-one-in-one
sed -i "s/node0/node1/g" docker-compose.yaml
bash deploy.sh

# 在第三台机器上，执行
cd docker-one-in-one
sed -i "s/node0/node2/g" docker-compose.yaml
bash deploy.sh
```

### 查看部署结果
```
# docker-compose ps -a
NAME                COMMAND                  SERVICE             STATUS              PORTS
application         "/bin/sh -c 'java -j…"   application         running (healthy)   
gateway             "/bin/sh -c 'java -j…"   gateway             running             
loki                "/usr/bin/loki -conf…"   loki                running             0.0.0.0:3100->3100/tcp, :::3100->3100/tcp
manage-web          "/docker-entrypoint.…"   nginx               running             0.0.0.0:30080->80/tcp, :::30080->80/tcp
meta                "/bin/sh -c 'java -j…"   meta                running (healthy)   0.0.0.0:9099->9099/tcp, :::9099->9099/tcp
mysql               "docker-entrypoint.s…"   mysql               running (healthy)   33060/tcp
nacos-server        "bin/docker-startup.…"   nacos               running (healthy)   0.0.0.0:8848->8848/tcp, :::8848->8848/tcp
node                "/bin/bash -c './pri…"   node                running             0.0.0.0:50050->50050/tcp, :::50050->50050/tcp
rabbitmq            "docker-entrypoint.s…"   rabbitmq            running             25672/tcp
redis               "docker-entrypoint.s…"   redis               running             6379/tcp
```

3. 安装loki插件（可选）(3台机器上都执行)
如需开启在页面上显示日志的功能，则需要先安装 `loki` 的 `docker plugin`

```shell
docker plugin install grafana/loki-docker-driver:latest --alias loki --grant-all-permissions
```

配置收集所有docker容器的日志
```shell
# vim /etc/docker/daemon.json  添加以下内容，注意此行不要插入
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

第一次登录后需要在节点管理里配置节点信息，具体操作步骤请看 [操作手册](https://m74hgjmt55.feishu.cn/file/boxcnXqmyAG9VpqjaCb7RP7Isjg)


### 停止服务

在3台机器上都执行
```shell
docker-compose down
```