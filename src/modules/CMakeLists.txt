#指定CMake编译最低要求版本
cmake_minimum_required(VERSION 3.9)

#设置项目名, 不填也可以, 会有警告
project(modules)

# set命令用来定义变量, 参数等
#CMAKE_BUILD_TYPE 相当于 cmake -DCMAKE_BUILD_TYPE=Debug
set(CMAKE_BUILD_TYPE "Debug")

add_library(helloworld SHARED helloworld.c)
set_target_properties(helloworld PROPERTIES PREFIX "redis_" SUFFIX ".so")

add_library(helloblock SHARED helloblock.c)
set_target_properties(helloblock PROPERTIES PREFIX "redis_" SUFFIX ".so")

add_library(helloacl SHARED helloacl.c)
set_target_properties(helloacl PROPERTIES PREFIX "redis_" SUFFIX ".so")

add_library(hellodict SHARED hellodict.c)
set_target_properties(hellodict PROPERTIES PREFIX "redis_" SUFFIX ".so")

add_library(hellocluster SHARED hellocluster.c)
set_target_properties(hellocluster PROPERTIES PREFIX "redis_" SUFFIX ".so")

add_library(hellotype SHARED hellotype.c)
set_target_properties(hellotype PROPERTIES PREFIX "redis_" SUFFIX ".so")

add_library(hellohook SHARED hellohook.c)
set_target_properties(hellohook PROPERTIES PREFIX "redis_" SUFFIX ".so")

add_library(hellotimer SHARED hellotimer.c)
set_target_properties(hellotimer PROPERTIES PREFIX "redis_" SUFFIX ".so")




