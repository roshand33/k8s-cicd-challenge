# Demo Plan

## 1. Live Deployment — 3–4 minutes

Show:

- GitHub repository
- GitHub Actions workflow
- Docker image
- Kubernetes pods/services
- Working backend endpoint

Useful commands:

```bash
kubectl -n k8s-cicd-demo get pods
kubectl -n k8s-cicd-demo get svc
kubectl -n k8s-cicd-demo get deployments
kubectl -n k8s-cicd-demo logs deployment/backend
```

## 2. Architecture — 2–3 minutes

Explain:

- Kind cluster
- Backend Deployment + Service
- PostgreSQL Deployment + Service
- GitHub Actions
- Docker Hub
- Self-hosted runner
- Deployment flow

## 3. Reliability — 1 minute

Chosen improvement: readiness/liveness probes.

Explain:

- Readiness prevents traffic to an unready pod.
- Liveness allows Kubernetes to restart an unhealthy pod.
- Incorrect probes can cause unnecessary restarts or suppress healthy traffic.

## 4. Failure Debugging — 2–3 minutes

Intentionally change:

```yaml
DB_HOST: postgres
```

to:

```yaml
DB_HOST: postgres-invalid
```

Then demonstrate:

```bash
kubectl -n k8s-cicd-demo get pods
kubectl -n k8s-cicd-demo describe pod <backend-pod>
kubectl -n k8s-cicd-demo logs <backend-pod>
kubectl -n k8s-cicd-demo get events --sort-by=.lastTimestamp
```

Reasoning:

1. Pod exists, but backend is not ready.
2. Inspect pod conditions/events.
3. Inspect application logs.
4. Logs show database hostname resolution/connectivity failure.
5. Compare environment variable with PostgreSQL Service name.
6. Restore `DB_HOST=postgres`.
7. Redeploy.
8. Verify readiness and application response.

## 5. Tradeoffs — 1 minute

Intentional simplifications:

- Kind instead of a managed cloud cluster.
- Single PostgreSQL replica.
- Basic Kubernetes manifests instead of a large Helm chart.
- Docker Hub instead of a private production registry.
- No external monitoring stack.

Production improvements:

- Managed Kubernetes.
- Managed database or HA PostgreSQL.
- Private registry.
- External secret manager.
- Ingress/TLS.
- Centralized logging and metrics.
- Network policies.
- Resource autoscaling.
- GitOps deployment.
