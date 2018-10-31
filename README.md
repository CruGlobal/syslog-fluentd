# syslog-fluentd


This defines a docker container that listens to syslog messages on port 602/TCP,
and forwards the messages on to fluentd for parsing, then ultimately to a log conslidation server.

Deployment
----------

When a successful build on the staging branch is performed,
jenkins will automatically deploy the image to ECS staging.

To deploy an image to production,
find the successful build in jenkins and 'Promote' it with the 'Deploy to Production' promotion process.

