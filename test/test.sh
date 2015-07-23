#!/bin/bash

echo "Host: $(hostname)";

echo "IP: $(hostname -I)";

TARGET=${1:-internal-syslog-splunk-staging-1258904703.us-east-1.elb.amazonaws.com}

echo "Target: $TARGET";


echo "Testing TCP...";
loggen \
  --rate 5 \
  --inet \
  --size 150 \
  --interval 2 \
  --syslog-proto \
  $TARGET \
  6010;

echo "Testing UDP...";

loggen \
  --rate 5 \
  --inet \
  --dgram \
  --size 150 \
  --interval 2 \
  --syslog-proto \
  $TARGET \
  514;

echo "Testing UDP Multiline";

logger --server $TARGET \
  --udp \
  $'hello\nworld\n\ttesting...\n\ttesting...';

echo "Testing structured data";

echo -n '<165>1 2011-02-04T20:06:00.000000+02:00 localhost structured-test - ID47 [exampleSDID@32473 iut="9" eventSource="rawr" eventID="123"] Message portion. Test log with structured data.' | nc -w 1 -u $TARGET 514

