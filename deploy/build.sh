#!/bin/bash

set -o nounset
set -o errexit

echo "Building image"
sudo docker build --rm=false -t hr-react .

echo "Tagging image"
sudo docker tag hr-react $DOCKER_USER/hr-react:$CIRCLE_SHA1

echo "Pushing image to registry"
sudo docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
sudo docker push $DOCKER_USER/hr-react:$CIRCLE_SHA1
