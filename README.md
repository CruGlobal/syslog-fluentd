# syslog-splunk


This defines a docker container that listens to syslog messages on ports 514/UDP and 601/TCP,
and forwards the messages on to a splunk server.

Testing
-------

After making your changes, build the project via:

```
  build.rb
```

This will build the syslog-splunk image and then build and run the tests.
The tests currently only check that the syslog messages were accepted by the container.
You will need to manually verify that the messages show up in Splunk.
Search for "index=aws-ecs eventSource=syslog-splunk-tester",
using the "Today" time option.


Deployment
----------

The CI server runs

```
 build.rb --push
```

which will perform the build as described above (but without the manual checking in Splunk),
and then will push the new syslog-splunk image to dockerhub.

When a successful build on the add-build-script branch is performed,
jenkins will automatically deploy the image to ECS staging.

To deploy an image to production,
find the successful build in jenkins and 'Promote' it with the 'Deploy to Production' promotion process.

