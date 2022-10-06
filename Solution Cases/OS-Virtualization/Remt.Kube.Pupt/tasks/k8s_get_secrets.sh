#!/bin/bash

secrets=$(kubectl get secrets)
admin_secret_name=$(echo "$secrets" | awk '$1 ~ /dashboard-admin-sa/ { print $1 }')

echo "$secrets" >&1
kubectl describe secret "$admin_secret_name" >&1

exit 0