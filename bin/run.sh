#!/bin/sh
d=$(cd $(dirname $0) && pwd)
cd $d/../

# docker-compose exec container1 su - user # bash
# docker-compose exec container1 /usr/sbin/dpkg-reconfigure openssh-server
docker-compose exec container1 bash
