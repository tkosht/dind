FROM teracy/ubuntu:16.04-dind-latest

MAINTAINER tkosht <takehito.oshita.business@gmail.com>

ENV TZ Asia/Tokyo
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y git sysstat vim tmux tzdata

RUN apt-get install -y --no-install-recommends \
        build-essential \
        libpq-dev libxml2-dev \
        libxslt1-dev libldap2-dev \
        libsasl2-dev libffi-dev \
        python3-dev \
        python3-pip \
        python3-setuptools \
        python3-wheel

# - upgrade system
RUN apt-get upgrade -y

# - make links
RUN rm -f /usr/bin/python
RUN rm -f /usr/bin/pip
RUN rm -f /usr/bin/pdb
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN ln -s /usr/bin/pip3 /usr/bin/pip
RUN ln -s /usr/bin/pdb3 /usr/bin/pdb

RUN pip install docker-compose

RUN useradd -m user
ARG home_dir=/home/user
# RUN chown -R user:user $home_dir
USER user
