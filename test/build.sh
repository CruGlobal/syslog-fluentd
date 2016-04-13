#!/bin/bash

docker build \
 --tag cruglobal/syslog-splunk-tester \
 $(dirname $0);
