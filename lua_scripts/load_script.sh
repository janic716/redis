#!/usr/bin/env bash
script_path=$1
REDIS_CLI=../src/redis-cli
sha=$($REDIS_CLI script load "$(cat $script_path)")
echo "script-sha: ${sha}"
function test_data() {
    $REDIS_CLI hset key1 a 1 b 2 c 3 > /dev/null
    $REDIS_CLI expire key1 86400 > /dev/null
    $REDIS_CLI hset key2 a 1 b 2 c 3 > /dev/null
    $REDIS_CLI expire key1 86400 > /dev/null
    $REDIS_CLI hset key3 a 1 b 2 c 3 > /dev/null
    $REDIS_CLI expire key1 86400 > /dev/null
}
test_data

$REDIS_CLI evalsha "${sha}" "${@:2}"

#eg:
#sh load_script.sh hello.lua 0
#sh load_script.sh mhget.lua 3 key1 key2 key3 a b c