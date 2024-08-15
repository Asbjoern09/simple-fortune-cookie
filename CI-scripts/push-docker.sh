#!/bin/bash
echo "$docker_password" | docker login docker.io --username "$docker_username" --password-stdin
docker push "docker.io/$docker_username/simple-fortune-cookie:1.0-${GIT_COMMIT::8}" 
docker push "docker.io/$docker_username/simple-fortune-cookie:latest" &
wait
