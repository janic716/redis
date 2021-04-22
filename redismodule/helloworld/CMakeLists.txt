#指定CMake编译最低要求版本
cmake_minimum_required(VERSION 3.9)

set(MODULE_NAME helloword)
#设置项目名, 不填也可以, 会有警告
project(${MODULE_NAME})

# set命令用来定义变量, 参数等
#CMAKE_BUILD_TYPE 相当于 cmake -DCMAKE_BUILD_TYPE=Debug
set(CMAKE_BUILD_TYPE "Debug")



add_library(${MODULE_NAME} SHARED module.c)
set_target_properties(${MODULE_NAME} PROPERTIES PREFIX "redis_" SUFFIX ".so")


