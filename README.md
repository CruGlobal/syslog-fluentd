# syslog-splunk


This defines a docker container that listens to syslog messages on ports 514/UDP and 601/TCP,
and forwards the messages on to a splunk server.

Testing
-------

After making your changes, build and run the syslog-splunk container:

```
cd main;
./build.sh;
./run.sh;
```

Then in a separate console build the test container:

```
cd test;
./build.sh;
```

and then run the tests against your local syslog-splunk container:

```
./run_test_against_ecs.sh;
```

Manually verify the test log messages show up in Splunk.
Search for "index=aws-ecs eventSource=syslog-splunk-tester",
using the "Today" time option.
