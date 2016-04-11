#!/bin/bash



docker run \
 --interactive \
 --tty \
 --rm \
 056154071827.dkr.ecr.us-east-1.amazonaws.com/syslog-splunk-tester \
 "$@"

