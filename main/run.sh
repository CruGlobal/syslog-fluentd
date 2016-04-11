#!/bin/bash


TTY="--tty"

if [[ "$NO_TTY" == "true" ]]; then
  TTY=""
fi

exec docker run \
 --interactive \
 $TTY \
 --rm \
 --env SPLUNK_HOST=splunk.ccci.org \
 --env SPLUNK_PORT=9997 \
 --env SPLUNK_INDEX=aws-ecs \
 --publish 601:601 \
 --publish 514:514/UDP \
 --name syslog-splunk-container \
 056154071827.dkr.ecr.us-east-1.amazonaws.com/syslog-splunk \
 "$@"
