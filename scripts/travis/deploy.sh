#!/bin/bash

docker login -u "$DOCKER_USER" -p "$DOCKER_PASS"

docker tag  "$BUILD_TAG" "$DOCKER_USER/code-server:latest"
docker push "$DOCKER_USER/code-server:latest"
