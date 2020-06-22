#!/usr/bin/env bash

script_home=$(cd `dirname $0`; pwd)
echo $script_home
REDIS_CLI=`which redis-cli`
if [[ $REDIS_CLI == "" ]];then
 REDIS_CLI=../../src/redis-cli
fi


module_src=module.c
module_name="helloworld"
module_obj="module_demo.so"

gcc module.c  -Wall -Wno-unused-function -fPIC -std=c11 -D_GUN_SOURCE -shared -o $module_obj

$REDIS_CLI module unload "helloworld" > /dev/null 2>&1
res=`$REDIS_CLI module load "$script_home/$module_obj"`
if [[ $res == "OK" ]];then
  echo "load module $module_name success!!"
fi
echo $res
$REDIS_CLI module list
$REDIS_CLI helloworld.rand