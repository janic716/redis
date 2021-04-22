cmake_minimum_required(VERSION 3.0 FATAL_ERROR)
project(redis VERSION 6.0)
set(CMAKE_BUILD_TYPE "Debug")

get_filename_component(REDIS_ROOT "${CMAKE_CURRENT_SOURCE_DIR}" ABSOLUTE)

add_subdirectory(deps)
add_subdirectory(redismodule/trie)
add_subdirectory(redismodule/helloworld)
add_subdirectory(src/modules)

include_directories(src)


file(GLOB SRC_SERVER_FILE_LIST  "src/*.c")
file(GLOB SRC_SERVER_FILE_LIST_EXCLUDE src/ae_*.c src/redis-cli.c src/redis-benchmark.c)
list(REMOVE_ITEM SRC_SERVER_FILE_LIST ${SRC_SERVER_FILE_LIST_EXCLUDE})

#message(${CMAKE_CURRENT_SOURCE_DIR})
#message(${CMAKE_CURRENT_SOURCE_DIR}/src/ae_kqueue.c)



set(SRC_SERVER ${SRC_SERVER_FILE_LIST})
#set(SRC_SERVER src/server.c ${SRC_SERVER})

set(SRC_CLI
        src/anet.c
        src/sds.c
        src/adlist.c
        src/redis-cli.c
        src/zmalloc.c
        src/release.c
        src/anet.c
        src/ae.c
        src/crc64.c
        src/crc16.c
        src/dict.c
        src/siphash.c
        src/crcspeed.c
        )


EXECUTE_PROCESS(COMMAND sh mkreleasehdr.sh WORKING_DIRECTORY "src")



set(EXECUTABLE_OUTPUT_PATH src)
link_directories(deps/linenoise/ deps/lua/src deps/hiredis)

add_executable(redis-server ${SRC_SERVER})
target_include_directories(redis-server
        PRIVATE ${REDIS_ROOT}/deps/linenoise
        PRIVATE ${REDIS_ROOT}/deps/hiredis
        PRIVATE ${REDIS_ROOT}/deps/lua/src)
target_link_libraries(redis-server
        PRIVATE lua
        PRIVATE linenoise
        PRIVATE hiredis
        )

#
add_executable(redis-cli ${SRC_CLI})
target_include_directories(redis-cli
        PRIVATE ${REDIS_ROOT}/deps/linenoise
        PRIVATE ${REDIS_ROOT}/deps/hiredis
        PRIVATE ${REDIS_ROOT}/deps/lua/src
        )

target_link_libraries(redis-cli
        PRIVATE linenoise
        PRIVATE hiredis
        )