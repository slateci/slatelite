#!/bin/bash
set -e
helm init --service-account tiller
kubectl rollout status -w deployment/tiller-deploy --namespace=kube-system
helm install --namespace kube-system --set nfs.server=127.0.0.1 --set nfs.path=/ --set storageClass.defaultClass=true stable/nfs-client-provisioner
chmod 666 /dev/fuse
