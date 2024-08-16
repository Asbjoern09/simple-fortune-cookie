#!/bin/bash
set -e

echo "Deploying application to test environment"
kubectl apply -f k8s/test-deployment.yaml

echo "Waiting for the application to be ready"
sleep 30 

echo "Checking application availability"
if curl --fail http://13.60.2.166:31448; then
    echo "Application is reachable!"
else
    echo "Application is not reachable"

    kubectl delete -f k8s/test-deployment.yaml
    exit 1
fi

echo "Cleaning up the test environment"
kubectl delete -f k8s/test-deployment.yaml

echo "Test completed"
