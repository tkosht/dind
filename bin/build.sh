#!/bin/sh
d=$(cd $(dirname $0) && pwd)
cd $d/../
docker-compose build
