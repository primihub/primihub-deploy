#/bin/bash
sed -ri 's/([0-9]{1,3}\.){3}[0-9]{1,3}/'${POD_IP}'/g' /data/primihub_node0.yaml
sed -ri 's/([0-9]{1,3}\.){3}[0-9]{1,3}/'${POD_IP}'/g' /data/primihub_node1.yaml
sed -ri 's/([0-9]{1,3}\.){3}[0-9]{1,3}/'${POD_IP}'/g' /data/primihub_node2.yaml
