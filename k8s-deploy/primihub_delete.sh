#!/bin/bash
# export NAMESPACE=wangyongwang

[ -z "$NAMESPACE" ] && echo "NAMESPACE is not set" && exit

helm uninstall primihub -n ${NAMESPACE} 

helm uninstall fusion -n ${NAMESPACE} 

helm uninstall platform -n ${NAMESPACE} 

helm uninstall gateway -n ${NAMESPACE} 

helm uninstall application -n ${NAMESPACE} 

helm uninstall rabbitmq -n ${NAMESPACE} 

helm uninstall nacos -n ${NAMESPACE} 

helm uninstall storage -n ${NAMESPACE} 


kubectl delete pvc -n ${NAMESPACE} mysql-pvc-mysql-0













