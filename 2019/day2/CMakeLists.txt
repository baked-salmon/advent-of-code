cmake_minimum_required(VERSION 3.31)
project(day2 C)

set(CMAKE_C_STANDARD 11)

add_executable(day2 main.c)
configure_file(${CMAKE_SOURCE_DIR}/input.txt ${CMAKE_BINARY_DIR}/input.txt COPYONLY)
configure_file(${CMAKE_SOURCE_DIR}/test.txt ${CMAKE_BINARY_DIR}/test.txt COPYONLY)
