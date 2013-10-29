##
# Builds a self-sufficient docker container that runs
# the eventstore, http://geteventstore.com.
# The binaries need to be available in ./bin/
# The wercker.yml file in this repository defines the
# build and deployment to the docker register, http://index.docker.io/
##
FROM pjvds/mono
MAINTAINER Pieter Joost van de Sande <pj@born2code.net>

RUN mkdir -p /var/lib/eventstore
ADD bin/ /var/lib/eventstore/

EXPOSE 1113:1113
EXPOSE 2113:2113
ENTRYPOINT ["mono","/var/lib/eventstore/EventStore.SingleNode.exe","--ip=0.0.0.0"]
CMD "--http-prefix='http://*:2113/'"
