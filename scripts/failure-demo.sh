#!/usr/bin/env bash
set -euo pipefail

echo "Intentional failure: change DB_HOST from postgres to postgres-invalid"
echo
echo "Useful debugging commands:"
echo "kubectl -n k8s-cicd-demo get pods"
echo "kubectl -n k8s-cicd-demo describe pod <backend-pod>"
echo "kubectl -n k8s-cicd-demo logs <backend-pod>"
echo "kubectl -n k8s-cicd-demo get events --sort-by=.lastTimestamp"
echo
echo "After identifying the root cause, restore DB_HOST=postgres and redeploy."
