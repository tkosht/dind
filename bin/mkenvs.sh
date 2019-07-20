#!/bin/sh
d=$(cd $(dirname $0) && pwd)
wkdir=$d/../
cd $wkdir

n=0
container_list=$(sh bin/get_containers.sh)
for container in $container_list
do
    n=$(echo $n + 1 | bc)
    mkdir -p $wkdir/$container
    cd $wkdir/$container
    cat << __direnv__ > .envrc
cd ../ && docker-compose exec $container su - user -c bash
export DOCKER_HOST="tcp://192.168.200.1$n:2375"
export SSH="ssh user@192.168.200.1$n"
__direnv__
    direnv allow
done
