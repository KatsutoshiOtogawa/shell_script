
# include(FetchContent)
# FetchContent_Declare(
#   googletest
#   URL https://github.com/google/googletest/archive/609281088cfefc76f9d0ce82e1ff6c30cc3591e5.zip
# )

cmake_minimum_required(VERSION 3.14)
# required at least g++17
set(CMAKE_CXX_STANDARD 17)
project(example)

set(CLI_SOURCE
  lib/command.cc
  lib/example.cc
  lib/web.cc
)
# set(private_headers
#   lib/command.h
#   lib/example.h
#   lib/web.h
# )
set(private_headers
  lib/include/command.h
  lib/include/example.h
  lib/include/web.h
)

set(BOOST_MIN_VERSION "1.74.0")
# target_sources(

# )

find_package(Boost REQUIRED COMPONENTS
  program_options
)

find_package(Threads REQUIRED)

add_library(
  command lib/command.cc
  example lib/example.cc
)

# 外側からディレクトリを指定する時に使う。
add_subdirectory(
  example
  # error
)

add_executable(
  example
  main.cc
  ${CLI_SOURCE}
)


# install(
#     TARGETS foo
#     LIBRARY DESTINATION lib
#     ARCHIVE DESTINATION lib
#     RUNTIME DESTINATION bin
# )

target_link_libraries(
  example
  command
  Threads::Threads
  ${Boost_LIBRARIES}
)

# target_include_directories(Tutorial PUBLIC
#   "${PROJECT_BINARY_DIR}"
#   "${PROJECT_SOURCE_DIR}/MathFunctions"
# )

# target_compile_options(a.out PRIVATE -Wall -Wextra -pedantic)

install(
  TARGETS example
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  RUNTIME DESTINATION bin
)


# # For Windows: Prevent overriding the parent project's compiler/linker settings
# set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
# FetchContent_MakeAvailable(googletest)
