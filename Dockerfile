FROM debian:wheezy

ENV NODE_VERSION 0.10.35

RUN apt-get update -y && \
   apt-get install wget -y && \
   echo 'deb http://packages.elasticsearch.org/logstashforwarder/debian stable main' | tee /etc/apt/sources.list.d/logstashforwarder.list && \
   wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add - && \
   apt-get update -y && \
   apt-get install --no-install-recommends -y -q logstash-forwarder supervisor && \
   mkdir /nodejs && wget -O - http://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz | tar xvzf - -C /nodejs --strip-components=1

ENV PATH $PATH:/nodejs/bin:/opt/logstash-forwarder/bin

CMD ["/bin/bash"]
