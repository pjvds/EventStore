##
# Builds a self-sufficient docker container that runs
# the eventstore, http://geteventstore.com.
# The binaries need to be available in ./bin/
# The wercker.yml file in this repository defines the
# build and deployment to the docker register, http://index.docker.io/
##
FROM pjvds/mono
MAINTAINER Pieter Joost van de Sande <pj@born2code.net>

ENV EVENTSTORE_BIN /var/lib/eventstore
ENV EVENTSTORE_DB /opt/eventstore/db
ENV EVENTSTORE_LOG /var/log/eventstore

RUN mkdir -p $EVENTSTORE_BIN
RUN mkdir -p $EVENTSTORE_DB
RUN mkdir -p $EVENTSTORE_LOG

ADD bin/ $EVENTSTORE_BIN

EXPOSE 1113:1113
EXPOSE 2113:2113
ENTRYPOINT ["mono","/var/lib/eventstore/EventStore.SingleNode.exe","--ip=0.0.0.0"]
CMD ["--http-prefix=http://*:2113/", "--db /opt/eventstore/db", "--log /var/log/eventstore"]