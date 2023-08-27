cmake_minimum_required(VERSION 3.15)
project(arrow_exam01 VERSION 0.1.0 LANGUAGES C CXX)

find_package(Arrow REQUIRED)
find_package(AWSSDK CONFIG COMPONENTS core s3 REQUIRED)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra")

set(MY_SRCS src/main.cpp)

include_directories(include "/vcpkg/installed/x64-linux/include")

add_executable(arrow_exam01 ${MY_SRCS})

target_link_libraries(arrow_exam01 
    PRIVATE Arrow::arrow_static
    PRIVATE ${AWSSDK_LIBRARIES}
)