FROM ubuntu:xenial
MAINTAINER "rockaut" <fischbacher.markus@gmail.com>
EXPOSE 5000

ARG sitename=cmk

RUN apt-get update && apt-get install -y wget curl \
    && wget https://mathias-kettner.de/support/1.2.8p17/check-mk-raw-1.2.8p17_0.xenial_amd64.deb \
    && dpkg -i check-mk-raw-1.2.8p17_0.xenial_amd64.deb || true \
    && apt-get install -y -f

#RUN omd setup
RUN apt -y update && \
    apt -y install time traceroute libsnmp-python curl dialog dnsutils fping graphviz libapache2-mod-fcgid apache2 apache2-utils libdbi1 libevent-1.4-2 libltdl7 libnet-snmp-perl libpango1.0-0 libperl5.22 libreadline5 libsnmp-perl libuuid1 libxml2 patch php-cli php-cgi php-gd php-mcrypt php-sqlite3 php-json php-pear pyro rsync smbclient rpcbind snmp unzip xinetd python-ldap freeradius-utils libpcap0.8 rpm binutils lcab libgsf-1-114 libglib2.0-0 python-reportlab python-imaging poppler-utils python-openssl

RUN omd create $sitename; \
    omd config $sitename set APACHE_TCP_ADDR 0.0.0.0; \
    omd config $sitename set DEFAULT_GUI check_mk; \
    omd config $sitename set TMPFS off;

COPY ./start.sh /usr/local/bin/start.sh

CMD bash -C '/usr/local/bin/start.sh';'/bin/bash'
