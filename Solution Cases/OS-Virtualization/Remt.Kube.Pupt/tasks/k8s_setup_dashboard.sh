#!/bin/bash

kubectl create serviceaccount dashboard-admin-sa
kubectl create clusterrolebinding dashboard-admin-sa \
        --clusterrole=cluster-admin \
        --serviceaccount=default:dashboard-admin-sa
