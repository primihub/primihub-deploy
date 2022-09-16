#!/bin/bash

[ -z "$NAMESPACE" ] && echo "NAMESPACE is not set, Use default ns: primihub" && export NAMESPACE=primihub

echo "check python3 version"

python3 --version
if [[ $? -ne 0 ]]; then
    echo "请手动安装python3"
    exit 1
fi

pip3 install -r requirements.txt
echo $?


echo "kubectl checking"
kubectl version
if [[ $? -ne 0 ]]; then
    echo "try to install kubectl: "
    # curl -LO "https://dl.k8s.io/release/v1.24.0/bin/darwin/arm64/kubectl"  # 先只考虑mac
    curl -LO "https://dl.k8s.io/release/v1.24.0/bin/linux/amd64/kubectl"
    if [[ $? -ne 0 ]]; then
        echo "下载kubectl失败, 请自行安装"
        exit 1
    fi
    echo "正在安装kubectl, 可能需要您输入密码"
    sleep 2
    chmod +x ./kubectl && sudo cp ./kubectl /usr/local/bin/kubectl
    if [[ $? -ne 0 ]]; then
        echo "安装kubectl失败, 请自行安装后重试"
        exit 1
    elif [[ $? -eq 0 ]]; then
        echo "安装kubectl成功"
    fi
fi


echo "helm checking"
helm version
if [[ $? -ne 0 ]];then
    # curl -LO "https://get.helm.sh/helm-v3.9.1-darwin-arm64.tar.gz"
    curl -LO "https://get.helm.sh/helm-v3.9.1-linux-amd64.tar.gz
    if [[ $? -ne 0 ]]; then
        echo "下载helm失败, 请自行安装"
        exit 1
    else
        echo "正在安装helm, 可能需要您输入密码"
        # tar -zxvf helm-v3.9.1-darwin-arm64.tar.gz && sudo cp darwin-arm64/helm /usr/local/bin/helm
        tar -zxvf helm-v3.9.1-linux-amd64.tar.gz && sudo cp linux-amd64/helm /usr/local/bin/helm
        if [[ $? -eq 0 ]]; then
            helm version
            echo "helm已安装"
        else
            echo "安装helm失败, 请手动安装"
            exit 1
        fi
    fi
fi

sleep 2

# 判断ns是否存在, 不存在尝试创建，创建失败退出
echo "ns checking"
kubectl get ns $NAMESPACE -o name
if [[ $? -ne 0 ]]; then
    echo "try to create namespace:" $NAMESPACE
    kubectl create ns $NAMESPACE
    if [[ $? -ne 0 ]]; then
        echo "创建namespace失败, 请确认是否拥有集群操作权限"
        exit 1
    fi
fi

sleep 2

echo "check sc"

cmd=$(kubectl get sc -o name|grep default|wc -l)

if [[ $cmd -eq 0 ]]; then
    # 获取sc
    sc_count=$(kubectl get sc -o name|wc -l)
    echo "现有storageclass数量为: " $sc_count
    if [[ $sc_count -eq 1 ]]; then
        echo "现在将目前的storageclass设置为默认"
        sc_name=$(kubectl get sc -o name|awk -F / '{print $2}')
        echo "the name of sc is: " $sc_name
        kubectl patch storageclass $sc_name -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
        if [[ $? -eq 0 ]]; then
            echo "set sc done!!!!!!!"
        else
            echo "设置默认storageclass失败, 请手动重试"
            exit 1
        fi
    elif [[ $sc_count -gt 1 ]]; then
        echo "现有storageclass过多, 请手动设置默认的storageclass"
        exit 1
    else
        echo "请尝试手动配置storageclass"
    fi


fi


echo "检查结束"

