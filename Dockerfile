#################################################################
# This docker image build file creates an image that contains
# the queueing middleware RabbitMQ
#
#                    ##        .
#              ## ## ##       ==
#           ## ## ## ##      ===
#       /""""""""""""""""\___/ ===
#  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
#       \______ o          __/
#         \    \        __/
#          \____\______/
#
# Component:    RabbitMQ
# Author:       Alex Oberhauser <alex.oberhauser@networld.to>
# Copyright:    (c) 2013-2014 Sigimera Ltd. All rights reserved.
#################################################################
FROM ubuntu:latest
MAINTAINER Alex Oberhauser <alex.oberhauser@networld.to>

# Reduce output from debconf
ENV DEBIAN_FRONTEND noninteractive
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN apt-get -y update
RUN echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list
RUN apt-get install -y wget
RUN wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc -O /tmp/rabbitmq-signing-key-public.asc
RUN apt-key add /tmp/rabbitmq-signing-key-public.asc
RUN apt-get -y update

RUN apt-get install -y rabbitmq-server
RUN rabbitmq-plugins enable rabbitmq_management

# For RabbitMQ and RabbitMQ Adminm
EXPOSE 5672 15672

ENTRYPOINT ["/usr/sbin/rabbitmq-server"]
