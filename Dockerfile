FROM ubuntu:14.04.3
MAINTAINER Sorin Badea <sorin@labsights.com>

#----------- upgrade distribution and install ansible ----------
RUN apt-get install software-properties-common -y
RUN apt-add-repository ppa:ansible/ansible
RUN apt-get update -y; apt-get upgrade -y;apt-get dist-upgrade -y;
RUN apt-get install ansible -y;


#--------------- add the playbook and run it -------------------
ADD bootstrap.yml /tmp/bootstrap.yml
ADD templates /tmp/templates

RUN ansible-playbook /tmp/bootstrap.yml

EXPOSE 80
