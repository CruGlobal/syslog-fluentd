#!/bin/bash

TAG="056154071827.dkr.ecr.us-east-1.amazonaws.com/syslog-splunk:gitrev-$(git rev-parse --verify --short=12 HEAD)"
docker build \
 --tag $TAG \
 $(dirname $0);

docker push $TAG;

