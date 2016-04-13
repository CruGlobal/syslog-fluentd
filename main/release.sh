#!/bin/bash

TAG="cruglobal/syslog-splunk:gitrev-$(git rev-parse --verify --short=12 HEAD)"
docker build \
 --tag $TAG \
 $(dirname $0);

docker push $TAG;

