#!/bin/bash

execute ()
{
  local cleanup_process=$1
  : > $LOGRESULTS
  log "Running $cleanup_process: $EXEC"
  $EXEC >> $LOGRESULTS 2>&1

  if [ $? -eq 0 ]; then
    log "$cleanup_process was successful"
  else
    log "$cleanup_process ended with errors"
  fi
}

log ()
{
  local message=$1;
  echo "`date --iso-8601=ns` - host $HOSTNAME - $message" >> $LOGRESULTS 2>&1
}
