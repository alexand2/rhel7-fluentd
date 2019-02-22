FROM registry.access.redhat.com/rhscl/ruby-23-rhel7
LABEL maintainer "Arctiq Inc. <dev@arctiq.ca>"

ENV FLUENTD_OPT=""
ENV FLUENTD_CONF="fluent.conf"

USER  root

RUN scl enable rh-ruby23 'gem update --system --no-document' && \
    scl enable rh-ruby23 'gem install --no-document json_pure jemalloc' && \
    scl enable rh-ruby23 "gem install --no-document fluentd" && \
    #scl enable rh-ruby23 "gem install --no-document fluent-plugin-secure-forward fluent-plugin-elasticsearch fluent-plugin-remote_syslog fluent-plugin-grep fluent-plugin-route elasticsearch-transport" && \
    scl enable rh-ruby23 "gem install --no-document fluent-plugin-secure-forward fluent-plugin-elasticsearch fluent-plugin-remote_syslog fluent-plugin-grep fluent-plugin-route" && \
    ln -s /opt/rh/rh-ruby23/root/usr/local/bin/* /usr/bin


RUN mkdir -p /fluentd/log && \
    mkdir -p /fluentd/etc /fluentd/plugins


COPY /configs/${FLUENTD_CONF} /fluentd/etc/
ADD set_user.sh .
RUN chmod +x set_user.sh && \
    ./set_user.sh && \
    sed -i "19irequire_relative 'elasticsearch_simple_sniffer.rb'" /opt/rh/rh-ruby23/root/usr/local/share/gems/gems/fluent-plugin-elasticsearch-3.2.3/lib/fluent/plugin/out_elasticsearch.rb 

USER 1002

EXPOSE 24224

CMD exec fluentd -c /fluentd/etc/${FLUENTD_CONF} -p /fluentd/plugins $FLUENTD_OPT
