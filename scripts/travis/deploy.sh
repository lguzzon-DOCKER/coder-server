#!/bin/bash
readonly TRAVIS_REPO_OWNER=${TRAVIS_REPO_SLUG%/*}
readonly TRAVIS_REPO_NAME=${TRAVIS_REPO_SLUG#*/}

echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin

readonly NEW_BUILD_TAG=$(echo "$DOCKER_USER/$TRAVIS_REPO_NAME" | tr '[:upper:]' '[:lower:]')

docker tag  "$BUILD_TAG" "$NEW_BUILD_TAG:latest"
docker push "$NEW_BUILD_TAG:latest"

docker tag  "$BUILD_TAG" "$NEW_BUILD_TAG:$TRAVIS_COMMIT"
docker push "$NEW_BUILD_TAG:$TRAVIS_COMMIT"
