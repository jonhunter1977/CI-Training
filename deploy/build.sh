#!/bin/bash

set -o nounset
set -o errexit

echo "Building and tagging image"
sudo docker build --rm=false -t $DOCKER_USER/hr-react:$CIRCLE_SHA1 -t $DOCKER_USER/hr-react:latest .

echo "Pushing image to registry"
sudo docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
sudo docker push $DOCKER_USER/hr-react:$CIRCLE_SHA1
