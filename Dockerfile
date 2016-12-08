

FROM artifactory.justgiving.com/base/ubuntu:14.04.8

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update

#Runit
RUN apt-get install -y runit 
CMD /usr/sbin/runsvdir-start

RUN apt-get install -y vim npm less net-tools inetutils-ping curl wget make git telnet nmap socat dnsutils netcat tree htop unzip sudo software-properties-common

RUN wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz && \
    tar -xzvf chruby-0.3.9.tar.gz && \
    cd chruby-0.3.9/ && \
    sudo make install

#required

RUN apt-get install software-properties-common && \
    apt-add-repository ppa:brightbox/ruby-ng && \
    apt-get update

RUN apt-get install -y ruby2.2 && \
    apt-get install -y ruby2.2-dev && \
    apt-get install -y build-essential libxslt-dev libxml2-dev zlib1g-dev

RUN gem install dashing -v 1.3.4 --no-rdoc --no-ri && \
    gem install bundler --no-rdoc --no-ri && \
    gem install elasticsearch --no-rdoc --no-ri


#nodejs
RUN npm install n -g 


