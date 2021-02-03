FROM instrumentisto/postfix

COPY ./main.cf /etc/postfix/main.cf
COPY ./master.cf /etc/postfix/master.cf

COPY ./mysql-virtual-mailbox-domains.cf /etc/postfix/mysql-virtual-mailbox-domains.cf
COPY ./mysql-virtual-mailbox-maps.cf /etc/postfix/mysql-virtual-mailbox-maps.cf
COPY ./mysql-virtual-alias-maps.cf /etc/postfix/mysql-virtual-alias-maps.cf

RUN chmod o= /etc/postfix/mysql-virtual-*.cf
RUN chgrp postfix /etc/postfix/mysql-virtual-*.cf


COPY ./header_checks /etc/postfix/header_checks
COPY ./syslog.conf /etc/syslog.conf
