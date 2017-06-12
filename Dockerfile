FROM openjdk:8-jre

MAINTAINER dale.tristram@sprinthive.com

ENV SGADMINURL='https://search.maven.org/remotecontent?filepath=com/floragunn/search-guard-5/5.3.2-12/search-guard-5-5.3.2-12-sgadmin-standalone.zip'

# Default ENV variables
ENV KEYSTORE_PATH=/keys/keystore.jks
ENV TRUSTSTORE_PATH=/keys/truststore.jks
ENV SG_CONFIG_PATH=/sgconfig
ENV WAIT_TIME_SECS=420
ENV SGADMIN_EXTRA_ARGS='-nhnv -icl -era'
ENV ES_HOSTNAME=elasticsearch-discovery
ENV ES_PORT=9300

RUN mkdir /sgadmin
WORKDIR /sgadmin
RUN curl -O $SGADMINURL
RUN unzip search-guard*

COPY run.sh /
CMD ["/run.sh"]
