#!/bin/sh
d=$(cd $(dirname $0) && pwd)
cd $d/../

echo "`date +'%Y/%m/%d %T'` - Start" > .reup.log

sh bin/down.sh
echo y | sh bin/garbage_cleaner.sh
sh bin/rmenvs.sh

sh bin/mkenvs.sh
sh bin/build.sh
sh bin/up.sh

echo "`date +'%Y/%m/%d %T'` - End" >> .reup.log
