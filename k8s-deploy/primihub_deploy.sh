# export NAMESPACE=wangyongwang

[ -z "$NAMESPACE" ] && echo "NAMESPACE is not set" && exit

helm install storage -n ${NAMESPACE} charts/storagechart 

echo " storgae installed\n\n"

helm install nacos -n ${NAMESPACE} charts/nacoschart 

echo " nacos installed\n\n"

helm install rabbitmq -n ${NAMESPACE} charts/mqchart 

echo " rabbitmq installed\n\n"

helm install application -n ${NAMESPACE} charts/applicationchart 

echo " application installed\n\n"

helm install gateway -n ${NAMESPACE} charts/gatewaychart

echo " gateway installed\n\n"

helm install platform -n ${NAMESPACE} charts/platformchart 

echo " platform installed\n\n"

helm install fusion -n ${NAMESPACE} charts/fusionchart 

echo " fusion installed\n\n"

helm install primihub -n ${NAMESPACE} charts/primihubchart 

echo " primihub installed"
