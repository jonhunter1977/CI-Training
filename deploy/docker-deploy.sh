#!/bin/bash
sudo docker pull jonhunter1977/ci-training:latest
sudo docker kill ci-training
sudo docker run -d -p 4001:4001 --name ci-training jonhunter1977/ci-training:latest
