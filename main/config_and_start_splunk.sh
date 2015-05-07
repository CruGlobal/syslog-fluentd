#!/bin/bash

set -e


check_env () {
	if [[ -z $1 ]]
	then
		echo "$2 variable is not set";
		exit 1;
	fi
}

check_env "$SPLUNK_HOST" "SPLUNK_HOST"
check_env "$SPLUNK_PORT" "SPLUNK_PORT"
check_env "$SPLUNK_INDEX" "SPLUNK_INDEX"


OUTPUTS_FILE=/opt/splunkforwarder/etc/system/local/outputs.conf;
INPUTS_FILE=/opt/splunkforwarder/etc/apps/search/local/inputs.conf;

sed --in-place "s/SPLUNK_HOST/$SPLUNK_HOST/" $OUTPUTS_FILE;
sed --in-place "s/SPLUNK_PORT/$SPLUNK_PORT/" $OUTPUTS_FILE;
sed --in-place "s/SPLUNK_INDEX/$SPLUNK_INDEX/" $INPUTS_FILE;

echo "outputs.conf:";
echo "";
cat $OUTPUTS_FILE;

echo "";
echo "";

echo "inputs.conf:";
echo "";
cat $INPUTS_FILE;


# use exec so that splunk receives signals sent to this script
exec /opt/splunkforwarder/bin/splunk start --nodaemon;
