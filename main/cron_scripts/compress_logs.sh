#!/bin/bash

# disable globs -- I can't figure out how to correctly handle the *.log part otherwise
set -f

# set variables
LOGPATH=/var/log/syslog
LOGRESULTS=/var/log/syslog-compression.log
EXEC="find $LOGPATH -type f -mmin +5 -name *.log -exec gzip {} ;"

script_dir="${BASH_SOURCE%/*}"
source $script_dir/cleanup_functions.sh

execute "Syslog Compression"
