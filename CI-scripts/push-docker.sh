#!/bin/bash
echo "$docker_password" | docker login docker.io --username "$docker_username" --password-stdin
echo "docker push "docker.io/$docker_username/simple-fortune-cookie-${IMAGE}:1.0-${GIT_COMMIT::8}""
echo "docker push "docker.io/$docker_username/simple-fortune-cookie-${IMAGE}:latest" &"
docker push "docker.io/$docker_username/simple-fortune-cookie-${IMAGE}:1.0-${GIT_COMMIT::8}" 
docker push "docker.io/$docker_username/simple-fortune-cookie-${IMAGE}:latest" &
wait
