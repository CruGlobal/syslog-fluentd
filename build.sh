#!/bin/bash

docker build \
 --tag 056154071827.dkr.ecr.us-east-1.amazonaws.com/syslog-fluentd:$BUILD_NUMBER \
 main;


