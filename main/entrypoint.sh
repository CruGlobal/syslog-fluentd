#!/bin/bash

sed -i 's/DD_APPLICATION_KEY/'$DD_APPLICATION_KEY'/g' /usr/etc/syslog-ng.conf

exec "$@"
