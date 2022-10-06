#!/bin/bash

sed "s/cont_pri_ip/$cont_pri_ip/g" ./files/templates/k8s-env.templ | \
sed "s/cont_hostname/$cont_hostname/g" | \
sed "s/work_pri_ip/$work_pri_ip/g" | \
sed "s/work_hostname/$work_hostname/g" > ./files/k8s-env