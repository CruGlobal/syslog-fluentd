#!/bin/bash


docker run \
 --interactive \
 --tty \
 --rm \
 --env SPLUNK_HOST=splunk.ccci.org \
 --env SPLUNK_PORT=9997 \
 --env SPLUNK_INDEX=aws-ecs \
 --publish 601:601 \
 --publish 514:514/UDP \
 --name syslog-splunk-container \
 cruglobal/syslog-splunk \
 "$@"
