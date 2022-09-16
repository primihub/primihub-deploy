#!/usr/bin/env python3

import platform
import sys
import os
from tabnanny import check

system = platform.system()
machine = platform.machine()

print(system)
print(machine)

helm_dl_dict = {
                 "Darwin":  
                            {
                                "x86_64": "https://get.helm.sh/helm-v3.9.3-darwin-amd64.tar.gz", 
                                "arm64": "https://get.helm.sh/helm-v3.9.1-darwin-arm64.tar.gz"
                            },

                 "Linux":   
                            {
                                "x86_64": "https://get.helm.sh/helm-v3.9.3-linux-amd64.tar.gz", 
                                "arm64": "https://get.helm.sh/helm-v3.9.3-linux-arm64.tar.gz"
                            }
                }

kubectl_dl_dict = {
                    "Darwin": 
                            {
                                "x86_64": "https://dl.k8s.io/release/v1.24.0/bin/darwin/amd64/kubectl", 
                                "arm64": "https://dl.k8s.io/release/v1.24.0/bin/darwin/arm64/kubectl"
                            }, 
                    "Linux": 
                            {
                                "x86_64": "https://dl.k8s.io/release/v1.24.0/bin/linux/amd64/kubectl", 
                                "arm64": "https://dl.k8s.io/release/v1.24.0/bin/linux/arm64/kubectl"
                            }
                }


def check_install_kubectl():
    res = os.system("kubectl version")
    if res == 0:
        print("已安装kubectl")
        return

    dl_url = kubectl_dl_dict.get(system, {}).get(machine)
    print(dl_url)
    if not dl_url:
        print("无对应kubectl下载地址, 请手动下载安装！")
        return
    
    dl_cmd= "curl -LO %s " % dl_url
    res = os.system(dl_cmd)
    if res != 0:
        print("下载kubectl失败, 请手动安装或重试")
        return 
    else:
        print("正在安装kubectl, 可能需要您输入密码")
        kubectl_cmd = "chmod +x ./kubectl && sudo cp ./kubectl /usr/local/bin/kubectl"
        res = os.system(kubectl_cmd)
        if res != 0:
            print("安装kubectl失败, 请自行安装后重试")
            return 
        print("安装kubectl成功! ")

    

def check_install_helm():
    res = os.system("helm version")
    if res == 0:
        print("已安装helm")
        return

    dl_url = helm_dl_dict.get(system, {}).get(machine)
    print(dl_url)
    if not dl_url:
        print("无对应helm下载地址, 请手动下载！")
        return
    
    dl_cmd= "curl -LO %s " % dl_url
    res = os.system(dl_cmd)
    if res != 0:
        print("下载helm失败, 请手动安装或重试")
        return
    else:
        helm_file_name = dl_url.split("/")[-1]
        print(helm_file_name)
        print("正在安装helm, 可能需要您输入密码")
        helm_cmd = "tar -zxvf %s && sudo cp %s-%s/helm /usr/local/bin/helm" % (helm_file_name, system.lower(), machine if machine == "arm64" else "amd64")
        res = os.system(helm_cmd)
        if res != 0:
            print("安装helm失败, 请自行安装后重试")
            return 
        print("安装helm成功! ")
    


def check_ct_namespace():
    print("检查namespace")
    env_ns = os.getenv("NAMESPACE")
    if not env_ns:
        env_ns = "primihub"
    
    check = "kubectl get ns %s -o name" % env_ns

    res = os.system(check)
    if res == 0:
        print("already has %s namespace" % env_ns)
        return

    print("namespace: %s 不存在, 尝试创建！")
    create_ns = "kubectl create ns %s" % env_ns
    res = os.system(create_ns)
    if res == 0:
        print("创建namespace: %s成功! " % env_ns)
    else:
        print("尝试创建namespace: %s  失败，请手动创建" % env_ns)

def check_set_sc():
    print("检查storageclass")
    check_cmd = "kubectl get sc -o name|grep default|wc -l"
    default_sc_count = os.popen(check_cmd).read().strip()
    print(default_sc_count)
    try:
        default_sc_count = int(default_sc_count)
    except Exception as error:
        print(error)
        print("请手动尝试设置storageclass")
        return 
    
    if default_sc_count == 1:
        print("storageclass 符合要求！")
        return

    if default_sc_count == 0: # 
        sc_num_cmd = "kubectl get sc -o name|wc -l"
        sc_num = os.popen(sc_num_cmd).read().strip()
        try:
            sc_num = int(sc_num)
        except Exception as error:
            print(error)
            print("查询不到storageclass, 请手动重试")
            return
        print("Now sc count: %s" % sc_num)
        if sc_num > 1:
            print("现存storageclass数量过多, 请手动选择设置默认storageclass")
            return 
        elif sc_num == 1:
            sc_name_cmd = "kubectl get sc -o name|awk -F / '{print $2}'"
            sc_name = os.popen(sc_name_cmd).read().strip()
            if not sc_name:
                print("查询不到storageclass, 请手动重试")
                return
            else:
                set_default_cmd = """kubectl patch storageclass %s -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'"""  % sc_name
                res = os.system(set_default_cmd)
                if res != 0:
                    print("设置默认storageclass失败, 请手动重试")
                    return 
        else:
            print("查询不到storageclass, 请手动重试！")
    else:
        print("设置storageclass失败, 请手动重试！")
    
def check_python_module():
    print("检查是否安装了pyyaml模块")
    check_cmd = "pip3 list |grep PyYAML"
    res = os.system(check_cmd)
    if res == 0:
        print("已安装pyyaml模块")
        return

    pip_install_cmd = "pip3 install ./PyYAML-6.0.tar.gz"
    res = os.system(pip_install_cmd)
    if res == 0:
        print("安装pyyaml模块成功")
    else:
        print("未能成功安装pyyaml模块, 请手动安装")


if __name__ == "__main__":


    check_install_kubectl()

    check_install_helm()

    check_ct_namespace()

    check_set_sc()

    check_python_module()
    