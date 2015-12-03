FROM ubuntu:14.04.3
MAINTAINER Sorin Badea <sorin@labsights.com>

#----------- upgrade distribution and install ansible ----------
RUN apt-get install software-properties-common -y
RUN apt-add-repository ppa:ansible/ansible
RUN apt-get update -y; apt-get upgrade -y;apt-get dist-upgrade -y;
RUN apt-get install ansible -y;

#--------------- add the playbook and run it -------------------

ADD bootstrap.yml /tmp/bootstrap.yml
ADD zsh.rc /tmp/zsh.rc
RUN ansible-playbook /tmp/bootstrap.yml
RUN rm /tmp/bootstrap.yml;rm /tmp/zsh.rc;

ENTRYPOINT zsh