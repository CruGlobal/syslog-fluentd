FROM balabit/syslog-ng:3.14.1
MAINTAINER dpt <hart-ds-dpt@uscm.org>

RUN apt-get update \
  && apt-get install --no-install-recommends --fix-missing -y -q \
  curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update \
  && apt-get install --no-install-recommends --fix-missing -y -q \
  build-essential \
  supervisor \
  logrotate \
  cron \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY entrypoint.sh /entrypoint.sh
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY syslog-ng.conf /usr/etc/syslog-ng.conf
COPY syslog-cron /etc/cron.d/syslog
RUN crontab /etc/cron.d/syslog

EXPOSE 602/tcp

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
