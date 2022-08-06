#!/usr/bin/env python3

import os
import sys
import yaml
import time

deploy_order = ["storage", "nacos", "rabbitmq", "application", "gateway", "platform", "fusion", "primihub"]

def set_order():
    
    all_images = yaml.load(open("./images.yaml"), Loader=yaml.BaseLoader)

    apps = all_images.keys()
    image_str = ""
    for app in apps:
        set_str = " --set "
        image_dict = all_images[app]
        set_str += app  + "." + "image=" + image_dict["image"] + " "
        image_str += set_str

    return image_str


def deploy_primihub():
    ns = os.getenv("NAMESPACE")
    if not ns:
        print("NAMESPACE is not set, please exec export NAMESPACE=<your namespace> in your environment")
        sys.exit(1)

    print("now ns is :%s" % ns)

    image_str = set_order()
    print(image_str)
    helm_str = "helm upgrade  %s -n %s charts/%schart --install" 
    for service in deploy_order:
        print("in installing %s >>>>>>>>>>>>>>>>>>>>>" % service)
        helm_order = helm_str % (service, ns, service) + image_str
        print(helm_order)
        os.system(helm_order)
        time.sleep(5)


        print("ok")


if __name__ == "__main__":
    deploy_primihub()
    