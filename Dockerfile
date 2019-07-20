FROM ubuntu:18.04

MAINTAINER tkosht <takehito.oshita.business@gmail.com>

ARG PORT

# for interactive environment
ENV TZ Asia/Tokyo
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y git sysstat vim tmux tzdata \
        openssh-server curl
### RUN echo $TZ > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata
RUN mkdir /var/run/sshd
RUN echo "exit 0" > /usr/sbin/policy-rc.d 

# # c.f https://hub.docker.com/r/billyteves/ubuntu-dind/dockerfile
# Install Docker from Docker Inc. repositories.
RUN curl -sSL https://get.docker.com/ | sh

# Install the magic wrapper.
RUN curl -sSL https://raw.githubusercontent.com/billyteves/ubuntu-dind/master/wrapdocker -o /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker
VOLUME /var/lib/docker
ENTRYPOINT ["wrapdocker"]

# install python3
RUN apt-get install -y --no-install-recommends \
        python3-dev \
        python3-pip \
        python3-setuptools \
        python3-wheel

# - make links for python3
RUN rm -f /usr/bin/python
RUN rm -f /usr/bin/pip
RUN rm -f /usr/bin/pdb
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN ln -s /usr/bin/pip3 /usr/bin/pip
RUN ln -s /usr/bin/pdb3 /usr/bin/pdb

# create normal user
RUN useradd -m user --shell /bin/bash -G docker,sudo
ARG home_dir=/home/user
RUN echo 'user:user' |chpasswd
RUN echo "user ALL=(ALL) ALL" >> /etc/sudoers

# expose ports
ENV PORT $PORT
EXPOSE $PORT
EXPOSE 22
