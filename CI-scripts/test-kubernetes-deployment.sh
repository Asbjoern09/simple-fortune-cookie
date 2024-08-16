#!/bin/bash

# Configuration
MANIFESTS_DIR="./manifests/deployment"  # Directory containing Kubernetes manifests
CLUSTER_NAME="minikube-cluster"
SERVICE_NAME="my-app-service"
NAMESPACE="default"  # Change if you use a different namespace
PORT=8080
TIMEOUT=10

# Function to check if Minikube is running
check_minikube_status() {
  if ! minikube status | grep -q "host: Running"; then
    echo "Minikube is not running. Starting Minikube..."
    minikube start --driver=docker
  else
    echo "Minikube is already running."
  fi
}

# Function to deploy manifests
deploy_manifests() {
  echo "Deploying manifests from $MANIFESTS_DIR..."
  kubectl apply -f "$MANIFESTS_DIR"
}

# Function to test application
test_application() {
  echo "Testing application..."

  # Expose the service if necessary
  kubectl expose deployment my-app --port=$PORT --name=$SERVICE_NAME --type=NodePort --dry-run=client -o yaml | kubectl apply -f -

  # Get service IP and port
  SERVICE_IP=$(minikube ip)
  SERVICE_PORT=$(kubectl get service $SERVICE_NAME -n $NAMESPACE -o jsonpath='{.spec.ports[0].nodePort}')

  # Check availability
  response=$(curl --write-out "%{http_code}" --silent --output /dev/null --max-time $TIMEOUT http://$SERVICE_IP:$SERVICE_PORT)

  if [ "$response" -eq 200 ]; then
    echo "Application is up and running."
    exit 0
  else
    echo "Application is not accessible. HTTP Status Code: $response"
    exit 1
  fi
}

# Main execution
check_minikube_status
deploy_manifests
test_application
