#!/bin/sh
d=$(cd $(dirname $0) && pwd)
cd $d/../
sh bin/down.sh --rmi all
echo y | sh bin/clean.sh
sh bin/rmenvs.sh
sh bin/mkenvs.sh
sh bin/build.sh
sh bin/up.sh
