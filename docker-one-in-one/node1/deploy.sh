#/bin/bash
# primihub 一键部署脚本

#1.安装docker和docker-compose

centos(){
    # iptables -F
    # systemctl stop firewalld
    # systemctl disable firewalld
    setenforce 0
    sed -i s#SELINUX=enforcing#SELINUX=disabled#  /etc/selinux/config
    docker version
    if [ $? -eq 0 ];
    then
        echo "docker installed"
    else
        wget -O /etc/yum.repos.d/docker-ce.repo https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
        yum -y install docker-ce device-mapper-persistent-data lvm2
        systemctl daemon-reload
        systemctl start docker && systemctl enable docker
        echo "docker install succeed !"
    fi
}

ubuntu(){
    docker version
    if [ $? -eq 0 ];
    then
        echo "docker installed"
    else
        apt-get update
        apt-get -y install apt-transport-https ca-certificates curl software-properties-common
        curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
        add-apt-repository "deb [arch=amd64] https://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"
        apt-get -y update
        apt-get -y install docker-ce
        echo "docker install succeed !"
    fi
}

# grep "Ubuntu" /etc/issue >> /dev/null
# if [ $? -eq 0 ];
# then
#     ubuntu
# else
#     centos
# fi

# docker-compose version
# if [ $? -eq 0 ];
# then
#     echo "docker-compose installed"
# else
#     curl -L "https://github.com/docker/compose/releases/download/v2.6.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
#     if [ $? -eq 0 ];
#     then
#         chmod +x /usr/bin/docker-compose
#         echo "docker-compose install succeed !"
#     else
#         echo "Download docker-compose failed!"
#         exit
#     fi
# fi

# 提前拉镜像，避免启动时重复拉取
# for i in `cat .env | cut -d '=' -f 2`
# do
#     docker pull $i
# done

docker tag registry.cn-beijing.aliyuncs.com/primihub/primihub-fusion:weiyan3.0 fusion:weiyan3.0
docker tag registry.cn-beijing.aliyuncs.com/primihub/primihub-platform:weiyan3.0 platform:weiyan3.0
docker tag registry.cn-beijing.aliyuncs.com/primihub/primihub-web:weiyan3.0 web:weiyan3.0
docker tag registry.cn-beijing.aliyuncs.com/primihub/primihub-node:weiyan3.0 node:weiyan3.0
docker tag registry.cn-beijing.aliyuncs.com/primihub/nacos-server:v2.0.4 nacos-server:v2.0.4
docker tag registry.cn-beijing.aliyuncs.com/primihub/rabbitmq:3.6.15-management rabbitmq:3.6.15-management
docker tag registry.cn-beijing.aliyuncs.com/primihub/redis:7 redis:7
docker tag registry.cn-beijing.aliyuncs.com/primihub/mysql:5.7 mysql:5.7

if [ $# != 1 ] ; then
echo "请传递参数 REDIS_HOST_IP ，即第一个节点的IP地址"
exit 1;
fi

YOUR_HOST_IP=`hostname -I | awk '{print $1}'`
echo "请确认你的主机IP是否为：" $YOUR_HOST_IP
echo "-----------------------------------"
echo "请确认第一台主机IP是否为：" $1


sed -i "s/YOUR_HOST_IP/$YOUR_HOST_IP/g" config/node1.yaml

if [ $? -eq 0 ];
then
    echo "修改 node 配置文件成功"
fi

sed -i "s/REDIS_HOST_IP/$1/g" config/node1.yaml

if [ $? -eq 0 ];
then
    echo "修改 node redis 配置成功"
fi

sed -i "s/YOUR_HOST_IP/$YOUR_HOST_IP/g" data/initsql/others.sql

if [ $? -eq 0 ];
then
    echo "修改 nacos 配置文件成功"
fi

# 2.启动应用
docker-compose up -d