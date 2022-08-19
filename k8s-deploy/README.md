# README

### 部署要求

- 拥有一个k8s集群
- 拥有集群操作权限

### 安装

指定你要部署的namespace名称，执行安装脚本完成部署

```
export NAMESPACE=<namespace>
bash primihub_deploy.sh
```

注意：目前脚本中指定了platform的nodePort端口，所以同一个集群只能安装一套（多租户场景将再进行优化处理）

### 验证：

查看对应pod的状态，是否均为Running
```
# kubectl get pod -n "你的namespace"
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
```

所有服务状态均为Runing后在浏览器分别访问

http://k8s集群的任意一台机器的IP:30801

http://k8s集群的任意一台机器的IP:30802

http://k8s集群的任意一台机器的IP:30803

3 个管理后台模拟 3 个机构，默认用户密码都是 admin / 123456

管理平台具体的操作步骤请参考 [快速试用管理平台](https://docs.primihub.com/docs/quick-start-platform)

### 删除
执行以下脚本，将删除以上安装的所有服务

```
export NAMESPACE="你部署的namespace"
bash primihub_delete.sh
```

### k8s常用命令

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
