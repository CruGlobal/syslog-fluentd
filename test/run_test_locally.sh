#!/bin/bash


docker run \
 --interactive \
 --rm \
 --link syslog-splunk-container:syslog \
 cruglobal/syslog-splunk-tester \
 /opt/splunkforwarder/test.sh syslog 601

