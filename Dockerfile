FROM ubuntu:12.04
MAINTAINER heihei

#RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/' /etc/apt/sources.list
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/' /etc/apt/sources.list
RUN apt-get -y update
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install -y \
    vim \
    build-essential \
    libtool \
    autotools-dev \
    automake \
    libz-dev \
    libcurl4-openssl-dev \
    libmysqlclient-dev \
    libfreetype6-dev \
    libreadline-dev \
    git \
    gawk \
    gdb \
    subversion	\
    wget	\
    lua5.1

# Set Timezone
#RUN echo "Asia/Shanghai" > /etc/timezone
#RUN dpkg-reconfigure -f noninteractive tzdata

ADD bashrc /root/.my_bashrc
RUN echo "source ~/.my_bashrc" >> ~/.bashrc

RUN wget "https://github.com/navy1125/vimrc/blob/master/vimrc"
ADD .vimrc /root/.vimrc
