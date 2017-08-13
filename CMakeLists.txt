cmake_minimum_required(VERSION 3.8)
project(vulkanier)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_C_FLAGS "-x objective-c")

set(SOURCE_FILES main.cpp window.m)

find_library(VULKAN MoltenVK)
find_library(METAL Metal)
find_library(METALKIT MetalKit)
find_library(CORE Cocoa)
find_library(OBJC ObjC)

message(${VULKAN})

add_executable(vulkanier ${SOURCE_FILES})
target_link_libraries(vulkanier ${CORE} ${COCOA} ${METAL} ${METALKIT} ${VULKAN})
