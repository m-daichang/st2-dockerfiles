FROM centos:7

ARG ST2_VERSION
ARG ST2_REPO=stable
ARG ST2_PACKAGE=https://packagecloud.io/StackStorm/${ST2_REPO}/packages/el/7/st2-${ST2_VERSION}.x86_64.rpm/download
ARG ST2_YUM_REPO=https://packagecloud.io/install/repositories/StackStorm/stable/config_file.repo?os=centos&dist=7&source=script

LABEL com.stackstorm.version="${ST2_VERSION}"

ADD ${ST2_YUM_REPO} /etc/yum.repos.d/StackStorm_stable.repo

RUN yum -y update
#ADD ${ST2_PACKAGE} /tmp/st2_${ST2_VERSION}.x86_64.rpm
#RUN yum -y install /tmp/st2-${ST2_version}.x86_64.rpm
RUN yum -y install st2

ADD ./conf/st2.conf.template /st2.conf.template
RUN md5sum /etc/st2/st2.conf > /st2.conf.orig.md5
ADD ./conf/logging.exporter.conf /etc/st2/logging.exporter.conf

COPY docker-entrypoint.sh /entrypoint.sh

VOLUME [ "/etc/st2", "/opt/stackstorm/packs" ]
ENTRYPOINT [ "/entrypoint.sh" ]
