# K8S 一键安装脚本

### 在运行脚本的节点上（一般将来的为master节点）安装python, ansible
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
    sudo apt install ansible=2.9* sshpass
    sudo vi /etc/ansible/ansible.cfg  手动将host_key_checking=False的注释去掉
```

### 执行步骤
```
执行安装命令:
ansible-playbook -i hosts.ini install_k8s.yaml -e "@online_vars.yaml" -k -K
按照提示输入密码

单独执行安装loki模块:
ansible-playbook -i hosts.ini install_k8s.yaml -e "@online_vars.yaml" -k -K -t loki


```


## 参数
* online_vars.yaml中进行参数配置
  
* mode 安装模式，目前仅支持在线安装
  
* harbor_registry 指定安装的集群使用的私有镜像仓库（后续扩展用）
  
* harbor_hostname 添加镜像仓库的hosts（后续使用）

## 注意
* 目前只考虑ubuntu系统，在线方式安装
  
* 默认使用/mnt作为storageclass的路径,默认使用master节点作为nfs server
  
* 默认使用/data/docker作为docker的工作目录

