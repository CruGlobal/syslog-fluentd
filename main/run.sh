#!/bin/bash



# --env-file=work/development.txt \
# --publish 8080:8080 \
docker run \
 --interactive \
 --tty \
 --rm \
 --name syslog-splunk-container \
 syslog-splunk \
 "$@"
