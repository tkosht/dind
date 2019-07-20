#!/bin/sh
d=$(cd $(dirname $0) && pwd)
cd $d/../
yq -r '.services|keys|.[]' docker-compose.yml
