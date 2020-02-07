#!/bin/bash
readonly TRAVIS_REPO_OWNER=${TRAVIS_REPO_SLUG%/*}
readonly TRAVIS_REPO_NAME=${TRAVIS_REPO_SLUG#*/}

echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin

docker tag  "$BUILD_TAG" "$DOCKER_USER/$TRAVIS_REPO_NAME:latest"
docker push "$DOCKER_USER/$TRAVIS_REPO_NAME:latest"

docker tag  "$BUILD_TAG" "$DOCKER_USER/$TRAVIS_REPO_NAME:$TRAVIS_TAG"
docker push "$DOCKER_USER/$TRAVIS_REPO_NAME:$TRAVIS_TAG"
