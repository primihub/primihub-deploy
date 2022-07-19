# README

### k8s部署
#### 
#### a.执行 01-initialization.sh 脚本设置环境变量，安装nfs，下载mysql数据及primihub_node配置文件
```bash
bash 01-initialization.sh
```
#### b.按顺序执行k8s资源清单文件
```bash
envsubst < 02-namespace.yaml | kubectl apply -f -
envsubst < 03-mysql.yaml | kubectl apply -f -
envsubst < 04-redis.yaml | kubectl apply -f -
envsubst < 05-nacos.yaml | kubectl apply -f -
envsubst < 06-rabbitmq.yaml | kubectl apply -f -
envsubst < 07-application.yaml | kubectl apply -f -
envsubst < 08-gateway.yaml | kubectl apply -f -
envsubst < 09-platform.yaml | kubectl apply -f -
envsubst < 10-fusion.yaml | kubectl apply -f -
envsubst < 11-primihubnode.yaml | kubectl apply -f -

```
#### c.查看部署结果
```bash
# kubectl get pod -n primihub-demo
NAME                            READY   STATUS    RESTARTS      AGE
application1-6c5cf779c-86zhb    1/1     Running   0             20h
application2-79686fcb9d-pxmb5   1/1     Running   0             20h
fusion-69d54b45fd-5v5cj         1/1     Running   4 (22h ago)   2d17h
gateway1-74ff467ff5-bngs9       1/1     Running   0             20h
gateway2-5cf6d7758-qmqgc        1/1     Running   0             20h
mysql-0                         1/1     Running   1 (22h ago)   2d20h
nacos-b5d8df958-4h9j7           1/1     Running   0             20h
platform1-7fbc875ccf-9thcw      1/1     Running   3 (22h ago)   2d17h
platform2-54b85c65df-rf7n2      1/1     Running   3 (22h ago)   2d17h
primihubnode-df5866d44-vhjbd    4/4     Running   0             22h
rabbitmq1-6746f55c9-8w84t       1/1     Running   1 (22h ago)   2d18h
rabbitmq2-6c8d9bf6cc-s9vjc      1/1     Running   1 (22h ago)   2d18h
redis-6b45bcdb46-ppnfp          1/1     Running   1 (22h ago)   2d20h
```

#### d.部署完成后访问k8s集群任一节点ip:30801/30802/30803，模拟三个机构，用户密码 admin / 123456（此端口通过platform.yaml中nodePort定义）
#### 具体的联邦建模、隐私求交、匿踪查询等功能的操作步骤请等我们完善产品说明文档