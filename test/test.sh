#!/bin/bash

echo "Host: $(hostname)";

echo "IP: $(hostname -I)";

TARGET=${1:-syslog.uscm.org}
PORT=${2:-6010}

echo "Target: $TARGET";


echo "Testing TCP...";
OUTPUT=$(loggen \
  --rate 5 \
  --inet \
  --size 150 \
  --interval 2 \
  --syslog-proto \
  --sdata '[exampleSDID@32473 iut="9" eventSource="syslog-splunk-tester" eventID="123"]' \
  --size 250 \
  $TARGET \
  $PORT 2>&1);

# note: it's hard to test TCP multiline with logger,
# because logger doesn't use the now-standard 'octet counting' method for TCP connections,
# which our current syslog-ng config requires.
echo "Testing UDP Multiline...";

logger --server $TARGET \
  --udp \
  $'hello\nworld\n\ttesting...\n\ttesting...';

echo $OUTPUT | grep "count=15" > /dev/null
FOUND=$?

if [[ $FOUND == "0" ]]; then
  echo "successfully sent messages"
else
  echo "test failed; loggen output:"
  echo "$OUTPUT"
fi

exit $FOUND
