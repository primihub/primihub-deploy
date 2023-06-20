#!/bin/bash
# primihub deploy script

# First, install docker and docker-compose

if [ $(uname -s) == "Linux" ];
then
    which docker > /dev/null
    if [ $? -eq 0 ];
    then
        echo "docker installed"
    else
        curl -s https://primihub.oss-cn-beijing.aliyuncs.com/dev/docker20.10.tar.gz | tar zxf -
        cd docker20.10
        bash install_docker.sh
        echo "docker install succeed !"
    fi
elif [ $(uname -s) == "Darwin" ]; then
  which docker-compose > /dev/null
  if [ $? != 0 ];
  then
    echo "Cannot find docker compose, please install it first."
    echo "Read the official document from https://docs.docker.com/compose/install/"
    exit 1
  fi
else
  echo "not support yet"
  exit 1
fi

docker-compose version
if [ $? -eq 0 ];
then
    echo "docker-compose installed"
else
    # curl -L "https://github.com/docker/compose/releases/download/v2.6.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
    curl -L https://primihub.oss-cn-beijing.aliyuncs.com/dev/docker-compose-linux-x86_64 -o /usr/bin/docker-compose
    if [ $? -eq 0 ];
    then
        chmod +x /usr/bin/docker-compose
        echo "docker-compose install succeed !"
    else
        echo "Download docker-compose failed!"
        exit
    fi
fi

# Pull all the necessary images to avoid pulling multiple times
for i in `cat .env | cut -d '=' -f 2`
do
    docker pull $i
done

# 替换 `nacos` 配置中的 `Loki` 地址

LOKI_IP=`hostname -I | awk '{print $1}'`
echo "请确认你的主机IP是否为：" $LOKI_IP

sed -i "s/YOUR_HOST_IP/$LOKI_IP/g" data/initsql/others.sql

if [ $? -eq 0 ];
then
    echo "修改 nacos 配置文件中的 LOKI_IP 成功"
fi

# Finally, start the application
docker-compose up -d
