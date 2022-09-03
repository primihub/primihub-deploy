#!/bin/bash

if [[ $# == 0 ]] ;then

    bash primihub_require_check.sh
    ./deploy.py


elif [[  $# == 1 ]] && [[  $1 == 'loki' ]]; then
    echo "installing loki"
    helm upgrade loki  -n $NAMESPACE charts/lokichart --install
elif [[  $# == 2 ]] && [[  $1 == 'loki' ]] && [[  $2 == "delete" ]]; then
    helm uninstall loki -n $NAMESPACE
fi