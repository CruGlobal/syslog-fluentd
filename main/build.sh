#!/bin/bash

docker build \
 --tag cruglobal/syslog-splunk \
 $(dirname $0);
