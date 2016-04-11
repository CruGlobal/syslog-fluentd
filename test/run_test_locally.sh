#!/bin/bash


docker run \
 --interactive \
 --rm \
 --link syslog-splunk-container:syslog \
 056154071827.dkr.ecr.us-east-1.amazonaws.com/syslog-splunk-tester \
 /opt/splunkforwarder/test.sh syslog 601

