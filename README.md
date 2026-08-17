# Kubernetes CI/CD Infrastructure Challenge

This project is designed for the 90-minute DevOps Engineer — Kubernetes and CI/CD challenge.

## Planned stack

- Python Flask backend
- PostgreSQL database
- Docker
- Kubernetes (Kind)
- GitHub Actions
- Docker Hub
- Kubernetes readiness/liveness probes
- Intentional database connectivity failure for live debugging

## Architecture

GitHub -> GitHub Actions -> Docker Hub -> Kubernetes (Kind)
                                      |
                              +-------+-------+
                              |               |
                         Flask API       PostgreSQL
                              |
                           Service

## Important

The CI/CD deployment is intended to use a GitHub Actions self-hosted runner running on the same machine as the Kind cluster. A GitHub-hosted runner cannot directly reach a Kind cluster running on your laptop.

## Challenge requirements covered

1. Working Kubernetes deployment: backend + database
2. CI/CD: build, Docker image, deploy to Kubernetes
3. Reliability improvement: readiness/liveness probes
4. Intentional failure: bad database hostname, followed by live debugging and recovery

## Folder structure

```text
k8s-cicd-challenge/
├── app/
├── k8s/
├── .github/workflows/
├── scripts/
└── docs/
```

The implementation will be completed step-by-step rather than adding unnecessary production complexity.
