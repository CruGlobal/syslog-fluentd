#!/bin/bash

# set variables
LOGPATH=/var/log/syslog
LOGRESULTS=/var/log/syslog-pruning.log
EXEC="find $LOGPATH -type f -mtime +7 -exec rm {} ;"

script_dir="${BASH_SOURCE%/*}"
source $script_dir/cleanup_functions.sh

execute "Syslog Pruning"
