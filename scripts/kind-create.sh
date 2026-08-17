#!/usr/bin/env bash
set -euo pipefail

kind create cluster --name devops-challenge
kubectl cluster-info --context kind-devops-challenge
