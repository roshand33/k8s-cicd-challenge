#!/usr/bin/env bash
set -euo pipefail

kubectl apply -k k8s/
kubectl -n k8s-cicd-demo rollout status deployment/postgres --timeout=120s
kubectl -n k8s-cicd-demo rollout status deployment/backend --timeout=120s
kubectl -n k8s-cicd-demo get pods,svc
