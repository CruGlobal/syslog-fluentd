# re-using the jboss/bas layer, partly because yum update fails on boot2docker:
# https://github.com/boot2docker/boot2docker/issues/459

#FROM fedora:20
FROM jboss/base


MAINTAINER Matt Drees <matt.drees@cru.org>

# Execute system update
#RUN yum -y update && yum clean all

USER root

RUN yum -y install \
  supervisor \
  syslog-ng \
  wget \
  && yum clean all;

ENV SPLUNK_VERSION=6.2.2
ENV SPLUNK_VERSION_FULL=$SPLUNK_VERSION-255606-linux-2.6-x86_64


RUN SPLUNK_RPM_FILE=splunkforwarder-$SPLUNK_VERSION_FULL.rpm \
    && wget -O $SPLUNK_RPM_FILE \
        "http://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=Linux&version=$SPLUNK_VERSION&product=universalforwarder&filename=$SPLUNK_RPM_FILE&wget=true" \
    && rpm -i $SPLUNK_RPM_FILE \
    && rm $SPLUNK_RPM_FILE;


WORKDIR /opt/splunkforwarder

ENV PATH $PATH:/opt/splunkforwarder/bin

RUN splunk version --accept-license

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY syslog-ng.conf /etc/syslog-ng/syslog-ng.conf

COPY inputs.conf /opt/splunkforwarder/etc/apps/search/local/inputs.conf

COPY outputs.conf /opt/splunkforwarder/etc/system/local/outputs.conf


EXPOSE 514/udp
EXPOSE 601/tcp

# see inputs.conf
#EXPOSE 1514/udp
#EXPOSE 1601/tcp

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
