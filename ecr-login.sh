#!/bin/bash
aws ecr get-login-password --region us-west-1 | docker login --username AWS --password-stdin 164566612831.dkr.ecr.us-west-1.amazonaws.com
docker build -t myrepo .
docker tag myrepo:latest 164566612831.dkr.ecr.us-west-1.amazonaws.com/myrepo:latest
docker tag myrepo:latest 164566612831.dkr.ecr.us-west-1.amazonaws.com/myrepo:1.0
docker push 164566612831.dkr.ecr.us-west-1.amazonaws.com/myrepo:latest
docker push 164566612831.dkr.ecr.us-west-1.amazonaws.com/myrepo:1.0
