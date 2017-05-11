#!/bin/bash
sudo docker pull jonhunter1977/ci-training:latest
sudo docker rename ci-training ci-training-old
sudo docker kill ci-training-old
sleep 2s
sudo docker run -d -p 4001:4001 --name ci-training jonhunter1977/ci-training:latest
sudo docker rm ci-training-old
