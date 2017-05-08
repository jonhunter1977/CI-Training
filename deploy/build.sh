#!/bin/bash

# usage:  -c ./build.sh ${SHA1}

set -o nounset
set -o errexit

SHA1=$1

echo "Building image"
sudo docker build -t hr-react .

echo "Tagging image"
sudo docker tag hr-react $DOCKER_USER/hr-react:$SHA1

echo "Pushing image to registry"
sudo docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
sudo docker push $DOCKER_USER/hr-react:latest
