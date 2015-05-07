#!/bin/bash



# --env-file=work/development.txt \
docker run \
 --interactive \
 --tty \
 --rm \
 --publish 601:601 \
 --publish 514:514/UDP \
 --name syslog-splunk-container \
 cruglobal/syslog-splunk \
 "$@"
