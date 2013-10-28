FROM pjvds/mono
MAINTAINER Pieter Joost van de Sande <pj@born2code.net>

RUN mkdir -p /var/lib/eventstore
ADD bin/ /var/lib/eventstore/

ENTRYPOINT ["mono", "/var/lib/eventstore/EventStore.SingleNode.exe"]
