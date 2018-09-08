FROM ubuntu 
MAINTAINER Mukund Bihari
USER root
RUN apt-get -qqy update; apt-get install -qqy wget 
RUN wget http://get.docker.com/builds/Linux/x86_64/docker-latest.tgz
RUN tar -xvzf docker-latest.tgz
RUN mv docker/* /usr/bin/
