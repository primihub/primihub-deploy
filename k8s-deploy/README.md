# README

### 执行之前
```
    0、拥有一个k8s集群
    1、本地安装kubectl，并确认拥有操作集群对应namespace的权限，测试方式：kubectl get all -n <namespace>
    2、本地已安装helm，版本3.1以上(mac上可以使用brew install helm命令进行安装或通过https://github.com/helm/helm/releases下载对应版本)
    3、集群管理员需确认集群存在默认的storageclass（执行kubectl get sc 获取的结果中，结果中含有'（default）'配置）
    4、本地安装Python3，且安装requirements里的所需模块
    5、修改images.yaml中的镜像（已指定默认镜像）
```

### 安装
```
    cd k8s-deploy
    export NAMESPACE=<namespace>
    ./primihub_deploy.sh （或执行python3 deploy.py）
    已经将所需服务进行了封装，执行上述命令将安装storage（mysql、redis）、nacos、rabbitmq、application、gateway、platform、fusion、primihubnode这些服务
    注意：目前脚本中指定了platform的nodeport端口，所以一个集群只能安装一套（多租户场景将再进行优化处理）
```

### 调试：
```
    1、查看对应pod的状态，是否均为running：
        NAME                            READY   STATUS    RESTARTS   AGE
        application1-5b4c6b457d-25mfk   1/1     Running   0          47h
        application2-68446f7887-wjdxp   1/1     Running   0          47h
        application3-685d7fc7c6-kbnwm   1/1     Running   0          47h
        fusion-6d6c4d8b9-4q999          1/1     Running   0          2d
        gateway1-6979f6f9c6-jr4jb       1/1     Running   0          46h
        gateway2-8d954d4d7-kjhr8        1/1     Running   0          46h
        gateway3-5d978768bb-wh7v2       1/1     Running   0          46h
        mysql-0                         1/1     Running   0          2d
        nacos-7b8f776d46-wdg6j          1/1     Running   0          47h
        platform1-5d98695485-98rct      1/1     Running   0          2d
        platform2-59b666ffbb-n4b86      1/1     Running   0          2d
        platform3-74b9dbcd7f-sqrgp      1/1     Running   0          2d
        primihubnode-59fbbb554d-grwzb   4/4     Running   0          31h
        rabbitmq1-55f5b55bb9-c9pqz      1/1     Running   0          2d
        rabbitmq2-5c9fbbb575-vsktm      1/1     Running   0          2d
        rabbitmq3-5cd59678cc-jx59r      1/1     Running   0          2d
        redis-595ff4c87b-ph6n6          1/1     Running   0          2d

    2、进入mysql对应的pod，并执行mysql -uroot -p<password>查看相关的数据库是否已经存在；

    3、查看pod对应的日志;

    4、进入primihubnode的node1容器，测试任务的执行，并查看其他node的日志，node1提交任务成功，且其他node没有报错信息，即为部署成功
    
    5、测试任务详见：
        1).MPC任务：https://docs.primihub.com/docs/advance-usage/create-tasks/mpc-task/
        2).联邦学习任务：https://docs.primihub.com/docs/advance-usage/create-tasks/FL-task
        3).PSI任务：https://docs.primihub.com/docs/advance-usage/create-tasks/psi-task
        4).PIR任务：https://docs.primihub.com/docs/advance-usage/create-tasks/pir-task
        
```


### 删除
```
    执行./primihub_delete.sh，将删除以上安装的所有服务，并删除mysql对应的存储
```

### 常用命令

```
    kubectl get pod -n <namespace> 获取对应的pod信息
    kubectl get svc -n <namespace> 获取对应的svc信息
    kubectl get cm -n <namespace> 获取对应的configmap
    kubectl get pvc -n <namespace> 获取对应的pvc
    kubectl logs -n <namespace> <pod-name> -f --tail=100 查看对应pod-name的日志
    kubectl exec -it -n <namespace> <pod-name> bash 进入到对应容器中
    helm install <helm-name> -n <namespace>  charts/<chartname>chart  使用helm安装对应chart中的服务
    helm uninstall <helm-name> -n <namespace>  卸载使用helm安装的服务
```
