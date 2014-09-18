#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM phusion/baseimage:0.9.12
MAINTAINER CG-DEVELOPERS  <developers@controlgroup.com>

#### Install #####

# Ubuntu deps
RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get update && apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:webupd8team/java -y
# Puppet to help install development libraries and software
RUN sudo apt-get install -y git puppet zip

