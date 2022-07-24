#!/bin/bash
USERNAME=$1
if [ -z "$USERNAME" ]; then
    echo "USERNAME is not empty"
    exit 0
fi

if [ "root" == "$USERNAME" ]; then
    echo "USERNAME can't is root"
    exit 0
fi

HOST_IP=$2
HOST_PORT=$3

SERVER_PATH=https://${HOST_IP}:${HOST_PORT}
DAYS=730
USER_HOME_DIR=./${USERNAME}/.kube
USER_KEY_PATH=${USER_HOME_DIR}/${USERNAME}.key
USER_CSR_PATH=${USER_HOME_DIR}/${USERNAME}.csr
USER_CRT_PATH=${USER_HOME_DIR}/${USERNAME}.crt
USER_CONFIG_PATH=${USER_HOME_DIR}/config
K8S_CA_KEY_PATH=/data/k8sca/ca.key  # cp /etc/kubernetes/pki/* /data/k8sca
K8S_CA_CRT_PATH=/data/k8sca/ca.crt
K8S_CA_SRL_DIR=/data/k8sca

mkdir -p ${USER_HOME_DIR}
openssl genrsa -out ${USER_KEY_PATH} 2048

export CA_DNAME="/CN=${USERNAME}/OU=System/O=kubernetes/L=Beijing/ST=Beijing/C=CN"

openssl req -new -key ${USER_KEY_PATH} -subj $CA_DNAME -out ${USER_CSR_PATH}

openssl x509 -req -in ${USER_CSR_PATH} -CA ${K8S_CA_CRT_PATH} -CAkey ${K8S_CA_KEY_PATH} -CAcreateserial -out ${USER_CRT_PATH} -days ${DAYS}

mv ${K8S_CA_SRL_DIR}/ca.srl ${K8S_CA_SRL_DIR}/${USERNAME}.srl

kubectl config set-cluster kubernetes --certificate-authority=${K8S_CA_CRT_PATH} --embed-certs=true --server=${SERVER_PATH} --kubeconfig=${USER_CONFIG_PATH}

kubectl config set-credentials ${USERNAME} --client-certificate=${USER_CRT_PATH} --client-key=${USER_KEY_PATH} --embed-certs=true --kubeconfig=${USER_CONFIG_PATH}

kubectl config set-context ${USERNAME}@kubernetes --cluster=kubernetes --user=${USERNAME} --kubeconfig=${USER_CONFIG_PATH}

kubectl config use-context ${USERNAME}@kubernetes --kubeconfig=${USER_CONFIG_PATH}

kubectl create namespace ${USERNAME}

kubectl create rolebinding ${USERNAME}-clusterrole-binding --clusterrole=cluster-admin --user=${USERNAME} --namespace=${USERNAME}


echo "copy ./${USERNAME}/.kube/config in your local machine, for example: ~/.kube/config"
