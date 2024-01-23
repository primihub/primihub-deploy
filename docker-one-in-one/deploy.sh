#/bin/bash

YOUR_HOST_IP=`hostname -I | awk '{print $1}'`
echo "请确认你的主机IP是否为：" $YOUR_HOST_IP

sed -i "s/YOUR_HOST_IP/$YOUR_HOST_IP/g" config/node0.yaml
sed -i "s/YOUR_HOST_IP/$YOUR_HOST_IP/g" config/node1.yaml
sed -i "s/YOUR_HOST_IP/$YOUR_HOST_IP/g" config/node2.yaml

if [ $? -eq 0 ];
then
    echo "修改 node 配置文件成功"
fi

sed -i "s/YOUR_HOST_IP/$YOUR_HOST_IP/g" data/initsql/nacos_config.sql

if [ $? -eq 0 ];
then
    echo "修改 nacos 配置文件成功"
fi

# 2.启动应用
docker-compose up -d