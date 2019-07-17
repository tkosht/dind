FROM gitlab/dind:latest

MAINTAINER tkosht <takehito.oshita.business@gmail.com>

ENV TZ Asia/Tokyo
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y git sysstat vim tmux tzdata
RUN echo $TZ > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

# - make links
RUN rm -f /usr/bin/python
RUN rm -f /usr/bin/pip
RUN rm -f /usr/bin/pdb
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN ln -s /usr/bin/pip3 /usr/bin/pip
RUN ln -s /usr/bin/pdb3 /usr/bin/pdb

RUN useradd -m user --shell /bin/bash -G docker,sudo
ARG home_dir=/home/user
RUN echo 'user:user' |chpasswd
RUN echo "user ALL=(ALL) ALL" >> /etc/sudoers
