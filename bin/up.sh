#!/bin/sh
d=$(cd $(dirname $0) && pwd)
cd $d/../
docker-compose up -d
container_list=$(sh bin/get_containers.sh)
for container in $container_list
do
    docker-compose exec $container /usr/sbin/dpkg-reconfigure openssh-server
done
