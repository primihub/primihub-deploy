# Primihub Deploy Script

## 使用 `docker-compose` 单机部署请参照 [这里](./docker-all-in-one/README.md)

## 使用 `docker-compose` 多机/异地部署请参照 [这里](./docker-one-in-one/README.md)
## 使用 `k8s` 部署请参照 [这里](./k8s-deploy/README.md)

### 特殊说明

* 部署的机器需要支持 `avx2`,`sse4_1` 指令集，可通过 `lscpu | grep avx2` 查看（不支持此指令集的机器无法运行 MPC 任务）

### 部署架构

![PrimiHub](./k8s-deploy/primihub.jpg)
