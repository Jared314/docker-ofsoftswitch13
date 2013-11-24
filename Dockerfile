# Dockerfile for OpenFlow 1.3 Softswitch 
# http://cpqd.github.io/ofsoftswitch13/
# http://www.nbee.org/download/
FROM ubuntu:precise
MAINTAINER Jared Lobberecht <jared@lobberecht.com>

ADD assets /tmp

RUN /tmp/install
