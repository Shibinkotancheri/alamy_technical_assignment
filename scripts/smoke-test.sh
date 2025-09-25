#!/usr/bin/env bash
set -euo pipefail
kubectl wait --for=condition=available --timeout=180s deployment/webapp -n alamy_assignment
kubectl get pods -n alamy_assignment
# wait for ingress
echo "Waiting for ingress (ALB) to provision..."
sleep 20
kubectl get ingress -n alamy_assignment -o wide || true
