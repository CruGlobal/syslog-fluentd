#!/bin/bash

# set variables
LOGPATH=/var/log/syslog
LOGRESULTS=/var/log/syslog-pruning.log
HOSTNANE=`hostname`
EXEC="find $LOGPATH -type f -mtime +7 -exec rm {} ;"


echo "`date --iso-8601=ns` - Running Syslog Pruning: $EXEC" > $LOGRESULTS 2>&1

$EXEC >> $LOGRESULTS 2>&1
RETVAL=$?

if [ $RETVAL -eq 0 ]; then
   echo "`date --iso-8601=ns` - Syslog Pruning was successful - host $HOSTNAME" >> $LOGRESULTS 2>&1
else
   echo "`date --iso-8601=ns` - Syslog Pruning ended with errors - host $HOSTNAME" >> $LOGRESULTS 2>&1
fi

