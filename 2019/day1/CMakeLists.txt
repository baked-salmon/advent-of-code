cmake_minimum_required(VERSION 3.31)
project(day1 C)

set(CMAKE_C_STANDARD 11)

add_executable(day1 main.c)
configure_file(${CMAKE_SOURCE_DIR}/input.txt ${CMAKE_BINARY_DIR}/input.txt COPYONLY)
