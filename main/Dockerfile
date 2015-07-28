FROM centos:latest
MAINTAINER Matt Drees <matt.drees@cru.org>

USER root

RUN yum -y install \
  # separate yum invocation required or epel dependent packages fail
  epel-release \
  && rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7 \
  && yum -y install \
  bind-utils \
  netcat \
  net-tools \
  nmap \
  supervisor \
  wget \
  # required to compile syslog-ng
  gcc \
  make \
  logrotate \
  eventlog \
  eventlog-devel \
  glib2-devel \
  pcre-devel \
  && yum clean all;

ENV SYSLOG_VERSION=3.6.4
ENV SYSLOG_DOWNLOAD_URL="https://github.com/balabit/syslog-ng/releases/download/syslog-ng-${SYSLOG_VERSION}/syslog-ng-${SYSLOG_VERSION}.tar.gz"

RUN curl --location "${SYSLOG_DOWNLOAD_URL}" > "syslog-ng-${SYSLOG_VERSION}.tar.gz" \
    && tar zxf "syslog-ng-${SYSLOG_VERSION}.tar.gz" \
    && cd "syslog-ng-${SYSLOG_VERSION}" \
    && ./configure --prefix=/usr \
    && make \
    && make install \
    && cd .. \
    && rm -rf "syslog-ng-${SYSLOG_VERSION}" "syslog-ng-${SYSLOG_VERSION}.tar.gz";


ENV SPLUNK_VERSION=6.2.2
ENV SPLUNK_VERSION_FULL=$SPLUNK_VERSION-255606-linux-2.6-x86_64
ENV SPLUNK_RPM_FILE=splunkforwarder-$SPLUNK_VERSION_FULL.rpm
ENV SPLUNK_DOWNLOAD_URL="http://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=Linux&version=$SPLUNK_VERSION&product=universalforwarder&filename=$SPLUNK_RPM_FILE&wget=true"

RUN curl --location "${SPLUNK_DOWNLOAD_URL}" > $SPLUNK_RPM_FILE \
    && rpm -i $SPLUNK_RPM_FILE \
    && rm $SPLUNK_RPM_FILE;


WORKDIR /opt/splunkforwarder

ENV PATH $PATH:/opt/splunkforwarder/bin
ENV LD_LIBRARY_PATH=/usr/lib

RUN splunk version --accept-license

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY syslog-ng.conf /usr/etc/syslog-ng.conf

COPY inputs.conf /opt/splunkforwarder/etc/apps/search/local/inputs.conf

COPY outputs.conf /opt/splunkforwarder/etc/system/local/outputs.conf


EXPOSE 514/udp
EXPOSE 601/tcp

# see inputs.conf
#EXPOSE 1514/udp
#EXPOSE 1601/tcp

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
