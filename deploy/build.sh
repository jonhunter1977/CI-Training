#!/bin/bash

set -o nounset
set -o errexit

echo "Building image"
sudo docker build --rm=false -t $DOCKER_USER/ci-training:$CIRCLE_SHA1 -t $DOCKER_USER/ci-training:latest .

echo "Pushing image to registry"
sudo docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
sudo docker push $DOCKER_USER/ci-training:latest
