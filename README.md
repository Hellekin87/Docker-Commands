# Kubernetes and Docker Commands
FROM ubuntu:16.04

# VirtualBox 4.3.x service
#
# VERSION               0.0.1

#MAINTAINER Esben Haabendal <esben@haabendal.dk>

RUN apt-get update && apt-get install -y curl
RUN apt install -y wget



#RUN  wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | apt-key add -
#RUN  wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | apt-key add -
#RUN  apt-get update 
#RUN  apt-get install -y virtualbox


#RUN echo "deb http://download.virtualbox.org/virtualbox/debian vivid contrib" > /etc/apt/sources.list.d/virtualbox.list
#RUN wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- |  apt-key add - 
#RUN apt-get purge virtualbox
#RUN apt-get update
#RUN apt-get install -y virtualbox-5.0 dkms



RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
RUN curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.28.0/minikube-linux-amd64 && chmod +x minikube && mv minikube /usr/local/bin/


# The virtualbox driver device must be mounted from host
VOLUME /dev/vboxdrv






















