#指定CMake编译最低要求版本
cmake_minimum_required(VERSION 3.9)

#设置项目名, 不填也可以, 会有警告
project(module_demo)

# set命令用来定义变量, 参数等
#CMAKE_BUILD_TYPE 相当于 cmake -DCMAKE_BUILD_TYPE=Debug
set(CMAKE_BUILD_TYPE "Debug")



add_library(module SHARED module.c)
set_target_properties(module PROPERTIES PREFIX "" SUFFIX ".so")


