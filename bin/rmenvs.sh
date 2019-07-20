#!/bin/sh
d=$(cd $(dirname $0) && pwd)
cd $d/../

container_list=$(sh bin/get_containers.sh)
rm -rf $container_list
