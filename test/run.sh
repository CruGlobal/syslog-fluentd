#!/bin/bash



docker run \
 --interactive \
 --tty \
 --rm \
 cruglobal/syslog-splunk-tester \
 "$@"

