# README

### 执行之前
```
    0、拥有一个k8s集群，并可以连接到该集群
    1、在操作的节点安装了python3和pip3，可执行python3 --version检查
    2、执行python3 primihub_require_check.py检查脚本：
        1）会在操作节点安装pyyaml模块，安装服务时使用；
        2）检查kubectl，helm等依赖是否安装，并在未安装时尝试进行联网安装；
        3）检查环境变量NAMESPACE是否设置，未设置会以primihub作为NAMESPACE来进行后续操作
        4）读取默认的storageclass，不存在默认的storageclass时，会尝试指定目前的storageclass为默认，但存在多个时，需手动介入执行。
    3、修改images.yaml中的镜像（已指定默认镜像，可根据基线进行调整）
```

### 安装
```
    cd k8s-deploy
    <!-- kubectl create namespace "你的namespace" -->
    export NAMESPACE=<namespace>  # 未设置为会使用primihub作为namespace
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
