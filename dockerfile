FROM centos
MAINTAINER zyfdegg@gmail.com

ENV	VERSION=3_10_2 \
	USER=openfire \
	DIR_DATA=/var/lib/openfire \
	DIR_LOG=/var/log/openfire \
	YUM_REPO=/etc/yum.repos.d

# Fix 'Public key for pkg.rpm is not installed'
RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

# Replace rpm repo with 163
RUN mkdir -p ${YUM_REPO}/backup && mv ${YUM_REPO}/*.repo ${YUM_REPO}/backup
ADD http://mirrors.163.com/.help/CentOS7-Base-163.repo ${YUM_REPO}/
RUN yum clean all && yum makecache

# Install jre
RUN yum install -y java-1.8.0-openjdk

# Get openfire
RUN mkdir /openfire
ADD http://download.igniterealtime.org/openfire/openfire_${VERSION}.tar.gz /openfire/openfire_${VERSION}.tar.gz

# Unarchive openfire
RUN tar -xzf /openfire/openfire_${VERSION}.tar.gz
RUN rm -I /openfire/openfire_${VERSION}.tar.gz

COPY start.sh /start.sh
RUN chmod 544 /start.sh

COPY stop.sh /stop.sh
COPY restart.sh /stop.sh
COPY init.sh /init.sh

EXPOSE 9090/tcp 9091/tcp

VOLUME ["${DIR_DATA}"]
