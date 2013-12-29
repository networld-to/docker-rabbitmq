# docker-rabbitmq

## Getting Started

Get the image via index.docker.io

        $ docker pull networld/rabbitmq

        or build from source

        $ IMAGE_NAME=networld/rabbitmq
        $ docker build -rm -t ${IMAGE_NAME} .

Start a container with:

        $ docker run -name rabbitmq -p 127.0.0.1:5672:5672 -p 127.0.0.1:15672:15672 -d $IMAGE_NAME
        # Only admin web interface on host
        $ docker run -name rabbitmq -p 127.0.0.1:15672:15672 -d $IMAGE_NAME

Use rabbitmq from other container:

        $ docker run -link=rabbitmq:service -i -t ubuntu /bin/bash
        $ echo $SERVICE_PORT_5672_TCP_PORT
        $ echo $SERVICE_PORT_5672_TCP_ADDR

## License

The Sigimera Copyright (c) 2013 - 2014 by
[Sigimera Ltd.](http://www.sigimera.com)

## Warranty

This software is provided "as is" and without any express or implied
warranties, including, without limitation, the implied warranties of
merchantability and fitness for a particular purpose.
