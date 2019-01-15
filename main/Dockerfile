FROM 056154071827.dkr.ecr.us-east-1.amazonaws.com/syslog-ng:latest
MAINTAINER dpt <hart-ds-dpt@uscm.org>

# fluentd
RUN apt-get update \
  && apt-get install --no-install-recommends --fix-missing -y -q \
  curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl https://packages.treasuredata.com/GPG-KEY-td-agent | apt-key add - \
  && echo "deb http://packages.treasuredata.com/2/debian/jessie/ jessie contrib" > /etc/apt/sources.list.d/treasure-data.list

RUN apt-get update \
  && apt-get install --no-install-recommends --fix-missing -y -q \
  td-agent \
  build-essential \
  supervisor \
  logrotate \
  cron \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN  td-agent-gem install fluent-plugin-elasticsearch fluent-plugin-aws-elasticsearch-service \
 fluent-plugin-multi-format-parser fluent-plugin-record-reformer fluent-plugin-datadog

COPY td-agent.conf /etc/td-agent/td-agent.conf
COPY entrypoint.sh /entrypoint.sh
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY syslog-ng.conf /usr/etc/syslog-ng.conf
COPY syslog-cron /etc/cron.d/syslog
RUN crontab /etc/cron.d/syslog

EXPOSE 602/tcp

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
