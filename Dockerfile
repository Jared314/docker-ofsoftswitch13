# Dockerfile for OpenFlow 1.3 Softswitch 
# http://cpqd.github.io/ofsoftswitch13/
FROM ubuntu:precise
MAINTAINER Jared Lobberecht <jared@lobberecht.com>

RUN apt-get update && apt-get -y upgrade && apt-get -y install autoconf automake autotools-dev pkg-config make gcc g++ libtool libc6-dev cmake libpcap-dev libxerces-c2-dev unzip libpcre3-dev flex bison libboost-dev

ADD CPqD-ofsoftswitch13-cc167ab.zip	/tmp/cpqdsrc.zip
ADD nbeesrc-jan-10-2013.zip			/tmp/nbeesrc.zip

RUN cd /tmp && unzip nbeesrc.zip && unzip cpqdsrc.zip
RUN cd /tmp/nbeesrc/src && cmake . && make && cd .. && cp bin/libn*.so /usr/local/lib && ldconfig && cp -R include/ /usr/
RUN cd /tmp/cpqdsrc && ./boot.sh && ./configure && make && make install


