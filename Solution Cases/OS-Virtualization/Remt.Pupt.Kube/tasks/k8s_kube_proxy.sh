#!/bin/bash

ulimit -n 8192
export KUBECONFIG=/etc/kubernetes/admin.conf
kubectl proxy --address='0.0.0.0' --port=8080 &>/dev/null & disown