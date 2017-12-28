FROM registry.access.redhat.com/rhscl/ruby-23-rhel7
LABEL maintainer "Arctiq Inc. <dev@arctiq.ca>"

ENV FLUENTD_OPT=""
ENV FLUENTD_CONF="fluent.conf"

USER  root

#RUN yum install -y yum-utils && \
#    yum-config-manager --enable rhel-7-server-optional-rpms

#RUN yum clean all && \
#    yum install -y gcc ruby-devel ruby-gems make gcc && \
#    yum clean all

#ADD td.repo /etc/yum.repos.d/
#RUN rpm --import https://packages.treasuredata.com/GPG-KEY-td-agent
#RUN yum install -y td-agent


RUN scl enable rh-ruby23 'gem update --system --no-document' && \
    scl enable rh-ruby23 'gem install --no-document json_pure jemalloc' && \
    scl enable rh-ruby23 "gem install --no-document fluentd" && \
    ln -s /opt/rh/rh-ruby23/root/usr/local/bin/* /usr/bin


RUN mkdir -p /fluentd/log
RUN mkdir -p /fluentd/etc /fluentd/plugins

COPY fluent.conf /fluentd/etc/
#COPY entrypoint.sh /bin/
#RUN chmod +x /bin/entrypoint.sh

EXPOSE 24224 5140

#ENTRYPOINT ["/bin/entrypoint.sh"]

CMD exec fluentd -c /fluentd/etc/${FLUENTD_CONF} -p /fluentd/plugins $FLUENTD_OPT
