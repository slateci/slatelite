#!/bin/bash
set -e
helm init --service-account tiller
kubectl rollout status -w deployment/tiller-deploy --namespace=kube-system
helm install --namespace kube-system --set nfs.server=127.0.0.1 --set nfs.path=/ stable/nfs-client-provisioner
