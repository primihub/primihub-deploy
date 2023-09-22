#!/bin/bash

filename=".env"

while IFS= read -r line
do
  image=$(echo "$line" | awk -F '=' '{print $2}')
  tag=$(echo "$image" | awk -F ':' '{print $2}')
  name=$(echo "$image" | awk -F '/' '{print $NF}' | awk -F ':' '{print $1}')
  package_name="${name}-${tag}.tar.gz"
  
  echo "导出镜像：$image"
  docker save "$image" -o "$package_name"
  echo "导出完成：$package_name"
done < "$filename"

echo "########################################"
echo "将导出的镜像复制到离线的机器上后，执行：for i in ./*.tar.gz;do docker load -i \$i;done 导入镜像"