FROM java
MAINTAINER zyfdegg@gmail.com

ENV	VERSION=3_10_2 \
	USER=openfire \
	DIR_DATA=/var/lib/openfire \
	DIR_LOG=/var/log/openfire 

# Fix 'Public key for pkg.rpm is not installed'
RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

# RUN yum install -y java-1.8.0-openjdk
RUN mkdir /openfire
COPY openfire_${VERSION}.tar.gz /openfire/openfire_${VERSION}.tar.gz
# ADD http://download.igniterealtime.org/openfire/openfire_${VERSION}.tar.gz /openfire/openfire_${VERSION}.tar.gz
RUN tar -xzf /openfire/openfire_${VERSION}.tar.gz
RUN rm -I /openfire/openfire_${VERSION}.tar.gz

COPY start.sh /start.sh
COPY stop.sh /stop.sh
COPY restart.sh /stop.sh
COPY init.sh /init.sh

RUN chmod +x /start.sh

EXPOSE 9090/tcp 9091/tcp

VOLUME ["${DIR_DATA}"]
