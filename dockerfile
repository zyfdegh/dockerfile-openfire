FROM centos
MAINTAINER zyfdegg@gmail.com

ENV	VERSION=3_10_2 \
	USER=openfire \
	DIR_DATA=/var/lib/openfire \
	DIR_LOG=/var/log/openfire

RUN yum install -y java-1.8.0-openjdk wget \
&& mkdir /openfire
&& wget http://download.igniterealtime.org/openfire/openfire_${VERSION}.tar.gz -O /openfire/openfire_${VERSION}.tar.gz \
&& tar -xzf /openfire_${VERSION}.tar.gz \
&& rm -I openfire_${VERSION}.tar.gz

COPY start.sh /start.sh
RUN chmod 544 /start.sh

COPY stop.sh /stop.sh
COPY restart.sh /stop.sh
COPY init.sh /init.sh

EXPOSE 9090/tcp 9091/tcp
VOLUME ["${DIR_DATA}"]
