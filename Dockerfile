FROM registry.access.redhat.com/rhscl/ruby-23-rhel7
LABEL maintainer "Arctiq Inc. <dev@arctiq.ca>"

ENV FLUENTD_OPT=""
ENV FLUENTD_CONF="fluent.conf"

USER  root

RUN scl enable rh-ruby23 'gem update --system --no-document' && \
    scl enable rh-ruby23 'gem install --no-document json_pure jemalloc' && \
    scl enable rh-ruby23 "gem install --no-document fluentd" && \
    scl enable rh-ruby23 "gem install --no-document fluent-plugin-secure-forward fluent-plugin-elasticsearch" && \
    ln -s /opt/rh/rh-ruby23/root/usr/local/bin/* /usr/bin


RUN mkdir -p /fluentd/log && \
    mkdir -p /fluentd/etc /fluentd/plugins


COPY fluent.conf /fluentd/etc/
ADD entrypoint.sh /bin/

EXPOSE 24224 5140

ENTRYPOINT ["/bin/entrypoint.sh"]

CMD exec fluentd -c /fluentd/etc/${FLUENTD_CONF} -p /fluentd/plugins $FLUENTD_OPT
