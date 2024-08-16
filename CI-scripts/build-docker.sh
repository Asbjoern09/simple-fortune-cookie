#!/bin/bash
[[ -z "${GIT_COMMIT}" ]] && Tag='local' || Tag="${GIT_COMMIT::8}" 
REPO="docker.io/$docker_username/"
echo "${REPO}"
docker build -t "${REPO}simple-fortune-cookie-${IMAGE}:latest" -t "${REPO}simple-fortune-cookie-${IMAGE}:1.0-$Tag" "$DIRECTORY/"
