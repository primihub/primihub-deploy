#/bin/bash
#
# 注意，此文件不要重复执行！！！
#
# nfs服务器IP地址，可自定义，默认取执行该脚本的机器IP，如自定义需要同步修改下面的NFS共享IP段变量 IP_NFS_SERVER，格式如 “192.168.1.0/24”
echo "export NFS_IP=`hostname -I | awk '{print $1}'`" >> /etc/profile.d/primihub_k8s_deploy.sh

# nfs共享目录，可自定义，该目录对应磁盘需要至少50G空间
echo "export NFS_PATH=/data/nfs-share" >> /etc/profile.d/primihub_k8s_deploy.sh

# NFS 共享同网段设置
IP1=`hostname -I | awk '{print $1}' | awk -F "." '{print $1}'`
IP2=`hostname -I | awk '{print $1}' | awk -F "." '{print $2}'`
IP3=`hostname -I | awk '{print $1}' | awk -F "." '{print $3}'`

echo "export IP_NFS_SERVER=$IP1"."$IP2"."$IP3".0/24"" >> /etc/profile.d/primihub_k8s_deploy.sh

# 创建的存储卷名，可自定义
#echo "export PV_NAME=nfs-storage" >> /etc/profile.d/primihub_k8s_deploy.sh

# k8s 名称空间
echo "export NAMESPACE=primihub-demo" >> /etc/profile.d/primihub_k8s_deploy.sh

# 镜像版本
VERSION=1.1

# 镜像地址
echo "export PRIVACY_IMAGE=primihub/primihub-platform:$VERSION" >> /etc/profile.d/primihub_k8s_deploy.sh
echo "export PLATFORM_IMAGE=primihub/primihub-web:$VERSION" >> /etc/profile.d/primihub_k8s_deploy.sh
echo "export PRIMIHUBNODE_IMAGE=primihub/primihub-node:1.1.0" >> /etc/profile.d/primihub_k8s_deploy.sh
echo "export FUSION_IMAGE=primihub/primihub-fusion:$VERSION" >> /etc/profile.d/primihub_k8s_deploy.sh


# 数据库用户密码
echo "export MYSQL_ROOT_PASSWORD=primihub@123" >> /etc/profile.d/primihub_k8s_deploy.sh
echo "export MYSQL_USER=primihub" >> /etc/profile.d/primihub_k8s_deploy.sh
echo "export MYSQL_PASS=primihub@123" >> /etc/profile.d/primihub_k8s_deploy.sh

# nginx 配置
echo "export uri='\$uri'" >> /etc/profile.d/primihub_k8s_deploy.sh

source /etc/profile.d/primihub_k8s_deploy.sh

echo "source path done"

#数据初始化目前通过手动执行
#安装nfs

centos(){
    #selinux
    selinux_str=`getenforce`
    if [ "$selinux_str" == Enforcing ];
    then 
        setenforce 0
        sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
    else
        echo "selinux is disabled"
    fi

    nfs=`rpm -qa |grep nfs-utils|wc -l`
    if [ $nfs -gt 0 ]
    then
        echo "nfs installd"
    else
        yum -y insatll nfs-utils
    fi
}

ubuntu(){
    apt update
    apt install nfs-server -y
    if [ $? -eq 0 ];
    then
        echo "nfs install succeed"
    else
        echo "nfs install failed"
    fi
}

grep "Ubuntu" /etc/issue >> /dev/null
if [ $? -eq 0 ];
then
    ubuntu
else
    centos
fi


# 配置NFS共享目录
if [ ! -d "$NFS_PATH" ]; then
  mkdir -p $NFS_PATH
  # mkdir -p $NFS_PATH/mysql
  mkdir -p $NFS_PATH/application
fi

# 下载mysql数据
wget https://primihub.oss-cn-beijing.aliyuncs.com/demo/mysql_data_620.tar.gz
tar xf mysql_data_615.tar.gz -C $NFS_PATH

# 下载配置文件
# wget -O $NFS_PATH/application/primihub_node0.yaml https://raw.githubusercontent.com/primihub/primihub/master/config/primihub_node0.yaml
# wget -O $NFS_PATH/application/primihub_node1.yaml https://raw.githubusercontent.com/primihub/primihub/master/config/primihub_node1.yaml
# wget -O $NFS_PATH/application/primihub_node2.yaml https://raw.githubusercontent.com/primihub/primihub/master/config/primihub_node2.yaml
cp ./config/* $NFS_PATH/application/

# wget update_pod_ip.sh
# wget -O $NFS_PATH/application/update_pod_ip.sh https://primihub.oss-cn-beijing.aliyuncs.com/demo/update_pod_ip.sh


echo "$NFS_PATH $IP_NFS_SERVER(rw,no_root_squash,async)" >> /etc/exports

#kubectl get svc -n primihub | grep bootstrap-node | awk '{print $3}'

systemctl start nfs
systemctl enable nfs
exportfs -rf
echo "nfs配置完成"