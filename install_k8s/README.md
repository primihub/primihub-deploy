# K8S 安装脚本

## 目前只考虑ubuntu系统，在线方式安装（截止0918尚未测试完，请稍后使用）

### 在运行脚本的节点上安装python, ansible
python安装参考步骤
```
    sudo apt update
    sudo apt install software-properties-common
    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt update
    sudo apt install python3.8
    sudo apt install python3-pip
```

ansible安装参考步骤
```
    sudo apt update
    sudo apt-add-repository ppa:ansible/ansible
    sudo apt install ansible sshpass

```



## 默认使用/mnt作为storageclass的路径,默认使用master节点nfs-server;
## 默认使用/data/docker作为docker的工作目录
