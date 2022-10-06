#!/bin/bash

set -a
source ./files/pre-run/pre-env
set +a

bolt plan run plg_kube_hdfs

# Legacy:
#--log-level info
#--log-level trace
# cont_pri_ip="${cont_pri_ip}" first_contact="${first_contact}"

# local connection
# kubectl cluster-info | more
# kubectl get pods,svc --all-namespaces -o wide
# kubectl proxy --address='0.0.0.0' --port=8080
# ssh -o ServerAliveCountMax=20 -o ServerAliveInterval=15  -L 6443:<nope_priv>:8080 cloud_user@<nope_pub>
#
# http://localhost:6443/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login


# TODO
# todo: timeout sshd congif
# todo tidy ups: hiera-manifest data