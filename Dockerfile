FROM resin/rpi-raspbian:jessie
MAINTAINER Greg Maslowski <gregmaslowski@gmail.com>

RUN apt-get update && apt-get upgrade

RUN  sudo apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

RUN curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -

RUN  echo "deb [arch=armhf] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
     $(lsb_release -cs) stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list

RUN  echo "deb [arch=armhf] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
     $(lsb_release -cs) edge" | \
    sudo tee /etc/apt/sources.list.d/docker.list

RUN sudo apt-get update && sudo apt-get install docker-ce
