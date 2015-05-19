#!/bin/bash



docker run \
 --interactive \
 --tty \
 --rm \
 syslog-splunk-tester \
 "$@"

