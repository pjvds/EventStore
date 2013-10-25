FROM ubuntu
MAINTAINER Pieter Joost van de Sande <pj@born2code.net>

RUN echo "deb http://ppa.launchpad.net/ermshiperete/monodevelop-beta/ubuntu precise main" >> /etc/apt/sources.list
RUN apt-get update -qq
RUN apt-get upgrade -y -qq
RUN apt-get dist-upgrade -y -qq
RUN apt-get install mono-3 -y -qq

RUN mkdir -p /var/lib/eventstore
ADD bin/ /var/lib/eventstore/

ENTRYPOINT mono /var/lib/eventstore/EventStore.SingleNode.exe
