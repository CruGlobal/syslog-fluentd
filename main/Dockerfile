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
  && yum clean all;


COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY syslog-ng.conf /etc/syslog-ng/syslog-ng.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
