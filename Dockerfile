FROM ubuntu
MAINTAINER Pieter Joost van de Sande <pj@born2code.net>

RUN mkdir -p /var/lib/eventstore
ADD bin/ /var/lib/eventstore/

ENTRYPOINT /var/lib/eventstore/EventStore --force
