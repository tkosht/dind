#!/bin/sh
d=$(cd $(dirname $0) && pwd)
cd $d/../

sh bin/down.sh --rmi all
echo y | sh bin/garbage_cleaner.sh
sh bin/rmenvs.sh
