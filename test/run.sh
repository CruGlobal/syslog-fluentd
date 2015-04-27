#!/bin/bash



docker run \
 --interactive \
 --tty \
 --rm \
 --link syslog-splunk-container:syslog \
 --name syslog-splunk-tester-container \
 syslog-splunk-tester \
 "$@"

