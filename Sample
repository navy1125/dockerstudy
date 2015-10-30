# This is a Dockerfile to create a Makefly environment on Debian Wheezy (version 7)
#
# VERSION 0.1

# use Debian wheezy (version 7) image provided by docker.io
FROM debian:wheezy

MAINTAINER Olivier Dossmann, olivier+dockerfile@dossmann.net

# Get noninteractive frontend for Debian to avoid some problems:
#    debconf: unable to initialize frontend: Dialog
ENV DEBIAN_FRONTEND noninteractive

# Update package list before installing ones
RUN apt-get update

# Install program to configure locales
RUN apt-get install -y locales
RUN dpkg-reconfigure locales && \
  locale-gen C.UTF-8 && \
  /usr/sbin/update-locale LANG=C.UTF-8
# Install needed default locale for Makefly
RUN echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen && \
  locale-gen
# Set default locale for the environment
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Install wget and makefly dependencies
RUN apt-get install -y wget unzip lua5.1 liblua5.1-filesystem0 liblua5.1-markdown0

# Download and install FAHClient
RUN wget -O makefly_latest.zip "https://github.com/blankoworld/makefly/archive/master.zip" --no-check-certificate \
  && unzip makefly_latest.zip -d /opt && cd /opt/makefly-master

# Install useful tools.
#+ nano (to edit files)
RUN apt-get install -y nano

# Install nginx so that we can see result on the web
RUN apt-get install -y nginx-light

# Run nginx each time we launch bash
RUN echo "/usr/sbin/nginx > /dev/null 2>&1 &" >> /etc/bash.bashrc

# Copy nginx configuration file
ADD nginx.conf /etc/nginx/sites-enabled/
# Use a specific makefly.rc configuration so that it works with Nginx
ADD makefly.rc /opt/makefly-master/makefly.rc

# Compile first version of Makefly
RUN cd /opt/makefly-master && ./makefly refresh

# Open some ports: 80(HTTP)
EXPOSE 80

# Delete last makefly zipfile
RUN rm -f /makefly_latest.zip
