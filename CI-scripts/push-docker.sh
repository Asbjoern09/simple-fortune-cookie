#!/bin/bash

echo "$docker_password" | docker login docker.io --username "$docker_username" --password-stdin
if [[ "$BRANCH_NAME" == "main" ]]; then
  BranchTag='latest'
else
  BranchTag="$BRANCH_NAME"
fi
echo "docker push docker.io/$docker_username/simple-fortune-cookie-${IMAGE}:1.0-${GIT_COMMIT::8}"
echo "docker push docker.io/$docker_username/simple-fortune-cookie-${IMAGE}:${BranchTag}"

docker push "docker.io/$docker_username/simple-fortune-cookie-${IMAGE}:1.0-${GIT_COMMIT::8}" &
docker push "docker.io/$docker_username/simple-fortune-cookie-${IMAGE}:${BranchTag}" &

wait
