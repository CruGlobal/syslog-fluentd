#!/bin/bash

# disable globs -- I can't figure out how to correctly handle the *.log part otherwise
set -f

# set variables
LOGPATH=/var/log/syslog
LOGRESULTS=/var/log/syslog-compression.log
HOSTNANE=`hostname`
EXEC="find $LOGPATH -type f -mmin +5 -name *.log -exec gzip {} ;"

echo "`date --iso-8601=ns` - Running Syslog Compression: $EXEC" > $LOGRESULTS 2>&1

$EXEC >> $LOGRESULTS 2>&1
RETVAL=$?

if [ $RETVAL -eq 0 ]; then
   echo "`date --iso-8601=ns` - Syslog Compression was successful - host $HOSTNAME" >> $LOGRESULTS 2>&1
else
   echo "`date --iso-8601=ns` - Syslog Compression ended with errors - host $HOSTNAME" >> $LOGRESULTS 2>&1
fi

