#!/bin/bash

[[ -z "${GIT_COMMIT}" ]] && Tag='local' || Tag="${GIT_COMMIT::8}"
REPO="docker.io/$docker_username/"
if [[ "$BRANCH_NAME" == "main" ]]; then
  BranchTag='latest'
else
  BranchTag="$BRANCH_NAME"
fi
echo "Repository: ${REPO}"
docker build -t "${REPO}simple-fortune-cookie-${IMAGE}:${BranchTag}" \
              -t "${REPO}simple-fortune-cookie-${IMAGE}:1.0-${Tag}" \
              "$DIRECTORY/"
