#!/bin/bash
BRANCH_NAME=$(echo "$GITHUB_REF" | sed 's/refs\/heads\///')
MANIFESTS_PATH="manifests"
case "$BRANCH_NAME" in
  main)
    echo "Deploying to production environment"
    kubectl --kubeconfig kubeconfig apply -f "$MANIFESTS_PATH/production"
    ;;
  staging)
    echo "Deploying to staging environment"
    kubectl --kubeconfig kubeconfig apply -f "$MANIFESTS_PATH/staging"
    ;;
  development)
    echo "Deploying to development environment"
    kubectl --kubeconfig kubeconfig apply -f "$MANIFESTS_PATH/development"
    ;;
  *)
    echo "Unknown environment: $BRANCH_NAME"
    exit 1
    ;;
esac