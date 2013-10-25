FROM ubuntu
MAINTAINER Pieter Joost van de Sande <pj@born2code.net>

RUN apt-get update -qq
RUN apt-get upgrade -y -qq
RUN apt-get dist-upgrade -y -qq
RUN apt-get install mono-runtime -y -qq

RUN mkdir -p /var/lib/eventstore
ADD bin/ /var/lib/eventstore/

ENTRYPOINT /var/lib/eventstore/EventStore.SingleNode.exe