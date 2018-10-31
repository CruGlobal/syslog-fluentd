#!/bin/bash

sed -i 's/DD_APPLICATION_KEY/'$DD_APPLICATION_KEY'/g' /usr/etc/syslog-ng.conf

sed -i 's/url/url https:\/\/'"$ES_ENDPOINT"'/g' /etc/td-agent/td-agent.conf

sed -i 's/region/region '"$ES_REGION"'/g' /etc/td-agent/td-agent.conf

sed -i 's/access_key_id/access_key_id \"'"$ACCESS_KEY_ID"'\"/g' /etc/td-agent/td-agent.conf

sed -i 's~secret_access_key~secret_access_key \"'"$SECRET_ACCESS_KEY"'\"~g' /etc/td-agent/td-agent.conf

exec "$@"
