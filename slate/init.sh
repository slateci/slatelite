#!/bin/bash
kubectl config set clusters.default.server https://kube:6443
set -e

if [[ $CLUSTERNAME == "# {CLUSTERNAME}" ]]; then
  echo "No slate cluster name provided...did not join federation"
  exit 1
fi
if [[ $CLUSTERGROUP == "# {CLUSTERGROUP}" ]]; then
  echo "No slate group provided...did not join federation"
  exit 1
fi
if [[ $TOKEN == "# {TOKEN}" ]]; then
  echo "No token provided...did not join federation"
  exit 1
fi
if [[ $ENDPOINT == "# {ENDPOINT}" ]]; then
  echo "No endpoint provided...did not join federation"
  exit 1
fi

mkdir -p -m 0700 "$HOME/.slate"
echo $TOKEN > "$HOME/.slate/token"
chmod 600 "$HOME/.slate/token"
echo $ENDPOINT > "$HOME/.slate/endpoint"

echo "Joining to SLATE..."

slate cluster create $CLUSTERNAME --group $CLUSTERGROUP --org SLATE -y --no-ingress
